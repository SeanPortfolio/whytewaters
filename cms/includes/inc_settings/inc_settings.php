<?php
## ----------------------------------------------------------------------------------------------------------------------
## NetZone 1.0
## inc_settings.php
##
## Author: Ton Jo Immanuel, Tomahawk Brand Management Ltd.
## Date: 19 April 2010
##
## Manage Settings
##
##
## ----------------------------------------------------------------------------------------------------------------------


function do_main()
{

    global $message,$valid,$htmladmin,$scripts_onload,$main_heading, $incdir;

    $action     = $_REQUEST['action'];

    $main_heading = 'General Settings';

    switch ($action) {

        case 'save':

            $return = save_item();
            break;

    }
    
    if ($message != "") {

        $page_contents .= <<< HTML
          <div class="alert alert-warning page">
             <i class="glyphicon glyphicon-info-sign"></i>
              <strong>$message</strong>
          </div>
HTML;
    

    }

    $sql = "SELECT `id`, `company_name`, `start_year`, `email_address`, `phone_number`, `free_phone_number`, `youtube_id`, `youtube_id_intro`, `youtube_thumbnail_intro`, `homepage_caption`,
        `address`, `js_code_head_close`, `js_code_body_open`, `js_code_body_close`, `adwords_code`,
        `instagram_username`,`instagram_client_id`, `instagram_access_token`, `photo_archive_url`, `gopro_photo_archive_url`,
        `slideshow_speed`, `homepage_slideshow_caption`, `mailchimp_api_key`, `mailchimp_list_id`,
        `tripadvisor_widget_code`,
        `footer_column_1`,
        `footer_column_2`,
        `footer_column_3`,
        `login_url`,
        `booking_terms_and_conditions`
        FROM `general_settings`
        WHERE `id` = '1'
        LIMIT 1";

    $row = fetch_row($sql);

    extract($row);

    ##------------------------------------------------------------------------------------------------------
    ## Page functions

    $page_functions = <<< HTML
        <ul class="page-action">
            <li><button type="button" class="btn btn-default" onclick="submitForm('save',1)"><i class="glyphicon glyphicon-floppy-save"></i> Save</button></li>
        </ul>
HTML;

// Social Icons

 $social_icons = fetch_all("SELECT `id`, `label`, `url`, `widget_blob`, `has_widget` FROM `social_links` WHERE `is_active` = '1' ORDER BY `rank`");

    if(count($social_icons) > 0)
    {
        $links = '';
        foreach ($social_icons as $index => $social_icon)
        {
            $index++;

            if($social_icon['has_widget'])
            {
                $input = '<textarea style="width:700px;height:150px;" name="social-item[]" >'.$social_icon['widget_blob'].'</textarea>';
            }
            else
            {
                $input = '<input type="text" style="width:700px" name="social-item[]" value="'.$social_icon['url'].'" id="social-item-'.$index.'">';
            }
           $links .= <<< H
            <tr>
                <td width="150" valign="top"><label for="social-item-$index">{$social_icon['label']}</label></td>
                <td>
                    <input type="hidden" name="social-item-id[]" value="{$social_icon['id']}">
                    <input type="hidden" name="social-item-has-wdge[]" value="{$social_icon['has_widget']}">
                    $input
                </td>
            </tr>
H;
        }
    
    $social_links = <<< H
    
<table width="100%" border="0" cellspacing="0" cellpadding="4">
    $links
</table>

H;

}
else
{
    $social_links = '';
}


    ##------------------------------------------------------------------------------------------------------
    ## Important Pages

    $sql = "SELECT `imppage_name`, `imppage_id`, `page_id`
        FROM `general_importantpages`
        WHERE `imppage_showincms` = 'Y'";

    $imppages_arr = fetch_all($sql);

    $imppages_list = '<table cellspacing="0" cellpadding="5" border="0">';
    foreach($imppages_arr as $key => $array)
    {
        $imppage_name = ucwords($array['imppage_name']);
        $page_id      = $array['page_id'];
        $imppage_id   = $array['imppage_id'];

        $pages_select = page_list(false, 0, $page_id);

        $imppages_list .= <<< HTML
            <tr>
                <td>$imppage_name <input type="hidden" name="imppage_id[]" value="$imppage_id"/></td>
                <td>
                    <select name="page_id[]">
                        <option value="">--select--</option>
                        $pages_select
                    </select>
                </td>
            </tr>
HTML;
    }
    $imppages_list .= <<< HTML
        </table>
HTML;



   
    ##------------------------------------------------------------------------------------------------------
    ## Details Content
    $companydetails_content = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
                <td width="180"><label for="company_name">Company name</label></td>
                <td><input name="company_name" id="company_name" type="text" value="{$company_name}" style="width:350px;" /></td>
            </tr>
            <tr>
                <td><label for="phone_number">Phone Number</label></td>
                <td>
                    <input name="phone_number" type="text" value="{$phone_number}" style="width:150px;" id="phone_number" />
                </td>
            </tr>
            <tr>
                <td><label for="free_phone_number">Free Phone Number</label></td>
                <td>
                    <input name="free_phone_number" type="text" value="{$free_phone_number}" style="width:150px;" id="free_phone_number" />
                </td>
            </tr>
            <tr>
                <td><label for="start_year">Start year</label></td>
                <td><input name="start_year" type="text" value="{$start_year}" style="width:150px;" id="start_year" /></td>
            </tr>
            <tr>
                <td><label for="slideshow_speed">Slideshow Speed</label></td>
                <td><input name="slideshow_speed" type="text" value="{$slideshow_speed}" style="width:150px;" id="slideshow_speed" /> <strong>&nbsp;ms</strong></td>
            </tr>
             <tr>
                <td><label for="youtube_id">Youtube Id (Slideshow)</label></td>
                <td><input name="youtube_id" type="text" value="{$youtube_id}" style="width:150px;" id="youtube_id" /></td>
            </tr>
             <tr>
                <td><label for="youtube_id_intro">Youtube Id (Intro)</label></td>
                <td><input name="youtube_id_intro" type="text" value="{$youtube_id_intro}" style="width:150px;" id="youtube_id_intro" /></td>
            </tr>
             <tr>
                <td><label for="youtube_thumbnail_intro">Youtube Intro Thumbnail</label></td>
                <td>
                    <input name="youtube_thumbnail_intro" type="text" value="$youtube_thumbnail_intro" style="width:350px;" id="youtube_thumbnail_intro" readonly autocomplete="off">
                    <input type="button" value="browse" onclick="openFileBrowser('youtube_thumbnail_intro')"> 
                    <input type="button" value="clear" onclick="clearValue('youtube_thumbnail_intro')"><br>
                </td>
            </tr>
            <tr>
                <td><label for="homepage_caption">Homepage Video Caption</label></td>
                <td><input name="homepage_caption" id="homepage_caption" type="text" value="{$homepage_caption}" style="width:350px;" /></td>
            </tr>
            <tr>
                <td><label for="login_url">Login Link URL</label></td>
                <td><input name="login_url" id="login_url" type="text" value="{$login_url}" style="width:350px;" /></td>
            </tr>
            <tr>
                <td valign="top"><label for="email_address">Email(s)</label> <span data-title="Separate multiple email addresses with a semicolon ( ; )" data-placement="right" data-toggle="tooltip"></span></td>
                <td><textarea name="email_address" style="width:350px;min-height:100px;">{$email_address}</textarea></td>
            </tr>
            <tr>
                <td valign="top"><label for="address">Address</label></td>
                <td><textarea name="address" style="width:350px;min-height:100px;">{$address}</textarea></td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
        </table>

HTML;




    ##------------------------------------------------------------------------------------------------------
    ## Important pages Content
    $importantpages_content = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
                <td colspan="4">$imppages_list</td>
            </tr>
        </table>
HTML;


    $footer_content = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
                <td width="150"><label for="footer_column_1">RTBS Support Business Hours</label></td>
                <td><textarea name="footer_column_1" style="width:350px;min-height:100px;">{$footer_column_1}</textarea></td>
            </tr>
            <tr>
                <td width="150"><label for="footer_column_2">RTBS Support After Hours</label></td>
                <td><textarea name="footer_column_2" style="width:350px;min-height:100px;">{$footer_column_2}</textarea></td>
            </tr>
            <tr>
                <td width="150"><label for="footer_column_3">Whyte Waters Group</label></td>
                <td><textarea name="footer_column_3" style="width:350px;min-height:100px;">{$footer_column_3}</textarea></td>
            </tr>
        </table>
HTML;


    ##------------------------------------------------------------------------------------------------------
    ## Developer Content
    $developer_content = <<< HTML
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr>
                <td valign="top"><label for="js_code_head_close">Head tag insert (close)</label></td>
                <td valign="top">
                    <textarea name="js_code_head_close" style="width:720px; height:150px;resize:none;" id="js_code_head_close">{$js_code_head_close}</textarea>
                    <span data-toggle="tooltip" data-placement="left" data-title="Insert code before closing head tag e.g Google Analytics, Facebook Pixel"></span>
                </td>
            </tr>
            <tr>
                <td valign="top"><label for="js_code_body_open">Body tag insert (open)</label></td>
                <td valign="top">
                    <textarea name="js_code_body_open" style="width:720px; height:150px;resize:none;" id="js_code_body_open">{$js_code_body_open}</textarea>
                    <span data-toggle="tooltip" data-placement="left" data-title="Insert code after opening body tag e.g Google Analytics, Facebook Pixel"></span>
                </td>
            </tr>
            <tr>
                <td valign="top"><label for="js_code_body_close">Body tag insert (close)</label></td>
                <td valign="top">
                    <textarea name="js_code_body_close" style="width:720px; height:150px;resize:none;" id="js_code_body_close">{$js_code_body_close}</textarea>
                    <span data-toggle="tooltip" data-placement="left" data-title="Insert code before closing body tag e.g Google Analytics, Facebook Pixel"></span>
                </td>
            </tr>
            <tr>
                <td valign="top"><label for="adwords_code">AdWords Tracking Code</label></td>
                <td valign="top">
                    <textarea name="adwords_code" style="width:720px; height:150px;resize:none;" id="adwords_code">{$adwords_code}</textarea>
                    <span data-toggle="tooltip" data-placement="left" data-title="Google AdWords Tracking Code"></span>
                </td>
            </tr>
        </table>
HTML;

$widgets_content = <<< HTML
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
                <tr>
                    <td style="vertical-align:top;">Trip Advisor Widget</td>
                    <td colspan="3">
                        <textarea name="tripadvisor_widget" style="width:790px; height:200px;">$tripadvisor_widget</textarea>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;">Facebook Widget</td>
                    <td colspan="3">
                        <textarea name="facebook_widget" style="width:790px; height:200px;">$facebook_widget</textarea>
                    </td>
                </tr>
            </table>
HTML;

$mailchimp_details = <<< HTML
    <table width="100%" border="0" cellspacing="0" cellpadding="4">
       
        <tr>
            <td width="150"><label for="mailchimp_list_id">List ID</label></td>
            <td><input name="mailchimp_list_id" type="text" value="{$mailchimp_list_id}" style="width:150px;" id="mailchimp_list_id" /></td>
        </tr>
        <tr>
            <td width="150"><label for="mailchimp_api_key">API Key</label></td>
            <td><input name="mailchimp_api_key" type="text" value="{$mailchimp_api_key}" style="width:350px;" id="mailchimp_api_key" /></td>
        </tr>
    </table>

HTML;


    // require_once

    ##------------------------------------------------------------------------------------------------------
    ## tab arrays and build tabs

    $temp_array_menutab = array();
    
    $temp_array_menutab ['Company Details']    = $companydetails_content;
    $temp_array_menutab ['Footer Columns']    = $footer_content;
    $temp_array_menutab ['MailChimp Details']  = $mailchimp_details;
    $temp_array_menutab ['Social Links']       = $social_links;
    $temp_array_menutab ['Important Pages']    = $importantpages_content;
    $temp_array_menutab ['Template Code']      = $developer_content;

    $counter = 0;
    $tablist ="";
    $contentlist="";

    foreach($temp_array_menutab as $key => $value){

        $tablist.= "<li><a href=\"#tabs-".$counter."\">".$key."</a></li>";

        $contentlist.=" <div id=\"tabs-".$counter."\">".$value."</div>";

        $counter++;
    }

    $tablist="<div id=\"tabs\"><ul>".$tablist."</ul><div style=\"padding:10px;\">".$contentlist."</div></div>";

    $page_contents = <<< HTML
        <form action="$htmladmin/index.php" method="post" name="pageList" enctype="multipart/form-data">
            $tablist
            <input type="hidden" name="action" value="" id="action">
            <input type="hidden" name="do" value="settings">
            <input type="hidden" name="id" value="$id">
            <input type="hidden" name="set_id" value="$id">
        </form>
HTML;

    require "resultPage.php";
    echo $result_page;
    exit();
}

