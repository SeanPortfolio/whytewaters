<?php

$body_cls = (!empty($is_home_page))? ' home' : '';

$heroshot_cls = (!empty($is_home_page)) ? ' heroshot--fs' : '';

$photo_caption_view = '';

if(!empty($is_home_page) && !empty($page_photo_caption))
{
	$photo_caption_view = '<p class="page__photo__caption__text">'.$page_photo_caption.'</p>';

} else {

	$photo_caption_view = '<h2 class="heroshot__heading">'.$page_photo_caption.'</h2>';

}

$slideshow_view = <<<HTML
	<section id="heroshot-section" class="section heroshot__wrapper {$heroshot_cls}">
		<div class="container-fluid heroshot" style="background-image: url({$page_photo});">			
			<div class="page__photo__caption wow fadeIn" data-wow-duration="2s" data-wow-delay="200ms">
				{$photo_caption_view}
				{$freetrial_cta_btn}
			</div>			
		</div>
		{$scroll_btn_view}
	</section>
HTML;



?>