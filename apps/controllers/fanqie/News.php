<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 咨询管理
 * @author chaituan@126.com
 */

class News extends XcxCheckLoginCommon {

    function __construct(){
        parent::__construct();
        $this->load->model(array('news/Articles'=>'do','news/Articles_group'=>'group'));
    }



    function index_get(){
        if(is_ajax_request()){
            $gid = Gets('gid');
            $group = $group = $this->group->getItems(['status'=>1,'parent_id'=>2],'id,gname');
            array_unshift($group,['id'=>0,'gname'=>'全部']);
            $data['group'] = $group;
            if($gid){
                $where['group_id'] = $gid;
            }else{
                $this->do->db->where_in('group_id',array_column($group,'id'));
            }
            $where['status'] = 1;

            $items = $this->do->getItems($where,'id,title,content,thumb');
            foreach ($items as &$item) {
                $item['content'] = strip_tags($item['content']);
            }
            $data['items'] = $items;
            AjaxResult_page($data);
        }
    }

    function detail_get(){
        if(is_ajax_request()){
            $id = Gets('id');
            $item = $this->do->getItem(['id'=>$id]);
            AjaxResult_page($item);
        }
    }

}
