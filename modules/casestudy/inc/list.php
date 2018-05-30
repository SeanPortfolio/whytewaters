<?php
$sql = "SELECT cs.`id` AS case_study_id, c.`name` AS client_name, c.`logo_path`, pmd.`full_url`,pmd.`short_description`
		FROM `case_study` cs 
		LEFT JOIN `client` c 
		ON(c.`id` = cs.`client_id`)
		LEFT JOIN `page_meta_data` pmd 
		ON(pmd.`id` = cs.`page_meta_data_id`)
		WHERE pmd.`status` = 'A'
		ORDER BY pmd.`rank`";

$case_study_arr = fetch_all($sql);
if($page == $page_casestudy->url && !$option1) {
    $extra_class = 'case-study-page';
}
if(!empty($case_study_arr))
{
	$sub_heading = ($option1) ? '<div class="row"><h3 class="has-motif col-xs-12 text-center">More Case Studies</h3></div>' : '';

	$list = '<div class="cs-list ' . $extra_class . '"><div class="container">'.$sub_heading;

	foreach ($case_study_arr as $case) {

		$logo = ($case['logo_path']) ? '<div class="logo"><img src="'.$case['logo_path'].'" alt="'.$client['client_name'].' logo" ></div>' : '';
		
		$case_study_id = $case['case_study_id'];
		$attached_ids  = fetch_value("SELECT GROUP_CONCAT(`category_id`) FROM `case_study_has_category` WHERE `case_study_id` = '$case_study_id'");

		$list .= <<<H
			<div class="row">
				<div class="col-xs-12">
					<div class="cs-item">
						<div class="tri-col"><span class="green-tri"></span></div>
						<div class="row">
							<div class="col-xs-12 col-sm-6">
								<p class="cs-label">CASE STUDY</p>
								<h3><a href="/{$page_casestudy->url}{$case['full_url']}">{$case['client_name']}</a></h3>
								{$logo}
							</div>
							<div class="col-xs-12 col-sm-6">
								<p>{$case['short_description']}</p>
								<p><a class="btn__white" href="/{$page_casestudy->url}{$case['full_url']}">Read Case Study</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
H;

	}

	$list .= '</div></div>';

	$tags_arr['mod_view'] = $list;
}



?>