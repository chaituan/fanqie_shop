<?php if (!defined('BASEPATH')) exit ('No direct script access allowed');

/**
 * 封装数据库类
 * @author chaituan@126.com
 */
class MY_Model extends CI_Model{
    // 表名字
    protected $table_name = '';
    public $pagemenu = '';
    public $count = 0;

    public function __construct()
    {//手动加载 database，如果改为自动可取消 初始化
        $this->load->database();
    }

    /**
     * 获取单条数据
     * @param string|array $conditions 查询条件
     * @param string|array $fields 查询字段
     * @param string $order 排序
     * @param string|array $group 分组字段
     * @param string|array $having 分组条件
     * @return mixed
     */
    function getItem($conditions = null, $fields = null, $order = null, $group = null, $having = null)
    {
        if (!empty ($conditions)) $this->db->where($conditions); // 条件
        if (!empty ($fields)) $this->db->select($fields); // 查询字段
        if (!empty ($order)) $this->db->order_by($order); // 排序
        if (!empty ($group)) $this->db->group_by($group); // 分组
        if (!empty ($having)) $this->db->having($having);
        $query = $this->db->get($this->table_name);
        $item = $query->row_array();
        $query->free_result();
        return $item;
    }

    /**
     * 获取数据列表
     * @param string|array $conditions 查询条件
     * @param string|array $fields 查询字段
     * @param string|array $order 排序
     * @param int $page 当前页
     * @param int $pagesize 每页数量
     * @param string $count 传递总数过来，不重复读取
     * @param string $mobile 是否是手机端
     * @param string mobile 是否是手机端查询        默认关闭
     * @param string $group 分组字段
     * @param string|array $having 分组条件
     * @return array item
     */
    function getItems($conditions = null, $fields = null, $order = null, $page = null, $pagesize = null, $count = null, $mobile = null, $group = null, $having = null)
    {
        if (!empty($conditions)) $this->db->where($conditions); // 条件
        if (!empty($fields)) $this->db->select($fields); // 查询字段
        if (!empty($order)) $this->db->order_by($order); // 排序
        if (!empty($page)) $this->db->limit($pagesize, !empty($page) ? ($page - 1) * $pagesize : 0); // (10, 20) LIMIT 20, 10
        if (!empty($group)) $this->db->group_by($group); // 分组
        if (!empty($having)) $this->db->having($having);
        // var_dump($this->db->get_compiled_select($this->table_name));//返回sql 语句
        $query = $this->db->get($this->table_name);
        $item = $query->result_array();
        $query->free_result(); // 释放
        if (!empty($page) && empty($count) && empty($mobile)) {// empty判断的是 空，没值的时候返回true 有值返回false
            $count = $this->count($conditions, $group, $having); // 获取总数
            $pages = pages($count, $pagesize); // 获取分页
            $this->pagemenu = $pages; // 控制器直接调用
            $this->count = $count;
        }
        if ($mobile) {
            if (empty($count)) {
                $count = $this->count($conditions, $group, $having); // 获取总数
            }
            $end = (int)ceil($count / $pagesize) - $page;
            $this->pagemenu = array('page' => $page + 1, 'count' => $count, 'end' => $end > 0 ? $end : 0,);
        }
        return $item;
    }


    /**
     * 获取总数
     * @param string $conditions
     * @param string $group
     * @param string $having
     * @param array $table key 数据表 val 条件 val里面写+ 后面带的是关联方式
     * @return int
     */
    function count($conditions = null, $group = null, $having = null, $join = null)
    {
        $this->db->from(isset($join['ytable']) ? $join['ytable'] : $this->table_name);
        if ($join) {
            if(isset($join['more'])){
                foreach ($join['more'] as $v) {
                    if (isset($v['type']) && $v['type']) {
                        $this->db->join($v['table'], $v['cond'], $v['type']);
                    } else {
                        $this->db->join($v['table'], $v['cond']);
                    }
                }
            }else{
                if (isset($join['type']) && $join['type']) {
                    $this->db->join($join['table'], $join['cond'], $join['type']);
                } else {
                    $this->db->join($join['table'], $join['cond']);
                }
            }
        }
        if (!empty ($conditions)) $this->db->where($conditions); // 条件
        if (!empty ($group)) $this->db->group_by($group); // 分组
        if (!empty ($having)) $this->db->having($having);
        $item = $this->db->count_all_results();
        return $item;
    }


