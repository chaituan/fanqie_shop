<?php echo template('admin/header');echo template('admin/sider');?>
<style>.layui-form-mid{
        padding: 2px !important;}</style>
<div class="layui-body">
	<div class="childrenBody childrenBody_show layui-form ">
		<div class="layui-card">
			<div class="layui-tab layui-tab-brief">
				<ul class="layui-tab-title">
                    <?php if($config_tab){ foreach ($config_tab as $key=>$val){?>
                    	<li class="<?php if($val['value']==$tab_id)echo 'layui-this';?>">
                    		<a href="<?php echo ($index_url.'/tab_id-'.$val['value'].'-type-'.$val['type']);?>"><?php echo $val['label'];?></a>
                    	</li>
                    <?php }}else{?>
                        <li class="layui-this">
                            配置
                        </li>
                    <?php } ?>
	            </ul>
				<div class="layui-tab-content">
					<form class="layui-form layui-card-body" method="post">
						<?php foreach ($list as $v){ ?>
							<?php if($v['type']=='text'){?>
		               		<div class="layui-form-item">
								<label class="layui-form-label"><?php echo $v['info']?></label>
								<div class="layui-input-block">
									<input type="text" name="<?php echo $v['menu_name'];?>" value="<?php echo $v['value'];?>"  class="layui-input"  lay-verify="<?php echo $v['required'];?>">
                                    <?php if($v['desc']){ ?><div class="layui-form-mid layui-word-aux"><?php echo $v['desc']?></div><?php } ?>
                                </div>

							</div>
							<?php }elseif($v['type']=='textarea'){ ?>
							<div class="layui-form-item">
								<label class="layui-form-label"><?php echo $v['info']?></label>
								<div class="layui-input-block">
									<textarea rows="<?php echo $v['high'];?>" name="<?php echo $v['menu_name'];?>" class="layui-textarea" lay-verify="<?php echo $v['required'];?>"><?php echo $v['value'];?></textarea>
                                    <?php if($v['desc']){ ?><div class="layui-form-mid layui-word-aux"><?php echo $v['desc']?></div><?php } ?>
                                </div>
							</div>
							<?php }elseif($v['type']=='radio'){ ?>
							<?php $parameter = array();  $option = array();
                                  if($v['parameter']){
                                  	  $parameter = explode("+",$v['parameter']);
	                                  foreach ($parameter as $k=>$vs){
	                                  	$option[$k] = explode('|',$vs);
	                                  }
                                  }
                             ?>
						  	<div class="layui-form-item">
							    <label class="layui-form-label"><?php echo $v['info']?></label>
							    <div class="layui-input-block">
							    <?php foreach ($option as $radio){ ?>
							      <input type="radio" name="<?php echo $v['menu_name']?>" value="<?php echo $radio[0];?>" title="<?php echo $radio[1]?>"  <?php echo $radio[0]==$v['value']?'checked':''?>>
							     <?php }?>
							    </div>
                                <?php if($v['desc']){ ?><?php if($v['desc']){ ?><div class="layui-form-mid layui-word-aux"><?php echo $v['desc']?></div><?php } ?><?php } ?>
						  	</div>
							<?php }elseif($v['type']=='checkbox'){ ?>
							<?php $parameter = array();  $option = array();
                                  if($v['parameter']){
                                  	  $parameter = explode("+",$v['parameter']);
	                                  foreach ($parameter as $k=>$vss){
	                                  	$option[$k] = explode('|',$vss);
	                                  }
                                  }
                             ?>
							<div class="layui-form-item">
							    <label class="layui-form-label"><?php echo $v['info']?></label>
							    <div class="layui-input-block">
                                    <?php foreach ($option as $check){ ?>
                                        <input type="checkbox" name="<?php echo $v['menu_name'].'[]'?>" value="<?php echo $check[0];?>" title="<?php echo $check[1]?>"  <?php echo in_array($check[0],explode(',',$v['value']))?'checked':''?>>
                                    <?php }?>
                                    <?php if($v['desc']){ ?><div class="layui-form-mid layui-word-aux"><?php echo $v['desc']?></div><?php } ?>
							    </div>
						  	</div>
						  	<?php }elseif($v['type']=='upload'){ ?>
							  	<?php if($v['upload_type']==1||$v['upload_type']==2){?>
								<div class="layui-form-item">
									<label class="layui-form-label"><?php echo $v['info']?></label>
									<div class="layui-input-block">
										<?php echo admin_btn($v['menu_name'],'upload',$v['menu_name'],$v['value'],$v['upload_type']==1?1:10,$v['value']);?>
                                        <div class="thumb-say"><?php echo $v['desc']?></div>
                                    </div>
								</div>
								<?php }else{?>
								<div class="layui-form-item">
									<label class="layui-form-label"><?php echo $v['info']?></label>
									<div class="layui-input-block">
										<div class="layui-upload">
										  <button type="button" class="layui-btn" id="test1">上传图片</button>
										</div>  
									</div>
								</div>
								<?php }?>
							<?php }?>
						<?php }?>
						<div>
							<?php echo admin_btn($dr_url.'/save','save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
						</div>
	               </form>
				</div>
			</div>
		</div>
		<!-- form END -->
		
	</div>
</div>
<?php echo template('admin/script');?>
<script type="text/javascript">


</script>
<?php echo template('admin/footer');?>