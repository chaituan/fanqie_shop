<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 区域管理
 * @author chaituan@126.com
 */
class Shops extends MY_Model {
    protected $sname = 'shop_x';
    function __construct() {
        parent::__construct ();
        $this->table_name = 'shop';
    }

    // 登录后存session
    function set_LoginUser($data) {
        unset($data['password'],$data['encrypt']);//销毁重要数据
        return $this->session->set_userdata($this->sname,$data);
    }
    // 取登录后的信息
    function get_LoginUser() {
        return $this->session->{$this->sname};
    }

    function updete_session(){
        $user = $this->get_LoginUser();
        $item = $this->getItem(['id'=>$user['id']]);
        $this->set_LoginUser($item);
    }

    function updates_se($data,$id){
        $result = $this->edit($data,array('id'=>$id));
        $item = $this->getItem(array('id'=>$id));
        $this->set_LoginUser($item);
        return $result;
    }

    // 退出系统
    function logout() {
        $this->session->unset_userdata($this->sname);
        redirect(site_url('shop/login/index'));
    }

    //邮费计算 用于购物车
    function send($shop_id,$is_ziti,$total){
        $type = ['包配送','满{$num}配送','包配送','满{$num}配送','需用户自提'];
        $shop = $this->getItem(['id'=>$shop_id],'send_type,send_id,buy_money,send_name,send_mobile,send_money,send_time,title,address');
        $shop['send_type'] = $shop['send_type']!=''?$shop['send_type']:0;

        if($shop['send_type']==1||$shop['send_type']==3){
            if($shop['buy_money']<=$total){
                $shop['say'] = str_replace('{$num}',$shop['buy_money'],$type[$shop['send_type']]).'，已满足';
            }else{
                $shop['say'] = str_replace('{$num}',$shop['buy_money'],$type[$shop['send_type']]).'，需凑单';
                $is_ziti = 0;
            }
        }else if($shop['send_type']==0||$shop['send_type']==2){
            $shop['say'] = $type[$shop['send_type']];
        }else{
            $shop['say'] = $type[$shop['send_type']];
            $is_ziti = 0;
        }
        return [$shop,$is_ziti];
    }
    //获取商家运费 ，用于订单
    function get_send($shop_id){

        $shop = $this->getItem(['id'=>$shop_id],'send_type,buy_money');
    }
    //首页附近店铺
    function dw_index($get,$pages){
        $longitude = $get['longitude'];
        $latitude = $get['latitude'];
        $lid = $get['location_id'];
        $where['status'] = 1;
        $where['location_id'] = $lid;
        $result = $this->getItems($where,"title,logo,address,id,longitude,latitude,info",'',$pages,10);
        foreach ($result  as &$item){
            $metre = get_metre($longitude,$latitude,$item['longitude'],$item['latitude']);
            $item['metre'] = $metre.'km';
            $item['sort'] = $metre;
            $item['system'] = '';
        }
        array_multisort(array_column($result,'sort'),SORT_ASC,$result);
        return $result;
    }

}