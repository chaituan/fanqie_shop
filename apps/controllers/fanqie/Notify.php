<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 异步通知
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
class Notify extends CI_Controller {

    function pay(){
        $this->load->model(['admin/AdminConfig','goods/Orders']);
        $config = get_Cache('wechatConfig');
        $configs = [
            'app_id'=>$config['appid'],
            'secret'=>$config['appsecret'],
            'payment' => [
                'merchant_id'=> $config['mchid'],
                'key'=> $config['key'],
                'notify_url'=> NOTIFY_URL
            ]
        ];
        $app = new Application($configs);
        $response = $app->payment->handleNotify(function ($wechat, $successful) {
            if($successful) {
                $wechat = json_decode($wechat, true);
                $oid = $wechat['out_trade_no'];
                $items = $this->Orders->getItems("status=1 and order_no = '$oid' ");
                if ($items) {
                    $idArr = array_column($items,'id');
                    $this->Orders->start();
                    $data['pay_time'] = strtotime($wechat['time_end']);
                    $data['pay_price'] = $wechat['total_fee'] / 100;
                    $data['status'] = 2;
                    $data['transaction_id'] = $wechat['transaction_id'];
                    $this->Orders->db->where_in('id',$idArr);
                    $this->Orders->edit($data);
                    $this->Orders->pay_finish($idArr);
                    $this->Orders->complete();
                } else {
                    return 'Order not exist.';
                }
            }
            return true;
        });
        $response->send();
        exit();
    }

	function cz(){
        $this->load->model(['user/UserBills']);
        $config = get_Cache('wechatConfig');
        $configs = [
            'app_id'=>$config['appid'],
            'secret'=>$config['appsecret'],
            'payment' => [
                'merchant_id'=> $config['mchid'],
                'key'=> $config['key'],
                'notify_url'=> NOTIFY_URL_CZ
            ]
        ];
        $app = new Application($configs);
        $response = $app->payment->handleNotify(function ($wechat, $successful) {
            if($successful) {
                $wechat = json_decode($wechat, true);
                $where['order_no'] = $wechat['out_trade_no'];
                $where['status'] = 0;
                $item = $this->UserBills->getItem($where);
                if ($item) {
                    $Bill['mark'] = '微信订单号' . $wechat['transaction_id'];
                    $Bill['status'] = 1;
                    $this->UserBills->start();
                    $this->UserBills->edit($Bill, ['id' => $item['id']]);
                    $this->UserBills->complete();
                } else {
                    return 'Order not exist.';
                }
            }
            return true;
        });
        $response->send();
		exit();
	}
    //退款
    function out(){
        $config = get_Cache('wechatConfig');
        $configs = [
            'app_id'=>$config['appid'],
            'secret'=>$config['appsecret'],
            'payment' => [
                'merchant_id'=> $config['mchid'],
                'key'=> $config['key'],
                'notify_url'=> NOTIFY_URL_OUT
            ]
        ];
        $app = new Application($configs);
        $response = $app->payment->handleNotify(function ($wechat, $successful) {
            if($successful) {
                $wechat = json_decode($wechat, true);
                $where['order_no'] = $wechat['out_trade_no'];
                set_Cache('testss',$where['order_no']);
            }
            return true;
        });
        $response->send();
        exit();
    }
    //积分商城邮费
    function points(){
        $this->load->model(['pointsmall/Orders']);
        $config = get_Cache('wechatConfig');
        $configs = [
            'app_id'=>$config['appid'],
            'secret'=>$config['appsecret'],
            'payment' => [
                'merchant_id'=> $config['mchid'],
                'key'=> $config['key'],
                'notify_url'=> NOTIFY_URL_POINTS
            ]
        ];
        $app = new Application($configs);
        $response = $app->payment->handleNotify(function ($wechat, $successful) {
            if($successful) {
                $wechat = json_decode($wechat, true);
                $where['order_no'] = $wechat['out_trade_no'];
                $where['status'] = 1;
                $item = $this->Orders->getItem($where);
                if ($item) {
                    $data['transaction_id'] = $wechat['transaction_id'];
                    $data['status'] = 2;
                    $this->Orders->start();
                    $this->Orders->edit($data, ['id' => $item['id']]);
                    $this->Orders->pay_finish($item);
                    $this->Orders->complete();
                } else {
                    return 'Order not exist.';
                }
            }
            return true;
        });
        $response->send();
        exit();
    }
}