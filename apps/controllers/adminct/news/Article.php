<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 文章管理
 * @author chaituan@126.com
 */
class Article extends AdminCommon{

    function __construct(){
        parent::__construct();
        $this->load->model(array('news/Articles'=>'do','news/Articles_group'=>'dos'));
    }

    function index()  {
        $items = $this->dos->get_cat();
        $data['parent'] = $items;
        $this->load->view('admin/news/article/index',$data);
    }

    function lists(){
        $name = Gets('name');//搜索
        $cid = Gets('cid');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where = [];
        if($name)$where['a.title'] = $name;
        if($cid)$where['a.group_id'] = $cid;
        $join = array('table'=>'article_group as b','cond'=>'a.group_id=b.id','type'=>'','ytable'=>'article as a');
        $data = $this->do->getItems_join($join,$where,'a.*,b.gname','b.id desc,a.id desc',$page,$limit,$total);
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
        $result = $this->do->del($where);
        is_AjaxResult($result);
    }

    function add(){
        if(is_ajax_request()){
            $data = Posts('data');
            $data['add_time'] = time();
            $con = Posts('data[content]','',false);
            $data['content'] = htmlspecialchars_decode($con, ENT_QUOTES);
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $items = $this->dos->get_cat();
            $data['parent'] = $items;
            $this->load->view('admin/news/article/add',$data);
        }
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            $where['id'] = Posts('id');
            $con = Posts('data[content]','',false);
            $data['content'] = htmlspecialchars_decode($con, ENT_QUOTES);
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $data['item'] = $this->do->getItem(array('id'=>Gets('id')),'');
            $items = $this->dos->get_cat();
            $data['parent'] = $items;
            $this->load->view('admin/news/article/edit',$data);
        }
    }

    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
            is_AjaxResult($this->do->edit($data,"id=".Posts('id','checkid')));
        }
    }


}
