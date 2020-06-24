axios.defaults.headers.post['X-Requested-With'] = 'XMLHttpRequest';
axios.defaults.baseURL = site_url_js;
let config = {
	timeout: 20000
};
const $axios = axios.create(config);
var toast_load;
$axios.interceptors.request.use(
	function(config) {
		toast_load = layer.load();
		if (config.method === 'post' || config.method === 'put') {
			config.data = Qs.stringify(config.data);
		}
		return config;
	},
	error => {
		// Do something with request error
		return Promise.reject(error);
	}
);
$axios.interceptors.response.use(
	function(res) {
		layer.close(toast_load);;
		let msg = '';
		if (res.data) {
			if (res.data.state == 2) {
				msg = res.data.message;
			} else if (res.data.state == 1) {
				return res.data;
			} else {
				msg = '系统异常，请稍后在试';
			}
		} else {
			msg = "返回数据异常";
		}
		console.log(msg)
		layer.alert(msg);
		return new Promise(() => {});
	},
	function(error) {
		layer.alert(error.message);
		return Promise.reject(error);
	}
);


