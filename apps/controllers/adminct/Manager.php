<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 后台首页
 * 
 * @author chaituan@126.com
 */
class Manager extends AdminCommon {

	public function index() {
		$data['items'] = $this->AdminUser->tongji();
		$this->load->view ( 'admin/index',$data);
	}
	
	public function password() {
		if (is_ajax_request ()) {
			$oldpass = Posts ( 'oldpass' );
			$item = $this->AdminUser->getItem ( array (
					'id' => $this->adminId
			), 'pwd,encrypt' );
			$pwd = get_password ( $oldpass, $item ['encrypt'] );
			if ($pwd != $item ['pwd'])
				AjaxResult_error ( '原始密码不正确' );
			$new = set_password ( Posts ( 'password' ) );
			$result = $this->AdminUser->edit ( array ('pwd' => $new ['password'],'encrypt' => $new ['encrypt']), "id=" . $this-> adminId);
			is_AjaxResult ( $result );
		}
	}


	function creat(){
	    if(is_ajax_request()){
            $path = FCPATH.'web/static/js';
            $result = $this->scanFile($path);
            $is_ok = false;
            foreach ($result as $v){
                if (strpos($v,'index.')===0){
                    $content = file_get_contents($path.'/'.$v);
                    if(strstr($content,'XNXBZ-H443D-SXS4W-HXFSF-KQTLH-FKFAX')){
                        $content = str_replace('XNXBZ-H443D-SXS4W-HXFSF-KQTLH-FKFAX',$this->qqmap_key,$content);
                        file_put_contents($path.'/'.$v,$content);
                        $is_ok = true;
                    }
                }
            }
            $file = FCPATH.'web/index.html';
            $web_name = $this->AdminConfig->getValue('web_name');
            $content = file_get_contents($file);
            $ru="/<title>(.*)<\/title>/";
            $content = preg_replace($ru,'<title>'.$web_name.'</title>',$content);
            $r = file_put_contents($file,$content);
            if($r)$is_ok = true;
            if($is_ok){
                AjaxResult_ok('生成成功');
            }else{
                AjaxResult_error('生成失败，请确保web目录可以读写或已生成不需要重新生成');
            }
        }
    }

    private function scanFile($path) {
        global $result;
        $files = scandir($path);
        foreach ($files as $file) {
            if ($file != '.' && $file != '..') {
                if (is_dir($path . '/' . $file)) {
                    $this->scanFile($path . '/' . $file);
                } else {
                    $result[] = basename($file);
                }
            }
        }
        return $result;
    }

	function wechat(){
	    if(is_ajax_request()){
            $data = Posts('data');
            $pem_path = APPPATH . 'libraries/wechat/cert';
            is_dir($pem_path) or mkdir($pem_path, 0777, true);
            $cert_path = APPPATH . 'libraries/wechat/cert/apiclient_cert.pem';
            $key_path = APPPATH . 'libraries/wechat/cert/apiclient_key.pem';
            file_put_contents($cert_path, $data['apiclient_cert']);
            file_put_contents($key_path , $data['apiclient_key']);
            unset( $data['apiclient_cert'],$data['apiclient_key']);
            $data['certpem'] = $cert_path;
            $data['keypem'] = $key_path;
            set_Cache('wechatConfig',$data);
            AjaxResult_ok();
        }
    }

    function wxapp(){
	    if(is_ajax_request()){
            $data = Posts('data');
            $pem_path = APPPATH . 'libraries/wechat/cert';
            is_dir($pem_path) or mkdir($pem_path, 0777, true);
            $cert_path = APPPATH . 'libraries/wechat/cert/apiclient_cert.pem';
            $key_path = APPPATH . 'libraries/wechat/cert/apiclient_key.pem';
            file_put_contents($cert_path, $data['apiclient_cert']);
            file_put_contents($key_path , $data['apiclient_key']);
            unset( $data['apiclient_cert'],$data['apiclient_key']);
            $data['certpem'] = $cert_path;
            $data['keypem'] = $key_path;
            set_Cache('wxappConfig',$data);
            AjaxResult_ok();
        }
    }


}
