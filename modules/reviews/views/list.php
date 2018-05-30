<?php

if($arrReviews) {		

	foreach ($arrReviews as $review) {

		
		$person    = $review['person_name'];
		$detail    = $review['description'];
		$photoPath = $review['photo_path'];
		
		if(!empty($photoPath)){

			$imageView = '<img src="'.$photoPath.'" alt="'.$person.'" class="review__item__img" />';

		} else {
		
			$imageView = '<span class="review__item__img review__item__img-avatar"><i class="review__avatar"></i></span>';
		
		}
		
		$testimonialView .= <<<HTML
			<blockquote class="review__item">
				{$imageView}
				<p class="review__item__text">
					{$detail} 
					<span class="review__item__person">{$person}</span>
				</p>				
			</blockquote>
HTML;

	}

	$reviewsPgURL = $page_reviews->full_url;

	$moreReviewsURL = (!empty($reviewsPgURL)) ? '<p><a href="'.$reviewsPgURL.'" class="btn btn__link" title="READ MORE REVIEWS">READ MORE REVIEWS</a></p>' : '';
	
	$testimonialView = <<<HTML
		<div class="reviews__wrappertext-center">
			<div class="reviews-list">
				{$testimonialView}
			</div>
 		</div>
HTML;

}

?>