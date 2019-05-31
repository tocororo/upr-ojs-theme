<nav class="site-navbar-wraper navbar-expand-lg navbar fixed-top navbar-dark bg-dark">

    <div class="container">
        <div class="d-flex flex-row align-items-center flex-wrap">
            {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
                <a href="{$homeUrl}" class="is_img journal-name navbar-brand">
                    <img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
                            width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}"
                            {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"
                            {else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
                </a>
            {elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
                <a href="{$homeUrl}" class="is_text journal-name navbar-brand">{$displayPageHeaderTitle}</a>
            {elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
                <a href="{$homeUrl}" class="is_img journal-name navbar-brand">
                    <img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}"
                            alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}"
                            height="{$displayPageHeaderTitle.height|escape}"/>
                </a>
            {/if}
            
        </div>
        {*start menu*}
            {load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary d-flex flex-row align-items-center flex-wrap"}
        {*end menu*}
        
        <div class="d-flex flex-row align-items-center flex-wrap">
            <form id="search_form" class="input-group form-inline d-flex flex-row align-items-center" action="{url page="search" op="search"}" method="post" role="search">
                {csrf}                           
                <input type="text" name="query" value="{$searchQuery|escape}" class="search-input-tag marg-l hidden-border" placeholder="{translate key="common.search"}" aria-label="Search">
                {*<span class="input-group-btn">
                    <button class="btn btn-secondary"
                            type="submit"><i class="fas fa-lg fa-search"></i></button>
                </span>*}                  
                <button type="submit" class="button-none"  data-toggle="tooltip" data-placement="bottom" title="{translate key="common.search"}">
                    <i class="fas fa-lg fa-search" style="color: #c0c0c0;"></i>
                </button>
            </form>  
            <ul id="navigationLanguages" class="toco_navigation">
                <li class="nav-item dropdown">
                     <a class="nav-link " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-lg fa-globe"></i>
                     </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        {foreach from=$languageToggleLocales item=localeName key=localeKey}
                                <a class=" dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
                                    {$localeName}
                                </a>
                        {/foreach}
                    </div>
                </li>
            </ul>

            {load_menu name="user" id="navigationUser" ulClass="toco_navigation pkp_navigation_user" liClass=""}

            {*<form class="form-inline pkp_search_toco" action="{url page="search" op="search"}" method="post" role="search">
                {csrf}
                <input name="query" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}">
                <button type="submit">
                    {translate key="common.search"}
                </button>
            </form>           
            
            {load_menu name="user" id="navigationUser" ulClass="pkp_navigation_primary flex-row justify-content-end"}

           {* 
           {if ($displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)) || $requestedPage|escape == "article"}
                <a href="{$homeUrl}" class="is_text journal-name navbar-brand">{$displayPageHeaderTitle}</a>
            {/if}
            *}
        </div>

    </div>

    
          
    
</nav>


