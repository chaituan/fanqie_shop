/**
 * 腾讯地图坐标拾取插件
 * @date 2020年1月1日
 * @auth reubenxu
 * @emil 376332768@qq.com
 * @param {Object} exports
 */
layui.define(['jquery', 'layer'], function(exports) {
	var $ = layui.jquery;
	var layer = layui.layer;
	var TMap = {};
	var marker10 = "data:image/png;base64,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";
	var marker_n = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAAAjCAYAAACNUQb7AAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sHCwsVCOQ3nJoAAA8WSURBVHja7Zx/UBvnmce/K62EAAmJH8a4xhi5NHYoSnNJOiE5MsnVyZUZXFInd0OtpK0v9jSHp4zd5JqJ40w6zcTgubnzhOPOXBv3cr3akEzaOOHshOkNvvbCJCQhPvuEHWM7CGRshMwPCfRjJe3ue39oV2j1A1ZCytk3+515h5ll9/O87+77vM/7PLtAYRk99TZZA6AJwH0ALAC0ADgAZwF8BqDvXx6jnMiC/mbkqyva+ru6LzK21dW/mA/g+wCaAZgB1AK4AMAOoA/Ab9oaDQGFoTC+TAaVDLTzd3wVgJcA7JIxt38LYP+/Pq66koljPGPblLatw5axK2k633YAR6rLNRUVJjUK8lQw5KuwGODhD/JwujmMu8JOAHvaGg0nFIbCyJTxtQpNRWWpGnqdCsYCFTx+Hl6Gx+Qsh8vOREaCA/7gLX4ngCMA8tOY4xyAZ//tL1Wd6TjGvnObMrb16jfGOmU634F1xfQr5nIN1hjVKc+74eFgd4UxNc++2NZoOKgwFEY6jA2l9Cu3rdNgXXFqxtQ8h0tTYVydXWJIHPDJN7lXABxYxU7yV8da1LvlnNh21rxqW1132nev4Hwt60voN+qq8qDTStcaj4+Fw8XAYtZHjzEhgvNXg5icZZ9oazT0pGI4XAwGbW54fCyMhTSa6stgLKQzZgBAU30Zqsp1aTHix2Mb86LBYkqLYbN74fGyEpZRT8Ni1qfdj1NDM3C4GABAa3Ol7H6IfU8myyY98jRq2f0YtLlhs3tXdU9Fhtxnu3EN/cbdm/JQkDDHeBgLVZJj/hDBGXsQ464II3rFjl72RwB+kYV07me9O+iXlzthz5nqrNk6ctf4yymcrwTA5T+9Pb+kzJC4KnX3TeKDETd6XqiTHJ9d5DD4eWAOwNeEQwmMqh2DaKovwx1mPT4YccPjZdFzoC76oNJlTLgY9Aw40b13C5rqy2QzYp3PenAENrsXjt6GtMZibR+BY5pB1Vrd0qQ367F/R7VshsfHorXzIgDggToTJlwMDu2ukd0Pm92Ljt7xhHEN2iLPp8FiktWP549ewaDNjSe2VsDtY9Ez4MT+HdWwbq2QPZZYhtxn+8gd+SVr46Knl+HR+4cFfO/BIhjypU7oWuDw+3MRBg0ALcfYWp5DF7Kjn7ccY0+/+SQ9mOyXTw9vrOV4kjVbTw9vPP2LeyaS2dpVs06bMGFtdi+ef+0KbPalaBGrUoMaNeu0JVemQrsAIBnjVPud0cjZ2lyJhr3DODU0E33QchjixIpGnUIax087ow4ohyEq2eRNh/HE1opoxMqE0dE7DmMhje69WzJiWMz6hIWwZ8AJ25gXlk16WQyHsIgNdt4TjXoby3Xo6B2X/Vxsdm/E7tF6GAtptDZXwto+giN9k9EFKZ5RW6lNcD4AGL7MgAkTfPh5AN++q1Dyu/IiNWortSUXJkO7VADAcqSD5YiW5Qiy1P42lcewPOlgeaJleYIstVS2WtaX0AkHq8p1klUxmSpLaQCwpmLEblsBoGqtLrqVlMtI5vziKiuXIUZyj4+NTpB0xyJHyzE8MZEmU0YyHembxJ7mSsk9WY7hmGYS7qHoiHL7MWhzo8FikjC23VuGU0MzKRnVa5bO9Qd5TLjC+OQSg5GJYCQ8Xg/h49EAxqfD8DJ89FxzeYRBf/f1UC3Hk2ZkV/d99/VQwzt/pZVEph8Obahlc2Drh0MbGn5dfzU+ClqKClRJJ3mDxRTZrgn5SryELUMtACRjJMu9tt1bljZDvFZceXsO1KXF6Blw4uTQDHoO1KXMoeT0Y0LIR8XcLx3GoM2NqvLIAtTdN5mQe2VyT3sGnJFtddwiuRyjwWKCxayH9eAI9u+oRoPFhOOnnWkxkqmqXJcwT2IZJiHH8/h4vDW4gECISM4lBPjkUuR6rYbCX9xvQGmRGsaI7VoVx5FmjiPIQWtJEv2asxj5YltLfP6npSmtisrMo1UUoKUprRxGz4AzOunSZThcDI78+ySODzixp7kyYfIvxxDzpu59WxIiZ6b9sB4cgbV9JCGaL8dwuBh4fGx0GzzhYqJb8kzvabLoJ4fRvW8LbHYvrO0jaNg7DMc0kxCZl2NYzHpJEUccX6p7qqFUUYaxUIXt9xmg1SQfHK2m8Oi9epQWqSUMmuXII8iNErgsx39ZtgIcT1YFlHP9oM0dcYK9yZ1gJUZs7tPaeRHPH70iKV4sx+joHUeDxRSd6BPCROnum0yIQMv1Izb38vhYNL1wVpLzyGFYNklzuI3lOhwR+pHuPU0V/VZieHwsWl+9iEO7a9BUH9k2dvSOp3VPGywmtDZXoumFs2iwmBKqw4kMKae0SI3GuwrR93HibuThOwtQUUwnMFQcSzZzLEEOWk2SCLg5RxFQYqut0RDgeNj9QT4j5/MHeXA87MsxbHYvWjuXHngmDEkh5FsV0Wgqh7Ht3kgFNRtjid2eP7G1QhIBMhmLxazPiOHxsSmj30oM8d5Zt1bAWEjDurUCPQfqIkWVmL6s1I/9O6ox2HkP9nynEt37tmBbfVlCvh5lENhj8zoA0NApImBcuPUyEYaK5Yg+i8WX2Kb+1j/4jdIImDtbj56uMMaNud85z2XkgMJ1/akYNrsX1oMjaKovS7lSr8RINvnSYViFyqXYxBy0tblSEv3S7YdbeLcptx8Wsz4h//SkyYh3olQV2XTHIm7pYyOZHEZVuQ4NFhOqynX4H7sXD9SZUvZjclbK8AYiDqnTULBU5yFfeDe4GJA6qnBdv4rl+BDL8chRkzyZME9CYZ4gRy0+7nfaHEGOSzMIcjxgcwQ5AJ3JGA4XE3W++K2NXIZYdIlVfMFgJUY2xhLfD7GiGTvhVmKIVUOxAAMAJz+ekewK5IwlNvplMhaxsBabe3b3TUaLbpnc054BJwZt7mWfy/CYlMFyBA1fz8fOh414yFKAnQ8b8WBdQcJYhsciDJpliQPAmhzkZdc+/KmBi8sBc2br99++wcVtQ0e7+hc7z18NPnPHxjxJ3mZtH5G8EN+/ozq66p6/GgSAzrZGw6hQ0JEwHNNMdKLGO5H4EnwlhpjDdfSOw7JJH33fFZt3yWGsJLn9ONI3iaq1OtjGvLBurZBMODmM7n1bYD04gpNDM/D4WFSt1UkWJzmMngFndOuYyVgsZj0O7a5Ba+dFWPr0SwtKTGVZ1liEDzQ8XjZ6fWw0T8Y4Yw8+882vRhi1VXkJxZc7zNJjZ+xLDJrlyCcA7s6BU3wWfyD8JdoS9Jx9OmyhKDxStyEPFBVZKWO/FoktF49cDcI+Hf4PAM+lYqS6Ph2GxayH7Wh99DOwqrW66LZRLoOiEgsIYr++7H6InPhXGekwxK10pveUoiLb8qb6suiWWIx86TCa6stgMesTXsksxxi9HmHcbU58LvFj+cwexOj1JQZ11yue+wB8mAOnePrMi8ZfSibJyZKc2RrcNvfLZL/o6l/UAvh7Y4Hqx9XlGqwvpaFRU7GLAq7Nshh3heHx8/8I4Nm2RkNIYSiMdBnFhaof3/YVDarLaEkxJswSjM+wuHQ9jHmflEEBwDd+7r4MoCaLDjEHYOO5n5kS6rH17xbnxNbQo/Pe5U7q6l+8E8DzABoLdSqjRg2EWMAf5D1CQn2ordFwVmEojGwwDPlLDC+TmkEBwNdfmm8CcDKLTvHs+ZeLDyf7xTdPmLJu69Pt7sPpXNDVv1gDwAhgrq3RYM/EqMJQGNlQNE5uOTB3HJHv21arQQAPXTxYkrJO/Ce/M2bV1n8/7uGgSNEtKHqpNEp2A1gP4MFV8M6G5+2Pjf/zPTjU0UFPTTs536IPR391VPLJAJslWyEn/9hom3dZW4oU3cyS1Gw2PTeTD+BdJPmMbEURbtj7+YntrpN/vSBweaEF/+zBh7j//OMfJI5x+5uGzG3xGPZ8GN5+vYuRZUuRolvCAUVtfPbGTgCvCvvglTzPxzOe9qnjf/4a67YTABqBKzpBCACzefPm4OjoaMLnHrf16uXbIvBxftLueDHwWtjJp21LkaJbwgEBoGLnx5V00YZjUNEpt4mED58LXDn11Nx7P5oStrOqOKfgAYQBBAAsfGX9Ou76tamEfG3D4fxKukx1jFKn3pISDud8n7JPubqCq7KlSNGt4IBaAHpt5f3akkffeItS5zUkOkT4/Nzbjz0emvqEA6AWnEH8yQlOwQIICk4xX1xsCs7Pu9lktnS3q7XlP817i9Ig0RaL89MdzOPBS/xqbSlSdFNJneJYIQAtt3CVJoQaotfdbyWE0hASeZtPCAkvftSxk7l8IgigAJH/alYo/NQJjiFGKU5wjJBaQ4fDIclfLEZtsTOE5kGGNJtVVh7Q8ATgCcDzCHt+G97pH+JWa0uRoptOyf4kWKyMagDk+YYPL4QXrp3geAKxhebtp/xnugIASgGUCM0oNL3ws0CIbioAfEF+PkcSv3yV2Fp8l10IzfBSW9P8qcVTbDZsKVJ0SzigGJloYWLrmS/e+yj2r90DI7/+L8EhimOaSXAGg3CdRtgaMgD8hAILUPxKtgLD3EexDug9zWbTliJFN70DkhjHyAOgZz7tmOA5NsTzBDwb8gfPv+6OcQbREYqEbWGBkFuyarVqAYDbUGRgVCp12O/3kZVs+d5mJziWhDiegAsTP3Oay5YtRYpuOiX7ZyJhIZfSiHkWYQMGlllwUXnFlcQ3cx1csEBwGirGicWK46JarZpS05prt2/eMldUVOS7cOECOzs3S2TZCsHA+omLKkQl7yHXSRjZsqVI0S3hgASAR5j0xUKU0fHBhUVKYwLvc84LRRAVll4BMCqKchHgmoZWOVq+Z/UEAoGQyWQKjY19weUX5Ec+mZZpi/Xxi6p8Ctw8yaYtRYpuCQcUNQdgSMi/7ucZd4Aq2AA+MBcQtothAF8AGFVRGHvv/fe5G64b/MzMDPuTZ37Cvt//PtXR3g6fj8Hk5ORKEUlqy0cCKAV4L8mFLUWKbkFPbf7jB5onJ4n6ge7TAFqEyCS+xqDGHeNUtmzlvaT+QPdPaqLZpcq5LUWKbtYIKBHPsz6KEBBd2QSAN+O3ktVV1VnrFM8RH0UA6JFzW4oU/V9KJfM8NWHcBp4HSFn9aI77pOZ9xMATAlJDRpVHpEiJgEABmT3Xi/yKd1C4oT/HfSrgJ9BLGfEOStGvPCJF/5/1vx3EETONqqGoAAAAAElFTkSuQmCC";
	var address_component = [];
	TMap.open = function(param) {
		var appkey = param.key;
		var dom = param.dom;
		var dialogOption = param.dialog;
		var onChoose = param.onChoose;
		dialogOption.id = 'map-choose-dialog';
		dialogOption.type = 1;
		(dialogOption.title != undefined) || (dialogOption.title = '坐标选取');
		dialogOption.content = '';
		dialogOption.area || (dialogOption.area = ['750px', '550px']);
		(dialogOption.shade != undefined) || (dialogOption.shade = .1);
		dialogOption.resize = false;
		dialogOption.skin || (dialogOption.skin = 'layer-map-choose');
		var sCallBack = param.success;
		dialogOption.success = function(layero, tIndex) {
			$(layero).children(".layui-layer-content").load(base_url_js+'res/layui/module/TMap/TMap.html', function() {
				init(tIndex);
				sCallBack && sCallBack(layero, tIndex)
			});
		};
		layer.open(dialogOption);

		function init(myIndex) {
			var urlSuffix = "&key=" + appkey + "&output=jsonp&&callback=?";
			var mapDom = document.getElementById("mapDom");
			var resDom = document.getElementById("resDom");
			var nowCity = document.getElementById("nowCity");
			var searchAdr = document.getElementById("searchAdr");
			var map = new qq.maps.Map(mapDom, {
				zoom: 10
			});
			var url3;
			var query_city;
			var listener_arr = [];
			var markerArray = [];
			var isNoValue = false;
			var label = new qq.maps.Label({
				map: map,
				offset: new qq.maps.Size(15, -12),
				draggable: false,
				clickable: false
			});
			var cityservice = new qq.maps.CityService({
				complete: function(result) {
					nowCity.children[0].innerHTML = result.detail.name;
					map.setCenter(result.detail.latLng);
				}
			});
			cityservice.searchLocalCity();
			map.setOptions({draggableCursor: "crosshair"});
			$(mapDom).mouseenter(function() {
				label.setMap(map);
			});
			$(mapDom).mouseleave(function() {
				label.setMap(null);
			});
			$("#choose-city-hover").click(function() {
				$(".city-content").fadeToggle();
			});
			qq.maps.event.addListener(map, "mousemove", function(e) {
				var latlng = e.latLng;
				label.setPosition(latlng);
				label.setContent(latlng.getLat().toFixed(6) + "," + latlng.getLng().toFixed(6))
			});
			qq.maps.event.addListener(map, "click", function(e) {
				document.getElementById("poiCur").value = e.latLng.getLat().toFixed(6) + "," + e.latLng.getLng().toFixed(6);
				url3 = encodeURI("https://apis.map.qq.com/ws/geocoder/v1/?location=" + e.latLng.getLat() + "," + e.latLng.getLng() + urlSuffix);
				$.getJSON(url3, function(result) {
					if (result.result != undefined) {
						address_component = result.result.address_component;
						document.getElementById("addrCur").value = result.result.address;
					} else {
						document.getElementById("addrCur").value = "";
					}
				});
			});
			qq.maps.event.addListener(map, "zoom_changed", function() {
				document.getElementById("mapLevel").innerHTML = "当前缩放等级：" + map.getZoom();
			});
			qq.maps.event.addDomListener(searchAdr, 'click', function() {
				var value = $("#addrText").val();
				var latlngBounds = new qq.maps.LatLngBounds();
				for (var i = 0, l = listener_arr.length; i < l; i++) {
					qq.maps.event.removeListener(listener_arr[i]);
				}
				listener_arr.length = 0;
				query_city = nowCity.children[0].innerHTML;
				var queryUrl = encodeURI("https://apis.map.qq.com/ws/place/v1/search?keyword=" + value + "&boundary=region(" + query_city + ",0)&page_size=9&page_index=1" + urlSuffix);
				$.getJSON(queryUrl, function(result) {
					if (result.count) {
						isNoValue = false;
						resDom.innerHTML = "";
						$.each(markerArray, function(n, ele) {
							ele.setMap(null);
						});
						markerArray.length = 0;
						$.each(result.data, function(n, ele) {
							var latlng = new qq.maps.LatLng(ele.location.lat, ele.location.lng);
							latlngBounds.extend(latlng);
							var left = n * 27;
							var marker = new qq.maps.Marker({
								map: map,
								position: latlng,
								zIndex: 10
							});
							marker.index = n;
							marker.isClicked = false;
							setAnchor(marker, true);
							markerArray.push(marker);
							var listener1 = qq.maps.event.addDomListener(marker, "mouseover", function() {
								var n = this.index;
								setCurrent(markerArray, n, false);
								setCurrent(markerArray, n, true);
								label.setContent(this.position.getLat().toFixed(6) + "," + this.position.getLng().toFixed(6));
								label.setPosition(this.position);
								label.setOptions({
									offset: new qq.maps.Size(15, -20)
								});
							});
							listener_arr.push(listener1);
							var listener2 = qq.maps.event.addDomListener(marker, "mouseout", function() {
								var n = this.index;
								setCurrent(markerArray, n, false);
								setCurrent(markerArray, n, true);
								label.setOptions({
									offset: new qq.maps.Size(15, -12)
								})
							});
							listener_arr.push(listener2);
							var listener3 = qq.maps.event.addDomListener(marker, "click", function() {
								var n = this.index;
								setFlagClicked(markerArray, n);
								setCurrent(markerArray, n, false);
								setCurrent(markerArray, n, true);
								address_component = ele.ad_info;
								document.getElementById("addrCur").value = resDom.childNodes[n].childNodes[1].childNodes[1].innerHTML.substring(3);
							});
							listener_arr.push(listener3);
							map.fitBounds(latlngBounds);
							var div = document.createElement("div");
							div.className = "info_list";
							var order = document.createElement("div");
							var leftn = -54 - 17 * n;
							order.style.cssText = "width:17px;height:17px;margin-top: 3px;float:left;background:url(" + marker_n + ") " + leftn + "px 0px";
							div.appendChild(order);
							var pannel = document.createElement("div");
							pannel.style.cssText = "width:90%;float:right;";
							div.appendChild(pannel);
							var name = document.createElement("p");
							name.style.cssText = "margin:0px;color:#0000CC";
							name.innerHTML = ele.title;
							pannel.appendChild(name);
							var address = document.createElement("p");
							address.style.cssText = "margin:0px;";
							address.innerHTML = "地址：" + ele.address;
							pannel.appendChild(address);
							if (ele.tel != undefined) {
								var phone = document.createElement("p");
								phone.style.cssText = "margin:0px;";
								phone.innerHTML = "电话：" + ele.tel;
								pannel.appendChild(phone);
							}
							var position = document.createElement("p");
							position.style.cssText = "margin:0px;";
							position.innerHTML = "坐标：" + ele.location.lat.toFixed(6) + "，" + ele.location.lng.toFixed(6);
							pannel.appendChild(position);
							resDom.appendChild(div);
							div.style.height = pannel.offsetHeight + "px";
							div.isClicked = false;
							div.index = n;
							marker.div = div;
							div.marker = marker;
						});
						$("#resDom").delegate(".info_list", "mouseover", function(e) {
							var n = this.index;
							setCurrent(markerArray, n, false);
							setCurrent(markerArray, n, true);
						});
						$("#resDom").delegate(".info_list", "mouseout", function() {
							$.each(markerArray, function(n, ele) {
								if (!ele.isClicked) {
									setAnchor(ele, true);
									ele.div.style.background = "#fff";
								}
							});
						});
						$("#resDom").delegate(".info_list", "click", function(e) {
							var n = this.index;
							setFlagClicked(markerArray, n);
							setCurrent(markerArray, n, false);
							setCurrent(markerArray, n, true);
							map.setCenter(markerArray[n].position);
							address_component = result.data[n].ad_info
							document.getElementById("addrCur").value = this.childNodes[1].childNodes[1].innerHTML.substring(3);
						});
					} else {
						resDom.innerHTML = "";
						$.each(markerArray, function(n, ele) {
							ele.setMap(null);
						});
						markerArray.length = 0;
						var novalue = document.createElement('div');
						novalue.id = "no_value";
						novalue.innerHTML = "对不起，没有搜索到您要找的结果!";
						resDom.appendChild(novalue);
						isNoValue = true;
					}
				});
			});
			var setAnchor = function(marker, flag) {
					var left = marker.index * 27;
					if (flag == true) {
						var anchor = new qq.maps.Point(10, 30),
							origin = new qq.maps.Point(left, 0),
							size = new qq.maps.Size(27, 33),
							icon = new qq.maps.MarkerImage(marker10, size, origin, anchor);
						marker.setIcon(icon);
					} else {
						var anchor = new qq.maps.Point(10, 30),
							origin = new qq.maps.Point(left, 35),
							size = new qq.maps.Size(27, 33),
							icon = new qq.maps.MarkerImage(marker10, size, origin, anchor);
						marker.setIcon(icon);
					}
				}
			var setCurrent = function(arr, index, isMarker) {
					if (isMarker) {
						$.each(markerArray, function(n, ele) {
							if (n == index) {
								setAnchor(ele, false);
								ele.setZIndex(10);
							} else {
								if (!ele.isClicked) {
									setAnchor(ele, true);
									ele.setZIndex(9);
								}
							}
						});
					} else {
						$.each(markerArray, function(n, ele) {
							if (n == index) {
								ele.div.style.background = "#DBE4F2";
							} else {
								if (!ele.div.isClicked) {
									ele.div.style.background = "#fff";
								}
							}
						});
					}
				}
			var setFlagClicked = function(arr, index) {
					$.each(markerArray, function(n, ele) {
						if (n == index) {
							ele.isClicked = true;
							ele.div.isClicked = true;
							var str = '<div style="width:250px;">' + ele.div.children[1].innerHTML.toString() + '</div>';
							var latLng = ele.getPosition();
							document.getElementById("poiCur").value = latLng.getLat().toFixed(6) + "," + latLng.getLng().toFixed(6);
						} else {
							ele.isClicked = false;
							ele.div.isClicked = false;
						}
					});
				}
			var city = document.getElementById("city");
			nowCity.onclick = function(e) {
				var e = e || window.event,
					target = e.target || e.srcElement;
				if (target.innerHTML == "更换城市") {
					city.style.display = "block";
					if (isNoValue) {
						bside.innerHTML = "";
						$.each(markerArray, function(n, ele) {
							ele.setMap(null);
						});
						markerArray.length = 0;
					}
				}
			};
			var url2;
			city.onclick = function(e) {
				var e = e || window.event,
					target = e.target || e.srcElement;

				if (target.className == "city_name") {
					$(".city-content").fadeOut();
					nowCity.children[0].innerHTML = target.innerHTML;
					url2 = encodeURI("https://apis.map.qq.com/ws/geocoder/v1/?&address=" + nowCity.children[0].innerHTML + urlSuffix);
					$.getJSON(url2, function(result) {

						if(result.status==0){
							map.setCenter(new qq.maps.LatLng(result.result.location.lat, result.result.location.lng));
							map.setZoom(10);
						}
					});
				}
			};
			var url4;
			$("#addrText").bind('input propertychange', function() {
				$("#autoRes").fadeIn("normal", function() {
					var keyword = $("#addrText").val();
					url4 = encodeURI("https://apis.map.qq.com/ws/place/v1/suggestion/?keyword=" + keyword + "&region=" + nowCity.children[0].innerHTML + urlSuffix);
					$.getJSON(url4, function(result) {
						var ars = "";
						$.each(result.data, function(n, ele) {
							ars += '<li class="auto-res">' + ele.title + '</li>';
						});
						$("#autoRes").empty().append(ars);
						$(".auto-res").click(function() {
							$("#addrText").val($(this).text());
						});
					});
				});
				$(this).on('blur', function() {
					$("#autoRes").fadeOut();
				});
			});
			$("#closPoint").click(function() {
				layer.close(myIndex);
			});
			$("#initPoint").click(function() {
				var point = $("#poiCur").val();
				var adress = $("#addrCur").val();
				if(point){
					onChoose && onChoose(point, adress,address_component, myIndex);
					layer.close(myIndex);
				}else{
					layer.msg('请选择地图')
				}
			});
		}
	};
	exports("TMap", TMap);
});