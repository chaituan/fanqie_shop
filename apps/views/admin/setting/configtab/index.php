<?php echo template('admin/header');echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show layui-form">
		<div class="layui-card">
			<div class="layui-card-header pt15 pb15">
				<div class="layui-row">
						<div class="layui-col-xs12">
							<div class="layui-inline">
									<?php echo admin_btns($add_url,'add','layui-btn-normal fq_iframe','','添加配置');?>
							</div>
						</div>
				</div>
			</div>
			<div class="layui-card-body">
				<table class="layui-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>分类名称</th>
							<th>分类字段</th>
							<th>是否显示</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($items as $vall){ ?>
						<tr>
							<td><?php echo $vall['id']; ?></td>
							<td><?php echo $vall['title']; ?></td>
							<td><?php echo $vall['eng_title']; ?></td>
							<td><input type="checkbox" lay-skin="switch" lay-filter="open" lay-text="是|否" <?php echo $vall['status']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$vall['id'])?>"  ></td>
							<td>
								<div class="layui-btn-group">
								  <?php echo admin_btn(site_url('adminct/setting/config/childtab/id-'.$vall['id']),'','layui-btn-xs','','管理');?>
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
<?php echo template('admin/script');?>
<script type="text/javascript">


</script>
<?php echo template('admin/footer');?>