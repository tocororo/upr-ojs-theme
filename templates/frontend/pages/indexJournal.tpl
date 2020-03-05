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
        <div class="col-8">
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
                    <hr class="featurette-divider">
            <div>
            {* <div class="col-md-8"> *}
                {if $issue}
                    
                    {include file="frontend/objects/issue_toc.tpl"}
                        
                        <a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
                            {translate key="journal.viewAllIssues"}
                        </a>

                {/if}
                {call_hook name="Templates::Index::journal"}
            {* </div> *}
            </div>
        </div>

        <div class="col-md-4 col-xs-12">
            {if empty($isFullWidth)}
                {capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
                {if $sidebarCode}
                    {* {if $latestIssues}
                        {include file="frontend/objects/issue_slider.tpl"}
                    {/if} *}
                    <div class="pkp_structure_sidebar" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
    
                        {$sidebarCode}
    
                    </div>
                {/if}
            {/if}
        </div>
    </div>
    
    </div>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
