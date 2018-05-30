<?php

function save_rank()
{
    global $message, $item_id, $item_rank, $htmladmin;

    $item_id   = $_POST['item_id'];
    $item_rank = $_POST['item_rank'];

    for($i=0;$i<=count($item_id);$i++)
    {
        $temp_array_ranking = array();
        $temp_array_ranking['rank'] = $item_rank[$i];
        $end = "WHERE id='".$item_id[$i]."'";

        update_row($temp_array_ranking, 'package_features', $end);
    }
    
    $message = "Item ranking has been saved";
}
