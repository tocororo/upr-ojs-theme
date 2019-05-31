{**
 * plugins/themes/tocoTheme/templates/frontend/parser/abstract.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 * article abstract
 *}

<div class="panwrap abstract">
    <div class="section-abstract" {* data-toggle="collapse" data-parent="#accordion" href="#accordion1" aria-expanded="true" aria-controls="accordion1" id="s1" *}>
        <!-- <h5 class="title title-abstract" id="sec-0">
            {translate key="article.abstract"}
        </h5> -->
    </div>
    <div class="forpan{*collapse show id="accordion1" role="tabpanel'*}">
        <div class="panel-body mt-3">
            {$article->getLocalizedAbstract()|strip_unsafe_html}
        </div>
    </div>
</div>