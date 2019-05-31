{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}


{*include file="frontend/components/indexCarousel.tpl" *}

<div class="page_index_journal container">
    <div class="index-page-content">
        <div class="row">
            <div class="jumbotron ">
                {if $homepageImage}
                    <div class="homepage-image-wrapper col-md-12">
                        <img class="img-fluid homepage_image" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
                    </div>

                    {if $showSummary && $journalDescription}
                        <div class="text-justify summary-content">
                            {$journalDescription}
                        </div>
                    {/if}

                {/if}
            </div>
        </div>
        <hr class="featurette-divider">
        <div class="row">
        
        <div class="col-md-8">
            {if $issue}
                <div class="row featurette">
                    
                    {if $issue->getLocalizedCoverImageUrl()}
                        <div class="col-md-5">
                                <img class="featurette-image img-fluid mx-auto"  src="{$issue->getLocalizedCoverImageUrl()}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
                        </div>    
                        <div class="col-md-7">
                            <h2 class="featurette-heading">
                            {translate key="journal.currentIssue"}
                            </h2>
                            <p class="lead">
                                {$issue->getIssueIdentification()|strip_unsafe_html}
                            </p>
                        </div>
                    {else}
                        <h2 class="featurette-heading">
                            {translate key="journal.currentIssue"}
                            </h2>
                            <p class="lead">
                                {$issue->getIssueIdentification()|strip_unsafe_html}
                            </p>
                            {* Description *}
                            {if $issue->hasDescription()}
                                <p class="injournal-description">
                                    {$issue->getLocalizedDescription()|strip_unsafe_html}
                                </p>
                            {/if}
                    {/if}
                </div>
                {include file="frontend/objects/issue_toc.tpl"}
                    
                    <a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
                        {translate key="journal.viewAllIssues"}
                    </a>

            {/if}
            {call_hook name="Templates::Index::journal"}
        </div>
        <div class="col-md-4">
            {if empty($isFullWidth)}
                {call_hook|assign:"sidebarCode" name="Templates::Common::Sidebar"}
                {if $sidebarCode}
                    {* {if $latestIssues}
                        {include file="frontend/objects/issue_slider.tpl"}
                    {/if} *}
                    {include file="frontend/components/sidebar.tpl"}
                {/if}
            {/if}
        </div>
    </div>
    </div>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
