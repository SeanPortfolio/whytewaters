<?php

$videoCaption = (!empty($youtubeVideoCaption)) ? '<p class="page__photo__caption__text">'.$youtubeVideoCaption.'</p>' : '';

$slideshow_view = <<<HTML
	<section class="section video__wrapper">
		<div class="container-fluid">
			<div class="video__wrapper--item">
				<div class="cover-video" data-id="{$youtube_id}"></div>
				<div class="page__photo__caption page__photo__caption--ghost">
					{$videoCaption}
					{$freetrial_cta_btn}
        		</div>
			</div>
		</div>
		{$scroll_btn_view}
	</section>

HTML;

?>