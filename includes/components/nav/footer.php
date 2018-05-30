<?php
$footer_nav = '';


//  Fetch all active general pages where footer menu is not empty and status is active
$footer_main_pages = fetch_all("SELECT gp.`id`, pmd.`footer_menu`, pmd.`title`, pmd.`url`, pmd.`full_url`
    FROM general_pages gp
    LEFT JOIN `page_meta_data` pmd
    ON(pmd.`id` = gp.`page_meta_data_id`)
    WHERE pmd.`status` = 'A'
    AND pmd.`footer_menu` != ''
    AND `parent_id` = '0'
    ORDER BY gp.`parent_id`, pmd.`rank` ASC LIMIT 3
");

if(!empty($footer_main_pages))
{
	foreach ($footer_main_pages as $item)
	{
        $child_pages = fetch_all("
        SELECT gp.`id`, pmd.`footer_menu`, pmd.`title`, pmd.`url`, pmd.`full_url`
        FROM general_pages gp
        LEFT JOIN `page_meta_data` pmd
        ON(pmd.`id` = gp.`page_meta_data_id`)
        WHERE pmd.`status` = 'A'
        AND pmd.`footer_menu` != ''
        AND `parent_id` = '{$item['id']}'
        ORDER BY gp.`parent_id`, pmd.`rank` ASC LIMIT 3
        ");

        $child_pages_html = '';
        if(count($child_pages) > 0) {
            foreach ($child_pages as $child_page ) {
                $child_pages_html .= <<<HTML
                    <li><a href="{$child_page['full_url']}" class="footer__top_links">{$child_page['footer_menu']}</a></li>
HTML;
            }
        }

		$content .= <<<HTML
            <div class="col-xs-12 col-md-3">
                <h4 class="footer__top_title text-up"><a href="{$item['full_url']}">{$item['footer_menu']}</a></h4>
                <ul class="footer__top_ul">
                    {$child_pages_html}
                </ul>
            </div>
HTML;
	}
}

$tags_arr['footer_three_columns'] = $content;


$sql = "SELECT c.`name` AS client_name, pmd.`full_url`
		FROM `case_study` cs 
		LEFT JOIN `client` c 
		ON(c.`id` = cs.`client_id`)
		LEFT JOIN `page_meta_data` pmd 
		ON(pmd.`id` = cs.`page_meta_data_id`)
		WHERE pmd.`status` = 'A'
		ORDER BY pmd.`rank`
		LIMIT 4";

$case_study_items = fetch_all($sql);

$case_study_list= '';
foreach ( $case_study_items as $item ) {
    $case_study_list .= <<<HTML
        <li><a href="/{$page_casestudy->url}{$item['full_url']}" class="footer__top_links">{$item['client_name']}</a></li>
HTML;
}

$tags_arr['case_study_list_items'] = $case_study_list;
