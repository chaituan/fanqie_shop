<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 购物车
 * @author chaituan@126.com
 */
class Cart extends XcxCheckLoginCommon {

	function __construct(){
		parent::__construct();
		$this->load->model('goods/Carts','do');
	}
	
	function index_get(){
        if(is_ajax_request()){
            $uid = $this->User['id'];
            $data = $this->do->get_cart(['type'=>1,'uid'=>$uid]);
            AjaxResult_page($data,'',true);
        }
	}
	
	//添加购物车
	function index_post(){
		if(is_ajax_request()){
			$data = Posts();
			$data['uid'] = $this->User['id'];
			$this->do->add_cart($data);
            $num = $this->do->get_cart_num();
			AjaxResult(1, '添加成功',$num);
		}
	}

	function index_put(){
	    if(is_ajax_request()){
	        $uid = $this->User['id'];
	        $put = Del_Put('id');
	        $data = json_decode($put,true);
            $stock = Del_Put('stock');
            $stock = json_decode($stock,true);
            if($stock){
                //对比更新购物车
                $result = $this->do->sub_check($stock,$uid);
            }
	        $ok = $no = [];
            foreach ($data as $item) {
                if($item['checked']){
                    $ok[] = $item['value'];
                }else{
                    $no[] = $item['value'];
                }
            }
            $where['uid'] = $uid;
            if($ok){
                $this->do->db->where_in('id',$ok);
                $edit['cart_sel'] = 1;
                $result = $this->do->edit($edit,$where);
            }
            if($no){
                $this->do->db->where_in('id',$no);
                $edit['cart_sel'] = 0;
                $result = $this->do->edit($edit,$where);
            }
            AjaxResult_page($result);

        }
    }


    function index_delete(){
	    if(is_ajax_request()){
            $id = Del_Put('id');
            $this->do->db->where_in('id',explode(',',$id));
            $result = $this->do->del();
            AjaxResult_page($result);
        }
    }

}
