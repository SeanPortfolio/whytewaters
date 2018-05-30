<?php

$tourItems = '';

$counter = 0;

foreach ($arrTours as $tour) {
	
	$counter++;

	$tourAdultRate       = (empty($tour['adult_rate'])) ? 'POA' : $tour['adult_rate'];
	$tourChildRate       = (empty($tour['child_rate'])) ? 'POA' : $tour['child_rate'];
	
	$tourLabel           = $tour['menu_label'];
	$tourDetails         = $tour['short_description'];
	$tourFullURL         = $tour['full_url'];
	$tourURL             = $tour['url'];
	$tourPhoto           = $tour['thumb_photo'];
	$tourBookingEngineId = $tour['booking_engine_url'];
	
	$ending              = '...';
	$tourDetails         = nl2br($tourDetails);
	$tourDetails         = str_truncate($tourDetails, 120, $ending, true, true);

	$btnTourBookNow = '';
	
	if(!empty($bookingPgUrl) && !empty($tourBookingEngineId)){

		$btnTourBookNow = '<a href="'.$bookingPgUrl.'/tour/'.$tourURL.'" title="Book Now" class="btn btn__blue--dark">Book Now</a>';

	}

	$elmDelay = $counter*300;

	$tourItems .= <<<HTML
		<div class="col-xs-12 col-md-6 grid__col">
			<div class="bg--white tour-item">
				<div class="grid__col__image">
					<a href="{$tourFullURL}"><span style="background-image:url({$tourPhoto})"></span></a>
				</div>
				<div class="grid__col__content text-center">
					<h2 class="grid__col__heading"><a href="{$tourFullURL}" title="{$tourLabel}">{$tourLabel}</a></h2>
					<p class="grid__col__rate">
						<span><label>Adults:</label> &#36;{$tourAdultRate}</span>
						<span><label>Children:</label> &#36;{$tourChildRate}</span>
					</p>
					<p class="grid__col__desc">{$tourDetails}</p>
					<p class="grid__col__btn">
						<a href="{$tourFullURL}" title="{$tourLabel}" class="btn btn__gold">Explore</a>
						{$btnTourBookNow}
					</p>
				</div>
			</div>
		</div>
HTML;

$bookingContentView = <<<HTML
	<section class="section bg--blue">
		<div class="container grid-cols">
	        <div class="row">
	            {$tourItems}
	        </div>
	    </div>
	</section>
HTML;

}


?>