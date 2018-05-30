<?php

$tags_arr['main_content'] = <<<HTML
    <section class="section section--main">
        <div class="main__content__wrapper"> 
            <div class="row main__content">
                <div class="main__intro col-xs-12">
                    <h1 class="main__intro--heading">{$heading}</h1>
                    <p class="main__intro--desc">{$introduction}</p>
                    <a class="btn__white margin-top-bottom" href="{$page_salesforce->full_url}"> FREE TRIAL </a>
                </div>
            </div>
            <div class="row main__content">
                <div class="content__wrapper">
                    {$page_content}
                </div>
            </div>
        </div>
    </section>
HTML;

$tags_arr['homepage_youtube'] = <<<HTML
<section class="section section--homepage-youtube">
    <div class="homepage-youtube-wrapper">
        <div id="ytplayer" data-id="{$youtube_id_intro}" data-autoplay="false"></div>
        <div class="homepage-youtube__background" style="background-image:url({$youtube_thumbnail_intro});"></div>
        <div class="play-video-btn"><i class="fa fa-play"></i></div>
    </div>
</section>
HTML;
