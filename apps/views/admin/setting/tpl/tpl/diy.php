

<!-- diy元素: banner -->
<script id="tpl_diy_banner" type="text/template">
    <div class="drag" id="diy-{{ id }}" data-itemid="{{ id }}">
        <div class="diy-banner">
            {{each data}}
            <img src="{{ $value.imgUrl }}">
            {{/each}}
            <div class="dots center square">
                {{each data}}
                <span style="background: #000000;"></span>
                {{/each}}
            </div>
        </div>
        <div class="btn-edit-del">
            <div class="btn-edit">编辑</div>
            <div class="btn-del">删除</div>
        </div>
    </div>
</script>
<!-- diy元素: banner -->
<!-- diy元素: adimg -->
<script id="tpl_diy_adimg" type="text/template">
    <div class="drag" id="diy-{{ id }}" data-itemid="{{ id }}">
        <div class="diy-banner">
            <img src="<?php echo base_url(); ?>res/images/admin/banner1-{{style.type}}.jpg">
        </div>
        <div class="btn-edit-del">
            <div class="btn-edit">编辑{{ style.type }}</div>
            <div class="btn-del">删除</div>
        </div>
    </div>
</script>
<script id="tpl_diy_nav" type="text/template">
    <div class="drag" id="diy-{{ id }}" data-itemid="{{ id }}">
        <div class="diy-nav">
            <div class="nav-icon-list">
                {{each data}}
                <div class="nav-icon">
                    <div class="navigator">
                        <img src="{{ $value.imgUrl }}" />
                        <div class="view">{{ $value.name }}</div>
                    </div>
                </div>
                {{/each}}
            </div>
        </div>
        <div class="btn-edit-del">
            <div class="btn-edit">编辑</div>
            <div class="btn-del">删除</div>
        </div>
    </div>
</script>
<!-- diy元素: 搜索栏 -->
<script id="tpl_diy_search" type="text/template">
    <div class="drag" id="diy-{{ id }}" data-itemid="{{ id }}">
        <div class="diy-search" style="background: {{ style.background }}; padding-top:{{ style.paddingTop  }}px; ">
            <div class="inner left {{ style.searchStyle }}" style="background: {{ style.inputBackground }};">
                <div class="search-input" style="text-align: {{ style.textAlign }}; color: {{ style.inputColor }};">
                    <i class="search-icon iconfont icon-ss-search"></i>
                    <span>{{ params.placeholder }}</span>
                </div>
            </div>
        </div>
        <div class="btn-edit-del">
            <div class="btn-edit">编辑</div>
            <div class="btn-del">删除</div>
        </div>
    </div>
</script>


<!-- diy元素: title -->
<script id="tpl_diy_title" type="text/template">
    <div class="drag" id="diy-{{ id }}" data-itemid="{{ id }}">
        <div class="diy-title">
            <div class="title-header">
                <div class="text">最新资讯，数据自动拉取</div>
            </div>
        </div>
        <div class="btn-edit-del">
            <div class="btn-del">删除</div>
        </div>
    </div>
</script>
<!-- diy元素: new_goods -->
<script id="tpl_diy_new_goods" type="text/template">
    <div class="drag" id="diy-{{ id }}" data-itemid="{{ id }}">
        <div class="diy-goods">
            最新产品，自动获取数据
        </div>
        <div class="btn-edit-del">
            <div class="btn-del">删除</div>
        </div>
    </div>
</script>
<!-- diy元素: hot_goods -->
<script id="tpl_diy_hot_goods" type="text/template">
    <div class="drag" id="diy-{{ id }}" data-itemid="{{ id }}">
        <div class="diy-goods">
            爆品推荐，自动获取数据
        </div>
        <div class="btn-edit-del">
            <div class="btn-del">删除</div>
        </div>
    </div>
</script>
<!-- diy元素: top_goods -->
<script id="tpl_diy_top_goods" type="text/template">
    <div class="drag" id="diy-{{ id }}" data-itemid="{{ id }}">
        <div class="diy-goods">
            销量榜单，自动获取数据
        </div>
        <div class="btn-edit-del">
            <div class="btn-del">删除</div>
        </div>
    </div>
</script>
