<?php 


class HtmlDocument{

	/* @var $document \DOMDocument */
	private $document;

	/* @var $xpath \DOMXPath */
	private static $xpath;

	/* @var $documentPath string */
	private $galley;

	/* var $articleSections array of Sections */
	private $articleContent;

	function __construct($filePath) {
		$document = new \DOMDocument;
		$this->document = $document->load($galley->getFile()->getFilePath());
        self::$xpath = new \DOMXPath($document);
        $this->extractContent();
    }
    
    public function getArticleContent () : string {
		return _getHTMLContents();
	}


    function _getHTMLContents() {
		//$journal = $request->getJournal();
		$submissionFile = $galley->getFile();
		$contents = file_get_contents($submissionFile->getFilePath());

		/* // Replace media file references
		$submissionFileDao = DAORegistry::getDAO('SubmissionFileDAO');
		import('lib.pkp.classes.submission.SubmissionFile'); // Constants
		$embeddableFiles = array_merge(
			$submissionFileDao->getLatestRevisions($submissionFile->getSubmissionId(), SUBMISSION_FILE_PROOF),
			$submissionFileDao->getLatestRevisionsByAssocId(ASSOC_TYPE_SUBMISSION_FILE, $submissionFile->getFileId(), $submissionFile->getSubmissionId(), SUBMISSION_FILE_DEPENDENT)
		);
		$referredArticle = null;
		$articleDao = DAORegistry::getDAO('ArticleDAO');
 */
		/* foreach ($embeddableFiles as $embeddableFile) {
			$params = array();

			if ($embeddableFile->getFileType()=='text/plain' || $embeddableFile->getFileType()=='text/css') $params['inline']='true';

			// Ensure that the $referredArticle object refers to the article we want
			if (!$referredArticle || $referredArticle->getId() != $galley->getSubmissionId()) {
				$referredArticle = $articleDao->getById($galley->getSubmissionId());
			}
			$fileUrl = $request->url(null, 'article', 'download', array($referredArticle->getBestArticleId(), $galley->getBestGalleyId(), $embeddableFile->getFileId()), $params);
			$pattern = preg_quote(rawurlencode($embeddableFile->getOriginalFileName()));

			$contents = preg_replace(
				'/([Ss][Rr][Cc]|[Hh][Rr][Ee][Ff]|[Dd][Aa][Tt][Aa])\s*=\s*"([^"]*' . $pattern . ')"/',
				'\1="' . $fileUrl . '"',
				$contents
			);

			// Replacement for Flowplayer
			$contents = preg_replace(
				'/[Uu][Rr][Ll]\s*\:\s*\'(' . $pattern . ')\'/',
				'url:\'' . $fileUrl . '\'',
				$contents
			);

			// Replacement for other players (ested with odeo; yahoo and google player won't work w/ OJS URLs, might work for others)
			$contents = preg_replace(
				'/[Uu][Rr][Ll]=([^"]*' . $pattern . ')/',
				'url=' . $fileUrl ,
				$contents
			);

		} */

		// Perform replacement for ojs://... URLs
		/* $contents = preg_replace_callback(
			'/(<[^<>]*")[Oo][Jj][Ss]:\/\/([^"]+)("[^<>]*>)/',
			array($this, '_handleOjsUrl'),
			$contents
		); */

		// Perform variable replacement for journal, issue, site info
		/* $issueDao = DAORegistry::getDAO('IssueDAO');
		$issue = $issueDao->getByArticleId($galley->getSubmissionId());

		$journal = $request->getJournal();
		$site = $request->getSite();

		$paramArray = array(
			'issueTitle' => $issue?$issue->getIssueIdentification():__('editor.article.scheduleForPublication.toBeAssigned'),
			'journalTitle' => $journal->getLocalizedName(),
			'siteTitle' => $site->getLocalizedTitle(),
			'currentUrl' => $request->getRequestUrl()
		);

		foreach ($paramArray as $key => $value) {
			$contents = str_replace('{$' . $key . '}', $value, $contents);
		} */

		return $contents;
	}


    private function extractContent(){
        $articleContent = "file_get_contents($documentPath)";
    }
    

}