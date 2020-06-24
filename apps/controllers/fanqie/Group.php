<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 分类
 * @author chaituan@126.com
 */
class Group extends XcxCommon {

    function index_get() {
        if(is_ajax_request()){
            $this->load->model('goods/Groups','do');
            $items = $this->do->getAll();
            AjaxResult_page($items);
        }
	}

    function lists_get(){
        if(is_ajax_request()){
            $post = Gets();
            $cate_id = $post['id'];
            $order = "sort DESC, top_time DESC";
            $this->load->model(['goods/Groups','goods/Goodss'=>'do']);
            $where = array('status'=>1);
            $cat = [];
            if($cate_id!=0){
                $cat = $this->Groups->getItem(['id'=>$cate_id],'pid,thumb');
                if($cat['pid']){
                    $this->do->db->where_in('group_id',[$cate_id,$cat['pid']]);
                }else{
                    $child = $this->Groups->getItem(['pid'=>$cate_id],'GROUP_CONCAT(id) as ids');
                    $child['ids'] = $child?$child['ids'].','.$cate_id:$cate_id;
                    $this->do->db->where_in('group_id',explode(',',$child['ids']));
                }
            }
            $pages = $post['pages'];
            $items = $this->do->getItems($where,'id,thumb,yj_money,p_1,burst,title,price,IFNULL(sales,0) + IFNULL(ficti,0) as sales,',$order,$pages,20);
            AjaxResult_page($items,$cat?$cat['thumb']:'',true);
        }
    }

    function search_get(){
        if(is_ajax_request()){
            $this->load->model(['admin/AdminConfig']);
            $hot = $this->AdminConfig->getValue('hot_key');
            $data = $hot?explode(',',$hot):'';
            AjaxResult_page($data,'',true);
        }
    }

    function search_post(){
        if(is_ajax_request()){
            $val = Posts('key');
            $this->load->model(array('goods/Goodss'=>'do'));
            $items = $this->do->getItems(array('status'=>1,'title like'=>"%$val%"),'id,thumb,title,price,yj_money,p_1,burst,IFNULL(sales,0) + IFNULL(ficti,0) as sales','sort DESC, id DESC');
            AjaxResult_page($items,'',true);
        }
    }

}
