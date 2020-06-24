<?php echo template('shop/header',['definedcss'=>[CSS_PATH.'element/index']]);echo template('shop/sider');?>
    <div class="layui-body" id="apps">
        <div class="childrenBody childrenBody_show">
            <blockquote class="layui-elem-quote">
                1、可提现金额：<?php echo $total; ?>元 <br>
                2、最小提现金额为：<?php echo $config['lowest']; ?>元起<br>
                3、提现手续费为：<?php echo $config['sxf']; ?>
            </blockquote>
            <div class="layui-card">
                <div class="layui-card-header " >
                    我要提现（<span class="text-red">请认真填写，如填写错误造成的严重后果由客户自己承担一切责任</span>）
                </div>
                <div class="layui-card-body">

                    <el-form :model="ruleForm"  ref="ruleForm" :rules="rules" label-width="100px" class="demo-ruleForm">
                        <el-form-item label="提现方式" prop="payout_type">
                            <el-select v-model="ruleForm.payout_type" placeholder="请选择提现" @change="sel">
                                <el-option v-for="(item,index) in type" :key="index" :label="item.name" :value="item.id"></el-option>
                            </el-select>
                        </el-form-item>
                        <template v-if="sel_type==1">
                            <el-form-item label="绑定ID" prop="uid">
                                <el-input v-model="ruleForm.uid" :disabled="true"></el-input>
                            </el-form-item>
                        </template>
                        <template v-if="sel_type==2">
                            <el-form-item label="支付宝帐号" prop="alipay">
                                <el-input v-model="ruleForm.alipay"></el-input>
                            </el-form-item>
                        </template>
                        <template v-if="sel_type==3">
                            <el-form-item label="银行名称" prop="bank_name">
                                <el-input v-model="ruleForm.bank_name"></el-input>
                            </el-form-item>
                            <el-form-item label="银行卡账户" prop="bank_no">
                                <el-input v-model="ruleForm.bank_no"></el-input>
                            </el-form-item>
                        </template>
                        <template v-if="sel_type==4">
                            <el-form-item label="微信帐号" prop="weixin">
                                <el-input v-model="ruleForm.weixin"></el-input>
                            </el-form-item>
                        </template>
                        <el-form-item label="收款人姓名" prop="username">
                            <el-input v-model="ruleForm.username"></el-input>
                        </el-form-item>
                        <el-form-item label="提现金额" prop="money">
                            <el-input v-model="ruleForm.money"></el-input>
                        </el-form-item>
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
            data(){
                var check_money = (rule, value, callback)=>{
                    var reg = /^\+?[1-9][0-9]*$/;
                    if (!value) {
                        return callback(new Error('请输入提现的金额'));
                    }else if (!reg.test(value)) {
                        return callback(new Error('只支持整数金额提现'));
                    } else if(value < this.min|| value > this.max) {
                        return callback(new Error('提现金额错误'));
                    }else{
                        callback();
                    }
                };
                return {
                    min:<?php echo intval($config['lowest']); ?>,max:<?php echo intval($total); ?>,
                    ruleForm: <?php echo json_encode($field);?>,
                    sel_type:0,
                    type:<?php echo json_encode($type);?>,
                    rules: {
                        payout_type:[
                            { required: true, message: '请选择提现方式', trigger: 'change' }
                        ],
                        uid:[
                            { required: true, message: '请联系管理员绑定', trigger: 'change' }
                        ],
                        money:[
                            { validator: check_money, trigger: 'blur'},
                        ],
                        alipay:[
                            { required: true, message: '请输入支付宝帐号', trigger: 'blur' },
                        ],
                        bank_name:[
                            { required: true, message: '请输入银行卡名称', trigger: 'blur' },
                        ],
                        bank_no:[
                            { required: true, message: '请输入银行卡卡号', trigger: 'blur' },
                        ],
                        username:[
                            { required: true, message: '请输入收款人姓名', trigger: 'blur' },
                        ],
                        weixin:[
                            { required: true, message: '请输入微信号', trigger: 'blur' },
                        ],
                    }
                }

            },
            created() {

            },
            methods:{
                onSubmit(formName){
                    this.$refs[formName].validate((valid) => {
                        if (valid) {
                            $axios.post('/shop/outpay/sub',this.ruleForm).then(res=>{
                                layer.msg(res.message);
                                setTimeout(()=>{
                                    window.location.href = site_url_js+'/shop/manager/index';
                                },1500)
                            });
                        } else {
                            return false;
                        }
                    });
                },
                sel(type){
                    this.sel_type = type;
                }
            }
        })

    </script>
<?php echo template('shop/footer');?>