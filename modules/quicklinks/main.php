<?php

$quicklinksContentView = '';

$isHomePage    = ($page_id == $page_home->id);
$sqlExtra      = (empty($isHomePage)) ? ' LIMIT 3' : '';

$arrQuicklinks = fetch_all("SELECT IF((pmd.`quicklink_heading` != ''), pmd.`quicklink_heading`, pmd.`menu_label`) AS label,
        `quicklink_menu_label` AS button_label,
        pmd.`title`,
        pmd.`short_description`,
        pmd.`full_url`,
        pmd.`quicklink_thumb_photo` AS thumb_photo,
        pmd.`quicklink_photo` AS photo
    FROM `general_pages` gp
    LEFT JOIN `page_meta_data` pmd
        ON(pmd.`id` = gp.`page_meta_data_id`)
    LEFT JOIN `page_has_quicklink` phq
        ON(phq.`quicklink_page_id` = gp.`id`)
    WHERE pmd.`status` = 'A'
        AND phq.`page_id` = '{$page_id}'
        AND pmd.`quicklink_photo` != ''
    ORDER BY pmd.`rank` ASC
    {$sqlExtra}");

if($isHomePage) {
    $extra_heading = <<<HTML
        <div class="row">
            <div class="margin-big-top-bottom">
                <h2 class="h2-font text-center text-green">HOW WE CAN HELP TO GROW YOUR BUSINESS?</h2>
            </div>
        </div>
HTML;
    $extra_tail = <<<HTML
<div class="row">
    <div class="quicklink-homepage-bottom">
        <span class="text-white">Let us help you grow your business</span><a href="{$page_salesforce->full_url}" class="btn text-white">FREE CONSULTATION</a>
    </div>
</div>
HTML;

}
if(!empty($arrQuicklinks)){

    require_once "views/list.php";

    $quicklinksContentView =<<<HTML
        <section class="section section--quicklink">
            <div class="container">
                {$extra_heading}
                <div class="row">
                    {$quicklinksView}

                </div>
            </div>
            <div class="container-fluid">
                {$extra_tail}
            </div>
        </section>
HTML;

}

$tags_arr['mod_view'] .= $quicklinksContentView;

?>
