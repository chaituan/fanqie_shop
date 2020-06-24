<?php
if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 翻牌记录
 * @author chaituan@126.com
 */
class FanpaiDetails extends MY_Model {
	function __construct() {
		parent::__construct ();
		$this->table_name = 'fanpai_detail';
	}	
	
	//开始抽奖
	function fp(){
	    $this->load->model('admin/AdminConfig');
	    $fanpai = $this->AdminConfig->getAllConfig(19);
		$proArr = array(
				array('id'=>1,'odds'=>$fanpai['fanpai_p1'],'name'=>'p1'),
				array('id'=>2,'odds'=>$fanpai['fanpai_p2'],'name'=>'p2'),
				array('id'=>3,'odds'=>$fanpai['fanpai_p3'],'name'=>'p3'),
				array('id'=>4,'odds'=>$fanpai['fanpai_p4'],'name'=>'p4'),
				array('id'=>5,'odds'=>$fanpai['fanpai_p5'],'name'=>'p5'),
				array('id'=>6,'odds'=>$fanpai['fanpai_p6'],'name'=>'p6'),
		);
		foreach ($proArr as $key => $val) {
			$arr[$val['id']] = $val['odds'];
			$news[$val['id']] = $val;
		}
		$result = '';
		//概率数组的总概率精度
		$proSum = array_sum($arr);
		//概率数组循环
		foreach ($arr as $key => $proCur) {
			$randNum = mt_rand(1, $proSum);
			if ($randNum <= $proCur) {
				$result = $key;
				break;
			} else {
				$proSum -= $proCur;
			}
		}
		unset ($proArr);
		return $news[$result];
	}
}