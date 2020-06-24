<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 分类控制器
 * @author chaituan@126.com
 */

class AdminConfig extends MY_Model {

    function __construct(){
        parent::__construct ();
        $this->table_name = 'system_config';
    }

    function get_payout_type(){
        $config = $this->getValue('payout_type');
        if(!$config)AjaxResult_error('管理员未设置提现方式');
        $type = [['id'=>1,'name'=>'微信零钱'],['id'=>2,'name'=>'支付宝'],['id'=>3,'name'=>'银行卡'],['id'=>4,'name'=>'微信私下转']];
        $news = [];
        foreach ($type as $k=>$v){
            if(in_array($v['id'],explode(',',$config))){
                $news[] = $v;
            }
        }
        if(!$news)AjaxResult_error('提现方式错误');
        return $news;
    }

    function getAllConfig($gid='',$key='') {
        $where = [];
        if($gid){//根据分类id查询，如果不输入则查询全部
            $where['config_tab_id'] = $gid;
        }
        $list = $this->getItems($where,'value,menu_name');
        $list = array_column($list,'value','menu_name');
        if($key){//查询数组中的某几个对应的键值
            $lists = [];
            foreach ($list as $k =>$v){
                if(in_array($k,$key)){
                    $lists[$k] = $v;
                }
            }
            $list = $lists;
        }
        return $list;
    }

    function getValue($key){
        $where['menu_name'] = $key;
        $result = $this->getItem($where,'value');
        return $result['value'];
    }

    //获取当前分类的所有数据
    function getAll($id){
        $where['config_tab_id'] = $id;
        $where['status'] = 1;
        return $this->getItems($where,'','sort');
    }

    //获取所有配置分类
    function getConfigTabAll($type=0){
        $configAll = $this->dos->getAll($type);
        $config_tab = array();
        foreach ($configAll as $k=>$v){
            if(!$v['info']){
                $config_tab[$k]['value'] = $v['id'];
                $config_tab[$k]['label'] = $v['title'];
                $config_tab[$k]['icon'] = $v['icon'];
                $config_tab[$k]['type'] = $v['type'];
            }
        }
        return $config_tab;
    }

    /**
     * 获取单选按钮或者多选按钮的显示值
     * */
    function getRadioOrCheckboxValueInfo($menu_name,$value){
        $parameter = array();
        $option = array();
        $config_one = $this->getOneConfig('menu_name',$menu_name);
        $parameter = explode("+",$config_one['parameter']);
        foreach ($parameter as $k=>$v){
            if(isset($v) && strlen($v)>0){
                $data = explode('|',$v);
                $option[$data[0]] = $data[1];
            }
        }
        $str = '';
        if(is_array($value)){
            foreach ($value as $v){
                $str .= $option[$v].',';
            }
        }else{
            if($option){
                $str .= $value;
            }
        }
        return $str;
    }

    function getOneConfig($filed,$value){
        $where[$filed] = $value;
        return $this->getItem($where);
    }

}