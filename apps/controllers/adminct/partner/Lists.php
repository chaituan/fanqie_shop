<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 合伙人管理
 * @author chaituan@126.com
 */
class Lists extends AdminCommon{

    function __construct(){
        parent::__construct();
        $this->load->model(array('partner/Partners'=>'do'));
    }

    function index()  {
        $this->load->view('admin/partner/lists/index');
    }

    function lists(){
        $name = Gets('name');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where = [];
        if($name)$where['title'] = $name;
        $data = $this->do->getItems($where,'*','id desc',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function search(){
        $get = Gets('keyword');
        $where = "title like '%$get%'";
        $data = $this->do->getItems ($where,'title as name ,id as value','id desc');
        f_ajax_lists(0,$data);
    }


    function del(){
        $where['id'] = Gets('id');
        $result = $this->do->del($where);
        is_AjaxResult($result);
    }


    function add(){
        if(is_ajax_request()){
            $data = Posts('data');
            $data['add_time'] = time();
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $this->load->model("shop/Locations");
            $data['location'] = $this->Locations->getItems('','','id desc');
            $this->load->view('admin/partner/lists/add',$data);
        }
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            $where['id'] = Posts('id');
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $where['id'] = Gets('id');
            $data['item'] = $item = $this->do->getItem($where);
            $this->load->model(["shop/Locations","user/Users"]);
            $data['location'] = $this->Locations->getItems('','','id desc');
            $data['user'] = $this->Users->getItems(['id'=>$item['uid']],'id as value,nickname as name');
            $data['user'][0]['selected'] = true;
            $this->load->view('admin/partner/lists/edit',$data);
        }
    }

    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
            is_AjaxResult($this->do->edit($data,"id=".Posts('id','checkid')));
        }
    }

    function defaults(){
        $where['id'] = Gets('id');
        $this->do->edit(array('default'=>0));
        $result = $this->do->edit(array('default'=>Gets('open')),$where);
        is_AjaxResult($result);
    }

    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('status'=>Gets('open')),$where);
        is_AjaxResult($result);
    }

    function sh_ok(){
        $id = Gets('id');
        $result = $this->do->edit(array('status'=>1),"id=$id");
        $item = $this->do->getItem(['id'=>$id],'uid');
        $this->load->model(['user/Templates','user/Users']);
        $user = $this->Users->getItem(['id'=>$item['uid']],'id,openid,nickname,system');
        if($user['openid']){
            $user['message'] = "恭喜，您已成为合伙人！";
            $user['status_say'] = "审核通过";
            $this->Templates->send_sh($user);
        }
        is_AjaxResult($result);
    }

    function sh_no(){
        $id = Gets('id');
        $result = $this->do->edit(array('status'=>2),"id=$id");
        $item = $this->do->getItem(['id'=>$id],'uid');
        $this->load->model(['user/Templates','user/Users']);
        $user = $this->Users->getItem(['id'=>$item['uid']],'id,openid,nickname,system');
        if($user['openid']){
            $user['message'] = "抱歉，您的合伙人申请，没有通过";
            $user['status_say'] = "拒绝加入";
            $this->Templates->send_sh($user);
        }
        is_AjaxResult($result);
    }



}
