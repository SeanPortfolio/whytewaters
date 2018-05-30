<?php

############################################################################################################################
## Save Testimonial Item
############################################################################################################################

function save_item()
{

    global $message,$id,$do,$disable_menu, $root, $rootfull, $rootadmin, $upload_dir;

    //Save Meta Data
    $meta_data                      = $cat_data = array();
    $page_meta_data_id                   = sanitize_input('page_meta_data_id');
    $meta_data['menu_label']        = sanitize_input('menu_label');
    $meta_data['heading']           = sanitize_input('heading');
    $meta_data['title']             = sanitize_input('title');
    $meta_data['meta_description']  = sanitize_input('meta_description');
    $meta_data['photo']             = sanitize_input('photo');
    $meta_data['short_description'] = sanitize_input('short_description');
    $meta_data['og_title']          = sanitize_input('og_title');
    $meta_data['og_meta_description']    = sanitize_input('og_meta_description');
    $meta_data['og_image']          = sanitize_input('og_image');
    $meta_data['date_updated']      = date('Y-m-d H:i:s');
    $meta_data['updated_by']        = $_SESSION['s_user_id'];

    update_row($meta_data,'page_meta_data', "WHERE id = '{$page_meta_data_id}'");

    $cat_data['is_featured'] = $_POST['is_featured'];
    $client_id               = sanitize_input('client_id', FILTER_SANITIZE_NUMBER_INT);
    $cat_data['client_id']   = $client_id;
    
    update_row($cat_data,'case_study', "WHERE id = '{$id}'");

    //update urls based on client name
    $update_data = array();

    $client_name        = fetch_value("SELECT `name` FROM `client` WHERE `id` = '$client_id' LIMIT 1");
    $url                = ($client_name) ? prepare_item_url($client_name) : prepare_item_url(date('Y-m-d H:i:s'));
    $update_data['url'] = $url;

    $update_data['full_url'] = $page.'/'.$url;

    update_row($update_data,'page_meta_data', "WHERE id = '{$page_meta_data_id}'");

    // ## save page responsive content ###
    // Check if content record exist for this page
    // get all exisitng row belong to this page's content
    $existing_rows = fetch_value("SELECT GROUP_CONCAT(`id`) FROM `content_row` WHERE `page_meta_data_id` = '$page_meta_data_id'");

    if($existing_rows)
    {
        // delete all columns
        run_query("DELETE FROM `content_column` WHERE `content_row_id` IN($existing_rows)");

        // delete all rows
        run_query("DELETE FROM `content_row` WHERE `id` IN($existing_rows)");
    }

    if( !empty($_POST['row-index']) && $page_meta_data_id )
    {
        // save new content rows and columns
        $rows      = $_POST['row-index'];
        $rows_rank = $_POST['row-rank'];
        $row_count = count($rows);

        if($row_count > 0)
        {
            for ($i=0; $i < $row_count; $i++)
            { 
                $row_record = array();
                $row_record['rank']              = ($rows_rank[$i]);
                $row_record['page_meta_data_id'] = $page_meta_data_id;

                $row_id = insert_row($row_record, 'content_row');

                if( $row_id )
                {
                    
                    $columns_rank    = $_POST["content-{$rows[$i]}-rank"];
                    $columns_content = $_POST["content-{$rows[$i]}-text"];
                    $columns_class   = $_POST["content-{$rows[$i]}-class"];

                    $total_row_columns = count($columns_content);

                    if($total_row_columns > 0)
                    {
                        for ($k=0; $k < $total_row_columns; $k++) 
                        { 
                            $column_record                   = array();
                            
                            $column_record['content']        = $columns_content[$k];
                            $column_record['css_class']      = $columns_class[$k];
                            $column_record['rank']           = $columns_rank[$k];
                            $column_record['content_row_id'] = $row_id;

                            insert_row($column_record, 'content_column');
                        }
                    }

                }
            }
        }
            
        

    }
    

    $message = "Item has been saved";
}

?>