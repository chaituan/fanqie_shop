<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 充值管理
 * @author chaituan@126.com
 */
class Recharge extends AdminCommon{

    function __construct(){
        parent::__construct();
        $this->load->model(array('user/UserBills'=>'do'));
    }

    function index()  {
        $this->load->view('admin/finance/recharge/index');
    }

    function lists(){
        $name = Gets('name');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where['type'] = 1;
        if($name)$where['b.nickname'] = $name;
        $join = array('table'=>'user as b','cond'=>'a.uid=b.id','type'=>'','ytable'=>'user_bill as a');
        $data = $this->do->getItems_join($join,$where,'a.*,b.nickname','a.id desc',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('is_show'=>Gets('open')),$where);
        is_AjaxResult($result);
    }


    function del(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('is_del'=>1),$where);
        is_AjaxResult($result);
    }



    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
            is_AjaxResult($this->do->edit($data,"id=".Posts('id','checkid')));
        }
    }


}
