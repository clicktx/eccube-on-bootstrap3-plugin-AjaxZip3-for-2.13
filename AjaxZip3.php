<?php
/*
 *
 * Copyright(c) 2000-2011 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

/**
 * プラグインのメインクラス
 *
 * @package AjaxZip3
 * @author SystemFriend Inc
 * @version $Id: AjaxZip3.php 576 2014-05-19 05:48:57Z habu $
 */
class AjaxZip3 extends SC_Plugin_Base {

    /**
     * コンストラクタ
     */
    public function __construct(array $arrSelfInfo) {
        parent::__construct($arrSelfInfo);
    }
    
    /**
     * インストール
     * installはプラグインのインストール時に実行されます.
     * 引数にはdtb_pluginのプラグイン情報が渡されます.
     *
     * @param array $arrPlugin plugin_infoを元にDBに登録されたプラグイン情報(dtb_plugin)
     * @return void
     */
    function install($arrPlugin) {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objQuery->begin();

        // プラグイン独自の設定データを追加
        $sqlval = array();
        $sqlval['free_field1'] = "https://ajaxzip3.googlecode.com/svn/trunk/ajaxzip3/ajaxzip3-https.js";
        $sqlval['free_field2'] = "Button";
        $sqlval['update_date'] = 'CURRENT_TIMESTAMP';
        $where = "plugin_code = 'AjaxZip3'";
        // UPDATEの実行
        $objQuery->update('dtb_plugin', $sqlval, $where);
        $objQuery->commit();

        // 【必要なファイルをコピー】

        // ■ロゴ画像
        AjaxZip3::lfCopyFile(PLUGIN_UPLOAD_REALDIR . "AjaxZip3/logo.png", PLUGIN_HTML_REALDIR . 'AjaxZip3/logo.png');

        // ■JSファイル
        AjaxZip3::lfCopyFile(PLUGIN_UPLOAD_REALDIR . "AjaxZip3/media/"
            , PLUGIN_HTML_REALDIR . "AjaxZip3/media/", true);    // ディレクトリごとコピー
    }

    /**
     * アンインストール
     * uninstallはアンインストール時に実行されます.
     * 引数にはdtb_pluginのプラグイン情報が渡されます.
     * 
     * @param array $arrPlugin プラグイン情報の連想配列(dtb_plugin)
     * @return void
     */
    function uninstall($arrPlugin) {
        // 【配備したファイルを削除】
        // ■ロゴ画像
        AjaxZip3::lfDeleteFile(PLUGIN_HTML_REALDIR . 'AjaxZip3/logo.png');

        // ■JSファイル
        AjaxZip3::lfDeleteFile(PLUGIN_HTML_REALDIR . "AjaxZip3/media");    // ディレクトリごと削除
    }

    /**
     * 稼働
     * enableはプラグインを有効にした際に実行されます.
     * 引数にはdtb_pluginのプラグイン情報が渡されます.
     *
     * @param array $arrPlugin プラグイン情報の連想配列(dtb_plugin)
     * @return void
     */
    function enable($arrPlugin) {
        // nop
    }

    /**
     * 停止
     * disableはプラグインを無効にした際に実行されます.
     * 引数にはdtb_pluginのプラグイン情報が渡されます.
     *
     * @param array $arrPlugin プラグイン情報の連想配列(dtb_plugin)
     * @return void
     */
    function disable($arrPlugin) {
        // nop
    }

    /**
     * 処理の介入箇所とコールバック関数を設定
     * registerはプラグインインスタンス生成時に実行されます
     * 
     * @param SC_Helper_Plugin $objHelperPlugin 
     */
    function register(SC_Helper_Plugin $objHelperPlugin) {
        $objHelperPlugin->addAction('prefilterTransform', array(&$this, 'prefilterTransform'), 1);
        // ヘッダへの追加
        $template_dir = PLUGIN_UPLOAD_REALDIR . 'AjaxZip3/templates/';
        $objHelperPlugin->setHeadNavi($template_dir . 'plg_AjaxZip3_header.tpl');
    }

