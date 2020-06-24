<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 产品分类
 * @author chaituan@126.com
 */
class Carts extends MY_Model {

	function __construct() {
		parent::__construct ();
		$this->table_name = 'goods_cart';
	}
	//提交购买的时候，对比库存更新购物车
	function sub_check($data,$uid){
        $id = array_column($data,'id');
        $this->db->where_in('id',$id);
        $items = $this->getItems(['uid'=>$uid]);
        if(!$items)AjaxResult_error('提交数据错误');
        $news_stock = [];
        foreach ($items as $v){
          $news_stock[] = ['id'=>$v['id'],'goods_id'=>$v['goods_id'],'num'=>$data[$v['id']]['num'],'sku_path'=>$v['sku_path']];
        }
        $goods_id = array_unique(array_column($items,'goods_id'));

        $this->load->model(['goods/Goodss']);
        $this->Goodss->db->where_in('id',$goods_id);
        $goods = $this->Goodss->getItems('','id,title,price,sku_stock,sku_price,stock,thumb,status');
        if(!$goods)AjaxResult_error('商品数据错误');
        foreach ($goods as $v){
          if(!$v['status']){
              AjaxResult_error($v['title'].'已下架，请删除');
          }
        }
        $goods = array_column($goods,null,'id');
        $news_cart = [];
        foreach ($news_stock as $v){
            //判断库存是否够
            if($v['sku_path']){
              $sku_stock = json_decode($goods[$v['goods_id']]['sku_stock'],true);
              if($sku_stock[$v['sku_path']] <= 0)AjaxResult_error($goods[$v['goods_id']]['title'].'无库存，请删除');
              if($sku_stock[$v['sku_path']] < $v['num'])AjaxResult_error($goods[$v['goods_id']]['title'].'库存不足，实际库存'.$sku_stock[$v['sku_path']] .'，请减少数量在下单。');
              $sku_price = json_decode($goods[$v['goods_id']]['sku_price'],true);
              $price = $sku_price[$v['sku_path']];
            }else{
              if($v['num'] > $goods[$v['goods_id']]['stock']){
                  AjaxResult_error($goods[$v['goods_id']]['title'].'库存不足，实际库存'.$goods[$v['goods_id']]['stock'].'，请减少数量在下单。');
              }
              $price = $goods[$v['goods_id']]['price'];
            }
            $news_cart[] = [
                'id'=>$v['id'],
                'data'=>[
                    'goods_title'=>$goods[$v['goods_id']]['title'],
                    'price'=>$price,
                    'num'=>$v['num'],
                    'total'=>bcmul($price,$v['num'],2)
                ]
            ];
        }
      //如果没有异常则开始执行更新购物车
        $result = '';
        foreach ($news_cart as $v){
            $result = $this->edit($v['data'],['id'=>$v['id']]);
        }
        return $result;
    }

