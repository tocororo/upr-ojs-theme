{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	
<div id="pkp_content_footer" class="site-footer pkp_structure_footer_wrapper" role="contentinfo">

	<div class="pkp_structure_footer d-flex flex-row flex-wrap justify-content-center container">
        {* Primary contact *}
        <div class="d-flex flex-column col-sm-2 col-md-2 col-lg-2">
            {if $siteTitle }
            <h6> {$siteTitle} </h6>
            {/if}
            {if $onlineIssn}
                <p> {translate key="plugins.tocoTheme.onlineIssn"}:  {$onlineIssn} </p>
            {/if}
            {if $printIssn}
                <p> {translate key="plugins.tocoTheme.printIssn"}:  {$printIssn} </p>
            {/if}
            {if $pageFooter}
                {$pageFooter}
            {/if}
            
            <h6>SÍGUENOS EN: </h6>
            <div class="d-flex">
                <a href="http://facebook.com"  target="_blank" class="footer-a-color follow-us"> <i class="fab fa-facebook-f"></i> </a>
                <a href="http://twitter.com" target="_blank" class="footer-a-color follow-us"> <i class="fab fa-twitter"></i> </a>
                <a href="http://plus.google.com" target="_blank" class="footer-a-color follow-us"> <i class="fab fa-google-plus-g"></i> </a>
                <a href="http://linkedin.com" target="_blank" class="footer-a-color"> <i class="fab fa-linkedin-in"></i> </a>
            </div>
        </div>
        <div class="d-flex flex-wrap justify-content-center col-sm-10 col-md-10 col-lg-10">
            {if $contactTitle || $contactName || $contactAffiliation || $contactPhone || $contactEmail}
                <span class="separator"></span>
                <div class="col-sm-6 col-md-6 col-lg-6">
                    {if $publisherInstitution}
                        <p>
                            {$publisherInstitution}
                        </p>                        
                    {/if}
                    {if $mailingAddress}
                        <p>
                            {$mailingAddress}
                        </p>  
                    {/if}
                    {if $contactPhone}
                        <div class="phone">
                        <span class="label">
                            {translate key="about.contact.phone"}:
                        </span>
                            <span class="value">
                            {$contactPhone|escape}
                        </span>
                        </div>
                    {/if}
                    {if $contactName}
                        <div class="name">
                        <span class="label">
                            {translate key="about.contact.principalContact"}:
                        </span>                        
                            {$contactName|escape}
                        </div>
                    {/if}
                    {if $contactEmail}
                        <div class="email">
                        <span class="label">
                            {translate key="about.contact.email"}:
                        </span>  
                            <a href="mailto:{$contactEmail|escape}" class="footer-a-color">
                                {$contactEmail|escape}
                            </a>
                        </div>
                    {/if}

                    {if $contactTitle}
                        <div class="title">
                            {$contactTitle|escape}
                        </div>
                    {/if}

                    

                    
                </div>
            {/if}
            <div class="col-sm-5 col-md-5 col-lg-5">
                {* Technical contact *}
                
                <div class="secondary-contact">
                    <p> Director: Dr.C. Iriadna Marín de León</p>
                    <p> {translate key="about.contact.email"}:
                        <a href="mailto:relcoop@upr.edu.cu" class="footer-a-color">
                            relcoop@upr.edu.cu
                        </a> 
                    </p>
                    <p> {translate key="about.contact.phone"}: 53 48 72 80 06</p>
                    <br>
                    
                    {if $supportName}
                        <div>
                            {translate key="plugins.tocoTheme.technicalSupport"}: {$supportName|escape}
                            <div class="d-flex flex-column">
                                <div class="d-flex justify-content-between">
                                    <span></span>
                                    {if $supportEmail}
                                        <a href="mailto:{$supportEmail|escape}" class="footer-a-color">
                                            {$supportEmail|escape}
                                        </a>
                                    {/if}
                                </div>
                                <div class="d-flex justify-content-around">
                                    <span></span>
                                    {if $supportPhone}
                                       {translate key="about.contact.phone"}: {$supportPhone|escape}
                                    {/if}
                                </div>
                                
                            </div>
                        </div>
                        
                    {/if}
                </div>
            </div>
            
        </div>

        
		
        {*{if $pageFooter}
			<div class="pkp_footer_content">
				{$pageFooter}
			</div>
		{/if}
        *}
		
	</div>

    



    </div><!-- pkp_structure_footer_wrapper -->
    <div class="container text-center">
        <a href="http://www.upr.edu.cu" class="footer-upr">
            <p>
                <img src="http://coodes.upr.edu.cu/plugins/themes/uprJournals/images/upr.png" alt="UPR">
            </p>
            <p>©2019 Universidad de Pinar del Río "Hermanos Saíz Montes de Oca"</p>
        </a>
    </div>
</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
