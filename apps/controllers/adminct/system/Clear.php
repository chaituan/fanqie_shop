<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 清理缓存
 * @author chaituan@126.com
 */
class Clear extends AdminCommon{


    function index()  {
        $this->load->view('admin/system/clear/index');
    }

    function start(){
        if(is_ajax_request()){
            $dir = FCPATH.'apps/cache/session';
            if (!is_dir($dir))AjaxResult_error('不是目录');
            $dh = opendir($dir);
            while ($file = readdir($dh)) {
                if($file != "." && $file!="..") {
                    $fullpath = $dir."/".$file;
                    if(!is_dir($fullpath)) {
                        @unlink($fullpath);
                    }
                }
            }
            closedir($dh);
            AjaxResult_ok('清理成功');
        }
    }


}
