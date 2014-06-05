<dd>
    <!--{assign var=key1 value="`$prefix`zip01"}-->
    <!--{assign var=key2 value="`$prefix`zip02"}-->
    <!--{assign var=key3 value="`$prefix`pref"}-->
    <!--{assign var=key4 value="`$prefix`addr01"}-->
    <span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span>
    <p>
        <input type="tel" name="zip01"
            value="<!--{$arrForm.zip01.value|default:$arrData.zip01|h}-->"
            maxlength="<!--{$smarty.const.ZIP01_LEN}-->"
            onkeyup="eccube.getAddress('', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->', true);"
            style="<!--{$arrErr.zip01|sfGetErrorColor}-->;" class="boxShort text data-role-none" />&nbsp;－&nbsp;
        <input type="tel" name="zip02"
            value="<!--{$arrForm.zip02.value|default:$arrData.zip02|h}-->"
            maxlength="<!--{$smarty.const.ZIP02_LEN}-->"
            onkeyup="eccube.getAddress('', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->', true);"
            style="<!--{$arrErr.zip02|sfGetErrorColor}-->;" class="boxShort text data-role-none" />&nbsp;&nbsp;
        <a href="http://search.post.japanpost.jp/zipcode/" target="_blank" rel="external"><span class="fn">郵便番号検索</span></a>
    </p>
</dd>
