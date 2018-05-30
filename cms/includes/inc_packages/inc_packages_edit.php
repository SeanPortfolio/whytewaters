<?php

function edit_item()
{
    global $message,$id,$do,$disable_menu,$valid,$htmladmin, $main_subheading, $js_vars;

    $disable_menu = "true";

    $sql = "
            SELECT 
                `name`,
                `price`,
                `description`,
                `additional_note`,
                `buy_now_url`
            FROM `packages`
            WHERE `id` = '{$id}'
            LIMIT 1
    ";

    $item = fetch_row($sql);

    $page_functions = <<< HTML
    <ul class="page-action">
        <li><button type="button" class="btn btn-default" onclick="submitForm('save',1)"><i class="glyphicon glyphicon-floppy-save"></i> Save</button></li>
        <li><a class="btn btn-default" href="{$htmladmin}/?do={$do}"><i class="glyphicon glyphicon-arrow-left"></i> Cancel</a>
        </li>
    </ul>
HTML;

    $settings_content = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="8">
            <tr>
                <td width="130"><label for="name">Package Name:</label></td>
                <td><input name="name" type="text" id="name" value="{$item['name']}" style="width:300px;" /></td>
            </tr>
            <tr>
                <td width="130" valign="top"><label for="price">Price:</label></td>
                <td valign="top">
                    <input name="price" type="text" id="price" value="{$item['price']}" style="width:300px;">
                </td>
            </tr>
            <tr>
                <td width="130" valign="top"><label for="description">Description:</label></td>
                <td valign="top">
                    <input name="description" type="text" id="description" value="{$item['description']}" style="width:300px;">
                </td>
            </tr>
            <tr>
                <td width="130" valign="top"><label for="additional_note">Additional Note:</label></td>
                <td valign="top">
                    <input name="additional_note" type="text" id="additional_note" value="{$item['additional_note']}" style="width:300px;">
                    <p><small>e.g. $8 billed monthly</small></p>
                </td>
            </tr>
            <tr>
                <td width="130" valign="top"><label for="buy_now_url">Buy Now URL:</label></td>
                <td valign="top">
                    <input name="buy_now_url" type="text" id="buy_now_url" value="{$item['buy_now_url']}" style="width:300px;">
                </td>
            </tr>
        </table>
HTML;

    $package_features = fetch_all("
        SELECT p.id, p.name
        FROM package_features AS p
        WHERE status = 'A'
        ORDER BY rank
    ");

    $this_package_has_features = fetch_all("
        SELECT feature_id, is_available, description
        FROM package_has_features
        WHERE package_id = {$id}
    ");

    $feature_id_as_id = [];
    foreach($this_package_has_features as $item ) {
        $feature_id_as_id[$item['feature_id']] = [
            'description' => $item['description'],
            'is_available' => $item['is_available']
        ];
    }

    $feature_rows = <<<HTML
        <div class="form-group">
            <span class="display-inline-block" style="width:250px;">
                <label>Feature Name</label>
            </span>
            <span class="display-inline-block" style="width:100px;">
                <label>Is Available?</label>
            </span>
            <span class="display-inline-block" style="width:100px;">
                <label>Description</label>
            </span>
        </div>
HTML;

    foreach ($package_features as $item) {
        $checked = ($feature_id_as_id[$item['id']]['is_available'] == 'Y') ? 'checked' : '';
        $feature_rows .= <<<FEATUREROW
        <div class="form-group">
            <span class="display-inline-block" style="width:250px;">
                <label>{$item['name']}</label>
            </span>
            <span class="display-inline-block" style="width:100px;">
                <input type="checkbox" name="feature[{$item['id']}][is_available]" $checked value="Y">
            </span>
            <span class="display-inline-block" style="width:100px;">
                <input type="text" name="feature[{$item['id']}][description]" value="{$feature_id_as_id[$item['id']]['description']}">
            </span>
        </div>
FEATUREROW;
    }

    $attached_features_content = <<< HTML
        <div>
            {$feature_rows}
        </div>
<style>.display-inline-block {display: inline-block;}</style>
HTML;

    $temp_array_menutab = array();

    $temp_array_menutab['Details']   = $settings_content;
    $temp_array_menutab['Attached Features']   = $attached_features_content;

    $counter = 0;
    $tablist = "";
    $contentlist = "";

    foreach($temp_array_menutab as $key => $value){
        $tablist .= "<li><a href=\"#tabs-".$counter."\">".$key."</a></li>";
        $contentlist .= "<div id=\"tabs-".$counter."\">".$value."</div>";
        $counter++;
    }

    $tablist = "<div id=\"tabs\"><ul>$tablist</ul><div style=\"padding:10px;\">$contentlist</div></div>";

    $page_contents = <<<PAGECONTENT
    <form action="{$htmladmin}/?do={$do}" method="post" name="pageList" enctype="multipart/form-data">
        $tablist
        <input type="hidden" name="action" value="" id="action">
        <input type="hidden" name="do" value="{$do}">
        <input type="hidden" name="id" value="{$id}">
    </form>
PAGECONTENT;

    require "resultPage.php";
    echo $result_page;
    exit();

}
