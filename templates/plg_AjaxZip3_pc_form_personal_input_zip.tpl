<p class="top">〒&nbsp;
    <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" onkeyup="eccube.getAddress('', '<!--{$key1}-->','<!--{$key2}-->','<!--{$key3}-->','<!--{$key4}-->', true);" />&nbsp;-&nbsp;
    <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" onkeyup="eccube.getAddress('', '<!--{$key1}-->','<!--{$key2}-->','<!--{$key3}-->','<!--{$key4}-->', true);" />&nbsp;
    <a href="http://search.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">郵便番号検索</span></a>
</p>
