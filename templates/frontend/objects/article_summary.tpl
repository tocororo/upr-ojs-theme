{**
 * templates/frontend/objects/article_summary.tpl
    *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 *}
{assign var=articlePath value=$article->getBestArticleId()}

<div class="card flex-md-row mb-4 shadow-sm h-md-250">


    {if $article->getLocalizedCoverImage()}
        <img class="card-img-left flex-auto d-none d-lg-block w-50 img-article"  src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText() != ''} alt="{$article->getLocalizedCoverImageAltText()|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if} data-holder-rendered="true">
    {/if}

    <div class="card-body d-flex flex-column align-items-start cursor"  data-toggle="collapse" data-target="#article-{$article->getBestArticleId()}" aria-expanded="false" aria-controls="collapseExample" href="#">
        <h4 class="mb-0 card-title">
            {$article->getLocalizedTitle()|strip_unsafe_html}
        </h4>

        <div class="mb-1 text-muted">
            <p class="issue-auth card-text">
                {$article->getAuthorString()}
            </p>
        </div>
        
        <div class="collapse" id="article-{$article->getBestArticleId()}">
            <div class=" d-flex flex-column align-items-start cursor issue-article-extras"> 
                <div class="text-justify"> 
                    {if $article->getLocalizedAbstract()}
                        {$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}
                    {/if}
                </div>
                <a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"class="btn btn-secondary btn-read-more" {/if}>
                    {translate key="common.readMore"}
                </a>
            </div>

        </div>
        
       
       <div class="issue-article-extras d-flex justify-content-between">
                <div>
                    <small class="issue-article-number text-muted">
                        {$article->getPages()|escape}
                    </small>
                    <small class="issue-article-number text-muted">
                        |
                    </small>
                    <small class="issue-article-date text-muted">
                        {translate key="plugins.tocoTheme.published"}: {$article->getDatePublished()|date_format:$dateFormatShort}
                    </small>
                </div>
                <div>
                    <small class="issue-article-number text-muted">
                        <span>{translate key="article.abstract"} {translate key="plugins.tocoTheme.viewed"}</span> - <b>{$article->getViews()}</b>
                        {translate key="plugins.tocoTheme.times"}
                        |
                    </small>
                    {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
                    {if $galleys}
                        {foreach from=$galleys item=galley name=galleyList}
                            <small class="issue-article-number text-muted">
                                <span>{$galley->getGalleyLabel()} {translate key="plugins.tocoTheme.downloaded"}</span> - <b>{$galley->getViews()}</b>
                                {translate key="plugins.tocoTheme.times"}
                                |
                            </small>
                        {/foreach}
                    {/if}
                </div>
                         
            
               
            </div> 
            
            
    </div>                 
            

</div>




{call_hook name="Templates::Issue::Issue::Article"}

