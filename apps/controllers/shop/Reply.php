<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 评价管理
 * @author chaituan@126.com
 */
class Reply extends ShopCommon {

    function __construct(){
        parent::__construct();
        $this->load->model(array('goods/Comments'=>'do','user/Users'=>'dos'));
    }

    function index() {
        $data['pid'] = Gets('pid');
        $data['type'] = Gets('type');
        $this->load->view('shop/goods/reply',$data);
    }

    function lists(){
        $name = Gets('name');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where['a.goods_id'] =  Gets('pid');
        $where['a.type'] =  Gets('type');
        $join = array('table'=>'user as b','cond'=>'a.uid=b.id','type'=>'','ytable'=>'goods_comment as a');
        $data = $this->do->getItems_join($join,$where,'a.*,b.nickname','a.id desc',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
            $data['reply_time'] = time();
            is_AjaxResult($this->do->edit($data,"id=".Posts('id')));
        }
    }

    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('status'=>Gets('open')),$where);
        is_AjaxResult($result);
    }

}
