<?php

############################################################################################################################
## Save Review Item
############################################################################################################################
function build_page_url($page_id, $reset = false)
{
    static $urls = array();
    static $count = 0;

    if($page_id)
    {
       $page_data = fetch_row("SELECT `id` AS `testm_id`, `heading`, `short_description`, `icon_cls`, `status`, `rank`
            FROM `highlights`
            WHERE `id` = '{$page_id}'
            LIMIT 1");



        if($page_data)
        {
            $pg_url = (in_array($page_data['url'], array('/', 'home'))) ? '' : $page_data['url'];

            array_unshift($urls, $pg_url);

            $parent_id = $page_data['parent_id'];

            if($parent_id != 0)
            {
                build_page_url($parent_id);
            }

        }

    }

   
    $csv = implode('/', $urls);
    if($reset == true)
    {
        $urls = array();
    }
    return $csv;
}
function save_item()
{
    global $message,$id,$do,$disable_menu, $root, $rootfull, $rootadmin, $upload_dir;
    
    
    $advantage_data['heading']           = sanitize_input('heading');
    $advantage_data['icon_photo_path']   = sanitize_input('icon_photo_path');
    $advantage_data['short_description'] = sanitize_input('short_description');
    
    update_row($advantage_data, 'highlights', "WHERE id = '{$id}' LIMIT 1");

    $message = "Item has been saved";

}

?>