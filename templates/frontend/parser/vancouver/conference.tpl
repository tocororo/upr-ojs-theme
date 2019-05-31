{**
 * plugins/themes/tocoTheme/templates/frontend/parser/vancouver/conference.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 * @brief template for parsing conference papers
 *}

{** writing conference paper title *}
<span class="ref-title">{$reference->getTitle()}</span>

{** writing authors names or collab*}
<span class="ref-auth">
    {include file="frontend/parser/$cslStyle/authors.tpl"}
</span>

{** writing year, publisher name and location *}
<span class="ref-source">Paper presented at: {strip}
    {if $reference->getConfName() != '' && ($reference->getYear() != '' || $reference->getConfDate() != '' || $reference->getConfLoc() != '')}
        {$reference->getConfName()};
    {else}
        {$reference->getConfName()}
    {/if}
    {/strip} {strip}
    {if $reference->getConfDate() != '' && $reference->getYear() != ''}
        {$reference->getConfDate()},
    {elseif $reference->getConfDate() != '' && $reference->getYear() == '' && $reference->getConfLoc() != ''}
        {$reference->getConfDate()},
    {elseif $reference->getConfDate() != '' && $reference->getYear() == '' && $reference->getConfLoc() == ''}
        {$reference->getConfDate()}
    {/if}
    {/strip} {strip}
    {if $reference->getYear() != '' && $reference->getConfLoc() != ''}
        {$reference->getYear()}.
    {elseif $reference->getYear() != '' && $reference->getConfLoc() == ''}
        {$reference->getYear()}
    {/if}
    {if $reference->getConfLoc() != ''}
        {$reference->getConfLoc()}
    {/if}
    .{/strip}
</span>

{** writing URL, DOI, PMID, PMCID *}

{if $reference->getPubIdType() !== '' || $reference->getUrl() !== ''}
    {include file="frontend/parser/$cslStyle/links.tpl"}
{/if}