<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 区域管理
 * @author chaituan@126.com
 */
class Location extends AdminCommon{

    function __construct(){
        parent::__construct();
        $this->load->model(array('shop/Locations'=>'do'));
    }

    function index()  {
        $this->load->view('admin/shop/location/index');
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
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $this->load->view('admin/shop/location/add');
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
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $where['id'] = Gets('id');
            $data['item'] = $this->do->getItem($where);
            $this->load->view('admin/shop/location/edit',$data);
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



}
