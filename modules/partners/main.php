<?php

//fetch all client logos
$sql = "SELECT `logo_path`, `name` FROM `partners` WHERE `status` = 'A' AND `logo_path` != '' ORDER BY  `rank`";

$partner_arr = fetch_all($sql);

$partner_view = '';

if(!empty($partner_arr))
{
	foreach ($partner_arr as $partner) {
		$list_items .= '<li><img title="'.$partner['name'].'" src="'.$partner['logo_path'].'" alt="'.$partner['name'].' logo" /></li>';
	}
	$partner_view = <<<H
    <section class="section section--partners">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 text-center">
					<h2 class="text-up text-green h2-font">Our Clients</h2>
					<ul class="partner-logos">{$list_items}</ul>
				</div>
			</div>
		</div>
    </section>
H;

	$tags_arr['mod_view'] .= $partner_view;
}
