<?php

############################################################################################################################
## Edit FAQ Item
############################################################################################################################

function edit_item()
{

    global $message,$id,$do,$disable_menu,$valid,$htmladmin, $main_subheading, $js_vars, $admin_dir;

    $disable_menu = "true";

    $sql = "SELECT `id`, `heading`, `short_description`, `icon_photo_path`, `status`, `rank` 
        FROM `highlights`
        WHERE `id` = '{$id}'
        LIMIT 1";

    $row = fetch_row($sql);

    if( empty($row) )
    {
        header("Location: {$htmladmin}/?do={$do}");
        exit();
    }

    @extract($row);

    $main_subheading = 'Editing: '.$name;


    ##------------------------------------------------------------------------------------------------------
    // Init view variables

    $meta_content = '';

    ##------------------------------------------------------------------------------------------------------
    ## Page functions

    $page_functions = <<< HTML
    <ul class="page-action">
        <li><button type="button" class="btn btn-default" onclick="submitForm('save',1)"><i class="glyphicon glyphicon-floppy-save"></i> Save</button></li>
        <li><a class="btn btn-default" href="{$htmladmin}/?do={$do}"><i class="glyphicon glyphicon-arrow-left"></i> Cancel</a>
        </li>
    </ul>
HTML;


$details_content = <<< HTML

    <table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
            <td width="130"><label for="heading">Heading:</label></td>
            <td><input name="heading" type="text" id="heading" value="$heading" style="width:600px;" /></td>
            
        </tr>
        <tr>
            
        </tr>
        <tr>

            <td width="200" valign="top">
                <label for="heading">Icon:</label>
            </td>
            <td>
                <input name="icon_photo_path" type="text" value="$icon_photo_path" style="width:250px;" data-thumb-elm="#icon_photo_path" id="icon_photo_path" readonly autocomplete="off">
                <input type="button" value="browse" onclick="openFileBrowser('icon_photo_path')"> 
                <input type="button" value="clear" onclick="clearValue('icon_photo_path')"><br>
                <p><strong>Recommend size: 50x50px and format: jpg</strong></p>
            </td>
        </tr>
        <tr>
            <td width="130" valign="top"><label for="short_description">Short Description:</label></td>
            <td>
                <textarea name="short_description" id="short_description" class="check-max" style="min-height:100px; width:600px;" maxlength="250">$short_description</textarea>
                
            </td>
        </tr>          
    </table>

HTML;


##------------------------------------------------------------------------------------------------------
## tab arrays and build tabs

$temp_array_menutab = array();


$temp_array_menutab['Details']   = $details_content;


$counter = 0;
$tablist ="";
$contentlist="";

foreach($temp_array_menutab as $key => $value){

	$tablist.= "<li><a href=\"#tabs-".$counter."\">".$key."</a></li>";
	

	$contentlist.=" <div id=\"tabs-".$counter."\">".$value."</div>";

	$counter++;
}


//$styles_ext  .= '<link rel="stylesheet" href="/'.$admin_dir.'/css/treatment/options.css?v=2">';
//$scripts_ext .= '<script src="'.$htmladmin.'/js/treatment/options.js?v=1"></script>';
$styles_ext  .= <<<HTML
    <link href="{$htmladmin}/css/bootstrap-iconpicker.min.css" rel="stylesheet">
    <link href="{$htmladmin}/css/glyphicons.css" rel="stylesheet">
HTML;

$scripts_ext .= <<<HTML
    <script src="{$htmladmin}/js/iconset-fontawesome-all.js"></script>
    <script src="{$htmladmin}/js/bootstrap-iconpicker.js"></script>
HTML;


$tablist="<div id=\"tabs\"><ul>$tablist</ul><div style=\"padding:10px;\">$contentlist</div></div>";

    $page_contents="<form action=\"$htmladmin/?do={$do}\" method=\"post\" name=\"pageList\" enctype=\"multipart/form-data\">
        $tablist
        <input type=\"hidden\" name=\"action\" value=\"\" id=\"action\">
        <input type=\"hidden\" name=\"do\" value=\"{$do}\">
        <input type=\"hidden\" name=\"id\" value=\"$id\">
        <input type=\"hidden\" name=\"meta_data_id\" value=\"$page_meta_data_id\">
    </form>";
require "resultPage.php";
echo $result_page;
exit();
}

?>