<?php
if (!defined('BASEPATH')) exit ('No direct script access allowed');

/**
 * 移动端公共类
 * @author chaituan@126.com
 */
class ShopCommon extends CI_Controller
{
    protected $loginUser; // 管理员信息
    protected $iswechat;
    protected $qqmap_key;
    function __construct()
    {
        parent::__construct();
        parseURL($this->uri->segment(4));
        $this->load->model(array('shop/Shops','admin/AdminConfig')); // 加载数据模型
        $this->loginUser = $this->Shops->get_LoginUser();
        if (!$this->loginUser) {
            showmessage('登录超时,返回重新登录', 'error', 'shop/login/index', '', false);
        } else {
            $this->load->vars('loginUser', $this->loginUser);
        }

        $m = Gets('m');
        if($m){
            $this->session->set_userdata('m',$m);
        }else{
            $m = $this->session->m;
        }
        $this->load->vars('shop_id', $this->loginUser['id']);
        $this->qqmap_key = $this->AdminConfig->getValue('qqmap_key');
        $this->load->vars('qqmap_key', $this->qqmap_key);
        $this->load->vars('menuList',$this->menu($m));
        $url = $this->router->directory.$this->router->class.'/';
        $this->load->vars('add_url', site_url($url.'add'));
        $this->load->vars('edit_url', site_url($url.'edit'));
        $this->load->vars('index_url', site_url($url.'index'));
        $this->load->vars ('dr_url', site_url($this->router->directory.$this->router->class));//首页常用链接
        $this->load->vars('emptyRecord', 'O(∩_∩)O~ 抱歉，暂无记录！');
    }

    function menu($sel)
    {
        $m = [[
            "icon" => "laptop",
            "menu_name" => "系统功能",
            "is_show" => 1,
            "child" => [
                [ "id" => 1,"is_show"=>$sel==1?1:0,"menu_name" => "商品管理","url" => site_url('shop/goods/index/m-1') ],
                ["id" => 2,"is_show"=>$sel==2?1:0,"menu_name" => "订单管理","url" => site_url('shop/order/index/m-2') ],
                ["id" => 3,"is_show"=>$sel==3?1:0,"menu_name" => "资金流水","url" => site_url('shop/detail/index/m-3') ],
                ["id" => 4,"is_show"=>$sel==4?1:0,"menu_name" => "我要提现","url" => site_url('shop/outpay/index/m-4') ],
                ["id" => 5,"is_show"=>$sel==5?1:0,"menu_name" => "配送设置","url" => site_url('shop/manager/send/m-5') ],
                ["id" => 6,"is_show"=>$sel==6?1:0,"menu_name" => "店铺设置","url" => site_url('shop/manager/set/m-6') ]
            ]
        ]];
        return $m;
    }
}

