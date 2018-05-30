<?php

$quicklinksView = '';
    
if( !empty($arrQuicklinks) )
{
    $counter = 0;

    foreach ($arrQuicklinks as $quicklink)
    {
        $counter++;

        $quicklinksView .= <<<HTML
            <div class="col-xs-12 col-md-4 quicklink__item">
                <div class="quicklink__item__content">           
                    <div class="quicklink__img"><img src="{$quicklink['photo']}" alt=""></div>
                    <h3 class="quicklink__heading"><a href="{$quicklink['full_url']}" title="{$quicklink['title']}">{$quicklink['label']}</a></h3>
                    <div class="quicklink__description">{$quicklink['short_description']}</div>
                </div>
            </div>
HTML;

    }

}

