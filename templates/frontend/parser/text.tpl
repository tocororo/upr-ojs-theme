{**
 * plugins/themes/tocoTheme/templates/frontend/parser/text.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 * @brief for writing article paragraphs
 *}
{strip}
    {foreach from=$parContent->getType() item=textType key=k}
        {if $textType === "bold"}
            <strong>
        {elseif $textType === "italic"}
            <em>
        {elseif $textType === "sup"}
            <sup>
        {elseif $textType === "sub"}
            <sub>
        {elseif $textType === "underline"}
            <span style="text-decoration:underline;">
        {elseif $textType === "monospace"}
            <span style="font-family:monospace,monospace;">
        {elseif $k === "ext-link"}
            {assign var=linkHref value=''}
            {foreach from=$textType key=linkAttribute item=linkValue}
                {if $linkAttribute === "xlink:href"}{assign var=linkHref value=$linkValue}{/if}
            {/foreach}
            <a href="{$linkHref}">
        {elseif $k === "xref"}
            {assign var=xrefType value=''}
            {assign var=xrefId value=''}
            {foreach from=$textType key=xrefAttribute item=xrefValue}
                {if $xrefAttribute === "ref-type"}{assign var=xrefType value=$xrefValue}{/if}
                {if $xrefAttribute === "rid"}{assign var=xrefId value=$xrefValue}{/if}
            {/foreach}
            <a tabindex="0" href="#{$xrefId}" class="intext-citation {$xrefType}" data-toggle="popover" data-placement="top" data-trigger="focus">
        {/if}
    {/foreach}
            {$parContent->getContent()}
    {foreach from=$parContent->getType() item=textType key=k}
        {if $textType === "bold"}
            </strong>
        {elseif $textType === "italic"}
            </em>
        {elseif $textType === "sup"}
            </sup>
        {elseif $textType === "sub"}
            </sub>
        {elseif $textType === "underline"}
            </span>
        {elseif $textType === "monospace"}
            </span>
        {elseif $k === "ext-link"}
            </a>
        {elseif $k === "xref"}
            </a>
        {/if}
    {/foreach}
{/strip}