<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * @author chaituan@126.com
 */
class User extends XcxCheckLoginCommon {

    //店铺申请
    function shop_apply_post(){
        if (is_ajax_request()){
            $post = Posts();
            $post['add_time'] = time();
            $this->load->model(['shop/Shops'=>'do']);

            $this->do->db->or_where('mobile',$post['mobile']);
            $this->do->db->or_where('uid',$this->User['id']);
            $this->do->db->or_where('account',$post['mobile']);
            $shop = $this->do->getItem('','uid');
            if($shop)AjaxResult_error('手机号或店铺已存在，请更换');
            $apply = $this->AdminConfig->getValue('apply');
            $post['status'] = $apply;
            $post['uid'] = $this->User['id'];
            $address_detail = cut_map($post['address']);
            $post['province'] = $address_detail['province'];
            $post['city'] = $address_detail['city'];
            $post['district'] = $address_detail['district'];

            $pwds = mt_rand();
            $pwd = set_password($pwds);
            $post['password'] = $pwd['password'];
            $post['encrypt'] = $pwd['encrypt'];
            $post['account'] = $mobile = $post['mobile'];
            $result = $this->do->add($post);
            if(!$apply){
                $this->load->model(['user/Templates','user/Users']);
                $admin_id = $this->AdminConfig->getValue('admin_id');
                if($admin_id){
                    $item = $this->Users->getItem(['id'=>$admin_id],'id,openid,system');
                    if($item){
                        $item['message'] = "用户申请入住商家，请及时在后台处理";
                        $item['status_say'] = "待审核";
                        $item['nickname'] = $post['title'];
                        $this->Templates->send_sh($item);
                    }
                }
            }
            if($result){
                //发送消息
                $content = "PC端登录帐号：$mobile ； 密码：$pwds ；请及时修改";
                $this->load->model('user/Messages');
                $m_data = ['uid'=>$this->User['id'],'content'=>$content,'cid'=>0,'nickname'=>'系统消息','add_time'=>time()];
                $this->Messages->add($m_data);
            }
            is_AjaxResult($result,$apply?'开通成功':'等待审核');
        }
    }

    //合伙人申请
    function partner_apply_post(){
        if (is_ajax_request()){
            $post = Posts();
            $post['add_time'] = time();
            $this->load->model(['partner/Partners'=>'do','admin/AdminConfig']);
            $this->do->db->or_where('uid',$this->User['id']);
            $this->do->db->or_where('mobile',$post['mobile']);
            $partner = $this->do->getItem('','id');
            if($partner)AjaxResult_error('手机号或帐号已存在，请更换');
            $apply = $this->AdminConfig->getValue('papply');
            $post['status'] = $apply;
            $post['uid'] = $this->User['id'];
            $post['send_time'] = '次日送达';
            $result = $this->do->add($post);
            if(!$apply){
                $this->load->model(['user/Templates','user/Users']);
                $admin_id = $this->AdminConfig->getValue('admin_id');
                if($admin_id){
                    $item = $this->Users->getItem(['id'=>$admin_id],'id,openid,system');
                    if($item){
                        $item['message'] = "用户申请加入合伙人，请及时在后台处理";
                        $item['status_say'] = "待审核";
                        $item['nickname'] = $post['username'];
                        $this->Templates->send_sh($item);
                    }
                }
            }

            is_AjaxResult($result,$apply?'开通成功':'等待审核');
        }
    }

    //分销申请
    function fx_apply_post(){
        if (is_ajax_request()){
            $this->load->model(["user/Users"=>'do']);
            $uid = $this->User['id'];
            $result = $this->do->fx_check($uid,true);
            AjaxResult_ok($result);
        }
    }

    //获取用户信息
    function index_get(){
        if(is_ajax_request()){
            $user = $this->User;
            $data['user'] = ['id'=>$user['id'],'nickname'=>$user['nickname'],'avatar'=>$user['avatar'],'mobile'=>$user['mobile']];
            $config = $this->Fx_config;
            $data['fxconfig'] = ['p_name'=>$config['menu_name'],'p_one_name'=>$config['p1_name'],'p_two_name'=>$config['p2_name'],'sxf'=>$config['fx_sxf'],'lowest'=>$config['fx_lowest']];;
            $data['shop_is_open'] = $this->AdminConfig->getValue('shop_is_open');
            AjaxResult_page($data);
        }
    }
    //编辑用户
    function index_put(){
        if(is_ajax_request()){
            $uid = $this->User['id'];
            $this->load->model(['user/Users']);
            $post = Del_Put();
            $result = $this->Users->updates_se(['nickname'=>$post['nickname'],'mobile'=>$post['mobile']],['id'=>$uid]);
            is_AjaxResult($result);
        }
    }
    //关于我们
    function about_get(){
        if(is_ajax_request()){
            $id = $this->AdminConfig->getValue('about');
            $this->load->model('news/Articles');
            $item = $this->Articles->getItem(['id'=>$id],'content');
            AjaxResult_page($item);
        }
    }

    //意见反馈
    function feedback_post(){
        if(is_ajax_request()){
            $data = Posts();
            $data['add_time'] = time();
            $data['uid'] = $this->User['id'];
            $data['nickname'] = $this->User['nickname'];
            $this->load->model('user/Feedbacks');
            $result = $this->Feedbacks->add($data);
            is_AjaxResult($result);
        }
    }
    //消息接受
    function gz_get(){
        if(is_ajax_request()){
            $img = $this->AdminConfig->getValue('qr_code');
            AjaxResult_page($img,'',true);
        }
    }
    //消息接收 用于小程序
    function gz_xcx_get(){
        if(is_ajax_request()){
            $this->load->model(['user/UsersGzs']);
            $data['img'] = $this->AdminConfig->getValue('qr_code');
            $gz = $this->UsersGzs->getItem(['uid'=>$this->User['id']],'id');
            $data['gz'] = $gz?$gz['id']:'';
            AjaxResult_page($data,'',true);
        }
    }
}
