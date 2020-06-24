<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 分类列表
 * @author chaituan@126.com
 */
class Config extends AdminCommon {
	
	function __construct(){
		parent::__construct();
		$this->load->model(array('admin/AdminConfig'=>'do','admin/AdminConfigTab'=>'dos'));
	}
	
   	function index(){
       $type = Gets('type')!=0?Gets('type'):0;//config_tab 表中的配置类型type
       $tab_id = Gets('tab_id');//config_tab_id config表中的分类id
       if(!$tab_id) $tab_id = 1;
       $data['tab_id'] = $tab_id;
       $list = $this->do->getAll($tab_id);//config 中的分类数据

       if($type==3){//其它分类
           $config_tab = null;
       }else{
           $config_tab = $this->do->getConfigTabAll($type);

           foreach ($config_tab as $kk=>$vv){
               $arr = $this->do->getAll($vv['value']);
               if(empty($arr)){
                   unset($config_tab[$kk]);
               }
           }
       }
       $data['config_tab'] = $config_tab;
       $data['list'] = $list;
       $this->load->view('admin/setting/config/index',$data);
   	}
   	
   	function save(){
   		if(is_ajax_request()){
   			$post = Posts();
   			foreach ($post as $k=>$v){
                if(is_array($v)){
                    $v = implode(',',$v);
                }
   				$this->do->edit(array('value'=>$v),array('menu_name'=>$k));
   			}
   			AjaxResult_ok();
   		}
   	}
   
	function childtab(){
	   	$data['tab_id'] = $tab_id = Gets('id');
	   	$list = $this->do->getItems(array('config_tab_id'=>$tab_id),'','sort');
	   	foreach ($list as $k=>$v){
	   		$list[$k]['value'] = $v['value']?:'';
	   		if($v['type'] == 'radio' || $v['type'] == 'checkbox'){
	   			$list[$k]['value'] =  $this->do->getRadioOrCheckboxValueInfo($v['menu_name'],$v['value']);
	   		}
	   	}
	   	$data['types'] = $this->typeall();
		$data['items'] = $list;
	   	$this->load->view('admin/setting/config/child',$data);
	}
	
	function typeall(){
		return [
		['value'=>'text','label'=>'文本框','disabled'=>1]
		,['value'=>'textarea','label'=>'多行文本框','disabled'=>1]
		,['value'=>'radio','label'=>'单选按钮','disabled'=>1]
		,['value'=>'upload','label'=>'文件上传','disabled'=>1]
		,['value'=>'checkbox','label'=>'多选按钮','disabled'=>1]
		];
	}
	
    /**
     * 基础配置  单个
     * @return mixed|void
     */
    public function index_alone(){
        $tab_id = input('tab_id');
        if(!$tab_id) return $this->failed('参数错误，请重新打开');
        $this->assign('tab_id',$tab_id);
        $list = ConfigModel::getAll($tab_id);
        foreach ($list as $k=>$v){
            if(!is_null(json_decode($v['value'])))
                $list[$k]['value'] = json_decode($v['value'],true);
            if($v['type'] == 'upload' && !empty($v['value'])){
                if($v['upload_type'] == 1 || $v['upload_type'] == 3) $list[$k]['value'] = explode(',',$v['value']);
            }
        }
        $this->assign('list',$list);
        return $this->fetch();
    }
    
    function add(){
    	if(is_ajax_request()){
    		$data = Posts('data');
            $cf = $this->do->getItem(['menu_name'=>$data['menu_name']]);
            if($cf)AjaxResult_error('变量已存在');
    		is_AjaxResult($this->do->add($data));
    	}else{
    		$data['config_tab_id'] = Gets('tab_id');
    		$data['type'] = Gets('type','num');
    		$data['typeval'] = $this->typeall()[$data['type']]['value'];
    		$this->load->view('admin/setting/config/add',$data);
    	}
    }

    function lock(){
        $id = Gets('id','num');
        $open = Gets('open','num');
        if(!$id)AjaxResult_error('失败！获取不到ID');
        $result = $this->do->edit(array('status'=>$open),array('id'=>$id));
        is_AjaxResult($result);
    }
    
    function del(){
    	$id = Gets('id');
    	is_AjaxResult($this->do->del(array('id'=>$id)));
    }
    
    function edit(){
    	if(is_ajax_request()){
    		$data = Posts('data');
    		$where['id'] = Posts('id');
    		is_AjaxResult($this->do->edit($data,$where));
    	}else{
    		$id = Gets('id');
    		$data['item'] = $this->do->getItem(array('id'=>$id));
    		$this->load->view('admin/setting/config/edit',$data);
    	}
    }
}
