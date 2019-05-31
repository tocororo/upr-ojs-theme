{**
 * templates/frontend/pages/editorialTeam.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *}
{include file="frontend/components/header.tpl" pageTitle="about.editorialTeam"}

<div class="page page_editorial_team">
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.editorialTeam"}
    <div class="container">
        {include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.editorialTeam"}
        {$currentContext->getLocalizedSetting('editorialTeam')}
    </div>
</div>

{include file="frontend/components/footer.tpl"}
