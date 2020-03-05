


{if !$indexJournal}
               
                {capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
                {if $sidebarCode}
                    {* {if $latestIssues}
                        {include file="frontend/objects/issue_slider.tpl"}
                    {/if} *}
                    <div class="d-flex pkp_structure_sidebar bg-secondary "  role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
    
                        {$sidebarCode}
    
                    </div>
                {/if}
                 
                
{/if}
