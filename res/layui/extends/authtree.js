layui.define(["jquery","form"],function(exports){$=layui.jquery;form=layui.form;var MOD_NANE="authtree";var obj={openIconContent:"",closeIconContent:"",checkType:"checkbox",checkedIconContent:"",halfCheckedIconContent:"",notCheckedIconContent:"",checkedNode:{},notCheckedNode:{},lastCheckedNode:{},lastNotCheckedNode:{},renderedTrees:{},on:function(events,callback){return layui.onevent.call(this,MOD_NANE,events,callback)},render:function(dst,trees,opt){var inputname=opt.inputname?opt.inputname:"menuids[]";opt.inputname=inputname;var layfilter=opt.layfilter?opt.layfilter:"checkauth";opt.layfilter=layfilter;var openall=opt.openall?opt.openall:false;opt.openall=openall;var dblshow=opt.dblshow?opt.dblshow:false;opt.dblshow=dblshow;var dbltimeout=opt.dbltimeout?opt.dbltimeout:120;opt.dbltimeout=dbltimeout;var openchecked=typeof opt.openchecked!=="undefined"?opt.openchecked:true;opt.openchecked=openchecked;var autoclose=typeof opt.autoclose!=="undefined"?opt.autoclose:true;opt.autoclose=autoclose;var autochecked=typeof opt.autochecked!=="undefined"?opt.autochecked:true;opt.autochecked=autochecked;var hidechoose=typeof opt.hidechoose!=="undefined"?opt.hidechoose:false;opt.hidechoose=hidechoose;opt.prefixChildStr=opt.prefixChildStr?opt.prefixChildStr:"├─";opt.checkType=opt.checkType?opt.checkType:"checkbox";this.checkType=opt.checkType;opt.checkSkin=opt.checkSkin?opt.checkSkin:"primary";opt.openIconContent=opt.openIconContent?opt.openIconContent:"&#xe625;";this.openIconContent=opt.openIconContent;opt.closeIconContent=opt.closeIconContent?opt.closeIconContent:"&#xe623;";this.closeIconContent=opt.closeIconContent;opt.checkedIconContent=opt.checkedIconContent?opt.checkedIconContent:"&#xe605;";this.checkedIconContent=opt.checkedIconContent;opt.halfCheckedIconContent=opt.halfCheckedIconContent?opt.halfCheckedIconContent:"&#xe605;";this.halfCheckedIconContent=opt.halfCheckedIconContent;opt.notCheckedIconContent=opt.notCheckedIconContent?opt.notCheckedIconContent:"&#xe605;";this.notCheckedIconContent=opt.notCheckedIconContent;opt.checkedKey=opt.checkedKey?opt.checkedKey:"checked";opt.childKey=opt.childKey?opt.childKey:"list";opt.disabledKey=opt.disabledKey?opt.disabledKey:"disabled";opt.nameKey=opt.nameKey?opt.nameKey:"name";opt.valueKey=opt.valueKey?opt.valueKey:"value";var dblisten=true;if(dblshow){}else{if(opt.dbltimeout<=0){dblisten=false}dbltimeout=0}obj.renderedTrees[dst]={trees:trees,opt:opt};$(dst).html(obj.renderAuth(trees,0,{inputname:inputname,layfilter:layfilter,openall:openall,openchecked:openchecked,checkType:this.checkType,prefixChildStr:opt.prefixChildStr,checkedKey:opt.checkedKey,childKey:opt.childKey,disabledKey:opt.disabledKey,nameKey:opt.nameKey,valueKey:opt.valueKey,}));obj.showChecked(dst);form.render();obj._saveNodeStatus(dst);obj.autoWidth(dst);var timer=0;$(dst).find(".auth-single:first").unbind("click").on("click",".layui-form-checkbox,.layui-form-radio",function(event){var that=this;clearTimeout(timer);timer=setTimeout(function(){var elem=$(that).prev();var checked=elem.is(":checked");if(autochecked){if(checked){elem.parents(".auth-child").prev().find('.authtree-checkitem:not(:disabled)[type="checkbox"]').prop("checked",true)}elem.parent().next().find('.authtree-checkitem:not(:disabled)[type="checkbox"]').prop("checked",checked)}if(autoclose){if(checked){}else{obj._autoclose($(that).parent())}}form.render("checkbox");form.render("radio");obj._saveNodeStatus(dst);obj._triggerEvent(dst,"change",{othis:$(that),oinput:elem,value:elem.val(),});obj.autoWidth(dst)},dbltimeout);return false});$(dst).unbind("click").on("click",".auth-icon",function(){obj.iconToggle(dst,this)});$(dst).find(".auth-single:first").unbind("dblclick").on("dblclick",".layui-form-checkbox,.layui-form-radio",function(e){obj._triggerEvent(dst,"dblclick",{othis:$(this),elem:$(this).prev(),value:$(this).prev().val(),});if(dblshow){clearTimeout(timer);obj.iconToggle(dst,$(this).prevAll(".auth-icon:first"))}}).on("selectstart",function(){return false})},_autoclose:function(obj){var single=$(obj).parent().parent();var authStatus=single.parent().prev();if(!authStatus.hasClass("auth-status")){return false}if(single.find('div>.auth-status>input.authtree-checkitem:not(:disabled)[type="checkbox"]:checked').length===0){authStatus.find('.authtree-checkitem:not(:disabled)[type="checkbox"]').prop("checked",false);this._autoclose(authStatus)}},iconToggle:function(dst,iconobj){var origin=$(iconobj);var child=origin.parent().parent().find(".auth-child:first");if(origin.is(".active")){origin.removeClass("active").html(obj.closeIconContent);child.slideUp("fast")}else{origin.addClass("active").html(obj.openIconContent);child.slideDown("fast")}obj._triggerEvent(dst,"deptChange");return false},renderAuth:function(tree,dept,opt){var inputname=opt.inputname;var layfilter=opt.layfilter;var openall=opt.openall;var str='<div class="auth-single">';var checkedKey=opt.checkedKey;var childKey=opt.childKey;var disabledKey=opt.disabledKey;var nameKey=opt.nameKey;var valueKey=opt.valueKey;layui.each(tree,function(index,item){var hasChild=(item[childKey]&&(item[childKey].length||!$.isEmptyObject(item[childKey].length)))?1:0;var append=hasChild?obj.renderAuth(item[childKey],dept+1,opt):"";var openstatus=openall||(opt.openchecked&&item.checked);str+='<div><div class="auth-status" style="display: flex;flex-direction: row;align-items: flex-end;"> '+(hasChild?'<i class="layui-icon auth-icon '+(openstatus?"active":"")+'" style="cursor:pointer;">'+(openstatus?obj.openIconContent:obj.closeIconContent)+"</i>":'<i class="layui-icon auth-leaf" style="opacity:0;color: transparent;">&#xe63f;</i>')+(dept>0?("<span>"+opt.prefixChildStr+" </span>"):"")+'<input class="authtree-checkitem" type="'+opt.checkType+'" name="'+inputname+'" title="'+item[nameKey]+'" value="'+item[valueKey]+'" lay-skin="primary" lay-filter="'+layfilter+'" '+(item[checkedKey]?' checked="checked"':"")+(item[disabledKey]?" disabled":"")+"> </div>"+' <div class="auth-child" style="'+(openstatus?"":"display:none;")+'padding-left:40px;"> '+append+"</div></div>"});str+="</div>";return str},showChecked:function(dst){$(dst).find(".authtree-checkitem:checked").parents(".auth-child").show()},listConvert:function(list,opt){opt.primaryKey=opt.primaryKey?opt.primaryKey:"id";opt.parentKey=opt.parentKey?opt.parentKey:"pid";opt.startPid=opt.startPid?opt.startPid:0;opt.currentDept=opt.currentDept?opt.currentDept:0;opt.maxDept=opt.maxDept?opt.maxDept:100;opt.childKey=opt.childKey?opt.childKey:"list";opt.checkedKey=opt.checkedKey?opt.checkedKey:"checked";opt.disabledKey=opt.disabledKey?opt.disabledKey:"disabled";opt.nameKey=opt.nameKey?opt.nameKey:"name";opt.valueKey=opt.valueKey?opt.valueKey:"id";return this._listToTree(list,opt.startPid,opt.currentDept,opt)},_listToTree:function(list,startPid,currentDept,opt){if(opt.maxDept<currentDept){return[]}var child=[];for(index in list){var item=list[index];if(typeof item[opt.parentKey]!=="undefined"&&item[opt.parentKey]===startPid){var nextChild=this._listToTree(list,item[opt.primaryKey],currentDept+1,opt);var node={};if(nextChild.length>0){node[opt.childKey]=nextChild}node["name"]=item[opt.nameKey];node["value"]=item[opt.valueKey];if(typeof opt.checkedKey==="string"||typeof opt.checkedKey==="number"){node["checked"]=item[opt.checkedKey]}else{if(typeof opt.checkedKey==="object"){if($.inArray(item[opt.valueKey],opt.checkedKey)!=-1){node["checked"]=true}else{node["checked"]=false}}else{node["checked"]=false}}if(typeof opt.disabledKey==="string"||typeof opt.disabledKey==="number"){node["disabled"]=item[opt.disabledKey]}else{if(typeof opt.disabledKey==="object"){if($.inArray(item[opt.valueKey],opt.disabledKey)!=-1){node["disabled"]=true}else{node["disabled"]=false}}else{node["disabled"]=false}}child.push(node)}}return child},treeConvertSelect:function(tree,opt){if(typeof tree.length!=="number"||tree.length<=0){return[]}opt.currentDept=opt.currentDept?opt.currentDept:0;opt.childKey=opt.childKey?opt.childKey:"list";opt.valueKey=opt.valueKey?opt.valueKey:"value";opt.checkedKey=opt.checkedKey?opt.checkedKey:"checked";opt.disabledKey=opt.disabledKey?opt.disabledKey:"disabled";opt.prefixChildStr=opt.prefixChildStr?opt.prefixChildStr:"├─ ";opt.prefixNoChildStr=opt.prefixNoChildStr?opt.prefixNoChildStr:"● ";opt.prefixDeptStr=opt.prefixDeptStr?opt.prefixDeptStr:"　";opt.prefixFirstEmpty=opt.prefixFirstEmpty?opt.prefixFirstEmpty:"　　";return this._treeToSelect(tree,opt.currentDept,opt)},_treeToSelect:function(tree,currentDept,opt){var ansList=[];var prefix="";for(var i=0;i<currentDept;i++){prefix+=opt.prefixDeptStr}for(index in tree){var child_flag=0;var item=tree[index];if(opt.childKey in item&&item[opt.childKey]&&item[opt.childKey].length>0){child_flag=1}var name=item.name;if(child_flag){name=opt.prefixChildStr+name}else{if(currentDept>1){name=opt.prefixNoChildStr+name}else{name=opt.prefixFirstEmpty+name}}ansList.push({name:prefix+name,value:item[opt.valueKey],checked:item[opt.checkedKey],disabled:item[opt.disabledKey],});if(child_flag){var child=this._treeToSelect(item[opt.childKey],currentDept+1,opt);ansList.push.apply(ansList,child)}}return ansList},autoWidth:function(dst){var tree=this.getRenderedInfo(dst);var opt=tree.opt;$(dst).css({"whiteSpace":"nowrap","maxWidth":"100%",});$(dst).find(".layui-form-checkbox,.layui-form-radio,.layui-form-audio").each(function(index,item){if($(this).is(":hidden")){$("body").append('<div id="layui-authtree-get-width">'+$(this).html()+"</div>");$width=$("#layui-authtree-get-width").find("span").width()+$("#layui-authtree-get-width").find("i").width()+29;$("#layui-authtree-get-width").remove()}else{$width=$(this).find("span").width()+$(this).find("i").width()+25}$(this).width($width);if(opt.hidechoose){$(this).prevAll("i").css({zIndex:2,});$(this).css({position:"relative",left:function(){return"-"+$(this).css("padding-left")}}).find("i").hide()}})},_triggerEvent:function(dst,events,other){var tree=this.getRenderedInfo(dst);var origin=$(dst);if(tree){var opt=tree.opt;var data={opt:opt,tree:tree.trees,dst:dst,othis:origin,};if(other&&typeof other==="object"){data=$.extend(data,other)}layui.event.call(origin,MOD_NANE,events+"("+dst+")",data);layui.event.call(origin,MOD_NANE,events+"("+opt.layfilter+")",data)}else{return false}},getRenderedInfo:function(dst){return this.renderedTrees[dst]},getMaxDept:function(dst){var next=$(dst);var dept=0;while(next.length&&dept<100000){next=this._getNext(next);if(next.length){dept++}else{break}}return dept},checkAll:function(dst){var origin=$(dst);origin.find(".authtree-checkitem:not(:disabled):not(:checked)").prop("checked",true);form.render("checkbox");form.render("radio");obj.autoWidth(dst);obj._saveNodeStatus(dst);obj._triggerEvent(dst,"change");obj._triggerEvent(dst,"checkAll")},uncheckAll:function(dst){var origin=$(dst);origin.find(".authtree-checkitem:not(:disabled):checked").prop("checked",false);form.render("checkbox");form.render("radio");obj.autoWidth(dst);obj._saveNodeStatus(dst);obj._triggerEvent(dst,"change");obj._triggerEvent(dst,"uncheckAll")},showAll:function(dst){this.showDept(dst,this.getMaxDept(dst))},closeAll:function(dst){this.closeDept(dst,1)},toggleAll:function(dst){if(this._shownDept(2)){this.closeDept(dst)}else{this.showAll(dst)}},showDept:function(dst,dept){var next=$(dst);for(var i=1;i<dept;i++){next=this._getNext(next);if(next.length){this._showSingle(next)}else{break}}obj._triggerEvent(dst,"deptChange",{dept:dept})},closeDept:function(dst,dept){var next=$(dst);for(var i=0;i<dept;i++){next=this._getNext(next)}while(next.length){this._closeSingle(next);next=this._getNext(next)}obj._triggerEvent(dst,"deptChange",{dept:dept})},_saveNodeStatus:function(dst){var currentChecked=this.getChecked(dst);var currentNotChecked=this.getNotChecked(dst);this.lastCheckedNode[dst]=this._getLastChecked(dst,currentChecked,currentNotChecked);this.lastNotCheckedNode[dst]=this._getLastNotChecked(dst,currentChecked,currentNotChecked);this.checkedNode[dst]=currentChecked;this.notCheckedNode[dst]=currentNotChecked},_shownDept:function(dst,dept){var next=$(dst);for(var i=0;i<dept;i++){next=this._getNext(next)}return !next.is(":hidden")},_getNext:function(dst){return $(dst).find(".auth-single:first>div>.auth-child")},_showSingle:function(dst){layui.each(dst,function(index,item){var origin=$(item).find(".auth-single:first");var parentChild=origin.parent();var parentStatus=parentChild.prev();if(!parentStatus.find(".auth-icon").hasClass("active")){parentChild.show();parentStatus.find(".auth-icon").addClass("active").html(obj.openIconContent)}})},_closeSingle:function(dst){var origin=$(dst).find(".auth-single:first");var parentChild=origin.parent();var parentStatus=parentChild.prev();if(parentStatus.find(".auth-icon").hasClass("active")){parentChild.hide();parentStatus.find(".auth-icon").removeClass("active").html(obj.closeIconContent)}},getLeaf:function(dst){var leafs=$(dst).find(".auth-leaf").parent().find(".authtree-checkitem:checked");var data=[];leafs.each(function(index,item){data.push(item.value)});return data},getAll:function(dst){var inputs=$(dst).find(".authtree-checkitem");var data=[];inputs.each(function(index,item){data.push(item.value)});return data},getLastChecked:function(dst){return this.lastCheckedNode[dst]||[]},_getLastChecked:function(dst,currentChecked,currentNotChecked){var lastCheckedNode=currentChecked;var data=[];for(i in lastCheckedNode){if($.inArray(lastCheckedNode[i],this.notCheckedNode[dst])!=-1){data.push(lastCheckedNode[i])}}return data},getChecked:function(dst){var inputs=$(dst).find(".authtree-checkitem:checked");var data=[];inputs.each(function(index,item){data.push(item.value)});return data},getLastNotChecked:function(dst){return this.lastNotCheckedNode[dst]||[]},_getLastNotChecked:function(dst,currentChecked,currentNotChecked){var lastNotCheckedNode=currentNotChecked;var data=[];for(i in lastNotCheckedNode){if($.inArray(lastNotCheckedNode[i],this.checkedNode[dst])!=-1){data.push(lastNotCheckedNode[i])}}return data},getNotChecked:function(dst){var inputs=$(dst).find(".authtree-checkitem:not(:checked)");var data=[];inputs.each(function(index,item){data.push(item.value)});return data}};exports("authtree",obj)});