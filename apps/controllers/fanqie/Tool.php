<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 工具
 * @author chaituan@126.com
 */
class Tool extends XcxCheckLoginCommon {

    function qiandao_post(){
        if(is_ajax_request()){//签到执行
            $this->load->model('user/Integrals','do');
            $user = $this->User;
            $uid = $user['id'];
            $t = format_time(time(),'Ymd');
            $item = $this->do->getItem("uid=$uid and type=1 and FROM_UNIXTIME(add_time,'%Y%m%d') = '$t'",'id','id desc');
            if($item)AjaxResult_error('今天已签到');
            $this->load->model(['admin/AdminConfig']);
            $num = $this->AdminConfig->getValue('qiandao');
            $data = array(
                'uid'=>$this->User['id'],
                'num'=>$num,
                'src'=>'每日签到',
                'ands'=>'+',
                'add_time'=>time(),
                'type'=>1
            );
            $items = $this->do->add($data);
            is_AjaxResult($items,'签到成功');
        }
    }

    function qiandao_get(){//签到明细
        if(is_ajax_request()){
            $uid = $this->User['id'];
            $this->load->model('user/Integrals','do');
            $t = format_time(time(),'Ym');
            $items = $this->do->getItems("uid=$uid and type=1 and FROM_UNIXTIME(add_time,'%Y%m') = '$t'",'','id desc');
            $item = $this->do->getItem(['uid'=>$uid,'type'=>1],'sum(num) as num');
            $total = $item['num']!=null?$item['num']:0;$status = false;
            $news = [];
            if($items){
                foreach ($items as $item) {
                    $news[] = ['date'=>format_time($item['add_time'],'Y-m-d')];
                    if(format_time($item['add_time'],'Y-m-d')==format_time(time(),'Y-m-d')){
                        $status = true;
                    }
                }
            }
            $this->load->model(['admin/AdminConfig']);
            $num = $this->AdminConfig->getValue('qiandao');
            AjaxResult_page(['total'=>$total,'status'=>$status,'num'=>$num,'selected'=>$news],format_time(time(),'Y-m-d'),true);
        }
    }

    function detail(){
        if(is_ajax_request()){
            $uid = $this->User['id'];
            $this->load->model(array('user/Integrals'=>'do'));
            $where = ['uid'=>$uid];
            $result = $this->do->getItems($where,"",'id desc');
            $sur = 0;$total=0;$xh = 0;$day = 0;
            if($result){
                foreach ($result as $v){
                    if($v['ands']=='+'){
                        $sur += $v['num'];
                    }else{
                        $sur -= $v['num'];
                    }
                    if($v['type']==4){
                        $xh += $v['num'];
                    }else{
                        $total += $v['num'];
                    }
                    if(date('d',$v['add_time'])==date('d',time())){
                        $day += $v['num'];
                    }
                }
                $results = result_format_time($result);
            }else{
                $results = '';
            }
            $mark = ['total'=>$total,'sur'=>$sur,'xh'=>$xh,'day'=>$day];
            AjaxResult_page($results,$mark,true);
        }
    }



}