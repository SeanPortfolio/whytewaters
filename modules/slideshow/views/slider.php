<?php

$body_cls = (!empty($is_home_page))? ' home' : '';
$section_cls    = (!empty($is_home_page)) ? ' slider-wrapper--fs' : '';

$slideshow_photos = fetch_all("SELECT `full_path`, `width`, `height`, `caption_heading`, `caption`, `alt_text`
    FROM `photo`
    WHERE `photo_group_id` = '{$slideshow_id}'
    AND `full_path` != ''
    ORDER BY `rank`");

if( !empty($slideshow_photos) )
{
    foreach ($slideshow_photos as $slideshow_photo)
    {
       $photo_path      = $slideshow_photo['full_path'];
       $photo_caption   = $slideshow_photo['caption'];
       $photo_alt_text  = $slideshow_photo['alt_text'];


       $slideshow_view .= <<<HTML
       <div class="slider__img item" style="background-image: url({$photo_path});" title="{$photo_alt_text}">
            <div class="page__photo__caption">
                    <p class="page__photo__caption__text">{$photo_caption}</p>
                    {$freetrial_cta_btn}
            </div>
       </div>
HTML;
    }

    $slideshow_view = <<<HTML
        <section id="heroshot-section" class="section slider__wrapper {$section_cls}">
            <div id="slider" class="slider">
                {$slideshow_view}
            </div>
            {$scroll_btn_view}
        </section>
HTML;
}



?>