<?php

$carousel = '';

//fetch featured case studies-------------------------------

$sql = "SELECT c.`name` AS client_name, c.`logo_path`, c.`rep_name`,
		c.`rep_photo`, c.`testimonial`, pmd.`full_url`,pmd.`short_description`
		FROM `case_study` cs 
		LEFT JOIN `client` c 
		ON(c.`id` = cs.`client_id`)
		LEFT JOIN `page_meta_data` pmd 
		ON(pmd.`id` = cs.`page_meta_data_id`)
		WHERE cs.`is_featured` = '1'
		AND pmd.`status` = 'A'
		ORDER BY pmd.`rank`";

$case_study_arr = fetch_all($sql);

if(!empty($case_study_arr))
{

	$slides = '';

	foreach ($case_study_arr as $case) {
		
		$testm = '';

		if($case['testimonial'])
		{
			$client_photo = ($case['rep_photo']) ? '<div class="rep-photo"><img src="'.$case['rep_photo'].'" alt="Photo of '.$case['rep_name'].' from '.$case['client_name'].'" /></div>' : '';

			$truncate = (strlen($case['testimonial']) > 200) ? substr($case['testimonial'], 0, 200).'...' : $case['testimonial'];

			$testm = <<<H
				
				<div class="testm-wrap">
					<p class="testm">{$truncate}</p>
					<p class="rep-name">{$case['rep_name']}<br>{$case['client_name']}</p>
					{$client_photo}
				</div>
				
H;
		}

		$logo = ($case['logo_path']) ? '<div class="logo"><img src="'.$case['logo_path'].'" alt="'.$client['client_name'].' logo" ></div>' : '';

		$slides .= <<<H

			<div class="slide">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-lg-4 hidden-xs">
						{$testm}
					</div>
					<div class="col-xs-12 col-sm-6 col-lg-6 col-lg-push-1">
						<h2 class="cs-label h2-font">CASE STUDY</h2>
						<h3>{$case['client_name']}</h3>
						{$logo}
						<p>{$case['short_description']}</p>
						<p><a class="btn__white" href="/{$page_casestudy->url}{$case['full_url']}">Read Case Study</a></p>
					</div>
				</div>
			</div>
H;
	}

	$carousel = <<<H

		<div class="feat-wrap">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="case-study-carousel">
							{$slides}
						</div>
					</div>
				</div>
			</div>
		</div>

H;

	$tags_arr['mod_view'] .= $carousel;

}

