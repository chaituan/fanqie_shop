<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 广告
 * @author chaituan@126.com
 */
class Ad extends AdminCommon {

	function __construct(){
		parent::__construct();
		$this->load->model(array('ad/Ads'=>'do','ad/AdGroup'=>'dos'));
	}

	function aa(){
	    return ['a','b'];
    }
    function index() {
        $this->load->view('admin/ad/ad/index');
    }

    function lists(){
        $name = Gets('name');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where = '';
        $join = array('table'=>'ad_group as b','cond'=>'a.gid=b.id','type'=>'','ytable'=>'ad as a');
        $data = $this->do->getItems_join($join,$where,'a.*,b.aname','b.id desc',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function add(){
        if(is_ajax_request()){
            $data = Posts('data');
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $data['group'] = $this->dos->getItems();
            $this->load->view('admin/ad/ad/add',$data);
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
            $data['group'] = $this->dos->getItems();
            $this->load->view('admin/ad/ad/edit',$data);
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
