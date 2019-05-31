{**
 * templates/frontend/pages/article.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$article->getLocalizedTitle()|escape setPageTitle=false}
<div class="page page_article">
	<div class="container">
    {if $requestedPage|escape != "article"}
			{if $section}
				{include file="frontend/components/breadcrumbs_article.tpl" currentTitle=$section->getLocalizedTitle()}
			{else}
				{include file="frontend/components/breadcrumbs_article.tpl" currentTitleKey="article.article"}
			{/if}
		{/if}

		{* Show article overview *}
			{if $jatsDocument}
			<div class="article-text-row row flex-row-reverse justify-content-between">
				{include file="frontend/parser/articleMainText.tpl"}
			</div>
			{else}
			<div class="article-text-row row flex-row-reverse justify-content-between">
				{include file="frontend/objects/articleOnlyAbstract.tpl"}
			</div>
			{/if}
	</div>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}