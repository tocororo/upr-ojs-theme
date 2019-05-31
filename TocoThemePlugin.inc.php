<?php

/**
 * @file plugins/themes/tocoTheme/TocoThemeThemePlugin.inc.php
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 * @class TocoThemeThemePlugin
 *
 * @brief Old Gregg theme is developed on the basis of bootstrap 4; it has build-in fucntionality of JATS Parser Plugin and browse latest articles plugin
 */

import('lib.pkp.classes.plugins.GenericPlugin');
import('lib.pkp.classes.plugins.ThemePlugin');

define('TOCOTHEME_CSL_STYLE_DEFAULT', 'vancouver');
define('TOCOTHEME_LATEST_ARTICLES_DEFAULT', 20);
define('TOCOTHEME_ISSUE_COVER_RELATIVE_URL', 'images/issue_default.jpg');
define('TOCOTHEME_LATEST_ISSUES_DEFAULT', 3);

class TocoThemePlugin extends ThemePlugin
{
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init()
	{
		// optionally add JATS Parser library (if JATSParser Plugin is not installed/activated) 
		$pluginSettingsDAO = DAORegistry::getDAO('PluginSettingsDAO');
		$context = PKPApplication::getRequest()->getContext();
		$contextId = $context ? $context->getId() : 0;
		$jatsParserSettings = $pluginSettingsDAO->getPluginSettings($contextId, 'JatsParserPlugin');
		
		if (!class_exists('\JATSParser\Body\Document', true) && empty($jatsParserSettings)) {
			require_once  __DIR__ . '/jatsParser/src/start.php';
		}
		

		

		$this->addOptions();
		
		$this->addStylesScripts();

		$this->addMenuArea(array('primary', 'user'));

		$additionalLessVariables = array();
		$additionalLessVariables[] = '@color-primary:' . $this->getOption('color-primary') . ';';
		$additionalLessVariables[] = '@color-secondary:' . $this->getOption('color-secondary') . ';';
		$additionalLessVariables[] = '@color-bg:' . $this->getOption('color-bg') . ';';
		$additionalLessVariables[] = '@color-text:' . $this->getOption('color-text') . ';';
		
		$this->modifyStyle('tocostyles', array('addLessVariables' => join($additionalLessVariables)));
		
		HookRegistry::register('TemplateManager::display', array($this, 'indexJournal'), HOOK_SEQUENCE_NORMAL);

		//HookRegistry::register('TemplateManager::display', array($this, 'jatsParser'), HOOK_SEQUENCE_NORMAL);
		//HookRegistry::register('TemplateManager::display', array($this, 'browseLatest'), HOOK_SEQUENCE_CORE);
		HookRegistry::register('TemplateManager::display', array($this, 'citationStyle'), HOOK_SEQUENCE_LATE);
		HookRegistry::register('TemplateManager::display', array($this, 'latestIssuesSlider'), HOOK_SEQUENCE_NORMAL);
		HookRegistry::register('TemplateManager::display', array($this, 'journalDescription'), HOOK_SEQUENCE_NORMAL);
	}