function save_item()
{

    global $message,$id,$do,$disable_menu, $incdir;

    $temp_array_save['company_name']                 = sanitize_input('company_name');
    $temp_array_save['email_address']                = sanitize_input('email_address');
    $temp_array_save['js_code_head_close']           = filter_input(INPUT_POST, 'js_code_head_close');
    $temp_array_save['js_code_body_open']            = filter_input(INPUT_POST, 'js_code_body_open');
    $temp_array_save['js_code_body_close']           = filter_input(INPUT_POST, 'js_code_body_close');
    $temp_array_save['adwords_code']                 = filter_input(INPUT_POST, 'adwords_code');
    $temp_array_save['start_year']                   = sanitize_input('start_year');
    $temp_array_save['slideshow_speed']              = sanitize_input('slideshow_speed');
    $temp_array_save['phone_number']                 = sanitize_input('phone_number');
    $temp_array_save['free_phone_number']            = sanitize_input('free_phone_number');
    $temp_array_save['address']                      = sanitize_input('address');
    $temp_array_save['homepage_slideshow_caption']   = sanitize_input('homepage_slideshow_caption');
    $temp_array_save['mailchimp_api_key']            = sanitize_input('mailchimp_api_key');
    $temp_array_save['mailchimp_list_id']            = sanitize_input('mailchimp_list_id');
    $temp_array_save['booking_url']                  = sanitize_input('booking_url', FILTER_VALIDATE_URL);
    $temp_array_save['youtube_id']                   = sanitize_input('youtube_id');
    $temp_array_save['login_url']                   = sanitize_input('login_url');
    $temp_array_save['youtube_id_intro']             = sanitize_input('youtube_id_intro');
    $temp_array_save['youtube_thumbnail_intro']      = sanitize_input('youtube_thumbnail_intro');
    $temp_array_save['tripadvisor_widget_code']      = filter_input(INPUT_POST, 'tripadvisor_widget_code');
    $temp_array_save['homepage_caption']             = filter_input(INPUT_POST, 'homepage_caption');
    $temp_array_save['instagram_username']           = sanitize_input('instagram_username');
    $temp_array_save['instagram_client_id']          = sanitize_input('instagram_client_id');
    $temp_array_save['instagram_access_token']       = sanitize_input('instagram_access_token');
    $temp_array_save['photo_archive_url']            = sanitize_input('photo_archive_url', FILTER_VALIDATE_URL);
    $temp_array_save['gopro_photo_archive_url']      = sanitize_input('gopro_photo_archive_url', FILTER_VALIDATE_URL);
    $temp_array_save['booking_terms_and_conditions'] = $_POST['booking_terms_and_conditions'];

    $temp_array_save['footer_column_1'] = filter_input(INPUT_POST,'footer_column_1');
    $temp_array_save['footer_column_2'] = filter_input(INPUT_POST,'footer_column_2');
    $temp_array_save['footer_column_3'] = filter_input(INPUT_POST,'footer_column_3');

    if( update_row($temp_array_save, 'general_settings', "WHERE id = '1' LIMIT 1") )
    {
        $message = "Settings have been saved";
    }

    // save social urls

    $url_ids    = $_POST['social-item-id'];
    $urls       = $_POST['social-item'];
    $has_widget = $_POST['social-item-has-wdge'];

    if(count($url_ids) > 0)
    {
        for ($i=0; $i < count($url_ids); $i++)
        { 
            $url_save_arr = array();
            if($has_widget[$i]) $url_save_arr['widget_blob'] = $urls[$i];
            else $url_save_arr['url'] = $urls[$i];

            update_row($url_save_arr, 'social_links', "WHERE id = '{$url_ids[$i]}'");
        }
    }

    $imppage_id = $_REQUEST['imppage_id'];
    $page_id = $_REQUEST['page_id'];
    $i = 0;
    foreach($imppage_id as $key => $value){
        $end = "WHERE imppage_id = '$value'";
        $temp_array_save = '';
        $temp_array_save['page_id']     = $page_id[$i];
        update_row($temp_array_save, 'general_importantpages', $end);
        $i++;
    }


}

?>