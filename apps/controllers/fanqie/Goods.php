<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 小程序登录
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
use EasyWeChat\Payment\Order;
class Goods extends XcxCheckLoginCommon {

    function __construct(){
        parent::__construct();
        $this->load->model(array('goods/Goodss'=>'do'));
    }

	function detail_get() {
		if(is_ajax_request()){
            $where['id'] = $id = Gets('id');
            $goods = $this->do->getItem($where, 'hb_img,hb_x,hb_y,shop_id,info,thumb_arr,sku_titles,sku_stock,sku_options,sku_price,thumb,title,price,id,content,stock,ot_price,IFNULL(sales,0) + IFNULL(ficti,0) as fsales,yj_money,p_1,p_2,video,video_url');
            if (!$goods) AjaxResult_error('产品不存在');
            $goods['sku_titles'] = json_decode($goods['sku_titles']);
            $goods['sku_options'] = json_decode($goods['sku_options']);
            $goods['sku_stock'] = json_decode($goods['sku_stock']);
            $goods['sku_price'] = json_decode($goods['sku_price']);
            $goods['stock'] = intval($goods['stock']);
            if($goods['video_url'])$goods['video'] = $goods['video_url'];
            unset($goods['video_url']);
            $content = preg_replace( '/(<img.*?)(style=.+?[\'|"])/i', '$1' , $goods['content']);
            $goods['content'] = str_replace('<img', '<img style="max-width:100%;height:auto" ', $content);
            $goods['thumb_arr'] = explode(',',$goods['thumb_arr']);
            $this->load->model(['shop/Shops','user/Users','goods/Comments']);
            //海报
            $goods['hb'] = $this->do->get_hb($this->User,$goods);
            //评论
            $commWhere['a.goods_id'] =  $id;
            $join = array('table'=>'user as b','cond'=>'a.uid=b.id','type'=>'','ytable'=>'goods_comment as a');
            $data = $this->Comments->getItems_join($join,$commWhere,'a.*,b.nickname,b.avatar','a.id desc',1,2);
            $goods['comment'] = result_format_time($data,'Y-m-d');

            $goods['fx'] = $this->Users->fx_view($goods,$this->Fx_config);
            $goods['shop'] = $this->Shops->getItem(['id'=>$goods['shop_id']],'id,title,address,logo,longitude,latitude,info,mobile');
            $goods['shop']['info'] = str_cut($goods['shop']['info'],10);
            $goods['shop']['address'] = str_cut($goods['shop']['address'],15);
            //收藏
            $this->load->model('goods/Collects');
            $is_relation = $this->Collects->getItem(['uid'=>$this->User['id'],'goods_id'=>$goods['id']],'id');
            $goods['is_relation'] = $is_relation?1:0;
            $this->load->model(['goods/Carts']);
            $goods['cart_num'] = $this->Carts->get_cart_num();
            $goods['fx_url'] = base_url('web/#/pages/goods/detail?id='.$id.'&uid='.$this->User['id']);
            $this->my_footmark($goods['id']);

            AjaxResult_page($goods);
        }
	}

    //店铺首页
    function shop_get(){
        if(is_ajax_request()){
            $order = "id DESC";
            $this->load->model (['shop/Shops'=>'shop']);
            $gid = Gets('gid');
            $where['shop_id'] = $gid;
            $shop = $this->shop->getItem(['id'=>$gid],'logo,title,info');
            $items = $this->do->getItems($where,'id,thumb,title,price,ot_price,IFNULL(sales,0) + IFNULL(ficti,0) as sales',$order);
            $data['goods'] = $items;
            $s = $shop;
            $data['shop'] = ['logo'=>$s['logo'],'title'=>$s['title'],'info'=>$s['info']];
            AjaxResult_page($data,'',true);
        }
    }

