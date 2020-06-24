<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 用户管理
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
class Users extends MY_Model {

    const sess = 'wechat_user_x';
    protected $field;
    function __construct() {
        parent::__construct ();
        $this->table_name = 'user';
        $this->field = array(
            'id'=>'','account'=>'','pwd'=>'','nickname'=>'','avatar'=>'','mobile'=>'','add_time'=>'','add_ip'=>'','last_time'=>'','last_ip'=>'',
            'now_money'=>0,'integral'=>0,'status'=>0,'level'=>0,'user_type'=>'','is_fx'=>0,'pay_count'=>'','unionid'=>'','openid'=>'',
            'sex'=>0,'city'=>'','province'=>'','country'=>'','remark'=>'','role'=>0,'subscribe'=>'','subscribe_time'=>'','p_1'=>'','p_2'=>'','session_key'=>''
        );
    }
    // 登录后存session
    function set_LoginUser($data) {
        unset($data['pwd']);
        return $this->session->set_userdata(self::sess,$data);
    }

    // 取登录后的信息
    function get_LoginUser() {
        return $this->session->{self::sess};
    }

    function del_result($data){
        unset($data['account'],$data['pwd'],$data['p_1'],$data['p_2'],$data['unionid'],$data['openid'],$data['add_time'],$data['add_ip'],$data['add_ip']);
        return $data;
    }

    function wechat_login($user,$fid=0){
        $data = array (
            'nickname'=>$user['nickname'],
            'avatar' => $user['headimgurl'],
            'openid' => $user['openid'],
            'sex' => $user['sex'],
            'subscribe'=>isset($user['subscribe'])?$user['subscribe']:'','subscribe_time'=>isset($user['subscribe_time'])?$user['subscribe_time']:'',
            'city'=>$user['city'],'province'=>$user['province'],'country'=>$user['country'],
            'user_type'=>'公众号',
            'add_ip'=>$this->input->ip_address(),
            'last_ip'=>$this->input->ip_address(),
            'add_time' =>time(),'last_time' =>time()
        );
        $this->start();

        $user = $this->getItem(array('openid'=>$data['openid']));
        if($user){
            $this->set_LoginUser($user);
            return $this->del_result($user);
        }else{
            if($fid){
                $fx = $this->getItem(array('id'=>$fid,'is_fx'=>1),'id,p_1');
                if($fx){
                    $data['p_1'] = $fx['id'];
                    $data['p_2'] = $fx['p_1'];
                }
            }
            $data['id'] = $this->add($data);
            $this->fx_check($data['id']);
            $this->complete();
            $datas = array_merge($this->field,$data);
            $this->set_LoginUser($datas);
            return $this->del_result($datas);
        }
    }

    //注册
    function xcx_login($res,$post){
        $info = json_decode($post['info'],true);
        $data = array (
            'nickname'=>$info['nickName'],
            'avatar' => $info['avatarUrl'],
            'openid' => $res['openid'],
            'sex' => $info['gender'],
            'system'=>2,
            'city'=>$info['city'],'province'=>$info['province'],'country'=>$info['country'],
            'user_type'=>'小程序',
            'add_ip'=>$this->input->ip_address(),
            'last_ip'=>$this->input->ip_address(),
            'add_time' =>time(),'last_time' => time()
        );
        $user = $this->getItem(array('openid'=>$data['openid']));
        if($user){
            $this->set_LoginUser($user);
            return $this->del_result($user);
        }else{
            if($post['fid']){//分销id
                $fx = $this->getItem(array('id'=>$post['fid'],'is_fx'=>1),'id,p_1');//上级是否是分销会员
                if($fx){
                    $data['p_1'] = $fx['id'];
                    $data['p_2'] = $fx['p_1'];
                }
            }
            $data['id'] = $this->add($data);
            $this->fx_check($data['id']);
            $this->complete();
            $datas = array_merge($this->field,$data);
            $this->set_LoginUser($datas);
            return $this->del_result($datas);
        }
    }


    // 获取用户信息通过id或者openid
    function get_user($key, $value) {
        $where[$key] = $value;
        $item = $this->getItem($where);
        return $this->del_result($item);
    }

    // 更新用户的session 根据id或者openid
    function update_usersession($key, $value) {
        $item = self::get_user ( $key, $value );
        self::set_LoginUser ( $item );
        return $item;
    }

    function get_openid($key){
        $user = $this->get_LoginUser();
        if(!$user||!$key)AjaxResult_error('获取openid出错');
        $item = $this->getItem(['id'=>$user['id']],'openid');
        return $item[$key];
    }

    //使用数组更新session
    function up_user_session($data){
        $user = self::get_LoginUser();
        foreach ($user as $key=>$v){
            if(array_key_exists($key, $data)){
                $new[$key] = $data[$key];
            }else{
                $new[$key] = $v;
            }
        }
        self::set_LoginUser($new);
        return $new;
    }
    //更新数据库和session
    function updates_se($data,$where){
        $this->edit($data, $where);
        $r = $this->up_user_session($data);
        return $r;
    }

