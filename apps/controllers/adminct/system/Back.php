<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 备份
 * @author chaituan@126.com
 */
class Back extends AdminCommon{

    function index()  {
        $this->getDirFilesLists('./data/back',$items,false,['.zip']);
        $data['items'] = $items?$items:[];
        $this->load->view('admin/system/back/index',$data);
    }

    function start(){
        $this->load->dbutil();
        $prefs = array(
            'tables'    => array(),   // Array of tables to backup.
            'ignore'    => array(),         // List of tables to omit from the backup
            'format'    => 'zip',           // gzip, zip, txt
            'filename'  => 'mybackup.sql',      // File name - NEEDED ONLY WITH ZIP FILES
            'add_drop'  => TRUE,            // Whether to add DROP TABLE statements to backup file
            'add_insert'    => TRUE,            // Whether to add INSERT data to backup file
            'newline'   => "\n"             // Newline character used in backup file
        );

        $backup = $this->dbutil->backup($prefs);
        $this->load->helper('file');
        $t = time();
        write_file("./data/back/$t.zip", $backup);
        AjaxResult_ok();
    }

    function getDirFilesLists($path,&$filename,$recursive = false,$ext = false,$baseurl = true){
        $v = [];
        if(!$path){
            die('请传入目录路径');
        }
        $resource = opendir($path);
        if(!$resource){
            die('你传入的目录不正确');
        }
        //遍历目录
        while ($rows = readdir($resource)){
            //如果指定为递归查询
            if($recursive) {
                if (is_dir($path . '/' . $rows) && $rows != "." && $rows != "..") {
                    $this->getDirFilesLists($path . '/' . $rows, $filename,$resource,$ext,$baseurl);
                } elseif ($rows != "." && $rows != "..") {
                    //如果指定后缀名
                    if($ext) {
                        //必须为数组
                        if (!is_array($ext)) {
                            die('后缀名请以数组方式传入');
                        }
                        //转换小写
                        foreach($ext as &$v){
                            $v = strtolower($v);
                        }
                        //匹配后缀
                        $file_ext = strtolower(pathinfo($rows)['extension']);
                        if(in_array($file_ext,$ext)){
                            //是否包含路径
                            if($baseurl) {
                                $filename[] = $path . '/' . $rows;
                            }else{
                                $filename[] = $rows;
                            }
                        }
                    }else{
                        if($baseurl) {
                            $filename[] = $path . '/' . $rows;
                        }else{
                            $filename[] = $rows;
                        }
                    }
                }
            }else{
                //非递归查询
                if (is_file($path . '/' . $rows) && $rows != "." && $rows != "..") {
                    if($baseurl) {
                        $v['name'] = $rows;
                        $v['path'] = $path;
                        $v['time'] = filectime($path.'/'.$rows);
                        $filename[] = $v;
                    }else{
                        $filename[] = $rows;
                    }
                }
            }
        }
    }



}
