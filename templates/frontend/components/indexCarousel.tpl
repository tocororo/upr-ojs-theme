<div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          {* <li data-target="#myCarousel" data-slide-to="2" class="active"></li> *}
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="back" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
            <img class="d-block w-100" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">

           {*  <div class="container"> *}
              <div class="carousel-caption">
                
                {if $homepageImage}
                    <div class="homepage-image-wrapper col-md-12">
                        <img class="img-fluid homepage_image" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
                    </div>

                    {if $showSummary && $journalDescription}
                        <div class="text-justify  summary-content">
                            {$journalDescription}
                        </div>
                    {/if}

                {/if}


              {* </div> *}
            </div>
          </div>
          {*<div class="carousel-item active">
            <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-right">
                <h1>One more for good measure.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
              </div>
            </div>
          </div> *}
        </div>
      </div>