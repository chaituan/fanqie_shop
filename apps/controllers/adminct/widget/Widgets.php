<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 文件校验
 * @author chaituan@126.com
 */
class Widgets extends AdminCommon {

    public function icon() {
        return $this->fetch('widget/icon');
    }
    /**
     * 会员列页面
     * @return \think\response\Json
     */
    public function userlist()
    {
        return $this->fetch('widget/icon');
    }
    /**
     * 产品列表页
     * @return \think\response\Json
     */
    public function productlist()
    {
        return $this->fetch('widget/icon');
    }
    /**
     * 图文列表页
     * @return \think\response\Json
     */
    public function newtlist()
    {
        return $this->fetch('widget/icon');
    }


}
