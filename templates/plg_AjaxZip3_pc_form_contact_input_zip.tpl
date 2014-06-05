<p class="top">
    〒&nbsp;
    <input type="text" name="zip01" class="box60" value="<!--{$arrForm.zip01.value|default:$arrData.zip01|h}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->; ime-mode: disabled;" onkeyup="eccube.getAddress('', 'zip01', 'zip02', 'pref', 'addr01', true);" />&nbsp;-&nbsp;
    <input type="text" name="zip02" class="box60" value="<!--{$arrForm.zip02.value|default:$arrData.zip02|h}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->; ime-mode: disabled;" onkeyup="eccube.getAddress('', 'zip01', 'zip02', 'pref', 'addr01', true);" />　
    <a href="http://search.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">郵便番号検索</span></a>
</p>