    function fx_check($uid,$sd = false){
        $user = $this->getItem(['id'=>$uid],'is_fx,nickname');
        if($user['is_fx']==0){
            $this->load->model(['admin/AdminConfig']);
            $config = $this->AdminConfig->getAllConfig(9);
            $apply_status = $config['fapply'];//申请方式
            $check = $config['check'];//申请后是否需要后台审核
            $status = 0;
            if($apply_status==1){
                $status = $check==1?1:2;
            }elseif($apply_status==2&&$sd){
                //手动申请，这里不能直接操作，需要从前端请求过来
                $status = $check==1?1:2;
            }elseif($apply_status==3){
                $this->load->model(array('goods/Orders'));
                $num = $this->Orders->count(['uid'=>$uid]);
                if($config['shop_num'] <= $num){
                    $status = $check==1?1:2;
                }
            }elseif($apply_status==4){
                $this->load->model(array('goods/Orders'));
                $order = $this->Orders->getItem(['uid'=>$uid,'status'=>2],'sum(pay_price) as tt');
                if($config['shop_money'] <= $order['tt']){
                    $status = $check==1?1:2;
                }
            }elseif($apply_status==5){
                $this->load->model(array('goods/Orders_lists','goods/Orders'));
                $order_lists = $this->Orders_lists->getItem(['uid'=>$uid,'goods_id'=>$config['goods_id']],'order_id');
                if($order_lists){
                    $order = $this->Orders->getItem(['id'=>$order_lists['order_id'],'status'=>2],'id');
                    if($order){
                        $status = $check==1?2:1;
                    }
                }
            }
            if($status){
                $this->edit(['is_fx'=>$status],['id'=>$uid]);
                if($status==2){
                    $this->load->model(['user/Templates']);
                    $config = $config['menu_name'];
                    $admin_id = $this->AdminConfig->getValue('admin_id');
                    if($admin_id){
                        $item = $this->getItem(['id'=>$admin_id],'id,openid,system');
                        if($item){
                            $item['message'] = "用户申请加入【{$config}】，请及时在后台审核";
                            $item['status_say'] = "待审核";
                            $item['nickname'] = $user['nickname'];
                            $this->Templates->send_sh($item);
                        }
                    }
                }
                return $status == 1?'申请已通过':'审核中，请耐心等待';
            }
        }
    }
    //分销显示
    function fx_view(&$goods,$config){
        $user = $this->get_LoginUser();
        $result = $this->getItem(['id'=>$user['id']],'is_fx');
        $yj_say = (strstr($goods['yj_money'],'%')?$goods['yj_money']:$goods['yj_money']);
        $say = '';
        if($result['is_fx']==1){
            if($goods['p_1']){
                $say .= '分享佣金：'.$goods['p_1'];
            }
            if($goods['p_2']){
                $say .= ' ~ '.$goods['p_2'];
            }
            if(!$say)$say = '该商品无返佣';
        }else{
            $say = '加入'.$config['menu_name'].'，可赚更多佣金';
        }
        unset($goods['yj_money'],$goods['p_1'],$goods['p_2']);
        return ['yj_say'=>$yj_say,'fx_say'=>$say];
    }


    function get_integral($uid){
        $this->load->model(['admin/AdminConfig']);
        $user = $this->Users->getItem(['id'=>$uid],'integral');
        $jf = $user['integral'];
        if($jf<=0)AjaxResult(3,'抱歉你的积分为0');
        $bili = $this->AdminConfig->getValue('integral_ratio');
        if($bili<=0)AjaxResult(3,'请联系管理员设置兑换比例');
        $rmb = $jf * $bili;
        $data['integral_money'] = $rmb;
        $data['integral'] = $jf;
        return [$data,"您的剩余积分为【{$jf}】 \r\n 可兑换【{$rmb}】 \r\n 请确认是否使用"];
    }

    function getQrcode($scene,$page,$filename){
        $img = "/res/upload/qrcode/$filename.jpg";
        if(!is_file(substr($img,1))){
            $config = get_Cache('wxappConfig');
            $configs = [
                'mini_program'=>[
                    'app_id'=>$config['appid'],
                    'secret'=>$config['appsecret']
                ]
            ];
            $app = new Application($configs);
            $result = $app->mini_program->qrcode->getAppCodeUnlimit($scene,$page);
            if(is_array($result))AjaxResult_error($result['errcode'].$result['errmsg']);
            $imgs = FCPATH.$img;
            file_put_contents($imgs, $result);
        }
        return base_url($img);
    }
    // 退出系统
    function logout() {
        $this->session->sess_destroy ();
        redirect(site_url('wechat/tips/logout'));
    }

}