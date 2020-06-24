<?php echo template('shop/header',['definedcss'=>[CSS_PATH.'element/index']]);echo template('shop/sider');?>
<div class="layui-body" id="apps">
	<div class="childrenBody childrenBody_show">
		<div class="layui-card">
            <div class="layui-card-header " >
                配送设置
            </div>
			<div class="layui-card-body">
                <el-form :model="ruleForm"  ref="ruleForm" :rules="rules" label-width="100px" class="demo-ruleForm">
                    <el-form-item label="配送方式" prop="send_type">
                        <el-select v-model="ruleForm.send_type" placeholder="请选择配送方式" @change="sel">
                            <el-option v-for="(item,index) in type" :key="index" :label="item" :value="index"></el-option>
                        </el-select>
                    </el-form-item>
                    <template v-if="sel_type==2||sel_type==3">
                        <el-form-item label="平台配送人" prop="send_type">
                            <el-select v-model="ruleForm.send_id" placeholder="请选择配送人员" @change="partnerChange">
                                <el-option v-for="(item,index) in partner" :key="index" :label="item.username" :value="item.id"></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="配送费用" prop="send_money" >
                            <el-input v-model="ruleForm.send_money" :disabled="PartnerDis"></el-input>
                        </el-form-item>
                    </template>
                    <template v-if="sel_type==0||sel_type==1||sel_type==2||sel_type==3">
                        <el-form-item label="配送人员" prop="send_name">
                            <el-input v-model="ruleForm.send_name" :disabled="PartnerDis"></el-input>
                        </el-form-item>
                        <el-form-item label="配送电话" prop="send_mobile">
                            <el-input v-model="ruleForm.send_mobile" :disabled="PartnerDis"></el-input>
                        </el-form-item>
                        <el-form-item label="配送时间" prop="send_time">
                            <el-input v-model="ruleForm.send_time" :disabled="PartnerDis"></el-input>
                        </el-form-item>
                    </template>
                    <template v-if="sel_type==1||sel_type==3">
                        <el-form-item label="购物满" prop="buy_money">
                            <el-input v-model="ruleForm.buy_money"></el-input>
                        </el-form-item>
                    </template>

                    <el-form-item>
                        <el-button type="primary" @click="onSubmit('ruleForm')">立即创建</el-button>
                    </el-form-item>
                </el-form>
			</div>
		</div>
	</div>
</div>

<?php echo template('shop/script');?>
    <script type="text/javascript" src="<?php echo JS_PATH.'vue.min.js'?>"></script>
    <script type="text/javascript" src="<?php echo JS_PATH.'element/index.js'?>"></script>
    <script type="text/javascript" src="<?php echo JS_PATH.'qs.js'?>" ></script>
    <script type="text/javascript" src="<?php echo JS_PATH.'admin/axios.js'?>" ></script>
<script>
    new Vue({
        el: '#apps',
        data:{
            ruleForm: <?php echo json_encode($field);?>,
            sel_type:<?php echo intval($item['send_type']);?>,
            type:<?php echo json_encode($type);?>,
            rules: {
                send_name: [
                    { required: true, message: '请输入配送人', trigger: 'blur' },
                    { min: 2, max: 5, message: '长度在 2 到 5 个字符', trigger: 'blur' }
                ],
                send_type:[
                    { required: true, message: '请选择配送方式', trigger: 'change' }
                ],
                send_mobile:[
                    { required: true, message: '请输入手机号', trigger: 'blur' },
                    { pattern:/^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/, message: "请输入合法手机号/电话号", trigger: "blur" }
                ],
                send_time:[
                    { required: true, message: '请输入配送时间', trigger: 'blur' },
                ],
                buy_money:[
                    { required: true, message: '请输入购物满多少包邮', trigger: 'blur' },
                ],
                send_money:[
                    { required: true, message: '请输入配送费用', trigger: 'blur' },
                ],
            },
            partner:<?php echo json_encode($partner);?>,PartnerDis:false
        },
        created() {
            if(this.sel_type==2||this.sel_type==3){
                this.PartnerDis = true;
            }
        },
        methods:{
            onSubmit(formName){
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        $axios.post('/shop/manager/send',this.ruleForm).then(res=>{
                            layer.msg(res.message);
                        });
                    } else {
                        return false;
                    }
                });
            },
            partnerChange(id){
                let val = this.partner.find(res=>{
                    return res.id == id;
                })
                this.$set(this.ruleForm,'send_id',val.id);
                this.$set(this.ruleForm,'send_name',val.username);
                this.$set(this.ruleForm,'send_mobile',val.mobile);
                this.$set(this.ruleForm,'send_time',val.send_time);
                this.$set(this.ruleForm,'send_money',val.send_money);
            },
            sel(type){
                this.ruleForm = {};
                this.partner = [];
                this.PartnerDis = false;
                this.ruleForm.send_id = '';
                this.ruleForm.send_type = type;
                this.sel_type = type
                if(type==2||type==3){
                    this.onPartner();
                }
            },
            onPartner(){
                axios({
                    method: 'get',
                    url: site_url_js+'/shop/manager/get_partner'
                }).then(response => {
                    var res = response.data;
                    if(res.state==1){
                        this.partner = res.data;
                        this.PartnerDis = true;
                    }
                });
            }
        }
    })

</script>
<?php echo template('shop/footer');?>