<?php

$testimonialView        = '';
$testimonialContentView = '';


$arrReviews = fetch_all("SELECT `id`,
			  `person_name`,
			  `person_location`,
			  `photo_path`,
			  `description`,
			  `date_posted`,
			  `rank`
			FROM `review`
			WHERE `status` = '".FLAG_ACTIVE."'
			ORDER BY `rank`");


if (!empty($arrReviews)) {
	
	if ($page == $page_reviews->url) {	
		
		require_once "views/list.php";
	
	} else {

		require_once "views/carousel.php";	

	}

	if (!empty($testimonialView)) {

		$testimonialContentView = <<<HTML
			<section class="section wow fadeInUp" data-wow-duration="1s" data-wow-delay="100ms">
	            <div class="container-fluid container--fluid-fw">
	            	{$testimonialView}
	            </div>
            </section>
HTML;

	}
	
}

$tags_arr['testimonial_view'] .= $testimonialContentView;

?>