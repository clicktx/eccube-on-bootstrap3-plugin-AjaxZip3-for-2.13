<div class="top col-sm-9">
    <div class="form-group">
        <label class="control-label col-xs-1 padding-right-none">〒</label>
        <div class="col-xs-3 col-sm-3 col-md-2<!--{if $arrErr.zip01}--> has-error<!--{/if}-->">
            <input type="tel" name="zip01" id="zip01" class="box60 form-control padding-sm" value="<!--{$arrForm.zip01.value|default:$arrData.zip01|h}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="123" onkeyup="eccube.getAddress('', 'zip01', 'zip02', 'pref', 'addr01', true);" />
        </div>
        <label class="control-label col-xs-1 padding-none">-</label>
        <div class="col-xs-4 col-sm-4 col-md-3<!--{if $arrErr.zip02}--> has-error<!--{/if}-->">
            <input type="tel" name="zip02" class="box60 form-control" value="<!--{$arrForm.zip02.value|default:$arrData.zip02|h}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="4567" onkeyup="eccube.getAddress('', 'zip01', 'zip02', 'pref', 'addr01', true);" />
        </div>
        <div class="col-xs-4 col-sm-4 padding-none">
            <p class="top">
                <a href="http://search.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">郵便番号検索</span></a>
            </p>
        </div>
    </div>
    <span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span>
</div>
