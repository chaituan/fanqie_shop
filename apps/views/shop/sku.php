<div class="layui-card" id="sku">
  <div class="layui-card-header">
  	<button class="layui-btn layui-btn-sm" @click="addKey" type="button"> <i class="layui-icon">&#xe608;</i> 添加规格</button> <span>（点击下面规格或者规格属性即可删除;不添加代表不开启属性）</span>
  </div>
  <div class="layui-card-body">
		<div class="layui-row mt5" v-for="(title, i) in titles">
            <div class="layui-col-md2">
                <button  @click="delKey(i)" class="layui-btn layui-btn-sm  layui-btn-normal" type="button" v-text="title"></button>
            </div>
            <div class="layui-col-md10">
                <div class="layui-btn-group ml10">
                    <button @click="delOption(i, j)" v-for="(name, j) in options[i]" type="button" class="layui-btn layui-btn-primary layui-btn-sm" v-text="name"></button>
                    <button @click="addOption(i)" type="button" class="layui-btn layui-btn-primary layui-btn-sm" title="添加规格属性"><i class="layui-icon">&#xe654;</i></button>
                </div>
            </div>
		</div>
		<table class="layui-table">
		  <thead>
		    <tr>
		     	<th>ID</th>
				<th v-for="title in titles" v-text="title"></th>
				<th>价格</th>
				<th>库存</th>
		    </tr> 
		  </thead>
		  <tbody>
		    <tr v-for="path in paths">
				<td v-text="path.symbols.join(SKU_SEP)"></td>	
				<td v-for="opt in path.values">
					<span v-text="opt"></span>
				</td>
				<td>
					<input v-model="path.price" type="number" step="0.01"  class="layui-input"/>
				</td>
				<td>
					<input v-model="path.stock" type="number"  class="layui-input"/>
				</td>
			</tr>
		  </tbody>
		</table>
		<input type="hidden" name="data[sku_paths]" v-model="paths">
  </div>
</div>
<script src="<?php echo JS_PATH.'sku/vue.js'?>"></script>
<!---需要调取页面的库存 一定要定义 id="stock" id="price"-->
<script>
		const SKU_SEP = ',';
 		Vue.config.devtools = true;
		let vue = new Vue({
			data: {
				titles: <?php echo isset($item['sku_titles'])&&$item['sku_titles']?$item['sku_titles']:'[]'?>,
				options: <?php echo isset($item['sku_options'])&&$item['sku_options']?$item['sku_options']:'[]'?>,
				stock: <?php echo isset($item['sku_stock'])&&$item['sku_stock']?$item['sku_stock']:'[]'?>,
				price: <?php echo isset($item['sku_price'])&&$item['sku_price']?$item['sku_price']:'[]'?>,
				SKU_SEP,
			},
			computed: {
				keys() {
					let keys = {}
					let symbol = 0
					for(let i in this.titles) {
						let option = {}
						for(let j in this.options[i]) {
							option[this.options[i][j]] = symbol++
						}
						keys[this.titles[i]] = option
					}
					return keys
				},
				paths() {
					let arr = this.titles.map( (v, k) => this.options[k].map((l, k) => [this.keys[v][l], l, v, ]) );
					let stock = this.stock;
					let price = this.price;
					let path = [], paths = {}, len = arr.length
					let func = (arr, n) => {
						if(typeof(arr[n])=="undefined")return;
						for(let i of arr[n]) {
							path.push(i)
							if(n !== len - 1) {
								func(arr, n + 1)
							} else {
								paths[path.map(v=>v[0]).sort().join(SKU_SEP)] = {
									symbols: path.map(v=>v[0]),
									values: path.map(v=>v[1]),
									titles: path.map(v=>v[2]),
									stock: stock[path.map(v=>v[0]).sort().join(SKU_SEP)]?stock[path.map(v=>v[0]).sort().join(SKU_SEP)]:document.getElementById("stock").value,
									price: price[path.map(v=>v[0]).sort().join(SKU_SEP)]?price[path.map(v=>v[0]).sort().join(SKU_SEP)]:document.getElementById("price").value,
									s_options:this.options,
								}
							}
							path.pop()
						}
					}
					func(arr, 0)
					return paths;
				},
			},
			methods: {
				addOption(i) {
					var my = this;
					layer.prompt({title:'请输入规格属性（如：红色等）'},function(value, index, elem){
						  my.options[i].push(value)
						  layer.close(index);
					});
				},
				delOption(i, j) {
					var my = this;
					layer.confirm('确定要删除？',function(index){
						my.options[i].splice(j, 1)
						layer.close(index);
					});
				},
				delKey(i) {
					var my = this;
					layer.confirm('确定要删除？',function(index){
						my.titles.splice(i, 1)
						my.options.splice(i, 1)
						layer.close(index);
					});
				},
				addKey() {
					var my = this;
					if(my.titles.length>=3){
						layer.msg("规格最多添加3个");
					}else{
						layer.prompt({title:'请输入规格（如：颜色等）',vars:this},function(value, index, elem){
							my.titles.push(value)
							my.options.push([])
							layer.close(index);
						});
					}

				},
			},
		}).$mount("#sku");
</script>


