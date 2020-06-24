
<!--编辑器: banner-->
<script id="tpl_editor_banner" type="text/template">
    <form class="am-form tpl-form-line-form" data-itemid="{{ id }}">
        <div class="margin-bottom am-form-group ">
            <label class="am-u-sm-3 am-form-label am-text-xs ">样式选择</label>
            <div class="am-u-sm-9 am-u-end">
                <label class="am-radio-inline margin-right">
                    <input data-bind="style.type" type="radio" name="searchStyle"  value="1" {{ style.type== 1 ? 'checked' : '' }}> 卡片式轮播
                </label>
                <label class="am-radio-inline">
                    <input data-bind="style.type" type="radio" name="searchStyle" value="2" {{ style.type== 2 ? 'checked' : '' }}> 全屏轮播
                </label>
            </div>
        </div>
        <div class="form-items">
            {{each data}}
            <div class="item" data-key="{{ $index }}">
                <div class="container">
                    <div class="item-image">
                        {{if $value.imgUrl.indexOf('banner_01')>0||$value.imgUrl.indexOf('banner_02')>0 }}
                        <?php echo admin_btn("imgName",'upload','{{ $index }}','',1);?>
                        {{else}}
                        <img src="{{ $value.imgUrl }}" alt="">
                        {{/if}}
                    </div>
                    <div class="item-form am-form-file">
                        <div class="input-group">
                            <input type="text" name="imgName" class="{{ $index }}" data-bind="data.{{ $index }}.imgName" value="{{ $value.imgName }}" placeholder="请选择图片" readonly>
                            <input type="hidden" name="imgUrl" class="{{ $index }}" data-bind="data.{{ $index }}.imgUrl"  value="{{ $value.imgUrl }}">
                        </div>
                        <div class="input-group" style="margin-top:10px;">
                            <input type="text" name="linkUrl" data-bind="data.{{ $index }}.linkUrl" value="{{ $value.linkUrl }}"  placeholder="请输入链接地址">
                        </div>
                    </div>
                </div>
                <i class="fa fa-trash-o item-delete"></i>

            </div>
            {{/each}}
        </div>
        <div class="form-item-add">
            <i class="fa fa-plus"></i> 添加一个
        </div>
    </form>
</script>
<!--编辑器: 导航菜单-->
<script id="tpl_editor_nav" type="text/template">
    <form class="am-form tpl-form-line-form" data-itemid="{{ id }}">
        <div class="form-items">
            {{each data}}
            <div class="item" data-key="{{ $index }}">
                <div class="container">
                    <div class="item-image">
                        {{if $value.imgUrl.indexOf('banner')>0 }}
                        <?php echo admin_btn("imgName",'upload','{{ $index }}','',1);?>
                        {{else}}
                        <img src="{{ $value.imgUrl }}" alt="">
                        {{/if}}
                    </div>
                    <div class="item-form am-form-file">
                        <div class="input-group">
                            <input type="text" name="name" data-bind="data.{{ $index }}.name" value="{{ $value.name }}" placeholder="请输入菜单中文名称">
                        </div>
                        <div class="input-group margin-top-sm" >
                            <input type="text" name="imgName" class="{{ $index }}" data-bind="data.{{ $index }}.imgName" value="{{ $value.imgName }}" placeholder="请选择图片" readonly>
                            <input type="hidden" name="imgUrl" class="{{ $index }}" data-bind="data.{{ $index }}.imgUrl" value="{{ $value.imgUrl }}">
                        </div>
                        <div class="input-group margin-top-sm" >
                            <input type="text" name="linkUrl" data-bind="data.{{ $index }}.linkUrl" value="{{ $value.linkUrl }}" placeholder="请输入链接地址">
                        </div>
                    </div>
                </div>
                <i class="fa fa-trash-o item-delete"></i>
            </div>
            {{/each}}
        </div>
        <div class="form-item-add">
            <i class="fa fa-plus"></i> 添加一个
        </div>
    </form>
