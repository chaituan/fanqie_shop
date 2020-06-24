<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * @author chaituan@126.com
 */
class Task extends AdminCommon {


	function __construct(){
		parent::__construct();
		$this->load->model('user/Tasks','do');
	}

    function index() {
	    $data['level_id'] = Gets('id');
        $this->load->view('admin/user/task/index',$data);
    }

    function lists(){
        $name = Gets('name');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where['level_id'] = Gets('level_id');
        $data = $this->do->getItems($where,'','',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function add(){
        if(is_ajax_request()){
            $data = Posts('data');
            $task = $this->do->type($data['task_type']);
            if($task['max_number']!=0 && $data['number'] > $task['max_number']) AjaxResult_error('您设置的限定数量超出最大限制,最大限制为:'.$task['max_number']);
            $data['name'] = str_replace('{$num}',$data['number'].$task['unit'],$task['name']);
            $data['real_name']=$task['real_name'];
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $data['type'] = $this->do->type();
            $data['level_id'] = Gets('level_id');
            $this->load->view('admin/user/task/add',$data);
        }
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            $where['id'] = Posts('id');

            $task = $this->do->type($data['task_type']);
            if($task['max_number']!=0 && $data['number'] > $task['max_number']) AjaxResult_error('您设置的限定数量超出最大限制,最大限制为:'.$task['max_number']);
            $data['name'] = str_replace('{$num}',$data['number'].$task['unit'],$task['name']);
            $data['real_name']=$task['real_name'];

            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $data['type'] = $this->do->type();
            $data['item'] = $this->do->getItem(array('id'=>Gets('id')),'');
            $this->load->view('admin/user/task/edit',$data);
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
