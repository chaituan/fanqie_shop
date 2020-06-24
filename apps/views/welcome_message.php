<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>test</title>
<link rel="stylesheet" href="https://unpkg.com/vant/lib/vant-css/index.css">
</head>
<body>
	<div id="app"></div>
	<script src="https://unpkg.com/vue/dist/vue.min.js"></script>
	<script src="https://unpkg.com/vant/lib/vant.min.js"></script>
	<script>
	new Vue({
	  el: '#app',
		  template:`
		  <van-cell-group>
		  <van-cell title="单元格" value="内容"/> 
		  <van-cell title="单元格" value="内容" label="描述信息"/>
		  </van-cell-group>`
		  
	});
</script>
</body>
</html>