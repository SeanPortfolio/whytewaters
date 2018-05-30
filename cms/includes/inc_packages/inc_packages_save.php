<?php

function save_item()
{
    global $message, $id, $do, $disable_menu, $root, $rootfull, $rootadmin, $upload_dir;;

    $page_data = array();

    $page_data['name'] = sanitize_input('name');
    $page_data['price'] = sanitize_input('price');
    $page_data['description'] = sanitize_input('description');
    $page_data['additional_note'] = sanitize_input('additional_note');
    $page_data['buy_now_url'] = filter_input(INPUT_POST, 'buy_now_url', FILTER_SANITIZE_URL);

    update_row($page_data, 'packages', "WHERE id = '{$id}' LIMIT 1");

    $package_id = $id;
    run_query("DELETE FROM `package_has_features` WHERE `package_id` = '{$package_id}'");

    $package_has_features = $_REQUEST['feature'];
    foreach( $package_has_features as $feature_id => $item ) {
        if( !empty($item['description']) ) {
            insert_row([
                'package_id' => $package_id,
                'feature_id' => $feature_id,
                'description' => $item['description']
            ], 'package_has_features');
        } else {
            if( $item['is_available'] == 'Y' ) {
                insert_row([
                    'package_id' => $package_id,
                    'feature_id' => $feature_id,
                    'is_available' => 'Y'
                ], 'package_has_features');
            }
        }
    }

    $message = "Item has been saved";
}
