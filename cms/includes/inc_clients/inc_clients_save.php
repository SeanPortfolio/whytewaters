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
	$page_data['rep_name']    = sanitize_input('rep_name');
	$page_data['rep_photo']   = sanitize_input('rep_photo');
	$page_data['testimonial'] = sanitize_input('testimonial');
    
    update_row($page_data, 'client', "WHERE id = '{$id}'");

    $message = "Item has been saved";

}
