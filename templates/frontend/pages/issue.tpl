{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 *
 * Distributed under the GNU GPL v3.
 *
 *
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification pageTitleCustom=$issueSeries pageSubtitle=$issueTitle}

<div class="page-issue container">

	{* Display a message if no current issue exists *}
	{if !$issue}
		{include file="frontend/components/breadcrumbs_issue.tpl" currentTitleKey="current.noCurrentIssue"}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="current.noCurrentIssueDesc"}

	{* Display an issue with the Table of Contents *}
	{else}
		{include file="frontend/components/breadcrumbs_issue.tpl" currentTitle=$issueIdentification}
		{include file="frontend/objects/issue_toc.tpl"}
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
