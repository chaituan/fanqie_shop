<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 第三方
 * @author chaituan@126.com
 */
class Third extends AdminCommon {

	public function index() {
        $data['item1'] = get_Cache('wechatConfig');
        $data['item2'] = get_Cache('wxappConfig');
        $this->load->view('admin/setting/third/index',$data);
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