	function comment_get(){
        if(is_ajax_request()){
            $gid = Gets('gid');
            $this->load->model(['goods/Comments']);
            $commWhere['a.goods_id'] =  $gid;
            $join = array('table'=>'user as b','cond'=>'a.uid=b.id','type'=>'','ytable'=>'goods_comment as a');
            $data = $this->Comments->getItems_join($join,$commWhere,'a.*,b.nickname,b.avatar','a.id desc');
            $data = result_format_time($data,'Y-m-d');
            AjaxResult_page($data);
        }
    }

    //订单页面
    function order_get(){
        if(is_ajax_request()){
            $data['type'] = Gets('type');
            $data['uid'] = $this->User['id'];
            $data['order'] = true;
            $this->load->model('goods/Carts');
            $result = $this->Carts->get_cart($data);
            $this->load->model('user/Addresss');
            $result['address'] = $this->Addresss->getItem(['uid'=>$this->User['id'],'is_default'=>1]);
            AjaxResult_page($result);
        }
    }

    function order_post(){
        if(is_ajax_request()){
            $post = Posts();
            $post['uid'] = $this->User['id'];
            $this->do->pay($post);
        }
    }
    //取消订单后删除订单
    function order_delete(){
        if(is_ajax_request()){
            $id = Del_Put('id');
            $uid = $this->User['id'];
            $result = $this->do->del_order($id,$uid);
            is_AjaxResult($result);
        }
    }
    //我的收藏
    function my_collect_get(){
        if(is_ajax_request()){
            $uid = $this->User['id'];
            $where = ['b.uid'=>$uid];
            $join = array('table'=>'goods_collect as b','cond'=>'b.goods_id=a.id','type'=>'','ytable'=>'goods as a');
            $data = $this->do->getItems_join($join,$where,'a.id,a.title,a.thumb,a.price','b.id desc');
            AjaxResult_page($data,'',true);
        }
    }
    //我的收藏
    function my_collect_post(){
        if(is_ajax_request()){
            $un = Posts('un');
            $product_id = Posts('gid');
            $uid = $this->User['id'];
            $this->load->model('goods/Collects');
            if($un){
                $data = ['uid'=>$uid,'goods_id'=>$product_id,'type'=>1,'add_time'=>time()];
                $this->Collects->add($data);
                AjaxResult_ok('收藏成功');
            }else{
                $this->Collects->del(['uid'=>$uid,'goods_id'=>$product_id]);
                AjaxResult_ok('取消收藏');
            }
        }
    }
    function my_collect_delete(){
        if(is_ajax_request()){
            $goods_id = Del_Put('goods_id');
            $uid = $this->User['id'];
            $this->load->model('goods/Collects');
            $item = $this->Collects->del(['uid'=>$uid,'goods_id'=>$goods_id]);
            AjaxResult_page($item);
        }
    }
    //我的足迹
    function my_footmark_get(){
        if(is_ajax_request()){
            $uid = $this->User['id'];
            $where = ['b.uid'=>$uid];
            $join = array('table'=>'goods_footmark as b','cond'=>'b.goods_id=a.id','type'=>'','ytable'=>'goods as a');
            $data = $this->do->getItems_join($join,$where,'a.id,a.title,a.thumb,a.price','b.id desc');
            AjaxResult_page($data,'',true);
        }
    }
    function my_footmark_delete(){
        if(is_ajax_request()){
            $goods_id = Del_Put('goods_id');
            $uid = $this->User['id'];
            $this->load->model('goods/Footmarks');
            $item = $this->Footmarks->del(['uid'=>$uid,'goods_id'=>$goods_id]);
            AjaxResult_page($item);
        }
    }

    function my_footmark($goods_id){
        $uid = $this->User['id'];
        $this->load->model('goods/Footmarks');
        $item = $this->Footmarks->getItem(['uid'=>$uid,'goods_id'=>$goods_id]);
        if($item){

        }else{
            $this->Footmarks->add(['uid'=>$uid,'goods_id'=>$goods_id,'type'=>1,'add_time'=>time()]);
        }
    }

}
