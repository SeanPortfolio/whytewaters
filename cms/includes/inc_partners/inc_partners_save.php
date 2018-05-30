<?php

############################################################################################################################
## Save Testimonial Item
############################################################################################################################

function save_item()
{

    global $message,$id,$do,$disable_menu, $root, $rootfull, $rootadmin, $upload_dir;

	$page_data                = array();
	
	$page_data['name']        = sanitize_input('name');
	$page_data['logo_path']   = sanitize_input('logo_path');
    
    update_row($page_data, 'partners', "WHERE id = '{$id}'");

    $message = "Item has been saved";

}

?>