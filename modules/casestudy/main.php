<?php

if($page_id == 1)
{
	require_once 'inc/featured.php';
} else {
	if($option1)
	{
		require_once 'inc/single.php';
	}
	require_once 'inc/list.php';
}