    /**
     * 关联查询
     * @param array $join 数组['table'=>'','cond'=>'','type'=>'','ytable'=>''] ytable = 是修改原表用于as 多个表使用[more=>[] ytable=>'']
     * @param string $conditions
     * @param string $fields
     * @param string $order
     * @param string $page
     * @param string $pagesize
     * @param string $count 传递总数过来，不重复读取
     * @param string $mobile 是否是手机端
     * @param string $group
     * @param string $having
     * @return array
     */
    function getItems_join($join, $conditions = null, $fields = null, $order = null, $page = null, $pagesize = null, $count = false, $mobile = null, $group = null, $having = null)
    {
        $this->db->from(isset($join['ytable']) ? $join['ytable'] : $this->table_name);
        if(isset($join['more'])){
            foreach ($join['more'] as $v) {
                if (isset($v['type']) && $v['type']) {
                    $this->db->join($v['table'], $v['cond'], $v['type']);
                } else {
                    $this->db->join($v['table'], $v['cond']);
                }
            }
        }else{
            if (isset($join['type']) && $join['type']) {
                $this->db->join($join['table'], $join['cond'], $join['type']);
            } else {
                $this->db->join($join['table'], $join['cond']);
            }
        }

        if (!empty ($conditions)) $this->db->where($conditions); // 条件
        if (!empty ($fields)) $this->db->select($fields); // 查询字段
        if (!empty ($order)) $this->db->order_by($order); // 排序
        if (!empty ($group)) $this->db->group_by($group); // 分组
        if (!empty ($having)) $this->db->having($having);
        if (!empty ($pagesize)) $this->db->limit($pagesize, !empty ($page) ? ($page - 1) * $pagesize : 0); // (10, 20) LIMIT 20, 10
        $query = $this->db->get();
        $item = $query->result_array();
        $query->free_result(); // 释放
        if (!empty($page) && empty($count)) { // 是否启用分页
            $count = $this->count($conditions, $group, $having, $join); // 获取总数
            if (!empty($mobile)) {//是否是手机端
                $end = (int)ceil($count / $pagesize) - $page;
                $this->pagemenu = array('end' => $end > 0 ? $end : 0, 'start' => $page + 1);
            } else {
                $pages = pages($count, $pagesize); // 获取分页
                $this->pagemenu = $pages; // 控制器直接调用
                $this->count = $count;
            }
        }
        return $item;
    }

    /**
     * 更新数据
     * @param    $data
     * @param    $conditions
     * @return mixed
     */
    public function edit($data, $conditions=null)
    {
        if (!empty ($conditions)) $this->db->where($conditions); // 条件
        if (is_array($data)) {
            foreach ($data as $k => $v) {
                switch (substr($v, 0, 2)) {
                    case '+=' :
                        $this->db->set($k, $k . "+" . str_replace("+=", "", $v), false);
                        unset ($data [$k]);
                        break;
                    case '-=' :
                        $this->db->set($k, $k . "-" . str_replace("-=", "", $v), false);
                        unset ($data [$k]);
                        break;
                    case '<>' :
                        $this->db->set($k, $k . "<>" . $v, false);
                        unset ($data [$k]);
                        break;
                    case '<=' :
                        $this->db->set($k, $k . "<=" . $v, false);
                        unset ($data [$k]);
                        break;
                    case '>=' :
                        $this->db->set($k, $k . ">=" . $v, false);
                        unset ($data [$k]);
                        break;
                    case '^1' :
                        $this->db->set($k, $k . "^1", false);
                        unset ($data [$k]);
                        break;
                    case 'in' :
                        if (substr($v, 0, 3) == "in(") {
                            $this->db->where_in($k, $v, false);
                            unset ($data [$k]);
                        } else {
                            $this->db->set($k, $v, true);
                            unset ($data [$k]);
                        }
                        break;
                    case 'sq' :
                        $this->db->set($k, str_replace("sq", "", $v), false);
                        unset ($data [$k]);
                        break;
                    default :
                        $this->db->set($k, $v, true);
                }
            }
            return $this->db->update($this->table_name);
        } else {
            return $this->db->update($this->table_name, check_input($data));
        }
    }

    /**
     * 批量更新
     * $key 键名
     */
    function update_batchs($data, $key)
    {
        return $this->db->update_batch($this->table_name, $data, $key);
    }

    /**
     * 添加数据
     * $return_insert_id 是否返回ID
     */
    public function add($data, $return_insert_id = true)
    {
        if (is_array($data)) {
            $this->db->set($data, '', true);
            $this->db->insert($this->table_name);
            if ($return_insert_id) return $this->db->insert_id();
        } else {
            $this->db->insert($this->table_name, check_input($data));
            if ($return_insert_id) return $this->db->insert_id();
        }
    }

    /**
     * 批量添加数据
     * data 二维数据
     */
    public function add_batch($data)
    {
        return $this->db->insert_batch($this->table_name, $data);
    }

    /**
     * 删除数据
     */
    public function del($conditions = '')
    {
        if (!empty($conditions)) $this->db->where($conditions);
        return $this->db->delete($this->table_name);
    }
    ///更新查询，如果没有则插入有则更新
    function replace($data){
        return $this->db->replace($this->table_name,$data);
    }

    //事物
    public function start() {
        $this->db->trans_start();
    }

    public function complete() {
        $this->db->trans_complete();
    }

    /**
     * 执行查询
     */
    public function querys($sql, $conditions = '', $pagesize = '',$page='')
    {
        $query = $this->db->query($sql);
        $items = $query->result_array();
        $query->free_result();
        if (!empty ($pagesize)) { // 是否启用分页
            $count = $this->count($conditions); // 获取总数
            if (!empty($mobile)) {//是否是手机端
                $end = (int)ceil($count / $pagesize) - $page;
                $this->pagemenu = array('end' => $end > 0 ? $end : 0, 'start' => $page + 1);
            } else {
                $pages = pages($count, $pagesize); // 获取分页
                $this->pagemenu = $pages; // 控制器直接调用
            }
        }
        return $items;
    }

    function up($sql, $conditions = '', $pagesize = ''){
        $query = $this->db-->query($sql);
        return '';
    }

    function query_file($sql){
        $query = $this->db->conn_id->multi_query($sql);
        return $query;
    }
}

