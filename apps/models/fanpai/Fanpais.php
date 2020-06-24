<?php
if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 翻牌
 * @author chaituan@126.com
 */
class Fanpais extends MY_Model {

	function __construct() {
		parent::__construct ();
		$this->table_name = 'fanpai';
	}


    function set_order($goods_sku){
        $id = $goods_sku['id'];
        $newItems['detail'][] = array(
            'id'=>$goods_sku['id'],
            'cate_id'=>$goods_sku['cate_id'],
            'price'=>$goods_sku['price'],
            'names'=>$goods_sku['name'],
            'image'=>$goods_sku['options']['thumb'],
            'selPath'=>$goods_sku['options']['selPath'],
            'num' => $goods_sku['qty'],
            'options'=>$goods_sku['options']['options'],
            'prices' =>$goods_sku['options']['total'],
        );
        $newItems['total'][] = $goods_sku['options']['total'];
        $newItems['total_num'][] = intval($goods_sku['qty']);
        $postage = floatval($goods_sku['options']['is_postage']?0:$goods_sku['options']['postage']);
        $newItems['postage'][] = $postage;
        $newItems['integral'] = $goods_sku['integral'];
        $this->session->set_userdata('new_goods',$newItems);
        $data['total'] = $goods_sku['options']['total'];
        $data['items'] = [$goods_sku];
        $data['postage'] = $postage;
        if(!$goods_sku)AjaxResult_error('数据错误，请返回');
        return $data;
    }
}