<?php

if($latitude && $longitude && $zoomLevel && $markerLatitude && $markerLongitude)
{
	$info_heading        = (!empty($mapHeading)) ? $mapHeading : $company_name;
	$info_address        = (!empty($mapAddress)) ? $mapAddress : $company_address;

	$jsVars['latitude']  = $markerLatitude;
	$jsVars['longitude'] = $markerLongitude;
	$jsVars['zoomLevel'] = $zoomLevel;
	$jsVars['address']   = '<h4>'.$info_heading.'</h4><p>'.$info_address.'</p>';

	$tags_arr['script-ext'] .= '<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqeRCfbUFp9cDWpnZPu1B8AnNnLCT9ZjQ"></script>';
	$map = <<<HTML
			<section class="section section-no-gutters">
				<div class="container-fluid map">	        			
					<div class="row">
						<div class="col-xs-12 map__wrapper">
							<div id="map-canvas"></div>
						</div>
					</div>
				</div>
			</section>
HTML;

	$tags_arr['mod_view'] .= $map;
}



?>