<?php

require_once 'nav.php';

if( !empty($gallery_ids)) {

	$gallery_photos = fetch_all("SELECT `full_path`, `thumb_path`, MD5(`photo_group_id`) AS group_key,
        `photo_group_id`, CONCAT(`width`,'x',`height`) AS size
        FROM `photo`
        WHERE `photo_group_id` IN (".implode(',', array_keys($gallery_ids)).")
        ORDER BY `rank`, `photo_group_id`");


	if( !empty($gallery_photos) )
    {
        $galleryContentView .= '<div class="row"><div class="col-xs-12"><div class="galleries" id="shuffle">';

        foreach ($gallery_photos as $photo)
        {
            $thumb_path      = $photo['thumb_path'];
            $thumb_full_path = "{$rootfull}{$thumb_path}";

            $img     = ( is_file( $thumb_full_path ) ) ? ' style="background-image:url('.$thumb_path.');"' : '';

            $galleryContentView .= '<figure class="col-xs-12 col-sm-6 col-md-4 col-lg-3 gallery__item ps-item" data-groups="[&#34;all&#34;,&#34;'.$photo['group_key'].'&#34;]" data-fpath="'.$photo['full_path'].'" data-size="'.$photo['size'].'" data-gp="'.$photo['group_key'].'" title="'.$gallery_ids[$photo['photo_group_id']].'">
                        <div class="gallery__item__img">
                        	<span'.$img.'></span>
                        </div>
                    </figure>';
        }

        $galleryContentView .= '</div></div></div>';

        //$jsVars['templates']['psGallery'] = file_get_contents("{$tmpldir}/underscore/gallery.tmpl");
        $tags_arr['body_html'] .= file_get_contents("{$tmpldir}/underscore/gallery.tmpl");
    }

    if(!empty($galleryContentView))
    {
    	$galleryContentView= <<<HTML
		    <section class="section">
		        <div class="container-fluid container--fluid-fw container--white text-center">
		            {$galleryContentView}
		        </div>
		    </section>
HTML;
    }
}

?>