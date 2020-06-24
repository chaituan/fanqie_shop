<?php echo template('admin/headers');?>
    <form class="layui-form layui-card-body" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">所属区域</label>
            <div class="layui-input-block">
                <select name="data[location_id]"  >
                    <?php foreach ($location as $val){?>
                        <option value="<?php echo $val['id'];?>" <?php echo $val['id']==$item['location_id']?'selected':'' ?>  ><?php echo $val['title'];?></option>
                    <?php }?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">绑定用户</label>
            <div class="layui-input-block">
                <div id="demo1"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">合伙人姓名</label>
            <div class="layui-input-block">
                <input type="text" name="data[username]" class="layui-input"  value="<?php echo $item['username'] ?>" lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">个人简介</label>
            <div class="layui-input-block">
                <input type="text" id="title" name="data[info]" value="<?php echo $item['info'];?>" class="layui-input"   lay-verify='required' >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" name="data[mobile]" value="<?php echo $item['mobile'] ?>" class="layui-input"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="data[mark]" value="<?php echo $item['mark'] ?>"   class="layui-input" >
            </div>
        </div>
        <div>
            <input type="hidden" name="id" value="<?php echo $item['id'];?>" lay-verify='required'>
            <?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
        </div>
    </form>
<?php echo template('admin/script');?>
    <script>

    var demo1 = xmSelect.render({
        el: '#demo1',
        autoRow: true,
        toolbar: { show: true },
        filterable: true,
        remoteSearch: true,
        radio: true,
        name:'data[uid]',
        data:<?php echo  json_encode($user); ?>,
        remoteMethod: function(val, cb, show){
            //这里如果val为空, 则不触发搜索
            if(!val){
                return cb([]);
            }
            //这里引入了一个第三方插件axios, 相当于$.ajax
            axios({
                method: 'get',
                url: site_url_js+'/adminct/user/user/search',
                params: {
                    keyword: val,
                }
            }).then(response => {
                var res = response.data;
                cb(res.data)
            }).catch(err => {

            });
        },
    })
    </script>
<?php echo template('admin/footers');?>

