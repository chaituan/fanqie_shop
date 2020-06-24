<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 积分
 * @author chaituan@126.com
 */
class Integral extends XcxCheckLoginCommon {

    function index_get(){
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
                        if(date('d',$v['add_time'])==date('d',time())){
                            $day += $v['num'];
                        }
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