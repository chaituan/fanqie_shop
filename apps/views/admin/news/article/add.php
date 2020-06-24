<?php echo template('admin/headers');?>
    <form class="layui-form layui-card-body" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">所属分类</label>
            <div class="layui-input-block">
                <select name="data[group_id]"  >
                    <?php foreach($parent as $v){?>
                        <option value="<?php echo $v['id'];?>"> <?php echo str_repeat('├',$v['level']).' '.$v['gname'];?></option>
                    <?php }?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章名称</label>
            <div class="layui-input-block">
                <input type="text" name="data[title]" class="layui-input"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">分享标题</label>
            <div class="layui-input-block">
                <input type="text" name="data[s_title]" class="layui-input" placeholder="如果不填写则默认读取文章标题" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">分享简介</label>
            <div class="layui-input-block">
                <input type="text" name="data[s_info]" class="layui-input" placeholder="如果不填写则默认读取文章标题">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">分享图</label>
            <div class="layui-input-block">
                <?php echo admin_btn("data[s_thumb]",'upload',"s_thumb",'',1,1);?><div class="thumb-say">不上传默认为封面图</div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">封面图</label>
            <div class="layui-input-block">
                <?php echo admin_btn("data[thumb]",'upload',"img",'',1,1);?>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章内容</label>
            <div class="layui-input-block">
                <script type="text/plain" id="editor"  name="data[content]"></script>
            </div>
        </div>
        <div>
            <?php echo admin_btn($add_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
        </div>
    </form>
<?php echo template('admin/script');?>
    <script src="<?php echo PLUGIN.'ueditor/ueditor.config.js'?>"></script>
    <script src="<?php echo PLUGIN.'ueditor/ueditor.all.min.js'?>"></script>
    <script src="<?php echo PLUGIN.'ueditor/lang/zh-cn/zh-cn.js'?>"></script>
    <script>
        $(function () {
            setTimeout(function(){
                var ue = UE.getEditor('editor',{zIndex:998});
            },1000);
        });
    </script>
<?php echo template('admin/footers');?>