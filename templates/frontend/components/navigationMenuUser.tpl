{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 *}

        {*<ul id="{$id|escape}" class="{$ulClass|escape} navbar-nav mr-auto pkp_navigation_primary">*}
        <ul class="{$ulClass|escape} navbar-nav mr-auto pkp_navigation_primary">
            <li class="nav-item dropdown"> 
            <a class="nav-link " href="#" id="navbarDropdownUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-lg fa-user" style="color: white"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownUser">
                {foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
                    {if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                        {continue}
                    {/if}
                    {if $navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                        {if !empty($navigationMenuItemAssignment->children)}
                            {foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
                                {if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                                    <a class="{$liClass|escape}  dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}" >
                                        {$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                                    </a>
                                    
                                {/if}
                            {/foreach}
                        {else}
                            <a class="{$liClass|escape}  dropdown-item"  href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
                                {$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                            </a>
                        {/if}

                    {/if}
                {/foreach}
                </div>
            </li>
        </ul>
