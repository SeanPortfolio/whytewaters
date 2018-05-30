<?php

$packages = fetch_all("
        SELECT 
            `id`,
            `name`,
            IF(`price`, `price`, 'POA') AS `price`,
            `description`,
            `additional_note`,
            `buy_now_url`,
            `rank`
        FROM `packages`
        WHERE `status` = 'A'
        ORDER BY `status`, `rank`
");

$packages_html = '';
foreach ($packages as $item)
{
    if($item['price'] == 'POA') {
        $price_amount = 'POA';
        $price_decimal = '00';
        $button_text = 'learn more';
        $item['buy_now_url'] = $page_contact->full_url;
    } else {
        list($price_amount, $price_decimal) = explode('.', $item['price']);
        $button_text = 'learn more';
    }

    if($item['name'] == 'Business Online') {
        $price_tag_text = '/annum';
    }else {
        $price_tag_text = '/month'; 
    }

    $package_btn .=<<<HTML
        <div class="rest-items__item">
            <div class="package-buy-now">
                <a href="{$item['buy_now_url']}">
                    <div class="package-buy-now__buy-now-button">{$button_text}</div>
                </a>
            </div>
        </div>
HTML;

    $packages_html .= <<<HTML
        <div class="rest-items__item--package">
            <div class="package-name">
                {$item['name']}
            </div>
            <div class="package-price">
                <span class="package-price__amount">&#36;{$price_amount}</span>
                <div class="package-price__right">
                    <div class="package-price__decimal">.{$price_decimal}</div>
                    <div class="package-price__suffix">{$price_tag_text}</div>
                </div>
            </div>
            <div class="package-description">
                {$item['description']}
            </div>
            <div class="package-additional-note">
                {$item['additional_note']}
            </div>
            <div class="package-view-detail pricing-table-mobile-only">
                <div class="package-view-detail__button" data-package-id="{$item['id']}">View Features</div>
            </div>
        </div>
HTML;
}

$features = fetch_all("
    SELECT 
        `id`,
        `name`,
        `tooltip`
    FROM `package_features`
    WHERE `status` = 'A'
    ORDER BY `status`, `rank`
");

$quantity_package = count($packages);
$package_ids = [];
foreach ( $packages as $item ) {
    $package_ids[] = $item['id'];
}

$quantity_feature = count($features);
$feature_ids = [];
foreach ( $features as $item ) {
    $feature_ids[] = $item['id'];
}

$package_has_features_array = fetch_all("
    SELECT
      p.`id` AS `package_id`, 
      pf.`id` AS `feature_id`, 
      (IFNULL(phf.`description`, phf.`is_available`)) AS `value`  
    FROM `package_has_features` phf
    LEFT OUTER JOIN `package_features` pf
    ON phf.`feature_id` = pf.`id`
    LEFT OUTER JOIN `packages` p
    ON phf.`package_id` = p.`id`
    WHERE pf.`status` = 'A'
    ORDER BY `feature_id`, `package_id`
");

$new_bi_dimensional_array = [];
foreach ($package_has_features_array as $item)
{
    $new_bi_dimensional_array[$item['feature_id']][$item['package_id']] = $item['value'];
}

// Generating Pricing Table
$feature_rows_html = '';
for( $feature_index = 0; $feature_index < $quantity_feature; $feature_index ++ )
{
    $tooltip = $features[$feature_index]['tooltip'];
    $tooltip = (!empty($tooltip)) ? "<span class=\"tooltip\">
                                        <i class=\"fa fa-info-circle\">
                                        <span>{$tooltip}</span>
                                        </i>
                                    </span>" : '';
    $feature_rows_html .= <<<HEAD
        <div class="pricing-table-row hide-on-mobile">
            <div class="pricing-table__column pricing-table__column--lg">
                {$features[$feature_index]['name']} {$tooltip}
            </div>
            <div class="pricing-table__column pricing-table__column--rest-items">
HEAD;

    for( $package_index = 0; $package_index < $quantity_package; $package_index ++ )
    {
        $value = $new_bi_dimensional_array[$feature_ids[$feature_index]][$package_ids[$package_index]];

        if( is_null($value) ) {
            $value = "<i class=\"fa fa-times\"></i>";
        } else {
            if($value == 'Y') {
                $value = "<i class=\"fa fa-check\"></i>";
            }
        }

        $feature_rows_html .= <<<ITEM
            <div class="rest-items__item">
                <span class="feature-value">{$value}</span>
            </div>
ITEM;

    }

    $feature_rows_html .= <<<TAIL
            </div>
        </div>
TAIL;
}

    $feature_rows_html .= <<<H
        <div class="pricing-table-row hide-on-mobile">
            <div class="pricing-table__column pricing-table__column--lg">
            </div>
            <div class="pricing-table__column pricing-table__column--rest-items">
            {$package_btn}
            </div>
        </div>
H;

//echo $feature_rows_html1;die;
// Generating modals
$view_detail_modals = '';
for( $package_index = 1; $package_index <= $quantity_package; $package_index ++ )
{
    $price_integer = '$' . explode('.', $packages[$package_index-1]['price'])[0];
    $price_decimal = '.' . explode('.', $packages[$package_index-1]['price'])[1];

    if($packages[$package_index-1]['name'] == 'Business Online') {

        $price_tag_text = '/year';

    }else {

        $price_tag_text = '/month';

    }
    $single_modal_html = <<<HEAD
        <div class="package-modal rest-items__item--package" data-package-id="{$package_index}">
            <div class="package-name">
                {$packages[$package_index-1]['name']}
            </div>
            <div class="package-price">
                <span class="package-price__amount">{$price_integer}</span>
                <div class="package-price__right">
                    <div class="package-price__decimal">{$price_decimal}</div>
                    <div class="package-price__suffix">{$price_tag_text}</div>
                </div>
            </div>
HEAD;

    for( $feature_index = 1; $feature_index <= $quantity_feature; $feature_index ++ )
    {
        $value = $new_bi_dimensional_array[$feature_index][$package_index];

        if( !is_null($value) ) {
            if($value == 'Y') {
                $value = '';
            } else {
                $value = "<div class=\"feature-value\">{$value}</div>";
            }
            $single_modal_html .= <<<ITEM
            <div class="package-modal__row">
                <div class="feature-name">{$features[$feature_index-1]['name']}</div>
                {$value}
            </div>
ITEM;
        }

    }

    $single_modal_html .= <<<TAIL
            <div class="package-buy-now">
                <a href="{$packages[$package_index-1]['buy_now_url']}">
                    <div class="package-buy-now__buy-now-button">learn more</div>
                </a>
            </div>
        </div>
TAIL;

    $view_detail_modals .= $single_modal_html;
}

$view_detail_modals = <<<WRAP
    <div class="package-modal-wrapper">
        <div class="package-modal__close-button"><i class="fa fa-times"></i></div>
        {$view_detail_modals}
    </div>
WRAP;

$tags_arr['mod_view'] .= <<<HTML
    <section class="section section--pricing-table">
        <div class="container">
            <div class="pricing-table">
                <div class="pricing-table-row">
                    <div class="pricing-table__column pricing-table__column--lg hide-on-mobile"></div>
                    <div class="pricing-table__column pricing-table__column--rest-items">
                    {$packages_html}
                    </div>
                </div>
            {$feature_rows_html}
            </div>
        </div>
    </section>
    {$view_detail_modals}
HTML;

