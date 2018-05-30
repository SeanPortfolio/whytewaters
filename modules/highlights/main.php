<?php 

$isHomePage = ($main_page_id == $page_home->id);

$arrHighlights = fetch_all("SELECT `id`, `heading`, `short_description`, `icon_photo_path`, `status`, `rank`
            FROM `highlights`
            WHERE `status` = 'A'
            ORDER BY`status`, `rank`");

require_once "views/list.php";

if(!empty($arrHighlights)){

    $tags_arr['mod_view'] .= <<<HTML
        <section class="section section--highlights">
            <div class="container">
                <div class="highlights__wrapper">
                    <div class="row">
                        {$highlightContentView}
                    </div>
                </div>
            </div>
        </section>
HTML;

}

?>
