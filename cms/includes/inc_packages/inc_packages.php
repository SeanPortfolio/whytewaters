<?php

function do_main()
{

    global $message, $valid, $item_select, $item_id, $item_rank, $htmladmin, $main_heading, $do, $action;

    $action = ($_GET['view']) ? $_GET['view'] : $action;
    $item_select = $_POST['item_select'];
    $item_id = $_POST['item_id'];

    $main_heading = 'Packages';

    switch ($action) {

        case 'publish':
            @include_once('inc_' . $do . '_publish.php');
            $return = publish_items();
            break;

        case 'hide':
            include_once('inc_' . $do . '_hide.php');
            $return = hide_items();
            break;

        case 'new':
            @include_once('inc_' . $do . '_new.php');
            $return = new_item();
            break;

        case 'delete':
            @include_once('inc_' . $do . '_delete.php');
            $return = delete_items();
            break;

        case 'edit':
            @include_once('inc_' . $do . '_edit.php');
            $return = edit_item();
            break;

        case 'save':
            @include_once('inc_' . $do . '_save.php');
            $return = save_item();
            break;

        case 'trash':
            @include_once('inc_' . $do . '_viewtrash.php');
            $return = view_trash();
            break;

        case 'saverank':
            include_once('inc_' . $do . '_saverank.php');
            $return = save_rank();
            break;
    }

    $c = 0;

    $active_pages = "";
    $page_contents = "";

    function generate_item_list($parent_id = 0)
    {
        global $c, $htmladmin, $do;

        $sql = "
                SELECT 
                    `id`,
                    `name`,
                    `rank`,
                    `status`
                FROM `packages`
                WHERE `status` != 'D'
                ORDER BY `status`, `rank`
        ";

        $rows = fetch_all($sql);

        $html = '';
        $indentation = 0;
        $c++;

        if (!empty($rows)) {
            for ($i = 1; $i < $c; $i++) $indentation += 48;
            foreach ($rows as $index => $row) {
                $bgc = (($index % 2) == 1) ? '#fff' : '#f6f8fd';
                $label = ($row['name']) ? $row['name'] : 'Untitled';
                $editlink = <<<EDITLINK
                    <a href="{$htmladmin}/?do={$do}&action=edit&id={$row['id']}">$label</a>
EDITLINK;
                $item_select = <<<ITEMSELECT
                    <label class="custom-check"><input type="checkbox" name="item_select[]" class ="checkall" value="{$row['id']}"><span></span></label>
ITEMSELECT;

                if ($row['status'] == "A") {
                    $status = '<span class="label label-success">Published</span>';
                }
                if ($row['status'] == "H") {
                    $status = '<span class="label label-warning">Hidden</span>';
                }

                $html .= <<< HTML
                <tr>
                    <td width="20" align="center">$item_select</td>
                    <td style="padding-left:{$indentation}px;">
                        <input type="hidden" name="item_id[]" value="{$row['id']}">
                        <input type="text" name="item_rank[]" value="{$row['rank']}" style="color:#999999;margin-right:10px;margin-left:10px;width:30px;text-align:center;">
                        $editlink
                    </td>
                    <td width="100">$status</td>
                </tr>
HTML;
            }
        }

        $c--;
        return $html;
    }

    $active_pages = generate_item_list();

    if ($message != "") {
        $page_contents .= <<< HTML
          <div class="alert alert-warning page">
             <i class="glyphicon glyphicon-info-sign"></i>
              <strong>$message</strong>
          </div>
HTML;
    }

    $page_functions = <<< HTML
        <ul class="page-action">
            <li class="pull-right">
                <a href="{$htmladmin}/?do={$do}&view=trash" class="btn btn-default">
                    <i class="glyphicon glyphicon-trash"></i> View trash
                </a>
            </li>
            <li><button type="button" class="btn btn-default" onclick="submitForm('publish')"><i class="glyphicon glyphicon-eye-open"></i> Publish</button></li>
            <li><button type="button" class="btn btn-default" onclick="submitForm('hide')"><i class="glyphicon glyphicon-eye-close"></i> Hide</button></li>
            <li><button type="button" class="btn btn-default" onclick="submitForm('saverank', 1)"><i class="glyphicon glyphicon-sort-by-order"></i> Save Rank</button></li>
        </ul>
HTML;

    $page_contents .= <<< HTML

    <form action="{$htmladmin}/?do={$do}" method="post" style="margin:0px;" name="pageList">
        <table width="100%" class="bordered">
            <thead>
                <tr>
                    <th width="20"><label class="custom-check"><input type="checkbox" name="all" id="checkall"><span></span></label></td>
                    <th align="left">Package Name</th>
                    <th align="left" width="100">Status</th>
                </tr>
            </thead>
            <tbody>
                $active_pages
            </tbody>
        </table>
        <input type="hidden" name="action" value="" id="action">
        <input type="hidden" name="do" value="{$do}">
    </form>
HTML;

    require "resultPage.php";
    echo $result_page;
    exit();
}
