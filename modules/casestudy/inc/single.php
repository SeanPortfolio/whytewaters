<?php

$query = "SELECT cs.`id` AS case_study_id, c.`name` AS client_name, c.`logo_path`, c.`rep_name`, c.`rep_photo`,
		c.`testimonial`, cs.`page_meta_data_id`, pmd.`full_url`, pmd.`photo`, pmd.`title`,
		pmd.`heading`, pmd.`og_title`,pmd.`og_image`, pmd.`og_meta_description`, pmd.`meta_description`,
		pmd.`short_description`
		FROM `case_study` cs 
		LEFT JOIN `client` c 
		ON(c.`id` = cs.`client_id`)
		LEFT JOIN `page_meta_data` pmd 
		ON(pmd.`id` = cs.`page_meta_data_id`)
		WHERE pmd.`status` = 'A'
		AND pmd.`url` = '$option1'
		ORDER BY pmd.`rank`
		LIMIT 1";

$single_arr = fetch_row($query);

if(!empty($single_arr))
{
	@extract($single_arr);

	$tags_arr['title']          = $title;
	$tags_arr['mdescr']         = $meta_description;
	$tags_arr['og_url']         = $htmlroot.'/'.$full_url;
	$tags_arr['og_meta_description'] = $og_meta_description;
	$tags_arr['og_image']       = $og_image;
	$tags_arr['og_title']       = $og_title;
	$tags_arr['heading']        = ($heading) ? $heading : $client_name;
	$tags_arr['heroshot']       = ($photo) ? '<div class="heroshot" style="background-image:url('.$photo.');"></div>' : '';
	$this_content               = get_content( $page_meta_data_id );
	$tags_arr['intro']          = '<p class="cs-label">CASE STUDY</p>';
	$tags_arr['intro']          .= ($short_description) ? '<p class="intro">'.$short_description.'</p>' : '';

	if($testimonial)
	{
		$client_photo = ($rep_photo) ? '<div class="rep-photo"><img src="'.$rep_photo.'" alt="Photo of '.$rep_name.' from '.$client_name.'" /></div>' : '';

		$testm = <<<H
			<div class="cs-logo"><img src="{$logo_path}" alt=""></div>
			<div class="testm-wrap">
				<p class="testm">{$testimonial}</p>
				{$client_photo}
				<p class="rep-name">{$rep_name}<br>{$client_name}</p>
			</div>
			
H;
	}

	$tags_arr['content'] = <<<H
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4">
            {$testm}
        </div>
        <div class="col-xs-12 col-md-8">
            {$this_content}
        </div>
    </div>
</div>
H;

}



?>