    //设置购买后计算价格存seesion
    function add_cart($data){
        $this->load->model(['goods/Goodss','shop/Shops']);
        $id = $data['id'];$num = $data['cart_num'];$path = $data['selpath'];$type = $data['type'];
        if($this->_edit($data))return true;
        $goods = $this->Goodss->getItem(['id'=>$id,'status'=>1]);
        if(!$goods)AjaxResult_error('产品不存在或已下架');
        $shop = $this->Shops->getItem(['id'=>$goods['shop_id']],'title');
        if(!$shop)AjaxResult_error('店铺不存在或异常');
        $sku_opt = '';
        if($path!==''){
            $sku_paths = json_decode($goods['sku_paths'],true);
            $sku_price = json_decode($goods['sku_price'],true);
            $sku_opt = '已选：'.implode(' + ',$sku_paths[$path]['values']);
            $price = $sku_price[$path];
        }else{
            $price = $goods['price'];
        }
        $datas = [
            'uid'=>$data['uid'],
            'shop_id'=>$goods['shop_id'],
            'shop_title'=>$shop['title'],
            'goods_id'=>$goods['id'],
            'goods_title'=>$goods['title'],
            'goods_thumb'=>$goods['thumb'],
            'sku_path'=>$path,
            'sku_opt'=>$sku_opt,
            'price'=>$price,
            'num'=>$num,
            'total'=>bcmul($num,$price,2),
            'add_time'=>time(),
            'type'=>$type,
            'goods_type'=>$data['goods_type']
        ];
        $this->add($datas);
    }
    //0直接购买产品 1购物车
    function _edit($data){
	    $where = ['uid'=>$data['uid'],'type'=>$data['type']];
	    if($data['type']==1){
            $where['goods_id'] = $data['id'];
            $where['sku_path'] = $data['selpath'];
        }
        $item = $this->getItem($where);
        //普通产品加入购物车，当不加入购物车的时候购物车，如果产品和用户相等则更新，
	    if($item){
            $edit_where = [];
            //直接购买
            if($item['type']==0){
                //如果有数据全部更新
                $goods = $this->Goodss->getItem(['id'=>$data['id'],'status'=>1]);
                if(!$goods)AjaxResult_error('产品不存在或已下架');
                $shop = $this->Shops->getItem(['id'=>$goods['shop_id']],'title');
                if(!$shop)AjaxResult_error('店铺不存在或异常');
                $sku_opt = '';
                if($data['selpath']!==''){
                    $sku_paths = json_decode($goods['sku_paths'],true);
                    $sku_price = json_decode($goods['sku_price'],true);
                    $sku_opt = '已选：'.implode(' + ',$sku_paths[ $data['selpath']]['values']);
                    $price = $sku_price[ $data['selpath']];
                }else{
                    $price = $goods['price'];
                }
                $edit_where = [
                    'uid'=>$data['uid'],
                    'shop_id'=>$goods['shop_id'],
                    'shop_title'=>$shop['title'],
                    'goods_id'=>$goods['id'],
                    'goods_title'=>$goods['title'],
                    'goods_thumb'=>$goods['thumb'],
                    'sku_path'=> $data['selpath'],
                    'sku_opt'=>$sku_opt,
                    'price'=>$price,
                    'num'=>$data['cart_num'],
                    'total'=>bcmul($data['cart_num'],$price,2),
                    'add_time'=>time(),
                    'type'=>0,
                    'goods_type'=>$data['goods_type']
                ];
            }else{
                //购物车添加购买
                //选择的数量不相等则直接修改+数量
                if($item['num']!=$data['cart_num']){
                    $edit_where['num'] = '+='.$data['cart_num'];
                    $num = bcadd($data['cart_num'],$item['num']);
                    $edit_where['total'] = bcmul($item['price'],$num,2);
                }
                //如果两个都相等，则更新数量即可
                if(($item['num']==$data['cart_num'])&&($item['sku_path']==$data['selpath'])){
                    $edit_where['num'] = '+='.$data['cart_num'];
                    $num = bcadd($data['cart_num'],$item['num']);
                    $edit_where['total'] = bcmul($item['price'],$num,2);
                }
            }
	        if($edit_where){
                $this->edit($edit_where,['id'=>$item['id']]);
                return true;
            }
            return false;
        }else{
            return false;
        }
    }

    function get_cart($data){
	    if($data['type']=='')AjaxResult_error('类型错误');
	    $where = ['uid'=>$data['uid'],'type'=>$data['type']];
	    if(isset($data['order'])&&$data['type']==1){
	        //订单页面显示选中的产品
            $where['cart_sel'] = 1;
        }
	    $result = $this->getItems($where,'id,shop_id,shop_title,goods_title,goods_thumb,sku_opt,price,num,total,cart_sel');
        $news = $ck = [];
        $total = 0;
        $total_arr = [];//订单小计
        foreach ($result as $item) {
            if(isset($total_arr[$item['shop_id']])){
                $total_arr[$item['shop_id']] = bcadd($total_arr[$item['shop_id']],$item['total'],2);
            }else{
                $total_arr[$item['shop_id']] = $item['total'];
            }
            $news[$item['shop_id']]['shop_total'] = $total_arr[$item['shop_id']];
            $news[$item['shop_id']]['name'] = $item['shop_title'];
            if($item['cart_sel']){
                $total = bcadd($total,$item['total'],2);//应该支付的总价
            }
            $news[$item['shop_id']]['child'][] = [
                'id'=>$item['id'],
                'shop_title'=>$item['shop_title'],
                'goods_title'=>$item['goods_title'],
                'goods_thumb'=>$item['goods_thumb'],
                'sku_opt'=>$item['sku_opt'],
                'num'=>$item['num'],
                'price'=>$item['price'],
                'cart_sel'=>intval($item['cart_sel']),
                'total'=>$item['total']//单个产品总价 相加后是店铺所选产品的小计
            ];
	    }
        $is_ziti = 1;//是否全部自提 0代表全部自提，则不需要写地址
        $is_ziti_arr = [];

        if($news){
            $this->load->model(['shop/Shops']);
            foreach ($news as $key=>&$item) {
                list($shop,$is_zitis) = $this->Shops->send($key,$is_ziti,$item['shop_total']);
                $item['send_say'] = $shop['say'];
                $is_ziti_arr[] = $is_zitis;
                foreach ($item['child'] as $v){
                    $ck[$v['id']] = ['checked'=>$v['cart_sel']?true:false,'value'=>$v['id'],'total'=>floatval($v['total']),'num'=>intval($v['num'])];
                }
            }
        }
        $is_ziti = array_sum($is_ziti_arr);
	    return ['total'=>floatval($total),'goods'=>$news?$news:'','ck'=>$ck,'is_ziti'=>$is_ziti];
    }

    function get_cart_num(){
	    return $this->count(['type'=>1,'uid'=>$this->session->wechat_user_x['id']]);
    }
}