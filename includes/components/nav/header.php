<?php

include_once "{$classdir}/mobile_detect.php";


if( !function_exists('main_navigation') )
{
    $level = 0;



    function main_navigation($parent = 0, $current_page = '')
    {

        global $max_pages, $max_pages_generation, $level, $page_arr, $rootfull, $static_map_img, $page_gallery;


        $sql = "SELECT gp.`id` AS page_id, pmd.`menu_label`, pmd.`title`, pmd.`full_url`, pmd.`url`, gp.`parent_id`, gp.`is_category`
        FROM general_pages gp
        LEFT JOIN `page_meta_data` pmd
        ON(pmd.`id` = gp.`page_meta_data_id`)
        WHERE pmd.`status` = 'A'
        AND gp.`parent_id` = '$parent'
        AND (pmd.`menu_label` != '')
        ORDER BY pmd.`rank` ASC";

        $pages  = fetch_all($sql);

        $html   = '';

        if( !empty($pages) )
        {
            $total_pages = count($pages);

            foreach ($pages as $page)
            {

                $page_id              = $page['page_id'];
                $is_category          = $page['is_category'];
                $item_cls             = ($page['url'] === $current_page || $page_id === $page_arr['parent_id']) ? 'active' : '';
                $url                  = $page['full_url'];
                $urlTarget            = '';

                $sub_menu = '';
                $icon     = '';
                $icon2    = '';
                $home_cls = '';
                
                $sub_menu_tours = '';
                
                $sub_menu  .= main_navigation($page_id, $current_page );

                if( $sub_menu )
                {
                    $icon = '<i class="fa fa-angle-down toggle-sub-nav"></i>';
                    $icon2 = '<i class="fa fa-caret-down"></i>';
                    $item_cls .= ' has-sub';

                    $sub_menu = '<ul>'.$sub_menu.'</ul>';
                }

                //$page['menu_label'] = ($page_id == '1') ? '<i class="fa fa-home"></i>' : $page['menu_label'];
                
                if($item_cls) $item_cls = ' class="'.trim($item_cls).'"';
                
                $html .= '<li'.$item_cls.'>';
                $html .= '<a href="'.$url.'" title="'.$page['title'].'" '.$urlTarget .'>'.$page['menu_label']. $icon2.'</a>';
                $html .= $icon;
                $html .= $sub_menu;
                $html .= '</li>';
            }
            return sprintf('%s', $html);
        }
        return $html;
    }
}

$menu = main_navigation(0, $page);

$tags_arr['nav-main'] = ($menu) ? '<nav id="primary-nav" role="navigation">
                                    <ul>
                                        '.$menu.'
                                        <li class="primary-nav__login">
                                            <span class="fa fa-user text-white primary-nav__login--icon"></span> 
                                            <a href="' . $tags_arr['login_url'] . '">Login</a>
                                        </li>    
                                        <li class="primary-nav__enquire">
                                            <a href="'.$page_contact->full_url.'" class="btn btn__green text-white text-bold">Enquire</a>
                                        </li>        
                                    </ul>
                                  </nav>
                                  <a href="'.$page_salesforce->full_url.'" title="Free Trial" class="btn btn__green nav__fr__btn text-white">
                                      <span class="icon-sync-user"></span>
                                      <span class="nav__fr__btn--text">
                                          Free Trial<span class="primary-nav__support text-low">including support</span>
                                      </span>
                                  </a>' : '';

?>