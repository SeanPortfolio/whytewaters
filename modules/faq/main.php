<?php
$sql = "
        SELECT 
            `id`,
            `question`,
            `answer`
        FROM `faq`
        WHERE `status` = 'A'
        ORDER BY `rank`
";

$faq_items = fetch_all($sql);

$faq_html = <<<HEAD
<div class="faq-list">
HEAD;

foreach ($faq_items as $item)
{
    $faq_html .= <<<HTML

    <div class="faq-item">
        <div class="faq-item__question">
            <span class="green bigger">Q</span> <span>{$item['question']}</span>
        </div>
        <div class="faq-item__answer">
            <span class="green bigger">A&nbsp;</span> <span>{$item['answer']}</span>
        </div>
    </div>
HTML;
}

$faq_html .= <<<TAIL
</div>
TAIL;

$tags_arr['mod_view'] .= <<<HTML
    <section class="section section--faq-list">
        <div class="container">
            {$faq_html}
        </div>
    </section>
HTML;

