<!DOCTYPE html>
<!--suppress JSAnnotator -->
<html lang="zh-CN">
<head>
    <link rel="stylesheet" href="<?php echo LAYUI."css/layui.css";?>" type="text/css" />
    <script type="text/javascript" src="<?php echo JS_PATH.'jquery.min.js'?>"></script>
	<script type="text/javascript" src="<?php echo LAYUI.'layui.all.js'?>"></script>
</head>
<style>
    .layui-btn + .layui-btn{margin: 0;}
    .main{ margin: 12px 0;}
    .main-top{ border-bottom: 1px solid #e5e5e5;  height: 12px;  width: 100%;  position: fixed;  top: 0;  background-color: #FFFFFF;  z-index: 100;  }
    .main .left{max-width:125px; height:100%;width: 115px;border-right: 1px solid #e5e5e5;border-left: 1px solid #e5e5e5;float: left;}
    .main .left .left-top{position: fixed;padding: 10px 10px 0;height: 35px;border-bottom: 1px solid #e5e5e5; background-color: #eee;}
    .main .left .tabs-left{overflow-y: auto;height: 100%;width:115px;position: fixed;top:46px;border-right: 1px solid #e5e5e5;}
    .main ::-webkit-scrollbar{width: 3px;height: auto;background-color: #ddd;}
    .main ::-webkit-scrollbar-thumb {
        border-radius: 1px;
        -webkit-box-shadow: inset 0 0 6px rgba(255,255,255,.3);
        background-color: #333;
    }
    .main ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        border-radius: 1px;
        background: #e5e5e5;
    }
    .main .left .nav{margin:0;padding-bottom: 100px;}
    .main .left .nav li{padding: 4px;height: 22px;}
    .main .left .nav li.active{background-color: #293846;border-left: 2px solid #19AA8D;}
    .main .left .nav li.active a{color: #a7b1c2;}
    .main .left .nav li.child{padding: 2px;padding-left: 7px;}
    .main .right{width: calc(100% - 117px);float: right;}
    .main .right .right-top{position: fixed;background-color: #fff;  z-index: 1000;width: 100%;padding: 7px 10px 0;height: 38px;border-bottom: 1px solid #e5e5e5;border-top: 1px solid #e5e5e5;}
    .main .right .imagesbox{position: fixed;top:58px;min-height: 200px;height: calc(100% - 115px);;overflow-y: auto;}
    .main .right .imagesbox .image-item{ text-align: center;position: relative;display: inline-block;  width: 112px;height: 112px;  border: 1px solid #ECECEC;background-color: #F7F6F6;  cursor: default;  margin: 10px 0 0 10px;padding: 5px;}
    .main .right .imagesbox .image-item img,video{max-width: 100%;height: 112px;vertical-align:middle}
    .main .right .imagesbox .on{border: 3px dashed #0092DC;padding: 3px;}
    .main .right .foot-tool{position: fixed;bottom: 0px;width: calc(100% - 117px);background-color:#fff;padding: 10px;border-top: 1px solid #e5e5e5;}
    .main .right .foot-tool .page{padding: 0px 10px;float: right;}
    .main .right .foot-tool .page ul{width: 100%}
    .main .right .foot-tool .page li{float: left;margin: 0px;}
    .main .right .foot-tool .page .disabled span{background-color: #e6e6e6!important;  color: #bbb!important;  cursor: no-drop;padding: 0px 10px;  height: 30px;  line-height: 30px;  display: block;}
    .main .right .foot-tool .page .active span{background-color: #428bca;color: #fff;border-color: #428bca;padding: 0px 10px;  height:30px;  line-height: 30px;  display: block;}
    .main .right .foot-tool .page li a{border: 1px solid #e5e5e5;padding: 0px 10px;  height: 28px;  line-height: 28px;  display: block;}
</style>
<body>
<div class="main">
    <div class="main-top"></div>
    <div class="left">
        <div class="left-top">
            <button class="layui-btn layui-btn-primary layui-btn-xs" id="addcate" title="添加分类"><i class="layui-icon layui-icon-add-circle-fine"></i></button>
            <button class="layui-btn layui-btn-primary layui-btn-xs" id="editcate" title="编辑当前分类"><i class="layui-icon layui-icon-edit"></i></button>
            <button class="layui-btn layui-btn-primary layui-btn-xs" id="deletecate" title="删除当前分类"><i class="layui-icon layui-icon-delete"></i></button>
        </div>
        <div class="tabs-left">
            <ul class="nav nav-tabs">
                <li class="<?php echo 0 == $pid?'active':''?>">
                    <a href="<?php echo site_url('adminct/widget/images/index/pid-0-classs-'.$classs.'-s-'.$s)?>">全部</a>
                </li>
                <?php if($typearray) foreach ($typearray as $k=>$vo){?>
                     <li class="<?php echo $vo['id'] == $pid?'active':''?>">
                     	<a href="<?php echo site_url('adminct/widget/images/index/pid-'.$vo['id'].'-classs-'.$classs.'-s-'.$s)?>"><?php echo $vo['name'];?></a>
                     </li>
                	<?php if(isset($vo['children']))foreach ($vo['children'] as $kk=>$voo){?>
                       <li class="child <?php echo $voo['id'] == $pid?'active':''?>">
                       <a href="<?php echo site_url('adminct/widget/images/index/pid-'.$voo['id'].'-classs-'.$classs)?>">
                       <?php $f = $kk == count($vo['children'])?'└':'├'; echo $f.$voo['name'];?>
                       </a>
                       </li>
                    <?php }?>
                <?php }?>
            </ul>
        </div>
    </div>
    <div class="right">
        <div class="right-top">
            <button class="layui-btn layui-btn-sm layui-btn-primary"  id="moveimg">移动分类</button>
            <button class="layui-btn  layui-btn-sm layui-btn-primary" id="deleteimg">删除图片</button>
        </div>
        <div class="imagesbox" style="margin-bottom: 60px">
            <?php foreach ($items as $vo){ $img = ['jpg','png','gif','bmp','jpeg']; ?>
            <div class="image-item">
                <?php if(in_array(explode('.',$vo['att_dir'])[1],$img)) { ?>
                    <img class="pic" src="<?php echo base_url($vo['att_dir'])?>" id="<?php echo $vo['att_id']?>"/>
                <?php }else{ ?>
                    <video class="pic" autoplay muted src="<?php echo base_url($vo['att_dir'])?>" id="<?php echo $vo['att_id']?>"> </video>
                <?php } ?>
            </div>
            <?php }?>
            <footer class="panel-footer" style="padding: 10px;">
                <div class="layui-row">
                    <div class="layui-col-xs12 " style="text-align: center">
                        <div class="layui-box layui-laypage layui-laypage-default f-right footer-page" >
                            <?php echo $pagemenu;?>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <div class="foot-tool">
            <button class="layui-btn layui-btn-sm"  id="upload">上传图片</button>
            <button class="layui-btn layui-btn-normal layui-btn-sm" id="ConfirmChoices">使用选中的图片</button>
<!--            <button class="layui-btn layui-btn-danger layui-btn-sm" id="close" >关闭</button>-->
            <div class="page"></div>
        </div>
    </div>
</div>

<script>
    var pid = <?php echo $pid;?>;//当前图片分类ID
    var parentinputname = '<?php echo $classs;?>';//父级input name 
    var uploadurl = "<?php echo site_url("adminct/widget/images/upload/pid-".$pid."-s-".$s); ?>"; //上传图片地址
    var deleteurl = "<?php echo site_url("adminct/widget/images/delete"); ?>";//删除图片地址
    var moveurl = "<?php echo site_url("adminct/widget/images/moveimg/s-".$s); ?>";//移动图片地址
    var addcate = "<?php echo site_url("adminct/widget/images/add/s-".$s); ?>";//添加图片分类地址
    var editcate = "<?php echo site_url("adminct/widget/images/edit/id-".$pid."-s-".$s); ?>";//编辑图片分类地址
    var deletecate = "<?php echo site_url("adminct/widget/images/del"); ?>";//删除图片分类地址
</script>
<script type="text/javascript" src="<?php echo JS_PATH.'admin/images.js'?>"></script>
</body>
</html>