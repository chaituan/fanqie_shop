<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 消息
 * @author chaituan@126.com
 */
class Message extends XcxCheckLoginCommon {

    function index_get(){
        if(is_ajax_request()){
            $this->load->model('user/Messages');
            $items = $this->Messages->getItems(['uid'=>$this->User['id']],'','id desc');
            foreach ($items as &$v){
                $v['add_time'] = time_ago($v['add_time']);
            }
            AjaxResult_page($items,'',true);
        }
    }

    function notify_get(){
        if(is_ajax_request()){
            $this->load->model('user/Messages');
            $item = $this->Messages->getItem(['uid'=>$this->User['id'],'status'=>1]);
            AjaxResult_page($item?1:0,'',true);
        }
    }

    function detail_get(){
        if(is_ajax_request()){
            $id = Gets('id');
            $this->load->model('user/Messages');
            $item = $this->Messages->getItem(['id'=>$id,'uid'=>$this->User['id']]);
            $this->Messages->edit(['status'=>0],['id'=>$id,'uid'=>$this->User['id']]);
            $item['add_time'] = time_ago($item['add_time']);
            AjaxResult_page($item);
        }
    }

    function index_delete(){
        if(is_ajax_request()){
            $id = Del_Put('id');
            $this->load->model('user/Messages');
            $item = $this->Messages->del(['id'=>$id,'uid'=>$this->User['id']]);
            AjaxResult_page($item);
        }
    }

    function send_post(){
        if(is_ajax_request()){
            $data['uid'] = Posts('uid');
            $data['content'] = Posts('content');
            $data['cid'] = $this->User['id'];
            if($data['uid']==$data['cid'])AjaxResult('不能给自己发');
            $data['nickname'] = $this->User['nickname'];
            $data['thumb'] = $this->User['avatar'];
            $data['add_time'] = time();
            $this->load->model('user/Messages');
            $id = $this->Messages->add($data);
            is_AjaxResult($id,'发送成功','发送失败');
        }
    }



}