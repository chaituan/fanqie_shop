<?php echo template('admin/header');echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show layui-form">
		<div class="layui-card">
			<div class="layui-card-header pt15 pb15">
				<div class="layui-row">
					<div class="layui-col-xs12">
						<div class="layui-inline">
							<?php echo admin_btns($add_url,'add','layui-btn-normal fq_iframe','','添加');?>

						</div>
					</div>
				</div>
			</div>
			<div class="layui-card-body">
                <span class="cu-tag radius sm bg-orange">请勿随意操作分类，可编辑</span>
				<table class="layui-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>名称</th>
							<th>显示</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($items as $v){ ?>
						<tr>
							<td><?php echo $v['id']; ?></td>
							<td><?php echo $v['gname']; ?></td>
							<td><input type="checkbox" lay-skin="switch" lay-filter="open" lay-text="是|否" <?php echo $v['status']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$v['id'])?>"  ></td>
                            <td>
								<div class="layui-btn-group">
								  <?php echo admin_btns(($edit_url.'/id-'.$v['id']),'edit','layui-btn-xs fq_iframe');?>
								  <?php echo admin_btn(($dr_url.'/del/id-'.$v['id']),'del','layui-btn-xs f_del');?>
								</div>
							</td>
						</tr>
                        <?php if(!isset($v['children']))continue;foreach ($v['children'] as $vs){?>
                        <tr>
                            <td><?php echo $vs['id'];?></td>
                            <td><?php echo ' ├ '.$vs['gname'];?></td>
                            <td><input type="checkbox" lay-skin="switch" lay-filter="open" lay-text="是|否" <?php echo $v['status']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$vs['id'])?>"  ></td>
                            <td>
                                <div class="layui-btn-group">
                                <?php echo admin_btns(($edit_url.'/id-'.$vs['id']),'edit','layui-btn-xs fq_iframe');?>
                                <?php echo admin_btn(($dr_url.'/del/id-'.$vs['id']),'del','layui-btn-xs f_del');?>
                                </div>
                            </td>
                        </tr>
                        <?php }?>
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