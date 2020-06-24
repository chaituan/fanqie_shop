<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 地址库管理
 * @author chaituan@126.com
 */

class Address extends XcxCheckLoginCommon {

    function __construct() {
        parent::__construct();
        $this->load->model(array('user/Addresss'=>'do'));
    }

    function index_get(){
        if(is_ajax_request()){
            $where['uid'] = $this->User['id'];
            $data = $this->do->getItems($where,'','id desc');
            AjaxResult_page($data,'',true);
        }
    }

    function set_default_put(){
        if(is_ajax_request()){
            $id = Del_Put('id');
            $where['uid'] = $this->User['id'];
            $this->do->edit(['is_default'=>0],$where);
            $where['id'] = $id;
            $result = $this->do->edit(['is_default'=>1],$where);
            is_AjaxResult($result);
        }
    }

    function index_post(){
        if(is_ajax_request()){
            $post = Posts();
            $post['uid'] = $this->User['id'];
            $id = $this->do->add($post);
            $post['id'] = "$id";
            $post['is_default'] = '0';
            AjaxResult_page($post,'');
        }
    }

    function index_put(){
        if(is_ajax_request()){
            $post = Del_Put();
            $post['uid'] = $this->User['id'];
            $where['id'] = $post['id'];
            $where['uid'] = $this->User['id'];
            $this->do->edit($post,$where);
            AjaxResult_ok('修改成功');
        }
    }

    function index_delete(){
        if(is_ajax_request()){
            $where['id'] = Del_Put('id','num');
            $where['uid'] = $this->User['id'];
            $result = $this->do->del($where);
            is_AjaxResult($result);
        }
    }

}