    /**
     * プレフィルタコールバック関数
     *
     * @param string &$source テンプレートのHTMLソース
     * @param LC_Page_Ex $objPage ページオブジェクト
     * @param string $filename テンプレートのファイル名
     * @return void
     */
    function prefilterTransform(&$source, LC_Page_Ex $objPage, $filename) {
        // お届け先の追加･変更画面(ポップアップ画面)ではデバイスタイプIDが取得できないため、ここで再取得(EC-CUBE2.12.2にて確認)
        $device_type_id = $objPage->arrPageLayout['device_type_id'];
        if (!$device_type_id) {
            $device_type_id = SC_Display::detectDevice();
        }

        // プラグイン情報を取得.
        $plugin = SC_Plugin_Util_Ex::getPluginByPluginCode("AjaxZip3");

        // トランスフォームオブジェクトを生成
        $objTransform = new SC_Helper_Transform($source);
        $template_dir = PLUGIN_UPLOAD_REALDIR . 'AjaxZip3/templates/';

        // お届け先の追加･変更画面(ポップアップ画面)では、setHeadNaviによるJSの追加ができないため、ここで挿入する
        $js_snip  = '<script type="text/javascript" src="' . $plugin['free_field1'] . '"></script>';
        $js_snip .= '<script type="text/javascript" src="' . ROOT_URLPATH . 'plugin/AjaxZip3/media/plg_ajaxzip3.js"></script>';
        switch ($device_type_id) {
            case DEVICE_TYPE_PC:
                if ($this->endsWith($filename, '/delivery_addr.tpl') !== false) {
                    $objTransform->select('div',0)->insertBefore($js_snip);
                }
                break;
            case DEVICE_TYPE_SMARTPHONE:
                if ($this->endsWith($filename, '/delivery_addr.tpl') !== false) {
                    $objTransform->select('section',0)->insertBefore($js_snip);
                }
                break;
            case DEVICE_TYPE_ADMIN:
            default:
                // nop
                break;
        }

        // フロントにて、郵便番号が入力された後すぐに住所検索を行なう設定かどうかを取得
        $trigger = $plugin['free_field2'];
        if ($trigger !== "KeyUp") {
            $source = $objTransform->getHTML();
            return;
        }

        // フロントにて、郵便番号が入力された後すぐに住所検索を行なう場合
        switch ($device_type_id) {
            case DEVICE_TYPE_PC:
                // 会員登録画面
                if ($this->endsWith($filename, 'frontparts/form_personal_input.tpl') !== false) {
                    $objTransform->select('p.top',0)->replaceElement(file_get_contents($template_dir . 'plg_AjaxZip3_pc_form_personal_input_zip.tpl'));
                    $objTransform->select('p.zipimg',0)->replaceElement("");
                }
                // お問い合わせ画面
                if ($this->endsWith($filename, 'contact/index.tpl') !== false) {
                    $objTransform->select('p.top',0)->replaceElement(file_get_contents($template_dir . 'plg_AjaxZip3_pc_form_contact_input_zip.tpl'));
                    $objTransform->select('p.zipimg')->replaceElement("");
                }
                // 非会員購入画面
                if ($this->endsWith($filename, 'shopping/nonmember_input.tpl') !== false) {
                    // 2.13系では置き換え不要
                }
                break;
            case DEVICE_TYPE_SMARTPHONE:
                // 会員登録画面
                if ($this->endsWith($filename, 'frontparts/form_personal_input.tpl') !== false) {
                    $objTransform->select('dd',5)->replaceElement(file_get_contents($template_dir . 'plg_AjaxZip3_sp_form_personal_input_zip.tpl'));
                }
                // お問い合わせ画面
                if ($this->endsWith($filename, 'contact/index.tpl') !== false) {
                    $objTransform->select('dd',2)->replaceElement(file_get_contents($template_dir . 'plg_AjaxZip3_sp_form_contact_input_zip.tpl'));
                }
                // 非会員購入画面
                if ($this->endsWith($filename, 'shopping/nonmember_input.tpl') !== false) {
                    $objTransform->select('dd',5)->replaceElement(file_get_contents($template_dir . 'plg_AjaxZip3_sp_form_nonmember_input_zip.tpl'));
                }
                break;
            case DEVICE_TYPE_ADMIN:
            default:
                // nop
                break;
        }
        $source = $objTransform->getHTML();
    }

    /**
     * ファイルコピー
     *
     * @param string $srcPath
     * @param string $dstPath
     * @param string $dirFlg
     * @return boolean
     */
    static function lfCopyFile($srcPath, $dstPath, $dirFlg = false){
        if($dirFlg){
            if(SC_Utils_Ex::sfCopyDir($srcPath, $dstPath) === false) {
                AjaxZip3::lfTriggerError("'" . $srcPath . "'から、'" . $dstPath . "へのディレクトリコピーに失敗しました");
            }
        } else {
            if(copy($srcPath, $dstPath) === false) {
                AjaxZip3::lfTriggerError("'" . $srcPath . "'から、'" . $dstPath . "'へのコピーに失敗しました");
            }
        }
        return true;
    }

    /**
     * ファイル削除
     *
     * @param string $targetPath
     * @return void
     */
    static function lfDeleteFile($targetPath){
        if(SC_Helper_FileManager_Ex::deleteFile($targetPath) === false) {
            AjaxZip3::lfTriggerError('[' . $targetPath . ']の削除に失敗しました');
        }
    }

    static function lfTriggerError($errMsg){
        GC_Utils_Ex::gfPrintLog($errMsg, ERROR_LOG_REALFILE, true);
        
        // エラー発生時に、プラグイン一覧画面がシステムエラーになり表示できなくなるため、エラーは発生させない
        // trigger_error($errMsg, E_USER_ERROR);
    }

    /**
     * 文字列の後方一致確認
     *
     * $haystackが$needleで終わるか判定します。
     * @param string $haystack
     * @param string $needle
     * @return boolean
     */
    function endsWith($haystack, $needle){
        $length = (strlen($haystack) - strlen($needle));
        // 文字列長が足りていない場合はFALSEを返します。
        if ($length < 0) return FALSE;
        return strpos($haystack, $needle, $length) !== FALSE;
    }
}
