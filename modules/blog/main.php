<?php

$pg_full_url = $page_blog->full_url;

if($page_id == $page_blog->id){

	require_once "inc/index.php";

} else {

    $newsletter_view = '';
    if( $mailchimp_api_key &&  $mailchimp_api_key )
    {
        $newsletter_view = '<div class="newsletter__wrapper">
        <h3 class="text-lg">Subscribe to our Newsletter</h3>
        <form action="#" id="news-signup-form" method="post">
            <div class="form-group">
                <input type="email" class="form-control" name="signup-email" id="signup-email" placeholder="Your email address" autocomplete="off">
                <button type="submit" id="newsletter-submit" name="signup" value="singup" class="btn btn__green_square text-white">go</button>
            </div>
            <div class="clearfix"></div>
            <p class="msg"></p>
        </form>
    </div>';
    }

    $blog_arr = fetch_row("SELECT pmd.`heading`, pmd.`title`, pmd.`meta_description`, pmd.`og_title`, 
    pmd.`photo` AS photo_path, pmd.`thumb_photo` AS thumb_photo_path, pmd.`short_description`,
    pmd.`og_meta_description`, pmd.`og_image`, pmd.`full_url`, pmd.`title`, pmd.`description`,
    IF(bp.`date_posted`, DATE_FORMAT(bp.`date_posted`, '%M %d, %Y'), '') AS posted_on,
    TRIM(CONCAT(cu.`user_fname`, ' ', cu.`user_lname`)) AS author_name,
    REPLACE(LOWER(TRIM(cu.`user_fname`)), ' ', '-') AS author_url,
    cu.`user_thumb_path` AS author_photo, cu.`user_introduction` AS author_intro
    FROM `blog_post` bp
    LEFT JOIN `page_meta_data` pmd
    ON(pmd.`id` = bp.`page_meta_data_id`)
    LEFT JOIN `cms_users` cu
    ON(cu.`user_id` = pmd.`updated_by`)
    WHERE pmd.`status` = 'A'
    AND bp.`date_posted` != ''
    ORDER BY bp.`date_posted` DESC
    LIMIT 1");

    $blog_view_html = <<<HTML
        <section class="section">
            <div class="container container-fw well">
                <div class="row">
                    <div class="col-xs-12 col-md-6 text-right">
                        <img src="{$blog_arr['photo_path']}" alt="" class="img-rounded" />
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <h2 class="text-up text-green">Latest Blog</h2>
                        <p class="text-lg"><strong>{$blog_arr['heading']}</strong></p>
                        <p>{$blog_arr['short_description']} <a href="{$page_blog->full_url}{$blog_arr['full_url']}" class="text-green text-up"><strong>Read More</strong></a></p>
                        <div class="well">
                            <div class="pull-left">
                                <a href="{$page_blog->full_url}" class="btn__white text-black text-up btn__see_all">See All Articles</a>
                            </div>
                            <div class="pull-right">
                                {$newsletter_view}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
HTML;

    $tags_arr['mod_view'] .= $blog_view_html;

}

require_once "footer/index.php";
