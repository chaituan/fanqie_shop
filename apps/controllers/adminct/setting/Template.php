<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 模版消息
 * @author chaituan@126.com
 */

class Template extends AdminCommon {

	function __construct(){
		parent::__construct();
		$this->load->model(array('user/Templates'=>'do'));
	}

    function index() {
	    $get = Gets();
	    $data['type'] = $get?$get['t']:1;
        $this->load->view('admin/user/template/index',$data);
    }

    function lists(){
        $name = Gets('name');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $t = Gets('t');
        $where['type'] = $t;
        $data = $this->do->getItems($where,'','id desc',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function add(){
        if(is_ajax_request()){

            is_AjaxResult(1);
        }
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            $where['id'] = Posts('id');
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $data['item'] = $this->do->getItem(array('id'=>Gets('id')),'');
            $this->load->view('admin/wechat/template/edit',$data);
        }
    }

    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
            if(array_keys($data)[0]=='pwd'){
                $pwd = set_password($data['pwd']);
                unset($data['pwd']);
                $data['pwd'] = $pwd['password'];
                $data['encrypt'] = $pwd['encrypt'];
            }
            is_AjaxResult($this->do->edit($data,"id=".Posts('id','checkid')));
        }
    }

    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('status'=>Gets('open')),$where);
        is_AjaxResult($result);
    }

    function del(){
        $where['id'] = Gets('id');
        $result = $this->do->del($where);
        is_AjaxResult($result);
    }
    

}
