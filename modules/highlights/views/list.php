<?php

if (!empty($arrHighlights)) {

    $highlightContentView = '';

    if (count($arrHighlights) == '4') {

        $cls = 'col-md-3';

    } elseif (count($arrHighlights) == '3') {

        $cls = 'col-md-4';

    } elseif (count($arrHighlights) == '2') {

        $cls = 'col-md-4 col-md-push-2';

    } else {

        $cls = 'col-md-4 col-md-push-4';
    }

    $counter = 1;

    foreach ($arrHighlights as $highlight) {

        $counter++;

        $highlightIconView = '';
        $highlightIcon = $highlight['icon_photo_path'];

        if (!empty($highlightIcon)) {

            $highlightIconView = <<<HTML
                <div class="highlight__icon__wrapper">
                    <i class="highlight__icon" style="background-image: url({$highlightIcon});"></i>
                </div>
HTML;
        }

        $elmDelay = $counter * 300;

        $highlightContentView .= <<<H
            <div class="{$cls} highlight text-center">
                {$highlightIconView}
                <h3 class="highlight__desc">{$highlight['short_description']}</h3>
            </div>  
H;
    }

}

?>