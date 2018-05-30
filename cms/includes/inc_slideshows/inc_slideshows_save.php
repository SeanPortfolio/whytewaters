<?php

############################################################################################################################
## Save slideshow
############################################################################################################################

function save_item() {

    global $message,$id,$imggrp_id,$do,$disable_menu,$htmladmin, $rootfull, $rootadmin, $root;

    $full_path         = $_REQUEST['full_path'];
    $caption_heading   = $_REQUEST['photo_caption_heading'];
    $caption           = $_REQUEST['photo_caption'];
    $imgslide_rank     = $_REQUEST['imgslide_rank'];
    $imggrp_name       = $_REQUEST['imggrp_name'];
    $photo_alt         = $_REQUEST['photo_alt'];
    $photo_rank        = $_REQUEST['photo_rank'];


    $photo_group_data = array();
    $photo_group_data['name'] = sanitize_input('label');
    update_row($photo_group_data, 'photo_group', "WHERE `id` = '{$id}'");

    run_query("DELETE FROM `photo` WHERE `photo_group_id` = '{$id}'");

    for($i=0;$i<count($full_path);$i++)
    {
        $photo_full_path  = "{$rootfull}{$full_path[$i]}";
        
        $photo_details = getimagesize($photo_full_path);

        $temp_array_save['full_path']               = $full_path[$i];
        $temp_array_save['caption_heading']         = $caption_heading[$i];
        $temp_array_save['caption']                 = $caption[$i];
        $temp_array_save['alt_text']                = $photo_alt[$i];
        $temp_array_save['rank']                    = $photo_rank[$i];
        $temp_array_save['width']                   = $photo_details[0];
        $temp_array_save['height']                  = $photo_details[1];
        $temp_array_save['photo_group_id']          = $id;

        insert_row($temp_array_save, 'photo');
    }

    $message = "Item has been saved";

}
?>