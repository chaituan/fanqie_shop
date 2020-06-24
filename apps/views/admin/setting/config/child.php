<?php echo template('admin/header');echo template('admin/sider');?>
<style>
.addvalhtml{display: none}
</style>
<div class="layui-body">
	<div class="childrenBody childrenBody_show layui-form">
		<div class="layui-card">
			<div class="layui-card-header pt15 pb15">
				<div class="layui-row">
					<div class="layui-col-xs12">
						<div class="layui-inline">
							<?php echo admin_btn('javascript:void(0)','add','layui-btn-normal addval','','添加配置项');?>
						</div>
						<div class="layui-inline">
							<?php echo admin_btn(site_url('adminct/setting/configtab/index'),'','','','返回配置');?>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-card-body">
				<table class="layui-table">
					<thead>
						<tr>
                            <th>No</th>
							<th>ID</th>
							<th>配置名称</th>
							<th>字段变量</th>
							<th>字段类型</th>
							<th>字段值</th>
							<th>是否显示</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($items as $vall){ ?>
						<tr>
                            <td><?php echo $vall['sort']; ?></td>
							<td><?php echo $vall['id']; ?></td>
							<td><?php echo $vall['info']; ?></td>
							<td><?php echo $vall['menu_name']; ?></td>
							<td><?php echo $vall['type']; ?></td>
							<td>
							<?php
                                    if($vall['type'] == 'text' || $vall['type'] == 'textarea' || $vall['type'] == 'radio' || $vall['type'] == 'checkbox'){
                                              echo $vall['value'];
                                    }else if($vall['type'] == 'upload'){
                                        if($vall['upload_type'] == 3){
                                            if($vall['value']) {
                                                echo basename($vall['value']);
                                            }
                                        }else{
                                                if(is_array($vall['value'])){
                                                    foreach ($vall['value'] as $v){
                                                        echo basename($v);
                                                    }
                                                }else{
                                                    echo basename($vall['value']);
                                                } 
                                        }
                                    }
                            ?>
							</td>
							<td><input type="checkbox" lay-skin="switch" lay-filter="open" lay-text="是|否" <?php echo $vall['status']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$vall['id'])?>"  ></td>
							<td>
								<div class="layui-btn-group">
								  <?php echo admin_btns(($edit_url.'/id-'.$vall['id']),'edit','layui-btn-xs fq_iframe');?>
								  <?php echo admin_btn(($dr_url.'/del/id-'.$vall['id']),'del','layui-btn-xs f_del');?>
								</div>
							</td>
						</tr>
						<?php }?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="addvalhtml">
	<form class="layui-form layui-card-body" method="get">
			<div class="mt15 mb15">
				<?php foreach ($types as $k=>$v){?>
					<input type="radio" name="type" value="<?php echo $k;?>" title="<?php echo $v['label'];?>" <?php echo $k==0?'checked':''?>>
				<?php }?>
			</div>
			<div class="mt15">
				<button class='layui-btn layui-btn-fluid sub' type="button">确认选择</button>
			</div>
	</form>
</div>
<?php echo template('admin/script');?>
<script type="text/javascript">
$(function(){
	$('.addval').click(function(){
		layer.open({
			  type: 1,
			  skin: 'layui-layer-rim', //加上边框
			  area: ['560px', '200px'], //宽高
			  content: $('.addvalhtml'),
			  success:function(s,index){
				  layui.form.render('radio');
				  $('.sub').click(function(){
					  	layer.close(index);
						var url = '<?php echo $add_url.'/tab_id-'.$tab_id.'-type-';?>' + $("input[name='type']:checked").val();
						layer.open({
						      type: 2,
						      title: '添加',
						      shade: 0.6,
						      maxmin: true, //开启最大化最小化按钮
						      area: ['893px','600px'],
						      content: url,
						      success:function(layero,index){
						    	  
						      }
						});
					});
			  },
			  cancel: function(i){ 
				  layer.close(i);
			  },
			  end:function(){
				  $(".sub").unbind();//销毁
				  $('.addvalhtml').hide();
			  }
		});
		//
	});

	
	
	
});                        

</script>
<?php echo template('admin/footer');?>