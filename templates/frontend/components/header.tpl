{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 *}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
{if $requestedPage|escape == "article"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}">
{else}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}">
{/if}

{* Primary site navigation *}
{capture assign="homeUrl"}
    {if $currentJournal && $multipleContexts}
        {url page="index" router=$smarty.const.ROUTE_PAGE}
    {else}
        {url context="index" router=$smarty.const.ROUTE_PAGE}
    {/if}
{/capture}
<header>
    {include file="frontend/components/navbar.tpl"}   
</header>

{* wraper for the page content; end in the footer; we want full-width container on the article's full-text page 
<main role="main" class="site-content container{if $requestedPage|escape == "article"}-fluid{/if}">

{if !$indexJournal && $setPageTitle}
    {if $pageTitleCustom}
        <h1 class="page-title">{$pageTitleCustom}</h1>
    
    {elseif $pageTitleTranslated}
        <h1 class="page-title">{$pageTitleTranslated}</h1>
    {/if}
    {if $pageSubtitle}
        <h2 class="page-subtitle">{$pageSubtitle}</h2>
    {/if}
{/if}
*}

