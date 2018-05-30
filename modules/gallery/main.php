<?php

$galleryContentView = '';
$gallery_ids       = array();

if($page_id === $page_gallery->id ){

    require_once 'list/index.php';

} else {

    require_once 'carousel/index.php';
}


$tags_arr['mod_view'] .= $galleryContentView;

?>