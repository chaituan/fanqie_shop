<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 合伙人管理
 * @author chaituan@126.com
 */

class Partner extends XcxCheckLoginCommon {
    protected $p_config = [];
    protected $partner = '';
    function __construct(){
        parent::__construct();
        $this->load->model(array('partner/Partners'=>'do','admin/AdminConfig'));
        $this->p_config = $this->AdminConfig->getAllConfig(21);
        $shop_verify_newsid = $this->p_config['pverify_newsid'];
        $this->partner = $item = $this->do->getItem(['uid'=>$this->User['id']],'id,username,mobile,location_id,status,send_status,info,send_time');
        if($item){
            if($item['status']==0){
                AjaxResult(9,'您的申请，还在审核中...');
            }
        }else{
            AjaxResult(8,'抱歉您还不是合伙人，马上去申请',$shop_verify_newsid);
        }
    }

    function index_get(){
        if(is_ajax_request()){
            $item = $this->partner;
            $data['my'] = $item;
            $this->load->model(['partner/Bills']);
            list($z_money,$s_money,$p_money) = $this->Bills->income($item['id']);
            $data['income'] = ['z_money'=>$z_money,'s_money'=>$s_money,'p_money'=>$p_money];
            AjaxResult_page($data);
        }
    }

    function info_get(){
        if(is_ajax_request()){
            $d = $this->partner;
            $data = ['info'=>$d['info'],'mobile'=>$d['mobile'],'username'=>$d['username'],'send_time'=>$d['send_time']];
            AjaxResult_page($data);
        }
    }

    //编辑资料
    function index_put(){
        if(is_ajax_request()){
            $data = Del_Put();
            $res = $this->do->edit($data,['id'=>$this->partner['id']]);
            AjaxResult_page($res);
        }
    }

    //获取H5二维码的链接
    function get_qrcode_get(){
        if(is_ajax_request()){
            $uid = $this->partner['id'];
            $newsid = $this->AdminConfig->getValue('verify_newsid');
            $url = base_url("web/#/pages/shop/info?id=$newsid&pid=$uid");
            AjaxResult_page($url);
        }
    }

    //获取提现详情
    function withdraw_get(){
        if(is_ajax_request()){
            $uid = $this->partner['id'];
            $this->load->model(['partner/Bills']);
            $data['type'] = $this->AdminConfig->get_payout_type();
            $data['field'] = [
                'payout_type'=>'',
                'uid'=>$uid,
                'weixin'=>'',
                'alipay'=>'',
                'bank_name'=>'',
                'bank_no'=>'',
                'username'=>'',
                'money'=>''
            ];
            $money = $this->Bills->surplus($uid);
            $data['total'] = $money;
            $data['config'] = ['lowest'=>$this->p_config['p_lowest'],'sxf'=>$this->p_config['p_sxf']];
            AjaxResult(1,'',$data);
        }
    }
    //提现
    function withdraw_post(){
        if(is_ajax_request()){
            $post = Posts();
            $this->load->model(['partner/Bills']);
            $uid = $this->partner['id'];
            $data['payout_type'] = $post['payout_type'];
            $money = $post['money'];
            unset($post['payout_type'],$post['money'],$post['uid']);
            $data['payout_data'] = json_encode($post);
            $result = $this->Bills->sub($uid,$money,$this->p_config,$data);
            is_AjaxResult($result,'提交成功，等待审核');
        }
    }


    //获取明细
    function detail_get(){
        if(is_ajax_request()){
            $uid = $this->partner['id'];
            $this->load->model(array('partner/Bills'));
            $result = $this->Bills->getItems(['uid'=>$uid],"",'id desc');
            if($result){
                foreach ($result as $v){
                    if($v['type']==2){
                        if($v['status']==0){
                            $status = ['color'=>'bg-orange','say'=>'审核中'];
                        }elseif ($v['status']==1){
                            $status = ['color'=>'bg-green','say'=>'提现成功'];
                        }elseif ($v['status']==2){
                            $status = ['color'=>'bg-red','say'=>'提现被拒绝:'.$v['mark']];
                        }
                    }else{
                        $status = ['color'=>'bg-green','say'=>$v['type']==1?'商家分成':'配送收入'];
                    }
                    $v['status'] = $status;
                    $v['add_time'] = format_time($v['add_time'],'Y-m-d H:i');
                    $results[] = $v;
                }
            }else{
                $results = '';
            }
            AjaxResult_page($results);
        }
    }
    //获取邀请的商家列表
    function shop_get(){
        if(is_ajax_request()){
            $this->load->model('shop/Shops');
            $items = $this->Shops->getItems(['partner_id'=>$this->partner['id']],'id,logo,title,address,mobile,status','status asc , id desc');
            AjaxResult_page($items,'',true);
        }
    }
    //合伙人审核店铺
    function shop_apply_put(){
        if(is_ajax_request()){
            $shop_id = Del_Put('shop_id');
            $this->load->model('shop/Shops');
            $items = $this->Shops->edit(['status'=>1],['id'=>$shop_id]);
            AjaxResult_page($items,'',true);
        }
    }
    //配送列表
    function send_get(){
        if(is_ajax_request()){
            $this->load->model('goods/Orders');
            $items = $this->Orders->partner_send_lists($this->partner['id']);
            AjaxResult_page($items,'',true);
        }
    }

    function send_detail_get(){
        if(is_ajax_request()){
            $id = Gets('id');
            $this->load->model(array('goods/Orders','goods/Orders_lists'));
            $where['id'] = $id;
            $item = $this->Orders->getItem($where);
            $items = $this->Orders_lists->getItems(['order_id'=>$item['id']]);
            if(!$item)AjaxResult_error('数据错误');
            if($item['status']==3){
                $say = '请及时配送...';
            }
            $item['status_say'] = $say;
            $item['add_time'] = format_time($item['add_time'],'Y-m-d H:i');
            $item['child'] = $items;
            $this->load->model(['shop/Shops']);
            $shop = $this->Shops->getItem(['id'=>$item['shop_id']],'title,mobile,address');
            $item['shop'] = $shop;
            AjaxResult_page($item);
        }
    }

}
