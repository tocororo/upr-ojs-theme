<nav class="site-navbar-wraper  navbar fixed-top navbar navbar-expand-lg navbar-light bg-light ">

    <div class="container">
        
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
        <button class="navbar-toggler" type="button" data-toggle="collapse" style="color: white;" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon " ></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            {*start menu*}
                {load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
            {*end menu*}
            <form  class="form-inline my-2 my-lg-0"  action="{url page="search" op="search"}" method="post">
                {csrf}                           
                <input type="search" name="query" value="{$searchQuery|escape}" class="form-control mr-sm-2" placeholder="{translate key="common.search"}" aria-label="Search">
                {*<span class="input-group-btn">
                    <button class="btn btn-secondary"
                            type="submit"><i class="fas fa-lg fa-search"></i></button>
                </span>*}                  
                <button type="submit" class="btn btn-primary my-2 my-sm-0"  data-toggle="tooltip" data-placement="bottom" title="{translate key="common.search"}">
                    <i class="fas fa-lg fa-search" style="color: white;"></i>
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

            {load_menu name="user" id="navigationUser" ulClass="pkp_navigation_primary " liClass="" }

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


