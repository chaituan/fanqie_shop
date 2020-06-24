<?php echo template('admin/headers');?>
    <form class="layui-form layui-card-body" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">所属分组</label>
            <div class="layui-input-block">
                <select name="data[gid]"  >
                    <?php foreach ($group as $val){?>
                        <option value="<?php echo $val['id'];?>" <?php  echo $val['id']==$item['gid']?'selected':''?>> <?php echo $val['aname'];?></option>
                    <?php }?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">广告图</label>
            <div class="layui-input-block">
                <?php echo admin_btn("data[thumb]",'upload',"pic",$item['thumb'],1);?>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">广告链接</label>
            <div class="layui-input-block">
                <input type="text" name="data[url]" class="layui-input" value="<?php echo $item['url'];?>"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">说明</label>
            <div class="layui-input-block">
                <input type="text" name="data[say]" class="layui-input" value="<?php echo $item['say'];?>"   >
            </div>
        </div>
        <div>
            <input type="hidden" name="id" value="<?php echo $item['id'];?>" lay-verify='required'>
            <?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
        </div>
    </form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>

