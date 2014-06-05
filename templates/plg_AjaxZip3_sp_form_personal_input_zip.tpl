<dd>
    <!--{assign var=key1 value="`$prefix`zip01"}-->
    <!--{assign var=key2 value="`$prefix`zip02"}-->
    <!--{assign var=key3 value="`$prefix`pref"}-->
    <!--{assign var=key4 value="`$prefix`addr01"}-->
    <!--{assign var=key5 value="`$prefix`addr02"}-->
    <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
        <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
    <!--{/if}-->
    <p>
    <input type="tel" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" class="boxShort text data-role-none" onkeyup="eccube.getAddress('', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->', true);" />&nbsp;－&nbsp;
    <input type="tel" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" class="boxShort text data-role-none" onkeyup="eccube.getAddress('', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->', true);" />&nbsp;&nbsp;
    <a href="http://search.post.japanpost.jp/zipcode/" target="_blank" rel="external"><span class="fn">郵便番号検索</span></a>
    </p>
</dd>
