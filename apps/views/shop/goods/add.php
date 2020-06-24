<?php echo template('shop/headers');?>
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
                    <div class="layui-input-block" >
                        <select name="data[group_id]"  lay-verify='required'>
                            <?php foreach ($group as $v){?>
                                <option value="<?php echo $v['id'];?>" ><?php echo $v['fh'].$v['title'];?></option>
                            <?php }?>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="data[title]" class="layui-input"  lay-verify='required'>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品简介</label>
                    <div class="layui-input-block">
                        <input type="text" name="data[info]" class="layui-input"  lay-verify='required'>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品主图</label>
                    <div class="layui-input-block">
                        <?php echo admin_btn("data[thumb]",'upload','thumbs','',1,'',$shop_id);?><div class="thumb-say">只能上传一张图片（300px * 300px）</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品轮播</label>
                    <div class="layui-input-block">
                        <?php echo admin_btn("data[thumb_arr]",'upload','thumb_arr','',10,'',$shop_id);?><div class="thumb-say">可上传多张（640px * 400px）</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品视频</label>
                    <div class="layui-input-block">
                        <?php echo admin_btn("data[video]",'upload','video','',1,1,$shop_id);?><div class="thumb-say">只支持mp4格式</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">视频链接</label>
                    <div class="layui-input-block">
                        <input type="text" name="data[video_url]" class="layui-input" placeholder="上传了视频，则无须填写视频链接，两者二选一，也可都不填写" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">产品价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="data[price]" id="price" class="layui-input" value="0" lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">市场价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="data[ot_price]" class="layui-input" value="0" lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">产品库存</label>
                        <div class="layui-input-inline">
                            <input type="text" name="data[stock]" id="stock" class="layui-input" value="0"  lay-verify='required'>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">产品状态</label>
                        <div class="layui-input-inline">
                            <input type="radio" name="data[status]" value="1" title="上架" checked>
                            <input type="radio" name="data[status]" value="0" title="下架">
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <script type="text/plain" id="editor"  name="data[content]"></script>
                </div>
            </div>

            <div class="layui-tab-item">
                <?php echo template('shop/sku');?>
            </div>
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">购买返现</label>
                    <div class="layui-input-block">
                        <input type="text" name="data[yj_money]" class="layui-input"  >
                        <div class="layui-form-mid layui-word-aux">填写说明：写1元 代表返现1元，写 1% 代表商品总价的1%的利润反给用户；留空不返</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">一级返佣</label>
                    <div class="layui-input-block">
                        <input type="text" name="data[p_1]" class="layui-input" >
                        <div class="layui-form-mid layui-word-aux">填写说明：写1元 代表返现1元，写 1% 代表商品总价的1%的利润反给上级；留空代表不返佣,填写销量会更高</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">二级返佣</label>
                    <div class="layui-input-block">
                        <input type="text" name="data[p_2]" class="layui-input"  >
                        <div class="layui-form-mid layui-word-aux">填写说明：写1元 代表返现1元，写 1% 代表商品总价的1%的利润反给上级；留空代表不返佣</div>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">产品海报</label>
                    <div class="layui-input-block">
                        <?php echo admin_btn("data[hb_img]",'upload','hb_img','',1,true,$shop_id);?><div class="thumb-say">只能上传一张图片（750px * 1334px）</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">X坐标</label>
                    <div class="layui-input-block">
                        <input type="text" name="data[hb_x]" class="layui-input" placeholder="X坐标填写后，系统会自动根据X的数值来改变二维码的水平位置">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Y坐标</label>
                    <div class="layui-input-block">
                        <input type="text" name="data[hb_y]" class="layui-input" placeholder="Y坐标填写后，系统会自动根据Y的数值来改变二维码的垂直位置" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-mid layui-word-aux">
                        1.如果不设置产品海报，系统会自动生成当前产品的海报，自己设计的会更美观<br>
                        2.自己设置的海报，请预留产品二维码的位置，二维码大小为 220px * 220px<br>
                        3.X,Y坐标是二维码的坐标位置
                    </div>
                </div>
            </div>
            <div>
                <?php echo admin_btn($add_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
            </div>
        </div>

    </div>


</form>

<?php echo template('shop/script');?>
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
<?php echo template('shop/footers');?>