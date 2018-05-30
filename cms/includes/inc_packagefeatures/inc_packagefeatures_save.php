<?php

function save_item()
{
    global $message, $id, $do, $disable_menu, $root, $rootfull, $rootadmin, $upload_dir;;

    $page_data = array();

    $page_data['name'] = sanitize_input('name');
    $page_data['tooltip'] = sanitize_input('tooltip');

    update_row($page_data, 'package_features', "WHERE id = '{$id}' LIMIT 1");

    $message = "Item has been saved";
}
