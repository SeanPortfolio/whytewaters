<?php


$main_content = <<< H

<table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
        <td>
            <textarea name="description" id="description" class="check-max" style="width:718px;min-height:100px;" maxlength="200">$description</textarea>
            <script>
                CKEDITOR.replace( 'description',
                {
                    toolbar : 'MyToolbar',
                    forcePasteAsPlainText : true,
                    resize_enabled : false,
                    height : 500,
                    filebrowserBrowseUrl : jsVars.dataManagerUrl
                });
            </script>
        </td>
    </tr>
</table>

H;


?>