<!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`admin_popup_header.tpl"}-->
<script type="text/javascript">
</script>

<h2><!--{$tpl_subtitle}--></h2>
<form name="form1" id="form1" method="post" action="<!--{$smarty.server.REQUEST_URI|h}-->">
<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
<input type="hidden" name="mode" value="edit" />
<p>郵便番号入力フォーム周りの詳細な設定が行えます。<br/>
    <br/>
</p>

<table border="0" cellspacing="1" cellpadding="8" summary=" ">
    <tr>
        <td colspan="2" width="90" bgcolor="#f3f3f3">▼全般</td>
    </tr>
    <tr >
        <td bgcolor="#f3f3f3">JS URL<span class="red">※</span></td>
        <td>
        <!--{assign var=key value="ajaxzip3_js_url"}-->
        <span class="red"><!--{$arrErr[$key]}--></span>
        <span>ajaxzip3のJavaScriptファイルのURL</span><br />
        <input type="text" class="box60" name="ajaxzip3_js_url" maxlength="<!--{$smarty.const.URL_LEN}-->" value="<!--{$arrForm.ajaxzip3_js_url|h}-->" style="<!--{$arrErr.ajaxzip3_js_url|sfGetErrorColor}-->" size="30" /><br/>
        </td>
    </tr>
    <tr>
        <td colspan="2" width="90" bgcolor="#f3f3f3">▼フロント</td>
    </tr>
    <tr>
        <td bgcolor="#f3f3f3">住所取得<br />タイミング<span class="red">※</span></td>
        <td style="<!--{$arrErr.trigger|sfGetErrorColor}-->">
        <!--{assign var=key value="trigger"}-->
        <span class="red"><!--{$arrErr[$key]}--></span>
        <input type="radio" name="trigger" id="trigger_button" value="Button" <!--{if $arrForm.trigger == "Button"}-->checked="checked"<!--{/if}--> /><label for="trigger_button">住所入力ボタン押下時</label><br />
        <input type="radio" name="trigger" id="trigger_keyup" value="KeyUp" <!--{if $arrForm.trigger == "KeyUp"}-->checked="checked"<!--{/if}--> /><label for="trigger_keyup">郵便番号入力後すぐ　（住所入力ボタンは表示されなくなります）</label>
        </td>
    </tr>
</table>

<div class="btn-area">
    <ul>
        <li>
            <a class="btn-action" href="javascript:;" onclick="document.form1.submit();return false;"><span class="btn-next">この内容で登録する</span></a>
        </li>
    </ul>
</div>

</form>
<!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`admin_popup_footer.tpl"}-->
