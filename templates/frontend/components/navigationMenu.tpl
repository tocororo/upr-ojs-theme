{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 *}

{if $navigationMenu}
    {if $id|escape == "navigationPrimary"}
        <ul id="{$id|escape}" class="{$ulClass|escape} navbar-nav mr-auto">
            {*{if ($requestedPage|escape == "article")}
                <li id="show-user-menu" class="show-user-menu nav-item hidden">
                    <i class="fas fa-angle-double-up fa-lg"></i>
                </li>
            {/if}*}
            <li class="nav-item">
                <a class="nav-link" href="{url page="index"}">
                {translate key="plugins.tocoTheme.home"}
                </a>
            </li>
            {foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
                {if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                    {continue}
                {/if}
                {if !empty($navigationMenuItemAssignment->children)}
                    <li class="{$liClass|escape} nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            {foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
                                {if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                                    <a class="{$liClass|escape} dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
                                        {$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                                    </a>
                                {/if}
                            {/foreach}
                        </div>
                    </li>
                {else}
                    <li class="{$liClass|escape} nav-item">
                        <a class="nav-link" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}</a>
                    </li>
                {/if}
            {/foreach}
        </ul>
    {elseif $id|escape == "navigationUser"}
        {include file="frontend/components/navigationMenuUser.tpl"}
    {*{else}
        <ul id="{$id|escape}" class="{$ulClass|escape}">
            {foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
                {if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                    {continue}
                {/if}
                {if !empty($navigationMenuItemAssignment->children)}
                    <li class="{$liClass|escape} nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            {foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
                                {if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                                    <a class="{$liClass|escape} dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
                                        {$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                                    </a>
                                {/if}
                            {/foreach}
                        </div>
                    </li>
                {else}
                    <li class="{$liClass|escape} nav-item">
                        <a class="nav-link" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}</a>
                    </li>
                {/if}
            {/foreach}
        </ul>
        
        <ul id="{$id|escape}" class="{$ulClass|escape} navbar-nav ml-md-auto d-none d-md-flex">
            {foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
                {if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                    {continue}
                {/if}
                {if !empty($navigationMenuItemAssignment->children)}
                    <li class="{$liClass|escape} nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            {foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
                                {if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                                    <a class="{$liClass|escape} dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
                                        {$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                                    </a>
                                {/if}
                            {/foreach}
                        </div>
                    </li>
                {else}
                    <li class="{$liClass|escape} nav-item">
                        <a class="nav-link" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}</a>
                    </li>
                            {/if}
            {/foreach}
        </ul>
        *}
    {/if}
{/if}