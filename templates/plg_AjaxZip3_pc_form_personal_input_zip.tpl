<div class="top col-sm-9">
  <div class="form-group">
      <label class="control-label col-xs-1 padding-right-none">〒</label>
      <div class="col-xs-3 col-sm-3 col-md-2<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
          <input type="tel" id="<!--{$key1}-->" class="box60 form-control padding-sm" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="123" onkeyup="eccube.getAddress('', '<!--{$key1}-->','<!--{$key2}-->','<!--{$key3}-->','<!--{$key4}-->', true);" />
      </div>
      <label class="control-label col-xs-1 padding-none">-</label>
      <div class="col-xs-4 col-sm-4 col-md-3<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
          <input type="tel" class="box60 form-control padding-sm" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="4567" onkeyup="eccube.getAddress('', '<!--{$key1}-->','<!--{$key2}-->','<!--{$key3}-->','<!--{$key4}-->', true);" />
      </div>
      <div class="col-xs-4 col-sm-4 padding-none">
          <p class="top">
              <a href="http://search.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">郵便番号検索</span></a>
          </p>
      </div>
  </div>
  <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
</div>
