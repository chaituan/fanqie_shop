<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 后台用户管理
 * @author chaituan@126.com
 */
class AdminUser extends MY_Model {
	
	private $admin_session_user = 'admin_fanqie_x_user';
	
	function __construct() {
		parent::__construct ();
		$this->table_name = 'system_admin';
	}
	// 登录后存session
	function set_LoginUser($data) {
		return $this->session->set_userdata ( $this->admin_session_user, $data );
	}
	// 取登录后的信息
	function get_LoginUser() {
		return $this->session->{$this->admin_session_user};
	}
	
	public function activeAdminAuthOrFail(){
		$adminInfo = $this->activeAdminInfoOrFail();
		return intval($adminInfo['level']) === 0 ? $this->AdminRole->getAllAuth() : $this->AdminRole->rolesByAuth($adminInfo['roles']);
	}

	/**
     * 获得登陆用户信息
     * @return mixed
     */
    public function activeAdminInfoOrFail() {
        $adminInfo = $this->get_LoginUser();
        if(!$adminInfo) AjaxResult_error('请登陆');
        if(!$adminInfo['status']) AjaxResult_error('该账号已被关闭!');
        return $adminInfo;
    }

	// 退出系统
	function logout() {
		$this->session->sess_destroy ();
		redirect (HTTP_HOST);
	}

    function tongji(){
        $this->load->model(['goods/Orders_lists','goods/Orders','user/Users','goods/Goodss','partner/Bills']);
        $order_day_num = $this->Orders->getItem('to_days(FROM_UNIXTIME(add_time)) = to_days(now())','count(id) as num')['num'];
        $user_day_num = $this->Users->getItem('to_days(FROM_UNIXTIME(add_time)) = to_days(now())','count(id) as num')['num'];
        $order_money = $this->Orders->getItem('','sum(pay_price)  as num')['num'];
        $goods_num = $this->Goodss->count();
        $fx_money = 0;
        $this->Bills->db->where_in('type',[1,4]);
        $partner_money = $this->Bills->getItem('','sum(money) as num')['num'];
        return [
            [
                'name'=>'今日订单',
                'field'=>'个',
                'count'=>$order_day_num,
                'content'=>'今天的订单总数',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$order_day_num,
                'class'=>'fa fa-line-chart',
                'col'=>2,
            ],
            [
                'name'=>'今日会员',
                'field'=>'个',
                'count'=>$user_day_num,
                'content'=>'今天的会员总数',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$user_day_num,
                'class'=>'fa fa-weixin',
                'col'=>2
            ],
            [
                'name'=>'订单金额',
                'field'=>'元',
                'count'=>$order_money,
                'content'=>'总订单金额',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$order_money,
                'class'=>'fa fa-jpy',
                'col'=>2
            ],
            [
                'name'=>'商品数量',
                'field'=>'个',
                'count'=>$goods_num,
                'content'=>'所有商品',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$goods_num,
                'class'=>'fa fa-balance-scale',
                'col'=>2
            ],
            [
                'name'=>'分销佣金',
                'field'=>'元',
                'count'=>$fx_money,
                'content'=>'分销总佣金',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$fx_money,
                'class'=>'fa fa-balance-scale',
                'col'=>2
            ],
            [
                'name'=>'合伙人佣金',
                'field'=>'元',
                'count'=>$partner_money,
                'content'=>'合伙人总佣金',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$partner_money,
                'class'=>'fa fa-balance-scale',
                'col'=>2
            ]
        ];
    }

    function tongji_shop($shop_id){
        $this->load->model(['goods/Orders_lists','goods/Orders','user/Users','goods/Goodss','partner/Bills']);
        $order_day_num = $this->Orders->getItem("to_days(FROM_UNIXTIME(add_time)) = to_days(now()) and shop_id=$shop_id",'count(id) as num')['num'];
        $order_money = $this->Orders->getItem("shop_id=$shop_id",'sum(pay_price)  as num')['num'];
        $goods_num = $this->Goodss->count("shop_id=$shop_id");
        return [
            [
                'name'=>'今日订单',
                'field'=>'个',
                'count'=>$order_day_num,
                'content'=>'今天的订单总数',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$order_day_num,
                'class'=>'fa fa-line-chart',
                'col'=>2,
            ],
            [
                'name'=>'订单金额',
                'field'=>'元',
                'count'=>$order_money?$order_money:0,
                'content'=>'总订单金额',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$order_money?$order_money:0,
                'class'=>'fa fa-jpy',
                'col'=>2
            ],
            [
                'name'=>'商品数量',
                'field'=>'个',
                'count'=>$goods_num,
                'content'=>'所有商品',
                'background_color'=>'layui-bg-cyan',
                'sum'=>$goods_num,
                'class'=>'fa fa-balance-scale',
                'col'=>2
            ]
        ];
    }

}