<?php

############################################################################################################################
## Save Testimonial Item
############################################################################################################################

function save_item()
{

    global $message,$id,$do,$disable_menu, $root, $rootfull, $rootadmin, $upload_dir;

    $page_data = array();



	$page_data['question']        = sanitize_input('question');
	$page_data['answer'] = sanitize_input('answer');

    update_row($page_data, 'faq', "WHERE id = '{$id}'");


    $message = "Item has been saved";

}

?>