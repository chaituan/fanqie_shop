<!-- 左侧导航 -->
<div class="layui-side layui-bg-black">
	<div class="layui-side-scroll">
		<div class="user-photo">
			<a href="<?php echo site_url('adminct/manager/index')?>" class="img" title="我的头像"><img src="<?php echo IMG_PATH.'admin/adminloginlogo.png'?>"></a>
			<p>
				Hello！<span class="userName"><?php echo $_admin['account'];?></span>
			</p>
		</div>
		<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
		<ul class="layui-nav layui-nav-tree" lay-filter="test">
		<?php foreach($menuList as $key => $val ){?>
			<li class="layui-nav-item <?php echo $val['id']==$menuselect['id_one']?'layui-nav-itemed':'' ?> ">
				<a class="" href="javascript:;"><i class="fa fa-fw fa-<?php echo $val['icon']; ?> sider"></i><cite><?php echo $val['menu_name']; ?></cite></a>
				<?php if($val["child"]){?>
				<dl class="layui-nav-child">
					<?php  foreach ($val["child"] as $keys=>$group){    ?>
						<dd class="<?php echo $group['id']==$menuselect['id_two']?$menuselect['id_three']?'layui-nav-itemed':'layui-this':'' ?>">
							<a href="<?php echo $group['url']?>">
							<i class="fa fa-fw fa-circle-o" style="font-size: 10px; margin-right: 5px;"></i><?php echo $group['menu_name'] ?>
							</a>
							<?php if($group['child']){?>
							<dl class="layui-nav-child">
								<?php foreach ($group['child'] as $c){?>
									<dd class="<?php echo $c['id']==$menuselect['id_three']?'layui-this':'' ?>">
										<a href="<?php echo $c['url']?>" style="padding-left: 60px;">
										<i class="fa fa-fw fa-circle" style="font-size: 5px; margin-right: 5px;"></i><?php echo $c['menu_name']; ?>
										</a>
									</dd>
								<?php }?>
							</dl>
							<?php }?>
						</dd>
					<?php }?>
				</dl>
				<?php }?>
			</li>
		<?php }?>
		</ul>
	</div>
</div>
