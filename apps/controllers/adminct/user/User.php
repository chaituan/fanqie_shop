<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * @author chaituan@126.com
 */
class User extends AdminCommon {


	function __construct(){
		parent::__construct();
		$this->load->model('user/Users','do');
	}

    function index() {
        $this->load->view('admin/user/user/index');
    }

    function search(){
        $get = Gets('keyword');
        $where = "nickname like '%$get%'";
        $data = $this->do->getItems ($where,'nickname as name ,id as value','id desc');
        f_ajax_lists(0,$data);
    }

    function lists(){
        $name = Gets('srk');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where = [];
        if($name)$where['nickname like'] = "%$name%";
        $data = $this->do->getItems($where,'','id desc',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }


    function edit(){
        if(is_ajax_request()){
            $post = Posts();
            $id = $post['id'];
            $data = $post['data'];
            $edit_data = [];

            if($data['now_money']){
                $ands = $data['now_money_ands'];
                $this->load->model('user/UserBills');
                //更新明细
                $result = $this->UserBills->add(['uid'=>$id,'cid'=>0,'money'=>$data['now_money'],'src'=>'管理员充值','ands'=>$ands,'add_time'=>time(),'type'=>2]);
            }
            if($data['integral']){
                $ands = $data['integral_ands'];
                //更新明细
                $this->load->model('user/Integrals');
                $result = $this->Integrals->add(['uid'=>$id,'num'=>$data['integral'],'src'=>'管理员增加','ands'=>$ands,'add_time'=>time(),'type'=>3]);
            }
            if($result){
                is_AjaxResult($result);
            }else{
                AjaxResult_error();
            }
        }else{
            $data['item'] = $this->do->getItem(array('id'=>Gets('id')),'');
            $this->load->view('admin/user/user/edit',$data);
        }
    }

    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
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
