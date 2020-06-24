<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 模版消息
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
class Templates extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'template';
	}

	//新订单提醒
	function send_newsorder($shop_id){
        $item = $this->getItem(['id'=>18,'status'=>1]);
        if($item['tmpid']){
            $shop = $this->Shops->getItem(['id'=>$shop_id],'uid,title');
            $user = $this->Users->getItem(['id'=>$shop['uid']],'id,openid,system');
            if($user['system']==2){//小程序的话执行公众号的模版消息接收
                $this->load->model('user/UsersGzs');
                $gz = $this->UsersGzs->getItem(['uid'=>$user['id']],'openid');
                if(!$gz)return true;
                $user['openid'] = $gz['openid'];
            }
            $datas = [
                "touser"=>$user['openid'],
                "template_id"=>$item['tmpid'],
                "url"=> base_url('web'),
                'data'=>[
                    'first'=>'您的门店收到了新订单',
                    'keyword1'=>$shop['title'],
                    'keyword2'=>'普通订单',
                    'keyword3'=>format_time(time()),
                    'remark'=>'请及时处理（点击查看详情）。'
                ]
            ];
            $this->send($datas,$user['system']);
        }
    }

	//审核
	function send_sh($user){
        $item = $this->getItem(['id'=>17,'status'=>1]);
        if($user['system']==2){//小程序的话执行公众号的模版消息接收
            $this->load->model('user/UsersGzs');
            $gz = $this->UsersGzs->getItem(['uid'=>$user['id']],'openid');
            if(!$gz)return true;
            $user['openid'] = $gz['openid'];
        }
        if($item['tmpid']){
            $datas = [
                "touser"=>$user['openid'],
                "template_id"=>$item['tmpid'],
                "url"=> base_url('web'),
                'data'=>[
                    'first'=>$user['message'],
                    'keyword1'=>$user['nickname'],
                    'keyword2'=>$user['status_say'],
                    'keyword3'=>format_time(time()),
                    'remark'=>''
                ]
            ];
            $this->send($datas,$user['system']);
        }
    }

    function send_fh($user,$data){
	    //先通知合伙人
        if($data['send_type']!=0&&$data['send_id']>0){
            $this->send_fh_partner($data);
        }
        $item = $this->getItem(['id'=>15,'status'=>1]);
        if($user['system']==2){//小程序的话执行公众号的模版消息接收
            $this->load->model('user/UsersGzs');
            $gz = $this->UsersGzs->getItem(['uid'=>$user['id']],'openid');
            if(!$gz)return true;
            $user['openid'] = $gz['openid'];
        }
        if($item['tmpid']){
            $say = '';
            if($data['send_type']==0){
                $say = ',需要上门取货';
            }
            $datas = [
                "touser"=>$user['openid'],
                "template_id"=>$item['tmpid'],
                "url"=> base_url('web'),
                'data'=>[
                    'first'=>'您的订单已打包成功'.$say,
                    'keyword1'=>$data['order_no_main'],
                    'keyword2'=>format_time(time()),
                    'remark'=>'感谢您的惠顾！'
                ]
            ];
            $this->send($datas,$user['system']);
        }
    }
    //发货通知合伙人接单
    function send_fh_partner($data){
        $item = $this->getItem(['id'=>16,'status'=>1]);
        $this->load->model(['partner/Partners','shop/Shops']);
        $partner = $this->Partners->getItem(['id'=>$data['send_id'],'status'=>1],'uid');
        if(!$partner)AjaxResult_error('配送人异常或者休息，请更换');
        $shop = $this->Shops->getItem(['id'=>$data['shop_id']],'title');
        $users = $this->Users->getItem(['id'=>$partner['uid']],'id,openid,system');
        if(!$users)AjaxResult_error('无法通知配送人，请更换');
        if($users['system']==2){//小程序的话执行公众号的模版消息接收
            $this->load->model('user/UsersGzs');
            $gz = $this->UsersGzs->getItem(['uid'=>$users['id']],'openid');
            if(!$gz)return true;
            $users['openid'] = $gz['openid'];
        }
        $datas = [
            "touser"=>$users['openid'],
            "template_id"=>$item['tmpid'],
            "url"=> base_url('web'),
            'data'=>[
                'first'=>'您有新的待配送订单，请尽快处理。',
                'keyword1'=>$data['order_no_main'],
                'keyword2'=>$shop['title'],
                'keyword3'=>'进入系统查看',
                'keyword4'=>format_time($data['add_time']),
                'keyword5'=>$data['a_address'],
                'remark'=>'请及时给客户配送！'
            ]
        ];
        $this->send($datas,$users['system']);
    }

    function send($datas,$sid){
	    $config = '';
	    if($sid==1||$sid==2){
            $config = get_Cache('wechatConfig');
        }
        if($config){
            $configs = [
                'app_id'=>$config['appid'],
                'secret'=>$config['appsecret']
            ];
            $app = new Application($configs);
            $notice = $app->notice;
            $notice->send($datas);
        }
    }
}