	function addStylesScripts(){
		$this->addStyle('bootstrap', 'bootstrap/css/bootstrap.min.css');
		$this->addStyle('tocostyles', 'less/index.less');
		
		$this->addScript('popper', 'bootstrap/js/popper.min.js');
		$this->addScript('jquery', 'jquery/jquery.min.js');
		$this->addScript('bootstrap', 'bootstrap/js/bootstrap.bundle.min.js');
		$this->addScript('bootstrap', 'bootstrap/js/bootstrap.min.js');
		$this->addScript('fontawesome', 'js/fontawesome-all.min.js');
		$this->addScript('article', 'js/article.js');
		$this->addScript('search', 'js/search.js');

	}
	function addOptions(){
		
		$this->addOption('color-primary', 'colour', array(
			'label' => 'plugins.tocoTheme.option.color.first.label',
			'description' => 'plugins.tocoTheme.option.color.first.description',
			'default' => '#e13707',
		));

		$this->addOption('color-secondary', 'colour', array(
			'label' => 'plugins.tocoTheme.option.color.second.label',
			'description' => 'plugins.tocoTheme.option.color.second.description',
			'default' => '#0681d8',
		));

		$this->addOption('color-bg', 'colour', array(
			'label' => 'plugins.tocoTheme.option.color.back.label',
			'description' => 'plugins.tocoTheme.option.color.back.description',
			'default' => '#e9f0ec',
		));
		
		$this->addOption('color-text', 'colour', array(
			'label' => 'plugins.tocoTheme.option.color.text.label',
			'description' => 'plugins.tocoTheme.option.color.text.description',
			'default' => '#000000',
		));

		/*$this->addOption('typography', 'radio', array(
			'label' => 'plugins.tocoTheme.option.typography.label',
			'description' => 'plugins.tocoTheme.option.typography.description',
			'options' => array(
				'myriad' => 'plugins.tocoTheme.option.typography.myriad',
				'notoSerif' => 'plugins.tocoTheme.option.typography.notoSerif',
			)
		));*/

		// Register theme options
		$this->addOption('latestArticlesNumber', 'text', array(
			'label' => 'plugins.tocoTheme.latest.number',
			'description' => 'plugins.tocoTheme.latest.description',
		));

		$this->addOption('cslStyle', 'radio', array(
			'label' => 'plugins.tocoTheme.citation-style.type',
			'description' => 'plugins.tocoTheme.citation-style.description',
			'options' => array(
				'vancouver' => 'plugins.tocoTheme.citation-style.vancouver',
				'apa' => 'plugins.tocoTheme.citation-style.apa',			)
		));

		$this->addOption('displayIssuesSlider', 'text', array(
			'label' => 'plugins.tocoTheme.if-display.issue-slider',
			'description' => 'plugins.tocoTheme.if-display.issue-slider.description',
		));

		$this->addOption('journalSummary', 'radio', array(
			'label' => 'plugins.tocoTheme.journal.summary.display',
			'options' => array(
				'true' => 'plugins.tocoTheme.journal.summary.display.true',
				'false' => 'plugins.tocoTheme.journal.summary.display.false',
			)
		));



	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName()
	{
		return __('plugins.themes.tocoTheme.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription()
	{
		return __('plugins.themes.tocoTheme.description');
	}
	public function indexJournal($hookName, $args)
	{
		// Retrieve the TemplateManager and the template filename
		$smarty = $args[0];
		$template = $args[1];
		
		if (!defined('SESSION_DISABLE_INIT')) {
			$request = $this->getRequest();
			$journal = $request->getJournal();

			if (isset($journal)) {
				$locales = $journal->getSupportedLocaleNames();

			} else {
				$site = $request->getSite();
				$locales = $site->getSupportedLocaleNames();
			}
		} else {
			$locales = AppLocale::getAllLocales();
			$smarty->assign('languageToggleNoUser', true);
		}

		if (isset($locales) && count($locales) > 1) {
			$smarty->assign('enableLanguageToggle', true);
			$smarty->assign('languageToggleLocales', $locales);
		}
		
		$context = PKPApplication::getRequest()->getContext();
		$smarty->assign(array(
			'mailingAddress'       => $context->getSetting('mailingAddress'),
			'contactPhone'         => $context->getSetting('contactPhone'),
			'contactEmail'         => $context->getSetting('contactEmail'),
			'contactName'          => $context->getSetting('contactName'),
			'supportName'          => $context->getSetting('supportName'),
			'supportPhone'         => $context->getSetting('supportPhone'),
			'supportEmail'         => $context->getSetting('supportEmail'),
			'contactTitle'         => $context->getLocalizedSetting('contactTitle'),
			'contactAffiliation'   => $context->getLocalizedSetting('contactAffiliation'),
			'publisherInstitution' => $context->getSetting('publisherInstitution'),
			'siteTitle'			   => $context->getLocalizedName(),
			'primaryLocale'		   => $context->getPrimaryLocale(),
			'onlineIssn'		   => $context->getSetting('onlineIssn'),
			'printIssn'			   => $context->getSetting('printIssn'),
			'pageFooter'		   => $context->getLocalizedSetting('pageFooter'),
		));
		

			
		// Don't do anything if we're not loading the right template
		if ($template != 'frontend/pages/indexJournal.tpl') return false;
		
		$smarty->assign('indexJournal', true);

	}
	
	/** For displaying article's JATS XML */
	public function jatsParser($hookName, $args)
	{

		// Retrieve the TemplateManager and the template filename
		$smarty = $args[0];
		$template = $args[1];

		// Don't do anything if we're not loading the right template
		if ($template != 'frontend/pages/article.tpl') return false;

		$articleArrays = $smarty->get_template_vars('article');

		foreach ($articleArrays->getGalleys() as $galley) {
			if ($galley && in_array($galley->getFileType(), array('application/xml', 'text/xml'))) {
				$xmlGalleys[] = $galley;
			}
		}

		// Return false if no XML galleys available
		if (!$xmlGalleys) {
			return false;
		}

		$xmlGalley = null;
		foreach ($xmlGalleys as $xmlNumber => $xmlGalleyOne) {
			if ($xmlNumber > 0) {
				if ($xmlGalleyOne->getLocale() == AppLocale::getLocale()) {
					$xmlGalley = $xmlGalleyOne;
				}
			} else {
				$xmlGalley = $xmlGalleyOne;
			}
		}

		// Parsing JATS XML
		$jatsDocument = new \JATSParser\Body\Document($xmlGalley->getFile()->getFilePath());

		// Assigning variables to article template
		$smarty->assign('jatsDocument', $jatsDocument);

		// Кetrieving embeded files
		$submissionFile = $xmlGalley->getFile();
		$submissionFileDao = DAORegistry::getDAO('SubmissionFileDAO');
		import('lib.pkp.classes.submission.SubmissionFile'); // Constants
		$embeddableFiles = array_merge(
			$submissionFileDao->getLatestRevisions($submissionFile->getSubmissionId(), SUBMISSION_FILE_PROOF),
			$submissionFileDao->getLatestRevisionsByAssocId(ASSOC_TYPE_SUBMISSION_FILE, $submissionFile->getFileId(), $submissionFile->getSubmissionId(), SUBMISSION_FILE_DEPENDENT)
		);
		$referredArticle = null;
		$articleDao = DAORegistry::getDAO('ArticleDAO');
		$imageUrlArray = array();
		foreach ($embeddableFiles as $embeddableFile) {
			$params = array();
			if ($embeddableFile->getFileType() == 'image/png' || $embeddableFile->getFileType() == 'image/jpeg') {
				// Ensure that the $referredArticle object refers to the article we want
				if (!$referredArticle || $referredArticle->getId() != $galley->getSubmissionId()) {
					$referredArticle = $articleDao->getById($galley->getSubmissionId());
				}
				$fileUrl = Application::getRequest()->url(null, 'article', 'download', array($referredArticle->getBestArticleId(), $galley->getBestGalleyId(), $embeddableFile->getFileId()), $params);
				$imageUrlArray[$embeddableFile->getOriginalFileName()] = $fileUrl;
			}
		}
		$smarty->assign('imageUrlArray', $imageUrlArray);
	}

	/* For retrieving articles from the database */
	public function browseLatest($hookName, $args)
	{
		$smarty = $args[0];
		$template = $args[1];

		if ($template != 'frontend/pages/indexJournal.tpl') return false;

		/* get number of latest article to display from user input; if there was none - use default */
		$latestArticles = $this->getOption("latestArticlesNumber");
		if (is_null($latestArticles)) {
			$latestArticles = TOCOTHEME_LATEST_ARTICLES_DEFAULT;
		} else {
			$latestArticles = intval($latestArticles);
		}

		$rangeArticles = new DBResultRange($latestArticles, 1);
		$publishedArticleDao = DAORegistry::getDAO('PublishedArticleDAO');

		/* retrieve current journal id from the request */
		$request = $this->getRequest();
		$journal = $request->getJournal();
		$journalId = $journal->getId();

		/* retrieve latest articles */
		$publishedArticleObjects = $publishedArticleDao->getPublishedArticlesByJournalId($journalId, $rangeArticles, $reverse = true);

		$publishedArticles = array();

		while ($publishedArticle = $publishedArticleObjects->next()) {
			$publishedArticles[] = $publishedArticle;
		}
		$smarty->assign('publishedArticles', $publishedArticles);
	}

	public function citationStyle($hookName, $args) {
		$smarty = $args[0];
		$template = $args[1];

		if ($template != 'frontend/pages/article.tpl') return false;

		$cslStyle = $this->getOption("cslStyle");
		if (is_null($cslStyle)) {
			$cslStyle = TOCOTHEME_CSL_STYLE_DEFAULT;
		}

		$smarty->assign('cslStyle', $cslStyle);
	}

	public function latestIssuesSlider($hookName, $args) {
		$smarty = $args[0];
		$template = $args[1];

		if ($template != 'frontend/pages/indexJournal.tpl') return false;

		$latestIssuesInput = $this->getOption("displayIssuesSlider");
		if (is_null($latestIssuesInput)) {
			$latestIssuesInput = TOCOTHEME_LATEST_ISSUES_DEFAULT;
		} elseif (intval($latestIssuesInput) === 0) {
			return false;
		} else {
			$latestIssuesInput = intval($latestIssuesInput);
		}

		$request = $this->getRequest();
		$journal = $request->getJournal();
		$journalId = $journal->getId();

		$issueDao = DAORegistry::getDAO('IssueDAO');
		$rangeIssues = new DBResultRange($latestIssuesInput, 1);
		$latestIssuesObjects = $issueDao->getPublishedIssues($journalId, $rangeIssues);

		$latestIssues = array();
		while ($latestIssue = $latestIssuesObjects->next()) {
			$latestIssues[] = $latestIssue;
		}

		$defaultCoverImageUrl = "/" . $this->getPluginPath() . "/" . TOCOTHEME_ISSUE_COVER_RELATIVE_URL;

		$smarty->assign('latestIssues', $latestIssues);
		$smarty->assign('defaultCoverImageUrl', $defaultCoverImageUrl);
	}

	public function journalDescription ($hookName, $args) {
		$smarty = $args[0];

		$showSummaryData = $this->getOption("journalSummary");

		$showSummary = false;
		if (!is_null($showSummaryData) && ($showSummaryData == "true")) {
			$showSummary = true;
		}

		$smarty->assign('showSummary', $showSummary);
	}

}

?>