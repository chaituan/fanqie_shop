<?php echo template('admin/headers');?>
    <style>
        html{background-color: #f2f2f2;}
    </style>
    <form class="layui-form " method="post">
        <div class="layui-tab layui-tab-brief childrenBody layui-card">
            <ul class="layui-tab-title">
                <li class="layui-this">基本设置</li>
                <li>产品详情</li>
                <li>产品规格</li>
                <li>分销配置</li>
                <li>海报设置</li>
            </ul>
            <div class="layui-tab-content" >
                <div class="layui-tab-item layui-show">
                    <div class="layui-form-item">
                        <label class="layui-form-label">上级分类</label>
                        <div class="layui-input-block">
                            <select name="data[group_id]"  lay-verify='required'>
                                <?php foreach ($group as $v){?>
                                    <option value="<?php echo $v['id'];?>" <?php echo $v['id']==$item['group_id']?'selected':''; ?> ><?php echo $v['fh'].$v['title'];?></option>
                                <?php }?>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属店铺</label>
                        <div class="layui-input-block" >
                            <div id="demo1"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">产品名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[title]" class="layui-input" value="<?php echo $item['title'];?>"  lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">产品简介</label>
                        <div class="layui-input-block">
                            <textarea name="data[info]" class="layui-textarea"><?php echo $item['info'];?></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">产品主图</label>
                        <div class="layui-input-block">
                            <?php echo admin_btn("data[thumb]",'upload','thumb',$item['thumb'],1);?><div class="thumb-say">只能上传一张图片（640px * 640px）</div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">产品轮播</label>
                        <div class="layui-input-block">
                            <?php echo admin_btn("data[thumb_arr]",'upload','thumb_arr',$item['thumb_arr'],10);?><div class="thumb-say">可上传多张（640px * 高随意）</div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">产品视频</label>
                        <div class="layui-input-block">
                            <?php echo admin_btn("data[video]",'upload','video',$item['video'],1,1);?><div class="thumb-say">只支持mp4格式</div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">视频链接</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[video_url]" class="layui-input" value="<?php echo $item['video_url'] ?>" placeholder="上传了视频，则无须填写视频链接，两者二选一，也可都不填写" >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">产品价格</label>
                            <div class="layui-input-inline">
                                <input type="text" name="data[price]" id="price" class="layui-input" value="<?php echo $item['price'];?>" lay-verify='required'>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">市场价格</label>
                            <div class="layui-input-inline">
                                <input type="text" name="data[ot_price]" class="layui-input" value="<?php echo $item['ot_price'];?>" lay-verify='required'>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">产品销量</label>
                            <div class="layui-input-inline">
                                <input type="text" name="data[sales]" class="layui-input" value="<?php echo $item['sales'];?>"  lay-verify='required'>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">产品库存</label>
                            <div class="layui-input-inline">
                                <input type="text" name="data[stock]" id="stock" class="layui-input" value="<?php echo $item['stock'];?>"  lay-verify='required'>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-form-item">
                        <script type="text/plain" id="editor"  name="data[content]"><?php echo $item['content']?></script>
                    </div>
                </div>

                <div class="layui-tab-item">
                    <?php echo template('admin/sku');?>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-form-item">
                        <label class="layui-form-label">购买返现</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[yj_money]" class="layui-input"  value="<?php echo $item['yj_money']?>"  >
                            <div class="layui-form-mid layui-word-aux">填写说明：写1元 代表返现1元，写 1% 代表商品总价的1%的利润反给用户；留空不返</div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">一级返佣</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[p_1]" class="layui-input" value="<?php echo $item['p_1']?>" >
                            <div class="layui-form-mid layui-word-aux">填写说明：写1元 代表返现1元，写 1% 代表商品总价的1%的利润反给上级；留空代表不返现</div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">二级返佣</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[p_2]" class="layui-input" value="<?php echo $item['p_2']?>"  >
                            <div class="layui-form-mid layui-word-aux">填写说明：写1元 代表返现1元，写 1% 代表商品总价的1%的利润反给上级；留空代表不返现</div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-form-item">
                        <label class="layui-form-label">产品海报</label>
                        <div class="layui-input-block">
                            <?php echo admin_btn("data[hb_img]",'upload','hb_img',$item['hb_img'],1,true);?><div class="thumb-say">只能上传一张图片（750px * 1334px）</div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">X坐标</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[hb_x]" class="layui-input" value="<?php echo $item['hb_x']; ?>" placeholder="X坐标填写后，系统会自动根据X的数值来改变二维码的水平位置">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">Y坐标</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[hb_y]" class="layui-input" value="<?php echo $item['hb_y']; ?>" placeholder="Y坐标填写后，系统会自动根据Y的数值来改变二维码的垂直位置" >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-form-mid layui-word-aux">
                            1.如果不设置产品海报，系统会自动生成当前产品的海报，自己设计的会更美观<br>
                            2.自己设置的海报，请预留产品二维码的位置，二维码大小为 220px * 220px<br>
                            3.如果想把二维码生成为公众号二维码，请在小程序设置中开启引流系统。（必须在第三方平台关联当前小程序和公众号）
                        </div>
                    </div>
                </div>
                <div>
                    <input type="hidden" name="id" value="<?php echo $item['id'] ?>">
                    <?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
                </div>
            </div>

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
        var demo1 = xmSelect.render({
            el: '#demo1',
            autoRow: true,
            toolbar: { show: true },
            filterable: true,
            remoteSearch: true,
            radio: true,
            name:'data[shop_id]',
            data:<?php echo  json_encode($user); ?>,
            remoteMethod: function(val, cb, show){
                //这里如果val为空, 则不触发搜索
                if(!val){
                    return cb([]);
                }
                //这里引入了一个第三方插件axios, 相当于$.ajax
                axios({
                    method: 'get',
                    url: site_url_js+'/adminct/shop/shop/search',
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