</script>
<!--编辑器: 图片广告-->
<script id="tpl_editor_adimg" type="text/template">
    <form class="am-form tpl-form-line-form" data-itemid="{{ id }}">
        <div class="am-form-group margin-bottom">
            <label class="am-u-sm-3 am-form-label am-text-xs ">样式选择</label>
            <div class="am-u-sm-9 am-u-end">
                <label class="am-radio-inline margin-right">
                    <input data-bind="style.type" type="radio" name="searchStyle"  value="1" {{ style.type== 1 ? 'checked' : '' }}> 样式一
                </label>
                <label class="am-radio-inline margin-right">
                    <input data-bind="style.type" type="radio" name="searchStyle" value="2" {{ style.type== 2 ? 'checked' : '' }}> 样式二
                </label>
                <label class="am-radio-inline margin-right">
                    <input data-bind="style.type" type="radio" name="searchStyle" value="3" {{ style.type== 3 ? 'checked' : '' }}> 样式三
                </label>
                <label class="am-radio-inline margin-right">
                    <input data-bind="style.type" type="radio" name="searchStyle" value="4" {{ style.type== 4 ? 'checked' : '' }}> 样式四
                </label>
                <label class="am-radio-inline margin-right">
                    <input data-bind="style.type" type="radio" name="searchStyle" value="5" {{ style.type== 5 ? 'checked' : '' }}> 样式五
                </label>
                <label class="am-radio-inline margin-right">
                    <input data-bind="style.type" type="radio" name="searchStyle" value="6" {{ style.type== 6 ? 'checked' : '' }}> 样式六
                </label>
                <label class="am-radio-inline margin-right">
                    <input data-bind="style.type" type="radio" name="searchStyle" value="7" {{ style.type== 7 ? 'checked' : '' }}> 样式七
                </label>
                <label class="am-radio-inline">
                    <input data-bind="style.type" type="radio" name="searchStyle" value="8" {{ style.type== 8 ? 'checked' : '' }}> 样式八
                </label>
            </div>
            <div class="text-orange">请按预览图显示他图片数量添加，否则无法正常显示</div>
        </div>

        <div class="form-items">
            {{each data}}
            <div class="item" data-key="{{ $index }}">
                <div class="container">
                    <div class="item-image">
                        {{if $value.imgUrl.indexOf('banner')>0 }}
                        <?php echo admin_btn("imgName",'upload','{{ $index }}','',1);?>
                        {{else}}
                        <img src="{{ $value.imgUrl }}" alt="">
                        {{/if}}
                    </div>
                    <div class="item-form am-form-file">
                        <div class="input-group">
                            <input type="text" name="imgName" class="{{ $index }}" data-bind="data.{{ $index }}.imgName" value="{{ $value.imgName }}" placeholder="请选择图片" readonly>
                            <input type="hidden" name="imgUrl" class="{{ $index }}" data-bind="data.{{ $index }}.imgUrl"  value="{{ $value.imgUrl }}">
                        </div>
                        <div class="input-group" style="margin-top:10px;">
                            <input type="text" name="linkUrl" data-bind="data.{{ $index }}.linkUrl" value="{{ $value.linkUrl }}"  placeholder="请输入链接地址">
                        </div>
                    </div>
                </div>
                <i class="fa fa-trash-o item-delete"></i>
            </div>
            {{/each}}
        </div>
        <div class="form-item-add">
            <i class="fa fa-plus"></i> 添加一个
        </div>
    </form>
</script>
<!--编辑器: 搜索-->
<script id="tpl_editor_search" type="text/template">
    <form class="am-form tpl-form-line-form" data-itemid="{{ id }}">
        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label am-text-xs">提示文字 </label>
            <div class="am-u-sm-9 am-u-end">
                <input class="tpl-form-input" type="text" name="searchStyle"
                       data-bind="params.placeholder" value="{{ params.placeholder }}">
            </div>
        </div>
        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label am-text-xs">搜索框样式 </label>
            <div class="am-u-sm-9 am-u-end">
                <label class="am-radio-inline">
                    <input data-bind="style.searchStyle" type="radio" name="searchStyle"
                           value="" {{ style.searchStyle=== '' ? 'checked' : '' }}> 方形
                </label>
                <label class="am-radio-inline">
                    <input data-bind="style.searchStyle" type="radio" name="searchStyle"
                           value="radius" {{ style.searchStyle=== 'radius' ? 'checked' : '' }}> 圆角
                </label>
                <label class="am-radio-inline">
                    <input data-bind="style.searchStyle" type="radio" name="searchStyle"
                           value="round" {{ style.searchStyle=== 'round' ? 'checked' : '' }}> 圆弧
                </label>
            </div>
        </div>
        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label am-text-xs">文字对齐 </label>
            <div class="am-u-sm-9 am-u-end">
                <label class="am-radio-inline">
                    <input data-bind="style.textAlign" type="radio" name="textAlign"
                           value="left" {{ style.textAlign=== 'left' ? 'checked' : '' }}>
                    居左
                </label>
                <label class="am-radio-inline">
                    <input data-bind="style.textAlign" type="radio" name="textAlign"
                           value="center" {{ style.textAlign=== 'center' ? 'checked' : '' }}>
                    居中
                </label>
                <label class="am-radio-inline">
                    <input data-bind="style.textAlign" type="radio" name="textAlign"
                           value="right" {{ style.textAlign=== 'right' ? 'checked' : '' }}>
                    居右
                </label>
            </div>
        </div>
    </form>
</script>

<!--编辑器: 标题项-->
<script id="tpl_editor_title" type="text/template">
    <form class="am-form tpl-form-line-form" data-itemid="{{ id }}">
    </form>
</script>
<!--编辑器: 最新商品组-->
<script id="tpl_editor_new_goods" type="text/template">
    <form class="am-form tpl-form-line-form" data-itemid="{{ id }}">
    </form>
</script>
<!--编辑器: 爆品商品组-->
<script id="tpl_editor_hot_goods" type="text/template">
    <form class="am-form tpl-form-line-form" data-itemid="{{ id }}">
    </form>
</script>
<!--编辑器: 销量榜单商品组-->
<script id="tpl_editor_top_goods" type="text/template">
    <form class="am-form tpl-form-line-form" data-itemid="{{ id }}">
    </form>
</script>
