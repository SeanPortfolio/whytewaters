<?php

############################################################################################################################
## Edit FAQ Item
############################################################################################################################

function edit_item()
{

    global $message,$id,$do,$disable_menu,$valid,$htmladmin, $main_subheading, $js_vars;

    $disable_menu = "true";

    $sql = "SELECT cs.`id`, cs.`page_meta_data_id`, cs.`client_id`, cs.`is_featured`, pmd.`name`,
    pmd.`menu_label`, pmd.`heading`, pmd.`url`, pmd.`title`, pmd.`meta_description`,
    pmd.`introduction`, pmd.`og_title`, pmd.`og_image`, pmd.`og_meta_description`, 
    pmd.`short_description`, pmd.`photo`, c.`name` AS client_name,
    (SELECT GROUP_CONCAT(`category_id`) FROM `case_study_has_category` WHERE `case_study_id` = cs.`id`) AS categories_csv
    FROM `case_study` cs
    LEFT JOIN `page_meta_data` pmd
    ON(pmd.`id` = cs.`page_meta_data_id`)
    LEFT JOIN `client` c
    ON(c.`id` = cs.`client_id`)
    WHERE cs.`id` = '{$id}'
    LIMIT 1";

    $row = fetch_row($sql);

    @extract($row);

    $main_subheading = 'Editing: '.(($client_name) ? $client_name : $name);

    ##------------------------------------------------------------------------------------------------------
    // Init view variables

    $meta_content = '';

    ##--------------------------------------------------------------------------------
    // Clients

    $sql = "SELECT c.`name`, c.`id`
            FROM `client` c
            WHERE c.`status` = 'A'
            ORDER BY c.`rank`";

    $client_arr = fetch_all($sql);

    $client_dd = '';

    if(!empty($client_arr))
    {
        $client_dd = '<select name="client_id" id="client_id" style="width:300px;height:23px;">';
        $client_dd .= '<option value="">Select client</option>';
        foreach ($client_arr as $client) {
            $sel = ($client['id'] == $client_id) ? 'selected' : '';
            $client_dd .= '<option '.$sel.' value="'.$client['id'].'">'.$client['name'].'</option>';
        }
        $client_dd .= '</select>';
    }

    $feat_check = ($is_featured == '1') ? 'checked' : '';

    ##------------------------------------------------------------------------------------------------------
    ## Page functions

    $page_functions = <<<HTML

        <ul class="page-action">
            <li><button type="button" class="btn btn-default" onclick="submitForm('save',1)"><i class="glyphicon glyphicon-floppy-save"></i> Save</button></li>
            <li><a class="btn btn-default" href="{$htmladmin}/?do={$do}"><i class="glyphicon glyphicon-arrow-left"></i> Cancel</a></li>
        </ul>
    
HTML;

##------------------------------------------------------------------------------------------------------
## Settings tab content
$settings_content = <<< HTML
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
            <td valign="top" width="130"><label>Client:</label></td>
            <td valign="top">{$client_dd}</td>
        </tr>
        <tr>
            <td valign="top" width="130"><label for="heading">Heading:</label></td>
            <td valign="top">
                <input name="heading" type="text" id="heading" value="$heading" style="width:300px;" />
                <div><small>Leave blank to use client name as heading</small></div>
            </td>
        </tr>
        <tr>
            <td valign="top"><label>Is featured?:</label></td>
            <td>
                <input type="checkbox" {$feat_check} name="is_featured" value="1" /> 
            </td>
        </tr>
        <tr>
            <td valign="top"><label>Photo:</label></td>
            <td valign="top" colspan="3">
                <input name="photo" type="text" id="photo" value="$photo" style="margin:0 5px 5px 0;width:300px;height:25px;float:left;" />
                <input type="button" onclick="openFileBrowser('photo')" style="height:25px;padding:1px 5px;" value="Browse">
                <input type="button" value="clear" onclick="clearValue('photo')" style="height:25px;">
                <div style="clear:both;"><small>Suggested size: 1800x600px</small></div>
            </td>
        </tr>
        <tr>
            <td width="130" valign="top"><label for="short_description">Short Description:</label></td>
            <td valign="top">
                <textarea name="short_description" maxlength="350" style="width:300px;height:150px;resize:none;">$short_description</textarea>
                <div><small>Max length - 350 char.</small></div>
            </td>
        </tr>
    </table>
HTML;

include_once 'views/overview.php';
include_once 'views/meta_data.php';

##------------------------------------------------------------------------------------------------------
## tab arrays and build tabs

$temp_array_menutab                       = array();
$temp_array_menutab['Details']            = $settings_content;
$temp_array_menutab['Content']            = $main_content;
$temp_array_menutab['Meta Data']          = $meta_content;

$counter     = 0;
$tablist     = "";
$contentlist = "";

foreach($temp_array_menutab as $key => $value){

	$tablist.= "<li><a href=\"#tabs-".$counter."\">".$key."</a></li>";
	$contentlist.=" <div id=\"tabs-".$counter."\">".$value."</div>";
	$counter++;
}

$tablist="<div id=\"tabs\"><ul>$tablist</ul><div style=\"padding:10px;\">$contentlist</div></div>";

    $page_contents="<form action=\"$htmladmin/?do={$do}\" method=\"post\" name=\"pageList\" enctype=\"multipart/form-data\">
        {$tablist}
        <input type=\"hidden\" name=\"action\" value=\"\" id=\"action\">
        <input type=\"hidden\" name=\"do\" value=\"{$do}\">
        <input type=\"hidden\" name=\"id\" value=\"{$id}\">
        <input type=\"hidden\" name=\"page_meta_data_id\" value=\"{$page_meta_data_id}\">
    </form>";

require "resultPage.php";
echo $result_page;
exit();

}

?>
