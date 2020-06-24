<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 店铺管理
 * @author chaituan@126.com
 */
class Shop extends AdminCommon{

    function __construct(){
        parent::__construct();
        $this->load->model(array('shop/Shops'=>'do'));
    }

    function index()  {
        $this->load->view('admin/shop/shop/index');
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
            $point = explode(',',$data['point']);
            $data['longitude'] = $point[1];
            $data['latitude'] = $point[0];
            unset($data['point']);
            $data['add_time'] = time();
            $pwd = set_password($data['pwd']);
            $data['password'] = $pwd['password'];
            $data['encrypt'] = $pwd['encrypt'];
            unset($data['pwd']);
            $this->do->db->where('account',$data['account']);
            $this->do->db->or_where('title',$data['title']);
            $item = $this->do->getItem();
            if($item)AjaxResult_error('帐号或者店铺名字重复');
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $this->load->model("shop/Locations");
            $data['location'] = $this->Locations->getItems('','','id desc');
            $this->load->view('admin/shop/shop/add',$data);
        }
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            $point = explode(',',$data['point']);
            $data['longitude'] = $point[1];
            $data['latitude'] = $point[0];
            unset($data['point']);
            $where['id'] = Posts('id');
            if($data['pwd']){
                $pwd = set_password($data['pwd']);
                $data['password'] = $pwd['password'];
                $data['encrypt'] = $pwd['encrypt'];
            }
            unset($data['pwd']);
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $where['id'] = Gets('id');
            $data['item'] = $item = $this->do->getItem($where);
            $this->load->model(["shop/Locations","user/Users"]);
            $data['location'] = $this->Locations->getItems('','','id desc');
            $data['user'] = $this->Users->getItems(['id'=>$item['uid']],'id as value,nickname as name');
            $data['user'][0]['selected'] = true;
            $this->load->view('admin/shop/shop/edit',$data);
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
            $user['message'] = "恭喜，您已成功入住商家！";
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
            $user['message'] = "抱歉，您的商家入住申请，没有通过";
            $user['status_say'] = "拒绝加入";
            $this->Templates->send_sh($user);
        }
        is_AjaxResult($result);
    }
}
