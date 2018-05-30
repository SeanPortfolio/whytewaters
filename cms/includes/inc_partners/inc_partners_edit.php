<?php

############################################################################################################################
## Edit FAQ Item
############################################################################################################################

function edit_item()
{

    global $message,$id,$do,$disable_menu,$valid,$htmladmin, $main_subheading, $js_vars;

    $disable_menu = "true";

    $sql = "SELECT `name`, `logo_path` 
    FROM `partners`
    WHERE `id` = '{$id}' LIMIT 1";

    $row = fetch_row($sql);

    @extract($row);


    ##------------------------------------------------------------------------------------------------------
    // Init view variables


    ##------------------------------------------------------------------------------------------------------
    ## Page functions

    $page_functions = <<< HTML
    <ul class="page-action">
        <li><button type="button" class="btn btn-default" onclick="submitForm('save',1)"><i class="glyphicon glyphicon-floppy-save"></i> Save</button></li>
        <li><a class="btn btn-default" href="{$htmladmin}/?do={$do}"><i class="glyphicon glyphicon-arrow-left"></i> Cancel</a>
        </li>
    </ul>
HTML;


##------------------------------------------------------------------------------------------------------
## Settings tab content
$settings_content = <<< HTML
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
            <td width="130"><label for="name">Partner Name:</label></td>
            <td><input name="name" type="text" id="name" value="$name" style="width:300px;" /></td>
        </tr>
        <tr>
            <td valign="top"><label>Partner Logo:</label></td>
            <td valign="top">
                <input name="logo_path" type="text" id="logo_path" value="$logo_path" style="margin-right:5px;width:300px;height:23px;float:left;" />
                <input type="button" onclick="openFileBrowser('logo_path')" style="height:23px;padding:1px 5px;" value="Browse">
                <input type="button" value="clear" onclick="clearValue('logo_path')" style="height:23px;"><br>
                <small>Suggested max width and max height: 360px (transparent PNG file)</small>
            </td>
        </tr>
    </table>
HTML;



##------------------------------------------------------------------------------------------------------
## tab arrays and build tabs

$temp_array_menutab            = array();
$temp_array_menutab['Details'] = $settings_content;

$counter = 0;
$tablist ="";
$contentlist="";

foreach($temp_array_menutab as $key => $value){

	$tablist.= "<li><a href=\"#tabs-".$counter."\">".$key."</a></li>";
	

	$contentlist.=" <div id=\"tabs-".$counter."\">".$value."</div>";

	$counter++;
}

$tablist="<div id=\"tabs\"><ul>$tablist</ul><div style=\"padding:10px;\">$contentlist</div></div>";

    $page_contents="<form action=\"$htmladmin/?do={$do}\" method=\"post\" name=\"pageList\" enctype=\"multipart/form-data\">
        $tablist
        <input type=\"hidden\" name=\"action\" value=\"\" id=\"action\">
        <input type=\"hidden\" name=\"do\" value=\"{$do}\">
        <input type=\"hidden\" name=\"id\" value=\"$id\">
        <input type=\"hidden\" name=\"meta_data_id\" value=\"$id\">
    </form>";
require "resultPage.php";
echo $result_page;
exit();

}

?>