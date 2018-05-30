<?php



//fetch all client logos

$sql = "SELECT `logo_path`, `name` FROM `client` WHERE `status` = 'A' AND `logo_path` != ''";



$client_arr = fetch_all($sql);



$client_view = '';



if(!empty($client_arr))

{

	foreach ($client_arr as $client) {

		$partner_list_items .= '<li><img title="'.$client['name'].'" src="'.$client['logo_path'].'" alt="'.$client['name'].' logo" /></li>';

	}

	$client_view = <<<H



		<div class="container">

			<div class="row">

				<div class="col-xs-12 text-center">

					<h3 class="has-motif">Our Clients</h3>

					<ul class="logos">{$partner_list_items}</ul>

				</div>

			</div>

		</div>



H;



	$tags_arr['mod_view'] .= $client_view;



}





?>