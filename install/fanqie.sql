
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ctshop_ad`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_ad`;
CREATE TABLE `ctshop_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) DEFAULT '' COMMENT '图片',
  `url` varchar(255) DEFAULT '',
  `sort` int(11) DEFAULT '0',
  `urlcat` int(11) DEFAULT '1',
  `gid` int(11) DEFAULT '0',
  `say` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ctshop_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `ctshop_ad_group`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_ad_group`;
CREATE TABLE `ctshop_ad_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ctshop_ad_group
-- ----------------------------

-- ----------------------------
-- Table structure for `ctshop_article`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_article`;
CREATE TABLE `ctshop_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `info` varchar(255) DEFAULT '',
  `content` text,
  `s_title` varchar(255) DEFAULT '',
  `s_info` varchar(255) DEFAULT '',
  `s_thumb` varchar(255) DEFAULT '',
  `sort` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ctshop_article
-- ----------------------------
INSERT INTO `ctshop_article` VALUES ('3', '1', '区域合伙人入住说明', '', null, '<p>合伙人说明</p><p>合伙人说明</p><p>合伙人说明</p>', '', '', '', '0', '1', '1584700355');
INSERT INTO `ctshop_article` VALUES ('4', '1', '分销商入住说明', '', null, '<p>分销商入住说明</p><p>分销商入住说明</p><p>分销商入住说明</p>', '分销商入住说明', '分销商入住说明', '', '0', '1', '1585104720');
INSERT INTO `ctshop_article` VALUES ('2', '1', '商家入住说明', '', null, '<p><br/></p><p>商家入住请看一下规则：</p><p>1、价格优势</p><p>2、优化优势</p><p>3、及时处理</p>', '1', '1', '', '0', '1', '1583594269');
INSERT INTO `ctshop_article` VALUES ('5', '1', '关于我们', '', null, '<p style="text-align: center;"><span style="color: rgb(255, 0, 0);"><strong>&nbsp; &nbsp;斯蒂芬阿斯蒂芬</strong></span></p><p>sdafa</p><p><br/></p><p style="text-align: center;">sdf</p>', '', '', '', '0', '1', '1585643893');
INSERT INTO `ctshop_article` VALUES ('6', '5', '宅在家的春节，请收下新时代文明实践中心为您提供的居家攻略！', 'http://shop.chaituans.com/res/upload/images/2019/08/05/15649643375d4775f10143c.jpg', null, '<p>少时诵诗书</p>', '', '', '', '0', '1', '1585884874');
INSERT INTO `ctshop_article` VALUES ('7', '4', '努力的人生、平淡才是生活的主题', 'http://shop.chaituans.com/res/upload/images/2019/08/05/15649660085d477c7874b88.jpg', null, '<p><br/></p><p><br/></p><p>你好啊啊<br/></p><p><br/></p><p>你好啊啊</p><p><br/></p><p>你好啊啊</p>', '', '', '', '0', '1', '1585884913');
INSERT INTO `ctshop_article` VALUES ('8', '3', '不增加产品库存,不投入额外资金,不承担任何风险', 'http://shop.chaituans.com/res/upload/images/2019/08/05/15649661545d477d0ab6da5.jpg', null, '<p>你好啊啊</p><p><br/></p><p>你好啊啊</p><p><br/></p><p><br/></p><p>你好啊啊</p>', '', '', '', '0', '1', '1585884928');

-- ----------------------------
-- Table structure for `ctshop_article_group`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_article_group`;
CREATE TABLE `ctshop_article_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) DEFAULT '',
  `icon` varchar(255) DEFAULT '',
  `status` tinyint(4) DEFAULT '1',
  `parent_id` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ctshop_article_group
-- ----------------------------
INSERT INTO `ctshop_article_group` VALUES ('1', '系统说明', 'http://www.fanqie_shop.my/res/upload/images/2019/08/01/15646263095d424d85e9a5a.jpg', '1', '0', '0');
INSERT INTO `ctshop_article_group` VALUES ('2', '首页资讯', '', '1', '0', '0');
INSERT INTO `ctshop_article_group` VALUES ('3', '周边好货', '', '1', '2', '0');
INSERT INTO `ctshop_article_group` VALUES ('4', '生活主题', '', '1', '2', '0');
INSERT INTO `ctshop_article_group` VALUES ('5', '居家攻略', '', '1', '2', '0');

-- ----------------------------
-- Table structure for `ctshop_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_delivery`;
CREATE TABLE `ctshop_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `method` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ctshop_delivery
-- ----------------------------
INSERT INTO `ctshop_delivery` VALUES ('10007', '运费模版', '20', '0', '1583916862', '1');

-- ----------------------------
-- Table structure for `ctshop_delivery_rule`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_delivery_rule`;
CREATE TABLE `ctshop_delivery_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) unsigned NOT NULL DEFAULT '0',
  `region` text NOT NULL,
  `first` double unsigned NOT NULL DEFAULT '0',
  `first_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `additional` double unsigned NOT NULL DEFAULT '0',
  `additional_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `days` int(3) NOT NULL DEFAULT '0' COMMENT '时效：天',
  `create_time` int(11) unsigned NOT NULL,
  `exemption_fee_condition` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10061 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ctshop_delivery_rule
-- ----------------------------
INSERT INTO `ctshop_delivery_rule` VALUES ('10060', '10007', '150100,150200,150300,150400,150500,150600,150700,150800,150900,152200,152500,152900,210100,210200,210300,210400,210500,210600,210700,210800,210900,211000,211100,211200,211300,211400,211500,220100,220200,220300,220400,220500,220600,220700,220800,222400,230100,230200,230300,230400,230500,230600,230700,230800,230900,231000,231100,231200,232700,460100,460200,460300,469000,530100,530300,530400,530500,530600,530700,530800,530900,532300,532500,532600,532800,532900,533100,533300,533400,540100,540200,540300,542200,542400,542500,542600,620100,620200,620300,620400,620500,620600,620700,620800,620900,621000,621100,621200,622900,623000,630100,630200,632200,632300,632500,632600,632700,632800,640100,640200,640300,640400,640500,650100,650200,652100,652200,652300,652700,652800,652900,653000,653100,653200,654000,654200,654300,659000', '1', '15.00', '1', '9.00', '0', '1587608881', '0.00');
INSERT INTO `ctshop_delivery_rule` VALUES ('10058', '10007', '310100,320100,320200,320300,320400,320500,320600,320700,320800,320900,321000,321100,321200,321300,330100,330200,330300,330400,330500,330600,330700,330800,330900,331000,331100,331200', '1', '6.00', '1', '1.00', '0', '1587608881', '0.00');
INSERT INTO `ctshop_delivery_rule` VALUES ('10059', '10007', '110100,120100,130100,130200,130300,130400,130500,130600,130700,130800,130900,131000,131100,140100,140200,140300,140400,140500,140600,140700,140800,140900,141000,141100,340100,340200,340300,340400,340500,340600,340700,340800,341000,341100,341200,341300,341500,341600,341700,341800,350100,350200,350300,350400,350500,350600,350700,350800,350900,360100,360200,360300,360400,360500,360600,360700,360800,360900,361000,361100,370100,370200,370300,370400,370500,370600,370700,370800,370900,371000,371100,371200,371300,371400,371500,371600,371700,410100,410200,410300,410400,410500,410600,410700,410800,410900,411000,411100,411200,411300,411400,411500,411600,411700,419000,420100,420200,420300,420500,420600,420700,420800,420900,421000,421100,421200,421300,422800,429000,430100,430200,430300,430400,430500,430600,430700,430800,430900,431000,431100,431200,431300,433100,440100,440200,440300,440400,440500,440600,440700,440800,440900,441200,441300,441400,441500,441600,441700,441800,441900,442000,445100,445200,445300,450100,450200,450300,450400,450500,450600,450700,450800,450900,451000,451100,451200,451300,451400,500100,500300,510100,510300,510400,510500,510600,510700,510800,510900,511000,511100,511300,511400,511500,511600,511700,511800,511900,512000,513200,513300,513400,520100,520200,520300,520400,520500,520600,522300,522600,522700,610100,610200,610300,610400,610500,610600,610700,610800,610900,611000,611100', '2', '0.01', '1', '0.01', '10', '1587608881', '0.00');

-- ----------------------------
-- Table structure for `ctshop_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_feedback`;
CREATE TABLE `ctshop_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `nickname` varchar(255) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ctshop_feedback
-- ----------------------------
INSERT INTO `ctshop_feedback` VALUES ('1', '3', 'Allen', '请加一个积分商城', '1585645810');

-- ----------------------------
-- Table structure for `ctshop_fx_bill`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_fx_bill`;
CREATE TABLE `ctshop_fx_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '收益人ID',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '收益来源id',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `sxf` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `src` varchar(255) NOT NULL DEFAULT '',
  `ands` varchar(10) NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(5) NOT NULL DEFAULT '0',
  `status` tinyint(5) unsigned NOT NULL DEFAULT '1',
  `mark` varchar(255) DEFAULT '',
  `payout_data` varchar(500) DEFAULT '',
  `payout_type` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户收益明细表';


-- ----------------------------
-- Table structure for `ctshop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_goods`;
CREATE TABLE `ctshop_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `info` varchar(255) DEFAULT '',
  `thumb` varchar(255) NOT NULL,
  `thumb_arr` varchar(1000) NOT NULL,
  `video` varchar(255) DEFAULT '',
  `video_url` varchar(255) DEFAULT '',
  `group_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `ot_price` decimal(10,2) NOT NULL,
  `integral` int(11) DEFAULT '0',
  `sales` int(11) DEFAULT '0',
  `ficti` int(11) DEFAULT '0',
  `stock` int(11) unsigned NOT NULL DEFAULT '0',
  `browes` int(11) DEFAULT '0',
  `content` text NOT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `sku_titles` text,
  `sku_options` text,
  `sku_stock` text,
  `sku_paths` text,
  `sku_price` text,
  `hb_img` varchar(255) DEFAULT '',
  `hb_x` varchar(20) DEFAULT '',
  `hb_y` varchar(20) DEFAULT '',
  `add_time` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `yj_money` varchar(20) DEFAULT '',
  `p_1` varchar(20) DEFAULT '',
  `p_2` varchar(20) DEFAULT '',
  `top_time` int(11) DEFAULT '0',
  `burst` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ctshop_goods_cart`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_goods_cart`;
CREATE TABLE `ctshop_goods_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `shop_title` varchar(255) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_title` varchar(255) NOT NULL,
  `goods_thumb` varchar(255) NOT NULL,
  `sku_path` varchar(255) DEFAULT '',
  `sku_opt` varchar(255) DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL,
  `num` int(11) NOT NULL,
  `total` decimal(10,2) unsigned NOT NULL,
  `add_time` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `goods_type` tinyint(2) NOT NULL,
  `cart_sel` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ctshop_goods_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `ctshop_goods_collect`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_goods_collect`;
CREATE TABLE `ctshop_goods_collect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `type` int(11) NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`goods_id`,`type`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ctshop_goods_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `ctshop_goods_comment`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_goods_comment`;
CREATE TABLE `ctshop_goods_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `comment` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `reply_content` varchar(255) DEFAULT '',
  `reply_time` int(11) DEFAULT '0',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ctshop_goods_footmark`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_goods_footmark`;
CREATE TABLE `ctshop_goods_footmark` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `type` int(11) NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`goods_id`,`type`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


-- ----------------------------
-- Table structure for `ctshop_goods_group`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_goods_group`;
CREATE TABLE `ctshop_goods_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sort` mediumint(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `thumb` varchar(255) DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_base` (`status`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Table structure for `ctshop_goods_order`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_goods_order`;
CREATE TABLE `ctshop_goods_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(80) NOT NULL,
  `order_no_main` varchar(80) DEFAULT '',
  `order_no_type` tinyint(4) NOT NULL DEFAULT '1',
  `edit_order_no` varchar(80) DEFAULT '',
  `uid` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `a_name` varchar(50) DEFAULT '',
  `a_mobile` varchar(15) DEFAULT '',
  `a_address` varchar(255) DEFAULT '',
  `total` decimal(10,2) unsigned NOT NULL,
  `pay_price` decimal(10,2) unsigned DEFAULT '0.00',
  `pay_type` tinyint(2) NOT NULL,
  `pay_time` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `refund_status` int(11) DEFAULT '1',
  `refund_thumb` varchar(255) DEFAULT '',
  `refund_say` varchar(255) DEFAULT '',
  `refund_time` int(11) DEFAULT '0',
  `refund_mark` varchar(255) DEFAULT '',
  `refund_no_say` varchar(255) DEFAULT '',
  `refund_money` decimal(10,2) DEFAULT '0.00',
  `refund_order_no` varchar(255) DEFAULT '',
  `send_type` tinyint(2) NOT NULL,
  `send_id` int(11) DEFAULT '0',
  `send_name` varchar(255) DEFAULT '',
  `send_mobile` varchar(20) DEFAULT '',
  `send_time` varchar(50) DEFAULT '',
  `send_money` decimal(10,2) DEFAULT '0.00',
  `use_integral` int(11) unsigned DEFAULT '0',
  `gain_integral` int(11) unsigned DEFAULT '0',
  `mark` varchar(255) DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  `transaction_id` varchar(255) DEFAULT '',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ctshop_goods_order_lists`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_goods_order_lists`;
CREATE TABLE `ctshop_goods_order_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_nos` varchar(50) NOT NULL,
  `order_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `num` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `sku_path` varchar(255) DEFAULT '',
  `sku_opt` varchar(255) DEFAULT '',
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ctshop_message`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_message`;
CREATE TABLE `ctshop_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `status` tinyint(4) DEFAULT '1',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



-- ----------------------------
-- Table structure for `ctshop_partner`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_partner`;
CREATE TABLE `ctshop_partner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT '',
  `send_time` varchar(255) DEFAULT '次日送达',
  `send_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ctshop_partner_bill`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_partner_bill`;
CREATE TABLE `ctshop_partner_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '收益人ID',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `sxf` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `src` varchar(255) NOT NULL,
  `ands` varchar(10) NOT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(5) NOT NULL DEFAULT '0',
  `status` tinyint(5) unsigned NOT NULL DEFAULT '1',
  `payout_type` tinyint(4) DEFAULT '0',
  `payout_data` varchar(500) DEFAULT '',
  `mark` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户收益明细表';





-- ----------------------------
-- Table structure for `ctshop_region`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_region`;
CREATE TABLE `ctshop_region` (
  `id` int(11) NOT NULL COMMENT '区域主键',
  `name` varchar(40) DEFAULT '' COMMENT '区域名称',
  `pid` int(11) DEFAULT '0' COMMENT '区域上级标识',
  `sname` varchar(40) DEFAULT '' COMMENT '地名简称',
  `level` int(11) DEFAULT '0' COMMENT '区域等级',
  `citycode` varchar(20) DEFAULT '' COMMENT '区域编码',
  `yzcode` varchar(20) DEFAULT '' COMMENT '邮政编码',
  `mername` varchar(100) DEFAULT '' COMMENT '组合名称',
  `Lng` float NOT NULL,
  `Lat` float NOT NULL,
  `pinyin` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ctshop_region
-- ----------------------------
INSERT INTO `ctshop_region` VALUES ('100000', '中国', '0', '中国', '0', '', '', '中国', '116.368', '39.9151', 'China');
INSERT INTO `ctshop_region` VALUES ('110000', '北京', '100000', '北京', '1', '', '', '中国,北京', '116.405', '39.905', 'Beijing');
INSERT INTO `ctshop_region` VALUES ('110100', '北京市', '110000', '北京', '2', '010', '100000', '中国,北京,北京市', '116.405', '39.905', 'Beijing');
INSERT INTO `ctshop_region` VALUES ('110101', '东城区', '110100', '东城', '3', '010', '100010', '中国,北京,北京市,东城区', '116.41', '39.9316', 'Dongcheng');
INSERT INTO `ctshop_region` VALUES ('110102', '西城区', '110100', '西城', '3', '010', '100032', '中国,北京,北京市,西城区', '116.36', '39.9305', 'Xicheng');
INSERT INTO `ctshop_region` VALUES ('110105', '朝阳区', '110100', '朝阳', '3', '010', '100020', '中国,北京,北京市,朝阳区', '116.485', '39.9484', 'Chaoyang');
INSERT INTO `ctshop_region` VALUES ('110106', '丰台区', '110100', '丰台', '3', '010', '100071', '中国,北京,北京市,丰台区', '116.286', '39.8585', 'Fengtai');
INSERT INTO `ctshop_region` VALUES ('110107', '石景山区', '110100', '石景山', '3', '010', '100043', '中国,北京,北京市,石景山区', '116.223', '39.9056', 'Shijingshan');
INSERT INTO `ctshop_region` VALUES ('110108', '海淀区', '110100', '海淀', '3', '010', '100089', '中国,北京,北京市,海淀区', '116.298', '39.9593', 'Haidian');
INSERT INTO `ctshop_region` VALUES ('110109', '门头沟区', '110100', '门头沟', '3', '010', '102300', '中国,北京,北京市,门头沟区', '116.101', '39.9404', 'Mentougou');
INSERT INTO `ctshop_region` VALUES ('110111', '房山区', '110100', '房山', '3', '010', '102488', '中国,北京,北京市,房山区', '116.143', '39.7479', 'Fangshan');
INSERT INTO `ctshop_region` VALUES ('110112', '通州区', '110100', '通州', '3', '010', '101149', '中国,北京,北京市,通州区', '116.657', '39.9097', 'Tongzhou');
INSERT INTO `ctshop_region` VALUES ('110113', '顺义区', '110100', '顺义', '3', '010', '101300', '中国,北京,北京市,顺义区', '116.654', '40.1302', 'Shunyi');
INSERT INTO `ctshop_region` VALUES ('110114', '昌平区', '110100', '昌平', '3', '010', '102200', '中国,北京,北京市,昌平区', '116.231', '40.2207', 'Changping');
INSERT INTO `ctshop_region` VALUES ('110115', '大兴区', '110100', '大兴', '3', '010', '102600', '中国,北京,北京市,大兴区', '116.341', '39.7267', 'Daxing');
INSERT INTO `ctshop_region` VALUES ('110116', '怀柔区', '110100', '怀柔', '3', '010', '101400', '中国,北京,北京市,怀柔区', '116.632', '40.316', 'Huairou');
INSERT INTO `ctshop_region` VALUES ('110117', '平谷区', '110100', '平谷', '3', '010', '101200', '中国,北京,北京市,平谷区', '117.121', '40.1406', 'Pinggu');
INSERT INTO `ctshop_region` VALUES ('110228', '密云县', '110100', '密云', '3', '010', '101500', '中国,北京,北京市,密云县', '116.843', '40.3762', 'Miyun');
INSERT INTO `ctshop_region` VALUES ('110229', '延庆县', '110100', '延庆', '3', '010', '102100', '中国,北京,北京市,延庆县', '115.975', '40.4567', 'Yanqing');
INSERT INTO `ctshop_region` VALUES ('120000', '天津', '100000', '天津', '1', '', '', '中国,天津', '117.19', '39.1256', 'Tianjin');
INSERT INTO `ctshop_region` VALUES ('120100', '天津市', '120000', '天津', '2', '022', '300000', '中国,天津,天津市', '117.19', '39.1256', 'Tianjin');
INSERT INTO `ctshop_region` VALUES ('120101', '和平区', '120100', '和平', '3', '022', '300041', '中国,天津,天津市,和平区', '117.215', '39.1172', 'Heping');
INSERT INTO `ctshop_region` VALUES ('120102', '河东区', '120100', '河东', '3', '022', '300171', '中国,天津,天津市,河东区', '117.226', '39.1232', 'Hedong');
INSERT INTO `ctshop_region` VALUES ('120103', '河西区', '120100', '河西', '3', '022', '300202', '中国,天津,天津市,河西区', '117.223', '39.1096', 'Hexi');
INSERT INTO `ctshop_region` VALUES ('120104', '南开区', '120100', '南开', '3', '022', '300110', '中国,天津,天津市,南开区', '117.151', '39.1382', 'Nankai');
INSERT INTO `ctshop_region` VALUES ('120105', '河北区', '120100', '河北', '3', '022', '300143', '中国,天津,天津市,河北区', '117.197', '39.1482', 'Hebei');
INSERT INTO `ctshop_region` VALUES ('120106', '红桥区', '120100', '红桥', '3', '022', '300131', '中国,天津,天津市,红桥区', '117.151', '39.1671', 'Hongqiao');
INSERT INTO `ctshop_region` VALUES ('120110', '东丽区', '120100', '东丽', '3', '022', '300300', '中国,天津,天津市,东丽区', '117.314', '39.0863', 'Dongli');
INSERT INTO `ctshop_region` VALUES ('120111', '西青区', '120100', '西青', '3', '022', '300380', '中国,天津,天津市,西青区', '117.009', '39.1412', 'Xiqing');
INSERT INTO `ctshop_region` VALUES ('120112', '津南区', '120100', '津南', '3', '022', '300350', '中国,天津,天津市,津南区', '117.385', '38.9914', 'Jinnan');
INSERT INTO `ctshop_region` VALUES ('120113', '北辰区', '120100', '北辰', '3', '022', '300400', '中国,天津,天津市,北辰区', '117.132', '39.2213', 'Beichen');
INSERT INTO `ctshop_region` VALUES ('120114', '武清区', '120100', '武清', '3', '022', '301700', '中国,天津,天津市,武清区', '117.044', '39.3842', 'Wuqing');
INSERT INTO `ctshop_region` VALUES ('120115', '宝坻区', '120100', '宝坻', '3', '022', '301800', '中国,天津,天津市,宝坻区', '117.31', '39.7176', 'Baodi');
INSERT INTO `ctshop_region` VALUES ('120116', '滨海新区', '120100', '滨海新区', '3', '022', '300451', '中国,天津,天津市,滨海新区', '117.702', '39.0267', 'Binhaixinqu');
INSERT INTO `ctshop_region` VALUES ('120221', '宁河县', '120100', '宁河', '3', '022', '301500', '中国,天津,天津市,宁河县', '117.826', '39.3305', 'Ninghe');
INSERT INTO `ctshop_region` VALUES ('120223', '静海县', '120100', '静海', '3', '022', '301600', '中国,天津,天津市,静海县', '116.974', '38.9458', 'Jinghai');
INSERT INTO `ctshop_region` VALUES ('120225', '蓟县', '120100', '蓟县', '3', '022', '301900', '中国,天津,天津市,蓟县', '117.408', '40.0457', 'Jixian');
INSERT INTO `ctshop_region` VALUES ('130000', '河北省', '100000', '河北', '1', '', '', '中国,河北省', '114.502', '38.0455', 'Hebei');
INSERT INTO `ctshop_region` VALUES ('130100', '石家庄市', '130000', '石家庄', '2', '0311', '050011', '中国,河北省,石家庄市', '114.502', '38.0455', 'Shijiazhuang');
INSERT INTO `ctshop_region` VALUES ('130102', '长安区', '130100', '长安', '3', '0311', '050011', '中国,河北省,石家庄市,长安区', '114.539', '38.0367', 'Chang\'an');
INSERT INTO `ctshop_region` VALUES ('130104', '桥西区', '130100', '桥西', '3', '0311', '050091', '中国,河北省,石家庄市,桥西区', '114.47', '38.0322', 'Qiaoxi');
INSERT INTO `ctshop_region` VALUES ('130105', '新华区', '130100', '新华', '3', '0311', '050051', '中国,河北省,石家庄市,新华区', '114.463', '38.0509', 'Xinhua');
INSERT INTO `ctshop_region` VALUES ('130107', '井陉矿区', '130100', '井陉矿区', '3', '0311', '050100', '中国,河北省,石家庄市,井陉矿区', '114.065', '38.0671', 'Jingxingkuangqu');
INSERT INTO `ctshop_region` VALUES ('130108', '裕华区', '130100', '裕华', '3', '0311', '050031', '中国,河北省,石家庄市,裕华区', '114.531', '38.006', 'Yuhua');
INSERT INTO `ctshop_region` VALUES ('130109', '藁城区', '130100', '藁城', '3', '0311', '052160', '中国,河北省,石家庄市,藁城区', '114.847', '38.0216', 'Gaocheng');
INSERT INTO `ctshop_region` VALUES ('130110', '鹿泉区', '130100', '鹿泉', '3', '0311', '050200', '中国,河北省,石家庄市,鹿泉区', '114.313', '38.0878', 'Luquan');
INSERT INTO `ctshop_region` VALUES ('130111', '栾城区', '130100', '栾城', '3', '0311', '051430', '中国,河北省,石家庄市,栾城区', '114.648', '37.9002', 'Luancheng');
INSERT INTO `ctshop_region` VALUES ('130121', '井陉县', '130100', '井陉', '3', '0311', '050300', '中国,河北省,石家庄市,井陉县', '114.143', '38.0369', 'Jingxing');
INSERT INTO `ctshop_region` VALUES ('130123', '正定县', '130100', '正定', '3', '0311', '050800', '中国,河北省,石家庄市,正定县', '114.573', '38.1445', 'Zhengding');
INSERT INTO `ctshop_region` VALUES ('130125', '行唐县', '130100', '行唐', '3', '0311', '050600', '中国,河北省,石家庄市,行唐县', '114.553', '38.4365', 'Xingtang');
INSERT INTO `ctshop_region` VALUES ('130126', '灵寿县', '130100', '灵寿', '3', '0311', '050500', '中国,河北省,石家庄市,灵寿县', '114.383', '38.3084', 'Lingshou');
INSERT INTO `ctshop_region` VALUES ('130127', '高邑县', '130100', '高邑', '3', '0311', '051330', '中国,河北省,石家庄市,高邑县', '114.611', '37.6156', 'Gaoyi');
INSERT INTO `ctshop_region` VALUES ('130128', '深泽县', '130100', '深泽', '3', '0311', '052560', '中国,河北省,石家庄市,深泽县', '115.204', '38.1835', 'Shenze');
INSERT INTO `ctshop_region` VALUES ('130129', '赞皇县', '130100', '赞皇', '3', '0311', '051230', '中国,河北省,石家庄市,赞皇县', '114.388', '37.6614', 'Zanhuang');
INSERT INTO `ctshop_region` VALUES ('130130', '无极县', '130100', '无极', '3', '0311', '052460', '中国,河北省,石家庄市,无极县', '114.975', '38.1765', 'Wuji');
INSERT INTO `ctshop_region` VALUES ('130131', '平山县', '130100', '平山', '3', '0311', '050400', '中国,河北省,石家庄市,平山县', '114.186', '38.2599', 'Pingshan');
INSERT INTO `ctshop_region` VALUES ('130132', '元氏县', '130100', '元氏', '3', '0311', '051130', '中国,河北省,石家庄市,元氏县', '114.525', '37.7667', 'Yuanshi');
INSERT INTO `ctshop_region` VALUES ('130133', '赵县', '130100', '赵县', '3', '0311', '051530', '中国,河北省,石家庄市,赵县', '114.776', '37.7563', 'Zhaoxian');
INSERT INTO `ctshop_region` VALUES ('130181', '辛集市', '130100', '辛集', '3', '0311', '052360', '中国,河北省,石家庄市,辛集市', '115.206', '37.9408', 'Xinji');
INSERT INTO `ctshop_region` VALUES ('130183', '晋州市', '130100', '晋州', '3', '0311', '052260', '中国,河北省,石家庄市,晋州市', '115.043', '38.0313', 'Jinzhou');
INSERT INTO `ctshop_region` VALUES ('130184', '新乐市', '130100', '新乐', '3', '0311', '050700', '中国,河北省,石家庄市,新乐市', '114.69', '38.3442', 'Xinle');
INSERT INTO `ctshop_region` VALUES ('130200', '唐山市', '130000', '唐山', '2', '0315', '063000', '中国,河北省,唐山市', '118.175', '39.6351', 'Tangshan');
INSERT INTO `ctshop_region` VALUES ('130202', '路南区', '130200', '路南', '3', '0315', '063000', '中国,河北省,唐山市,路南区', '118.154', '39.625', 'Lunan');
INSERT INTO `ctshop_region` VALUES ('130203', '路北区', '130200', '路北', '3', '0315', '063000', '中国,河北省,唐山市,路北区', '118.201', '39.6244', 'Lubei');
INSERT INTO `ctshop_region` VALUES ('130204', '古冶区', '130200', '古冶', '3', '0315', '063100', '中国,河北省,唐山市,古冶区', '118.458', '39.7199', 'Guye');
INSERT INTO `ctshop_region` VALUES ('130205', '开平区', '130200', '开平', '3', '0315', '063021', '中国,河北省,唐山市,开平区', '118.262', '39.6713', 'Kaiping');
INSERT INTO `ctshop_region` VALUES ('130207', '丰南区', '130200', '丰南', '3', '0315', '063300', '中国,河北省,唐山市,丰南区', '118.113', '39.5648', 'Fengnan');
INSERT INTO `ctshop_region` VALUES ('130208', '丰润区', '130200', '丰润', '3', '0315', '064000', '中国,河北省,唐山市,丰润区', '118.13', '39.8244', 'Fengrun');
INSERT INTO `ctshop_region` VALUES ('130209', '曹妃甸区', '130200', '曹妃甸', '3', '0315', '063200', '中国,河北省,唐山市,曹妃甸区', '118.46', '39.2731', 'Caofeidian');
INSERT INTO `ctshop_region` VALUES ('130223', '滦县', '130200', '滦县', '3', '0315', '063700', '中国,河北省,唐山市,滦县', '118.703', '39.7406', 'Luanxian');
INSERT INTO `ctshop_region` VALUES ('130224', '滦南县', '130200', '滦南', '3', '0315', '063500', '中国,河北省,唐山市,滦南县', '118.674', '39.5039', 'Luannan');
INSERT INTO `ctshop_region` VALUES ('130225', '乐亭县', '130200', '乐亭', '3', '0315', '063600', '中国,河北省,唐山市,乐亭县', '118.912', '39.4256', 'Laoting');
INSERT INTO `ctshop_region` VALUES ('130227', '迁西县', '130200', '迁西', '3', '0315', '064300', '中国,河北省,唐山市,迁西县', '118.316', '40.1459', 'Qianxi');
INSERT INTO `ctshop_region` VALUES ('130229', '玉田县', '130200', '玉田', '3', '0315', '064100', '中国,河北省,唐山市,玉田县', '117.739', '39.9005', 'Yutian');
INSERT INTO `ctshop_region` VALUES ('130281', '遵化市', '130200', '遵化', '3', '0315', '064200', '中国,河北省,唐山市,遵化市', '117.964', '40.1874', 'Zunhua');
INSERT INTO `ctshop_region` VALUES ('130283', '迁安市', '130200', '迁安', '3', '0315', '064400', '中国,河北省,唐山市,迁安市', '118.701', '39.9983', 'Qian\'an');
INSERT INTO `ctshop_region` VALUES ('130300', '秦皇岛市', '130000', '秦皇岛', '2', '0335', '066000', '中国,河北省,秦皇岛市', '119.587', '39.9425', 'Qinhuangdao');
INSERT INTO `ctshop_region` VALUES ('130302', '海港区', '130300', '海港', '3', '0335', '066000', '中国,河北省,秦皇岛市,海港区', '119.61', '39.9345', 'Haigang');
INSERT INTO `ctshop_region` VALUES ('130303', '山海关区', '130300', '山海关', '3', '0335', '066200', '中国,河北省,秦皇岛市,山海关区', '119.776', '39.9787', 'Shanhaiguan');
INSERT INTO `ctshop_region` VALUES ('130304', '北戴河区', '130300', '北戴河', '3', '0335', '066100', '中国,河北省,秦皇岛市,北戴河区', '119.484', '39.8341', 'Beidaihe');
INSERT INTO `ctshop_region` VALUES ('130321', '青龙满族自治县', '130300', '青龙', '3', '0335', '066500', '中国,河北省,秦皇岛市,青龙满族自治县', '118.952', '40.4074', 'Qinglong');
INSERT INTO `ctshop_region` VALUES ('130322', '昌黎县', '130300', '昌黎', '3', '0335', '066600', '中国,河北省,秦皇岛市,昌黎县', '119.166', '39.7088', 'Changli');
INSERT INTO `ctshop_region` VALUES ('130323', '抚宁县', '130300', '抚宁', '3', '0335', '066300', '中国,河北省,秦皇岛市,抚宁县', '119.245', '39.8754', 'Funing');
INSERT INTO `ctshop_region` VALUES ('130324', '卢龙县', '130300', '卢龙', '3', '0335', '066400', '中国,河北省,秦皇岛市,卢龙县', '118.893', '39.8918', 'Lulong');
INSERT INTO `ctshop_region` VALUES ('130400', '邯郸市', '130000', '邯郸', '2', '0310', '056002', '中国,河北省,邯郸市', '114.491', '36.6123', 'Handan');
INSERT INTO `ctshop_region` VALUES ('130402', '邯山区', '130400', '邯山', '3', '0310', '056001', '中国,河北省,邯郸市,邯山区', '114.484', '36.6001', 'Hanshan');
INSERT INTO `ctshop_region` VALUES ('130403', '丛台区', '130400', '丛台', '3', '0310', '056002', '中国,河北省,邯郸市,丛台区', '114.493', '36.6185', 'Congtai');
INSERT INTO `ctshop_region` VALUES ('130404', '复兴区', '130400', '复兴', '3', '0310', '056003', '中国,河北省,邯郸市,复兴区', '114.459', '36.6113', 'Fuxing');
INSERT INTO `ctshop_region` VALUES ('130406', '峰峰矿区', '130400', '峰峰矿区', '3', '0310', '056200', '中国,河北省,邯郸市,峰峰矿区', '114.211', '36.4194', 'Fengfengkuangqu');
INSERT INTO `ctshop_region` VALUES ('130421', '邯郸县', '130400', '邯郸', '3', '0310', '056101', '中国,河北省,邯郸市,邯郸县', '114.531', '36.5938', 'Handan');
INSERT INTO `ctshop_region` VALUES ('130423', '临漳县', '130400', '临漳', '3', '0310', '056600', '中国,河北省,邯郸市,临漳县', '114.619', '36.3346', 'Linzhang');
INSERT INTO `ctshop_region` VALUES ('130424', '成安县', '130400', '成安', '3', '0310', '056700', '中国,河北省,邯郸市,成安县', '114.67', '36.4441', 'Cheng\'an');
INSERT INTO `ctshop_region` VALUES ('130425', '大名县', '130400', '大名', '3', '0310', '056900', '中国,河北省,邯郸市,大名县', '115.154', '36.2799', 'Daming');
INSERT INTO `ctshop_region` VALUES ('130426', '涉县', '130400', '涉县', '3', '0310', '056400', '中国,河北省,邯郸市,涉县', '113.692', '36.5807', 'Shexian');
INSERT INTO `ctshop_region` VALUES ('130427', '磁县', '130400', '磁县', '3', '0310', '056500', '中国,河北省,邯郸市,磁县', '114.374', '36.3739', 'Cixian');
INSERT INTO `ctshop_region` VALUES ('130428', '肥乡县', '130400', '肥乡', '3', '0310', '057550', '中国,河北省,邯郸市,肥乡县', '114.8', '36.5481', 'Feixiang');
INSERT INTO `ctshop_region` VALUES ('130429', '永年县', '130400', '永年', '3', '0310', '057150', '中国,河北省,邯郸市,永年县', '114.489', '36.7836', 'Yongnian');
INSERT INTO `ctshop_region` VALUES ('130430', '邱县', '130400', '邱县', '3', '0310', '057450', '中国,河北省,邯郸市,邱县', '115.174', '36.8208', 'Qiuxian');
INSERT INTO `ctshop_region` VALUES ('130431', '鸡泽县', '130400', '鸡泽', '3', '0310', '057350', '中国,河北省,邯郸市,鸡泽县', '114.874', '36.9237', 'Jize');
INSERT INTO `ctshop_region` VALUES ('130432', '广平县', '130400', '广平', '3', '0310', '057650', '中国,河北省,邯郸市,广平县', '114.947', '36.4805', 'Guangping');
INSERT INTO `ctshop_region` VALUES ('130433', '馆陶县', '130400', '馆陶', '3', '0310', '057750', '中国,河北省,邯郸市,馆陶县', '115.299', '36.5372', 'Guantao');
INSERT INTO `ctshop_region` VALUES ('130434', '魏县', '130400', '魏县', '3', '0310', '056800', '中国,河北省,邯郸市,魏县', '114.935', '36.3617', 'Weixian');
INSERT INTO `ctshop_region` VALUES ('130435', '曲周县', '130400', '曲周', '3', '0310', '057250', '中国,河北省,邯郸市,曲周县', '114.952', '36.7767', 'Quzhou');
INSERT INTO `ctshop_region` VALUES ('130481', '武安市', '130400', '武安', '3', '0310', '056300', '中国,河北省,邯郸市,武安市', '114.202', '36.6928', 'Wu\'an');
INSERT INTO `ctshop_region` VALUES ('130500', '邢台市', '130000', '邢台', '2', '0319', '054001', '中国,河北省,邢台市', '114.509', '37.0682', 'Xingtai');
INSERT INTO `ctshop_region` VALUES ('130502', '桥东区', '130500', '桥东', '3', '0319', '054001', '中国,河北省,邢台市,桥东区', '114.507', '37.068', 'Qiaodong');
INSERT INTO `ctshop_region` VALUES ('130503', '桥西区', '130500', '桥西', '3', '0319', '054000', '中国,河北省,邢台市,桥西区', '114.468', '37.0598', 'Qiaoxi');
INSERT INTO `ctshop_region` VALUES ('130521', '邢台县', '130500', '邢台', '3', '0319', '054001', '中国,河北省,邢台市,邢台县', '114.566', '37.0456', 'Xingtai');
INSERT INTO `ctshop_region` VALUES ('130522', '临城县', '130500', '临城', '3', '0319', '054300', '中国,河北省,邢台市,临城县', '114.504', '37.4398', 'Lincheng');
INSERT INTO `ctshop_region` VALUES ('130523', '内丘县', '130500', '内丘', '3', '0319', '054200', '中国,河北省,邢台市,内丘县', '114.512', '37.2867', 'Neiqiu');
INSERT INTO `ctshop_region` VALUES ('130524', '柏乡县', '130500', '柏乡', '3', '0319', '055450', '中国,河北省,邢台市,柏乡县', '114.693', '37.4824', 'Baixiang');
INSERT INTO `ctshop_region` VALUES ('130525', '隆尧县', '130500', '隆尧', '3', '0319', '055350', '中国,河北省,邢台市,隆尧县', '114.776', '37.3535', 'Longyao');
INSERT INTO `ctshop_region` VALUES ('130526', '任县', '130500', '任县', '3', '0319', '055150', '中国,河北省,邢台市,任县', '114.684', '37.1258', 'Renxian');
INSERT INTO `ctshop_region` VALUES ('130527', '南和县', '130500', '南和', '3', '0319', '054400', '中国,河北省,邢台市,南和县', '114.684', '37.0049', 'Nanhe');
INSERT INTO `ctshop_region` VALUES ('130528', '宁晋县', '130500', '宁晋', '3', '0319', '055550', '中国,河北省,邢台市,宁晋县', '114.921', '37.617', 'Ningjin');
INSERT INTO `ctshop_region` VALUES ('130529', '巨鹿县', '130500', '巨鹿', '3', '0319', '055250', '中国,河北省,邢台市,巨鹿县', '115.035', '37.218', 'Julu');
INSERT INTO `ctshop_region` VALUES ('130530', '新河县', '130500', '新河', '3', '0319', '055650', '中国,河北省,邢台市,新河县', '115.25', '37.5272', 'Xinhe');
INSERT INTO `ctshop_region` VALUES ('130531', '广宗县', '130500', '广宗', '3', '0319', '054600', '中国,河北省,邢台市,广宗县', '115.143', '37.0746', 'Guangzong');
INSERT INTO `ctshop_region` VALUES ('130532', '平乡县', '130500', '平乡', '3', '0319', '054500', '中国,河北省,邢台市,平乡县', '115.03', '37.0632', 'Pingxiang');
INSERT INTO `ctshop_region` VALUES ('130533', '威县', '130500', '威县', '3', '0319', '054700', '中国,河北省,邢台市,威县', '115.264', '36.9768', 'Weixian');
INSERT INTO `ctshop_region` VALUES ('130534', '清河县', '130500', '清河', '3', '0319', '054800', '中国,河北省,邢台市,清河县', '115.665', '37.0712', 'Qinghe');
INSERT INTO `ctshop_region` VALUES ('130535', '临西县', '130500', '临西', '3', '0319', '054900', '中国,河北省,邢台市,临西县', '115.501', '36.8708', 'Linxi');
INSERT INTO `ctshop_region` VALUES ('130581', '南宫市', '130500', '南宫', '3', '0319', '055750', '中国,河北省,邢台市,南宫市', '115.391', '37.358', 'Nangong');
INSERT INTO `ctshop_region` VALUES ('130582', '沙河市', '130500', '沙河', '3', '0319', '054100', '中国,河北省,邢台市,沙河市', '114.498', '36.8577', 'Shahe');
INSERT INTO `ctshop_region` VALUES ('130600', '保定市', '130000', '保定', '2', '0312', '071052', '中国,河北省,保定市', '115.482', '38.8677', 'Baoding');
INSERT INTO `ctshop_region` VALUES ('130602', '新市区', '130600', '新市', '3', '0312', '071051', '中国,河北省,保定市,新市区', '115.459', '38.8775', 'Xinshi');
INSERT INTO `ctshop_region` VALUES ('130603', '北市区', '130600', '北市', '3', '0312', '071000', '中国,河北省,保定市,北市区', '115.497', '38.8832', 'Beishi');
INSERT INTO `ctshop_region` VALUES ('130604', '南市区', '130600', '南市', '3', '0312', '071001', '中国,河北省,保定市,南市区', '115.529', '38.8545', 'Nanshi');
INSERT INTO `ctshop_region` VALUES ('130621', '满城县', '130600', '满城', '3', '0312', '072150', '中国,河北省,保定市,满城县', '115.323', '38.9497', 'Mancheng');
INSERT INTO `ctshop_region` VALUES ('130622', '清苑县', '130600', '清苑', '3', '0312', '071100', '中国,河北省,保定市,清苑县', '115.493', '38.7671', 'Qingyuan');
INSERT INTO `ctshop_region` VALUES ('130623', '涞水县', '130600', '涞水', '3', '0312', '074100', '中国,河北省,保定市,涞水县', '115.715', '39.394', 'Laishui');
INSERT INTO `ctshop_region` VALUES ('130624', '阜平县', '130600', '阜平', '3', '0312', '073200', '中国,河北省,保定市,阜平县', '114.197', '38.8476', 'Fuping');
INSERT INTO `ctshop_region` VALUES ('130625', '徐水县', '130600', '徐水', '3', '0312', '072550', '中国,河北省,保定市,徐水县', '115.658', '39.021', 'Xushui');
INSERT INTO `ctshop_region` VALUES ('130626', '定兴县', '130600', '定兴', '3', '0312', '072650', '中国,河北省,保定市,定兴县', '115.808', '39.2631', 'Dingxing');
INSERT INTO `ctshop_region` VALUES ('130627', '唐县', '130600', '唐县', '3', '0312', '072350', '中国,河北省,保定市,唐县', '114.985', '38.7451', 'Tangxian');
INSERT INTO `ctshop_region` VALUES ('130628', '高阳县', '130600', '高阳', '3', '0312', '071500', '中国,河北省,保定市,高阳县', '115.779', '38.7', 'Gaoyang');
INSERT INTO `ctshop_region` VALUES ('130629', '容城县', '130600', '容城', '3', '0312', '071700', '中国,河北省,保定市,容城县', '115.872', '39.0535', 'Rongcheng');
INSERT INTO `ctshop_region` VALUES ('130630', '涞源县', '130600', '涞源', '3', '0312', '074300', '中国,河北省,保定市,涞源县', '114.691', '39.3539', 'Laiyuan');
INSERT INTO `ctshop_region` VALUES ('130631', '望都县', '130600', '望都', '3', '0312', '072450', '中国,河北省,保定市,望都县', '115.157', '38.71', 'Wangdu');
INSERT INTO `ctshop_region` VALUES ('130632', '安新县', '130600', '安新', '3', '0312', '071600', '中国,河北省,保定市,安新县', '115.936', '38.9353', 'Anxin');
INSERT INTO `ctshop_region` VALUES ('130633', '易县', '130600', '易县', '3', '0312', '074200', '中国,河北省,保定市,易县', '115.498', '39.3489', 'Yixian');
INSERT INTO `ctshop_region` VALUES ('130634', '曲阳县', '130600', '曲阳', '3', '0312', '073100', '中国,河北省,保定市,曲阳县', '114.701', '38.6215', 'Quyang');
INSERT INTO `ctshop_region` VALUES ('130635', '蠡县', '130600', '蠡县', '3', '0312', '071400', '中国,河北省,保定市,蠡县', '115.577', '38.4897', 'Lixian');
INSERT INTO `ctshop_region` VALUES ('130636', '顺平县', '130600', '顺平', '3', '0312', '072250', '中国,河北省,保定市,顺平县', '115.135', '38.8385', 'Shunping');
INSERT INTO `ctshop_region` VALUES ('130637', '博野县', '130600', '博野', '3', '0312', '071300', '中国,河北省,保定市,博野县', '115.47', '38.4564', 'Boye');
INSERT INTO `ctshop_region` VALUES ('130638', '雄县', '130600', '雄县', '3', '0312', '071800', '中国,河北省,保定市,雄县', '116.109', '38.9944', 'Xiongxian');
INSERT INTO `ctshop_region` VALUES ('130681', '涿州市', '130600', '涿州', '3', '0312', '072750', '中国,河北省,保定市,涿州市', '115.981', '39.4862', 'Zhuozhou');
INSERT INTO `ctshop_region` VALUES ('130682', '定州市', '130600', '定州', '3', '0312', '073000', '中国,河北省,保定市,定州市', '114.99', '38.5162', 'Dingzhou');
INSERT INTO `ctshop_region` VALUES ('130683', '安国市', '130600', '安国', '3', '0312', '071200', '中国,河北省,保定市,安国市', '115.323', '38.4139', 'Anguo');
INSERT INTO `ctshop_region` VALUES ('130684', '高碑店市', '130600', '高碑店', '3', '0312', '074000', '中国,河北省,保定市,高碑店市', '115.874', '39.3265', 'Gaobeidian');
INSERT INTO `ctshop_region` VALUES ('130700', '张家口市', '130000', '张家口', '2', '0313', '075000', '中国,河北省,张家口市', '114.884', '40.8119', 'Zhangjiakou');
INSERT INTO `ctshop_region` VALUES ('130702', '桥东区', '130700', '桥东', '3', '0313', '075000', '中国,河北省,张家口市,桥东区', '114.894', '40.7884', 'Qiaodong');
INSERT INTO `ctshop_region` VALUES ('130703', '桥西区', '130700', '桥西', '3', '0313', '075061', '中国,河北省,张家口市,桥西区', '114.87', '40.8195', 'Qiaoxi');
INSERT INTO `ctshop_region` VALUES ('130705', '宣化区', '130700', '宣化', '3', '0313', '075100', '中国,河北省,张家口市,宣化区', '115.065', '40.6096', 'Xuanhua');
INSERT INTO `ctshop_region` VALUES ('130706', '下花园区', '130700', '下花园', '3', '0313', '075300', '中国,河北省,张家口市,下花园区', '115.287', '40.5024', 'Xiahuayuan');
INSERT INTO `ctshop_region` VALUES ('130721', '宣化县', '130700', '宣化', '3', '0313', '075100', '中国,河北省,张家口市,宣化县', '115.155', '40.5662', 'Xuanhua');
INSERT INTO `ctshop_region` VALUES ('130722', '张北县', '130700', '张北', '3', '0313', '076450', '中国,河北省,张家口市,张北县', '114.714', '41.1598', 'Zhangbei');
INSERT INTO `ctshop_region` VALUES ('130723', '康保县', '130700', '康保', '3', '0313', '076650', '中国,河北省,张家口市,康保县', '114.6', '41.8522', 'Kangbao');
INSERT INTO `ctshop_region` VALUES ('130724', '沽源县', '130700', '沽源', '3', '0313', '076550', '中国,河北省,张家口市,沽源县', '115.689', '41.6696', 'Guyuan');
INSERT INTO `ctshop_region` VALUES ('130725', '尚义县', '130700', '尚义', '3', '0313', '076750', '中国,河北省,张家口市,尚义县', '113.971', '41.0778', 'Shangyi');
INSERT INTO `ctshop_region` VALUES ('130726', '蔚县', '130700', '蔚县', '3', '0313', '075700', '中国,河北省,张家口市,蔚县', '114.589', '39.8407', 'Yuxian');
INSERT INTO `ctshop_region` VALUES ('130727', '阳原县', '130700', '阳原', '3', '0313', '075800', '中国,河北省,张家口市,阳原县', '114.151', '40.1036', 'Yangyuan');
INSERT INTO `ctshop_region` VALUES ('130728', '怀安县', '130700', '怀安', '3', '0313', '076150', '中国,河北省,张家口市,怀安县', '114.386', '40.6743', 'Huai\'an');
INSERT INTO `ctshop_region` VALUES ('130729', '万全县', '130700', '万全', '3', '0313', '076250', '中国,河北省,张家口市,万全县', '114.741', '40.7669', 'Wanquan');
INSERT INTO `ctshop_region` VALUES ('130730', '怀来县', '130700', '怀来', '3', '0313', '075400', '中国,河北省,张家口市,怀来县', '115.518', '40.4154', 'Huailai');
INSERT INTO `ctshop_region` VALUES ('130731', '涿鹿县', '130700', '涿鹿', '3', '0313', '075600', '中国,河北省,张家口市,涿鹿县', '115.224', '40.3764', 'Zhuolu');
INSERT INTO `ctshop_region` VALUES ('130732', '赤城县', '130700', '赤城', '3', '0313', '075500', '中国,河北省,张家口市,赤城县', '115.832', '40.9144', 'Chicheng');
INSERT INTO `ctshop_region` VALUES ('130733', '崇礼县', '130700', '崇礼', '3', '0313', '076350', '中国,河北省,张家口市,崇礼县', '115.28', '40.9752', 'Chongli');
INSERT INTO `ctshop_region` VALUES ('130800', '承德市', '130000', '承德', '2', '0314', '067000', '中国,河北省,承德市', '117.939', '40.9762', 'Chengde');
INSERT INTO `ctshop_region` VALUES ('130802', '双桥区', '130800', '双桥', '3', '0314', '067000', '中国,河北省,承德市,双桥区', '117.943', '40.9747', 'Shuangqiao');
INSERT INTO `ctshop_region` VALUES ('130803', '双滦区', '130800', '双滦', '3', '0314', '067001', '中国,河北省,承德市,双滦区', '117.745', '40.9538', 'Shuangluan');
INSERT INTO `ctshop_region` VALUES ('130804', '鹰手营子矿区', '130800', '鹰手营子矿区', '3', '0314', '067200', '中国,河北省,承德市,鹰手营子矿区', '117.66', '40.5474', 'Yingshouyingzikuangqu');
INSERT INTO `ctshop_region` VALUES ('130821', '承德县', '130800', '承德', '3', '0314', '067400', '中国,河北省,承德市,承德县', '118.176', '40.7699', 'Chengde');
INSERT INTO `ctshop_region` VALUES ('130822', '兴隆县', '130800', '兴隆', '3', '0314', '067300', '中国,河北省,承德市,兴隆县', '117.501', '40.4171', 'Xinglong');
INSERT INTO `ctshop_region` VALUES ('130823', '平泉县', '130800', '平泉', '3', '0314', '067500', '中国,河北省,承德市,平泉县', '118.702', '41.0184', 'Pingquan');
INSERT INTO `ctshop_region` VALUES ('130824', '滦平县', '130800', '滦平', '3', '0314', '068250', '中国,河北省,承德市,滦平县', '117.333', '40.9415', 'Luanping');
INSERT INTO `ctshop_region` VALUES ('130825', '隆化县', '130800', '隆化', '3', '0314', '068150', '中国,河北省,承德市,隆化县', '117.73', '41.3141', 'Longhua');
INSERT INTO `ctshop_region` VALUES ('130826', '丰宁满族自治县', '130800', '丰宁', '3', '0314', '068350', '中国,河北省,承德市,丰宁满族自治县', '116.649', '41.2048', 'Fengning');
INSERT INTO `ctshop_region` VALUES ('130827', '宽城满族自治县', '130800', '宽城', '3', '0314', '067600', '中国,河北省,承德市,宽城满族自治县', '118.492', '40.6083', 'Kuancheng');
INSERT INTO `ctshop_region` VALUES ('130828', '围场满族蒙古族自治县', '130800', '围场', '3', '0314', '068450', '中国,河北省,承德市,围场满族蒙古族自治县', '117.76', '41.9437', 'Weichang');
INSERT INTO `ctshop_region` VALUES ('130900', '沧州市', '130000', '沧州', '2', '0317', '061001', '中国,河北省,沧州市', '116.857', '38.3106', 'Cangzhou');
INSERT INTO `ctshop_region` VALUES ('130902', '新华区', '130900', '新华', '3', '0317', '061000', '中国,河北省,沧州市,新华区', '116.866', '38.3144', 'Xinhua');
INSERT INTO `ctshop_region` VALUES ('130903', '运河区', '130900', '运河', '3', '0317', '061001', '中国,河北省,沧州市,运河区', '116.857', '38.3135', 'Yunhe');
INSERT INTO `ctshop_region` VALUES ('130921', '沧县', '130900', '沧县', '3', '0317', '061000', '中国,河北省,沧州市,沧县', '116.878', '38.2936', 'Cangxian');
INSERT INTO `ctshop_region` VALUES ('130922', '青县', '130900', '青县', '3', '0317', '062650', '中国,河北省,沧州市,青县', '116.803', '38.5835', 'Qingxian');
INSERT INTO `ctshop_region` VALUES ('130923', '东光县', '130900', '东光', '3', '0317', '061600', '中国,河北省,沧州市,东光县', '116.537', '37.8857', 'Dongguang');
INSERT INTO `ctshop_region` VALUES ('130924', '海兴县', '130900', '海兴', '3', '0317', '061200', '中国,河北省,沧州市,海兴县', '117.498', '38.1396', 'Haixing');
INSERT INTO `ctshop_region` VALUES ('130925', '盐山县', '130900', '盐山', '3', '0317', '061300', '中国,河北省,沧州市,盐山县', '117.231', '38.0565', 'Yanshan');
INSERT INTO `ctshop_region` VALUES ('130926', '肃宁县', '130900', '肃宁', '3', '0317', '062350', '中国,河北省,沧州市,肃宁县', '115.83', '38.4227', 'Suning');
INSERT INTO `ctshop_region` VALUES ('130927', '南皮县', '130900', '南皮', '3', '0317', '061500', '中国,河北省,沧州市,南皮县', '116.702', '38.0411', 'Nanpi');
INSERT INTO `ctshop_region` VALUES ('130928', '吴桥县', '130900', '吴桥', '3', '0317', '061800', '中国,河北省,沧州市,吴桥县', '116.385', '37.6255', 'Wuqiao');
INSERT INTO `ctshop_region` VALUES ('130929', '献县', '130900', '献县', '3', '0317', '062250', '中国,河北省,沧州市,献县', '116.127', '38.1923', 'Xianxian');
INSERT INTO `ctshop_region` VALUES ('130930', '孟村回族自治县', '130900', '孟村', '3', '0317', '061400', '中国,河北省,沧州市,孟村回族自治县', '117.104', '38.0534', 'Mengcun');
INSERT INTO `ctshop_region` VALUES ('130981', '泊头市', '130900', '泊头', '3', '0317', '062150', '中国,河北省,沧州市,泊头市', '116.578', '38.0836', 'Botou');
INSERT INTO `ctshop_region` VALUES ('130982', '任丘市', '130900', '任丘', '3', '0317', '062550', '中国,河北省,沧州市,任丘市', '116.103', '38.7112', 'Renqiu');
INSERT INTO `ctshop_region` VALUES ('130983', '黄骅市', '130900', '黄骅', '3', '0317', '061100', '中国,河北省,沧州市,黄骅市', '117.339', '38.3706', 'Huanghua');
INSERT INTO `ctshop_region` VALUES ('130984', '河间市', '130900', '河间', '3', '0317', '062450', '中国,河北省,沧州市,河间市', '116.099', '38.4455', 'Hejian');
INSERT INTO `ctshop_region` VALUES ('131000', '廊坊市', '130000', '廊坊', '2', '0316', '065000', '中国,河北省,廊坊市', '116.714', '39.5292', 'Langfang');
INSERT INTO `ctshop_region` VALUES ('131002', '安次区', '131000', '安次', '3', '0316', '065000', '中国,河北省,廊坊市,安次区', '116.703', '39.5206', 'Anci');
INSERT INTO `ctshop_region` VALUES ('131003', '广阳区', '131000', '广阳', '3', '0316', '065000', '中国,河北省,廊坊市,广阳区', '116.711', '39.5228', 'Guangyang');
INSERT INTO `ctshop_region` VALUES ('131022', '固安县', '131000', '固安', '3', '0316', '065500', '中国,河北省,廊坊市,固安县', '116.299', '39.4383', 'Gu\'an');
INSERT INTO `ctshop_region` VALUES ('131023', '永清县', '131000', '永清', '3', '0316', '065600', '中国,河北省,廊坊市,永清县', '116.501', '39.3207', 'Yongqing');
INSERT INTO `ctshop_region` VALUES ('131024', '香河县', '131000', '香河', '3', '0316', '065400', '中国,河北省,廊坊市,香河县', '117.006', '39.7613', 'Xianghe');
INSERT INTO `ctshop_region` VALUES ('131025', '大城县', '131000', '大城', '3', '0316', '065900', '中国,河北省,廊坊市,大城县', '116.654', '38.7053', 'Daicheng');
INSERT INTO `ctshop_region` VALUES ('131026', '文安县', '131000', '文安', '3', '0316', '065800', '中国,河北省,廊坊市,文安县', '116.458', '38.8732', 'Wen\'an');
INSERT INTO `ctshop_region` VALUES ('131028', '大厂回族自治县', '131000', '大厂', '3', '0316', '065300', '中国,河北省,廊坊市,大厂回族自治县', '116.989', '39.8865', 'Dachang');
INSERT INTO `ctshop_region` VALUES ('131081', '霸州市', '131000', '霸州', '3', '0316', '065700', '中国,河北省,廊坊市,霸州市', '116.392', '39.1257', 'Bazhou');
INSERT INTO `ctshop_region` VALUES ('131082', '三河市', '131000', '三河', '3', '0316', '065200', '中国,河北省,廊坊市,三河市', '117.072', '39.9836', 'Sanhe');
INSERT INTO `ctshop_region` VALUES ('131100', '衡水市', '130000', '衡水', '2', '0318', '053000', '中国,河北省,衡水市', '115.666', '37.7351', 'Hengshui');
INSERT INTO `ctshop_region` VALUES ('131102', '桃城区', '131100', '桃城', '3', '0318', '053000', '中国,河北省,衡水市,桃城区', '115.675', '37.735', 'Taocheng');
INSERT INTO `ctshop_region` VALUES ('131121', '枣强县', '131100', '枣强', '3', '0318', '053100', '中国,河北省,衡水市,枣强县', '115.726', '37.5103', 'Zaoqiang');
INSERT INTO `ctshop_region` VALUES ('131122', '武邑县', '131100', '武邑', '3', '0318', '053400', '中国,河北省,衡水市,武邑县', '115.887', '37.8018', 'Wuyi');
INSERT INTO `ctshop_region` VALUES ('131123', '武强县', '131100', '武强', '3', '0318', '053300', '中国,河北省,衡水市,武强县', '115.982', '38.0414', 'Wuqiang');
INSERT INTO `ctshop_region` VALUES ('131124', '饶阳县', '131100', '饶阳', '3', '0318', '053900', '中国,河北省,衡水市,饶阳县', '115.726', '38.2353', 'Raoyang');
INSERT INTO `ctshop_region` VALUES ('131125', '安平县', '131100', '安平', '3', '0318', '053600', '中国,河北省,衡水市,安平县', '115.519', '38.2339', 'Anping');
INSERT INTO `ctshop_region` VALUES ('131126', '故城县', '131100', '故城', '3', '0318', '053800', '中国,河北省,衡水市,故城县', '115.971', '37.3477', 'Gucheng');
INSERT INTO `ctshop_region` VALUES ('131127', '景县', '131100', '景县', '3', '0318', '053500', '中国,河北省,衡水市,景县', '116.269', '37.6926', 'Jingxian');
INSERT INTO `ctshop_region` VALUES ('131128', '阜城县', '131100', '阜城', '3', '0318', '053700', '中国,河北省,衡水市,阜城县', '116.144', '37.8688', 'Fucheng');
INSERT INTO `ctshop_region` VALUES ('131181', '冀州市', '131100', '冀州', '3', '0318', '053200', '中国,河北省,衡水市,冀州市', '115.579', '37.5508', 'Jizhou');
INSERT INTO `ctshop_region` VALUES ('131182', '深州市', '131100', '深州', '3', '0318', '053800', '中国,河北省,衡水市,深州市', '115.56', '38.0011', 'Shenzhou');
INSERT INTO `ctshop_region` VALUES ('140000', '山西省', '100000', '山西', '1', '', '', '中国,山西省', '112.549', '37.857', 'Shanxi');
INSERT INTO `ctshop_region` VALUES ('140100', '太原市', '140000', '太原', '2', '0351', '030082', '中国,山西省,太原市', '112.549', '37.857', 'Taiyuan');
INSERT INTO `ctshop_region` VALUES ('140105', '小店区', '140100', '小店', '3', '0351', '030032', '中国,山西省,太原市,小店区', '112.569', '37.7356', 'Xiaodian');
INSERT INTO `ctshop_region` VALUES ('140106', '迎泽区', '140100', '迎泽', '3', '0351', '030002', '中国,山西省,太原市,迎泽区', '112.563', '37.8633', 'Yingze');
INSERT INTO `ctshop_region` VALUES ('140107', '杏花岭区', '140100', '杏花岭', '3', '0351', '030009', '中国,山西省,太原市,杏花岭区', '112.562', '37.8843', 'Xinghualing');
INSERT INTO `ctshop_region` VALUES ('140108', '尖草坪区', '140100', '尖草坪', '3', '0351', '030023', '中国,山西省,太原市,尖草坪区', '112.487', '37.9419', 'Jiancaoping');
INSERT INTO `ctshop_region` VALUES ('140109', '万柏林区', '140100', '万柏林', '3', '0351', '030024', '中国,山西省,太原市,万柏林区', '112.516', '37.8592', 'Wanbailin');
INSERT INTO `ctshop_region` VALUES ('140110', '晋源区', '140100', '晋源', '3', '0351', '030025', '中国,山西省,太原市,晋源区', '112.48', '37.7248', 'Jinyuan');
INSERT INTO `ctshop_region` VALUES ('140121', '清徐县', '140100', '清徐', '3', '0351', '030400', '中国,山西省,太原市,清徐县', '112.359', '37.6076', 'Qingxu');
INSERT INTO `ctshop_region` VALUES ('140122', '阳曲县', '140100', '阳曲', '3', '0351', '030100', '中国,山西省,太原市,阳曲县', '112.679', '38.0599', 'Yangqu');
INSERT INTO `ctshop_region` VALUES ('140123', '娄烦县', '140100', '娄烦', '3', '0351', '030300', '中国,山西省,太原市,娄烦县', '111.795', '38.0669', 'Loufan');
INSERT INTO `ctshop_region` VALUES ('140181', '古交市', '140100', '古交', '3', '0351', '030200', '中国,山西省,太原市,古交市', '112.169', '37.9098', 'Gujiao');
INSERT INTO `ctshop_region` VALUES ('140200', '大同市', '140000', '大同', '2', '0352', '037008', '中国,山西省,大同市', '113.295', '40.0903', 'Datong');
INSERT INTO `ctshop_region` VALUES ('140202', '城区', '140200', '城区', '3', '0352', '037008', '中国,山西省,大同市,城区', '113.298', '40.0757', 'Chengqu');
INSERT INTO `ctshop_region` VALUES ('140203', '矿区', '140200', '矿区', '3', '0352', '037003', '中国,山西省,大同市,矿区', '113.177', '40.0368', 'Kuangqu');
INSERT INTO `ctshop_region` VALUES ('140211', '南郊区', '140200', '南郊', '3', '0352', '037001', '中国,山西省,大同市,南郊区', '113.149', '40.0054', 'Nanjiao');
INSERT INTO `ctshop_region` VALUES ('140212', '新荣区', '140200', '新荣', '3', '0352', '037002', '中国,山西省,大同市,新荣区', '113.135', '40.2562', 'Xinrong');
INSERT INTO `ctshop_region` VALUES ('140221', '阳高县', '140200', '阳高', '3', '0352', '038100', '中国,山西省,大同市,阳高县', '113.75', '40.3626', 'Yanggao');
INSERT INTO `ctshop_region` VALUES ('140222', '天镇县', '140200', '天镇', '3', '0352', '038200', '中国,山西省,大同市,天镇县', '114.093', '40.423', 'Tianzhen');
INSERT INTO `ctshop_region` VALUES ('140223', '广灵县', '140200', '广灵', '3', '0352', '037500', '中国,山西省,大同市,广灵县', '114.282', '39.7608', 'Guangling');
INSERT INTO `ctshop_region` VALUES ('140224', '灵丘县', '140200', '灵丘', '3', '0352', '034400', '中国,山西省,大同市,灵丘县', '114.237', '39.4404', 'Lingqiu');
INSERT INTO `ctshop_region` VALUES ('140225', '浑源县', '140200', '浑源', '3', '0352', '037400', '中国,山西省,大同市,浑源县', '113.696', '39.6996', 'Hunyuan');
INSERT INTO `ctshop_region` VALUES ('140226', '左云县', '140200', '左云', '3', '0352', '037100', '中国,山西省,大同市,左云县', '112.703', '40.0134', 'Zuoyun');
INSERT INTO `ctshop_region` VALUES ('140227', '大同县', '140200', '大同', '3', '0352', '037300', '中国,山西省,大同市,大同县', '113.612', '40.0401', 'Datong');
INSERT INTO `ctshop_region` VALUES ('140300', '阳泉市', '140000', '阳泉', '2', '0353', '045000', '中国,山西省,阳泉市', '113.583', '37.8612', 'Yangquan');
INSERT INTO `ctshop_region` VALUES ('140302', '城区', '140300', '城区', '3', '0353', '045000', '中国,山西省,阳泉市,城区', '113.601', '37.8474', 'Chengqu');
INSERT INTO `ctshop_region` VALUES ('140303', '矿区', '140300', '矿区', '3', '0353', '045000', '中国,山西省,阳泉市,矿区', '113.557', '37.8689', 'Kuangqu');
INSERT INTO `ctshop_region` VALUES ('140311', '郊区', '140300', '郊区', '3', '0353', '045011', '中国,山西省,阳泉市,郊区', '113.585', '37.9414', 'Jiaoqu');
INSERT INTO `ctshop_region` VALUES ('140321', '平定县', '140300', '平定', '3', '0353', '045200', '中国,山西省,阳泉市,平定县', '113.658', '37.786', 'Pingding');
INSERT INTO `ctshop_region` VALUES ('140322', '盂县', '140300', '盂县', '3', '0353', '045100', '中国,山西省,阳泉市,盂县', '113.412', '38.0858', 'Yuxian');
INSERT INTO `ctshop_region` VALUES ('140400', '长治市', '140000', '长治', '2', '0355', '046000', '中国,山西省,长治市', '113.114', '36.1911', 'Changzhi');
INSERT INTO `ctshop_region` VALUES ('140402', '城区', '140400', '城区', '3', '0355', '046011', '中国,山西省,长治市,城区', '113.123', '36.2035', 'Chengqu');
INSERT INTO `ctshop_region` VALUES ('140411', '郊区', '140400', '郊区', '3', '0355', '046011', '中国,山西省,长治市,郊区', '113.127', '36.1992', 'Jiaoqu');
INSERT INTO `ctshop_region` VALUES ('140421', '长治县', '140400', '长治', '3', '0355', '047100', '中国,山西省,长治市,长治县', '113.048', '36.0472', 'Changzhi');
INSERT INTO `ctshop_region` VALUES ('140423', '襄垣县', '140400', '襄垣', '3', '0355', '046200', '中国,山西省,长治市,襄垣县', '113.052', '36.5353', 'Xiangyuan');
INSERT INTO `ctshop_region` VALUES ('140424', '屯留县', '140400', '屯留', '3', '0355', '046100', '中国,山西省,长治市,屯留县', '112.892', '36.3158', 'Tunliu');
INSERT INTO `ctshop_region` VALUES ('140425', '平顺县', '140400', '平顺', '3', '0355', '047400', '中国,山西省,长治市,平顺县', '113.436', '36.2001', 'Pingshun');
INSERT INTO `ctshop_region` VALUES ('140426', '黎城县', '140400', '黎城', '3', '0355', '047600', '中国,山西省,长治市,黎城县', '113.388', '36.503', 'Licheng');
INSERT INTO `ctshop_region` VALUES ('140427', '壶关县', '140400', '壶关', '3', '0355', '047300', '中国,山西省,长治市,壶关县', '113.207', '36.113', 'Huguan');
INSERT INTO `ctshop_region` VALUES ('140428', '长子县', '140400', '长子', '3', '0355', '046600', '中国,山西省,长治市,长子县', '112.877', '36.1213', 'Zhangzi');
INSERT INTO `ctshop_region` VALUES ('140429', '武乡县', '140400', '武乡', '3', '0355', '046300', '中国,山西省,长治市,武乡县', '112.863', '36.8369', 'Wuxiang');
INSERT INTO `ctshop_region` VALUES ('140430', '沁县', '140400', '沁县', '3', '0355', '046400', '中国,山西省,长治市,沁县', '112.699', '36.7563', 'Qinxian');
INSERT INTO `ctshop_region` VALUES ('140431', '沁源县', '140400', '沁源', '3', '0355', '046500', '中国,山西省,长治市,沁源县', '112.338', '36.5001', 'Qinyuan');
INSERT INTO `ctshop_region` VALUES ('140481', '潞城市', '140400', '潞城', '3', '0355', '047500', '中国,山西省,长治市,潞城市', '113.229', '36.3341', 'Lucheng');
INSERT INTO `ctshop_region` VALUES ('140500', '晋城市', '140000', '晋城', '2', '0356', '048000', '中国,山西省,晋城市', '112.851', '35.4976', 'Jincheng');
INSERT INTO `ctshop_region` VALUES ('140502', '城区', '140500', '城区', '3', '0356', '048000', '中国,山西省,晋城市,城区', '112.853', '35.5018', 'Chengqu');
INSERT INTO `ctshop_region` VALUES ('140521', '沁水县', '140500', '沁水', '3', '0356', '048200', '中国,山西省,晋城市,沁水县', '112.187', '35.691', 'Qinshui');
INSERT INTO `ctshop_region` VALUES ('140522', '阳城县', '140500', '阳城', '3', '0356', '048100', '中国,山西省,晋城市,阳城县', '112.415', '35.4861', 'Yangcheng');
INSERT INTO `ctshop_region` VALUES ('140524', '陵川县', '140500', '陵川', '3', '0356', '048300', '中国,山西省,晋城市,陵川县', '113.281', '35.7753', 'Lingchuan');
INSERT INTO `ctshop_region` VALUES ('140525', '泽州县', '140500', '泽州', '3', '0356', '048012', '中国,山西省,晋城市,泽州县', '112.839', '35.5079', 'Zezhou');
INSERT INTO `ctshop_region` VALUES ('140581', '高平市', '140500', '高平', '3', '0356', '048400', '中国,山西省,晋城市,高平市', '112.923', '35.7971', 'Gaoping');
INSERT INTO `ctshop_region` VALUES ('140600', '朔州市', '140000', '朔州', '2', '0349', '038500', '中国,山西省,朔州市', '112.433', '39.3313', 'Shuozhou');
INSERT INTO `ctshop_region` VALUES ('140602', '朔城区', '140600', '朔城', '3', '0349', '036000', '中国,山西省,朔州市,朔城区', '112.432', '39.3198', 'Shuocheng');
INSERT INTO `ctshop_region` VALUES ('140603', '平鲁区', '140600', '平鲁', '3', '0349', '038600', '中国,山西省,朔州市,平鲁区', '112.288', '39.5116', 'Pinglu');
INSERT INTO `ctshop_region` VALUES ('140621', '山阴县', '140600', '山阴', '3', '0349', '036900', '中国,山西省,朔州市,山阴县', '112.817', '39.527', 'Shanyin');
INSERT INTO `ctshop_region` VALUES ('140622', '应县', '140600', '应县', '3', '0349', '037600', '中国,山西省,朔州市,应县', '113.191', '39.5528', 'Yingxian');
INSERT INTO `ctshop_region` VALUES ('140623', '右玉县', '140600', '右玉', '3', '0349', '037200', '中国,山西省,朔州市,右玉县', '112.469', '39.9901', 'Youyu');
INSERT INTO `ctshop_region` VALUES ('140624', '怀仁县', '140600', '怀仁', '3', '0349', '038300', '中国,山西省,朔州市,怀仁县', '113.1', '39.8281', 'Huairen');
INSERT INTO `ctshop_region` VALUES ('140700', '晋中市', '140000', '晋中', '2', '0354', '030600', '中国,山西省,晋中市', '112.736', '37.6965', 'Jinzhong');
INSERT INTO `ctshop_region` VALUES ('140702', '榆次区', '140700', '榆次', '3', '0354', '030600', '中国,山西省,晋中市,榆次区', '112.708', '37.6978', 'Yuci');
INSERT INTO `ctshop_region` VALUES ('140721', '榆社县', '140700', '榆社', '3', '0354', '031800', '中国,山西省,晋中市,榆社县', '112.976', '37.0721', 'Yushe');
INSERT INTO `ctshop_region` VALUES ('140722', '左权县', '140700', '左权', '3', '0354', '032600', '中国,山西省,晋中市,左权县', '113.379', '37.0824', 'Zuoquan');
INSERT INTO `ctshop_region` VALUES ('140723', '和顺县', '140700', '和顺', '3', '0354', '032700', '中国,山西省,晋中市,和顺县', '113.57', '37.3296', 'Heshun');
INSERT INTO `ctshop_region` VALUES ('140724', '昔阳县', '140700', '昔阳', '3', '0354', '045300', '中国,山西省,晋中市,昔阳县', '113.705', '37.6186', 'Xiyang');
INSERT INTO `ctshop_region` VALUES ('140725', '寿阳县', '140700', '寿阳', '3', '0354', '045400', '中国,山西省,晋中市,寿阳县', '113.175', '37.889', 'Shouyang');
INSERT INTO `ctshop_region` VALUES ('140726', '太谷县', '140700', '太谷', '3', '0354', '030800', '中国,山西省,晋中市,太谷县', '112.552', '37.4216', 'Taigu');
INSERT INTO `ctshop_region` VALUES ('140727', '祁县', '140700', '祁县', '3', '0354', '030900', '中国,山西省,晋中市,祁县', '112.334', '37.3579', 'Qixian');
INSERT INTO `ctshop_region` VALUES ('140728', '平遥县', '140700', '平遥', '3', '0354', '031100', '中国,山西省,晋中市,平遥县', '112.176', '37.1892', 'Pingyao');
INSERT INTO `ctshop_region` VALUES ('140729', '灵石县', '140700', '灵石', '3', '0354', '031300', '中国,山西省,晋中市,灵石县', '111.777', '36.8481', 'Lingshi');
INSERT INTO `ctshop_region` VALUES ('140781', '介休市', '140700', '介休', '3', '0354', '032000', '中国,山西省,晋中市,介休市', '111.918', '37.0277', 'Jiexiu');
INSERT INTO `ctshop_region` VALUES ('140800', '运城市', '140000', '运城', '2', '0359', '044000', '中国,山西省,运城市', '111.004', '35.0228', 'Yuncheng');
INSERT INTO `ctshop_region` VALUES ('140802', '盐湖区', '140800', '盐湖', '3', '0359', '044000', '中国,山西省,运城市,盐湖区', '110.998', '35.0151', 'Yanhu');
INSERT INTO `ctshop_region` VALUES ('140821', '临猗县', '140800', '临猗', '3', '0359', '044100', '中国,山西省,运城市,临猗县', '110.774', '35.1446', 'Linyi');
INSERT INTO `ctshop_region` VALUES ('140822', '万荣县', '140800', '万荣', '3', '0359', '044200', '中国,山西省,运城市,万荣县', '110.837', '35.4156', 'Wanrong');
INSERT INTO `ctshop_region` VALUES ('140823', '闻喜县', '140800', '闻喜', '3', '0359', '043800', '中国,山西省,运城市,闻喜县', '111.223', '35.3555', 'Wenxi');
INSERT INTO `ctshop_region` VALUES ('140824', '稷山县', '140800', '稷山', '3', '0359', '043200', '中国,山西省,运城市,稷山县', '110.979', '35.5999', 'Jishan');
INSERT INTO `ctshop_region` VALUES ('140825', '新绛县', '140800', '新绛', '3', '0359', '043100', '中国,山西省,运城市,新绛县', '111.225', '35.6157', 'Xinjiang');
INSERT INTO `ctshop_region` VALUES ('140826', '绛县', '140800', '绛县', '3', '0359', '043600', '中国,山西省,运城市,绛县', '111.567', '35.491', 'Jiangxian');
INSERT INTO `ctshop_region` VALUES ('140827', '垣曲县', '140800', '垣曲', '3', '0359', '043700', '中国,山西省,运城市,垣曲县', '111.672', '35.2992', 'Yuanqu');
INSERT INTO `ctshop_region` VALUES ('140828', '夏县', '140800', '夏县', '3', '0359', '044400', '中国,山西省,运城市,夏县', '111.22', '35.1412', 'Xiaxian');
INSERT INTO `ctshop_region` VALUES ('140829', '平陆县', '140800', '平陆', '3', '0359', '044300', '中国,山西省,运城市,平陆县', '111.217', '34.8377', 'Pinglu');
INSERT INTO `ctshop_region` VALUES ('140830', '芮城县', '140800', '芮城', '3', '0359', '044600', '中国,山西省,运城市,芮城县', '110.695', '34.6938', 'Ruicheng');
INSERT INTO `ctshop_region` VALUES ('140881', '永济市', '140800', '永济', '3', '0359', '044500', '中国,山西省,运城市,永济市', '110.445', '34.8656', 'Yongji');
INSERT INTO `ctshop_region` VALUES ('140882', '河津市', '140800', '河津', '3', '0359', '043300', '中国,山西省,运城市,河津市', '110.712', '35.5948', 'Hejin');
INSERT INTO `ctshop_region` VALUES ('140900', '忻州市', '140000', '忻州', '2', '0350', '034000', '中国,山西省,忻州市', '112.734', '38.4177', 'Xinzhou');
INSERT INTO `ctshop_region` VALUES ('140902', '忻府区', '140900', '忻府', '3', '0350', '034000', '中国,山西省,忻州市,忻府区', '112.746', '38.4041', 'Xinfu');
INSERT INTO `ctshop_region` VALUES ('140921', '定襄县', '140900', '定襄', '3', '0350', '035400', '中国,山西省,忻州市,定襄县', '112.957', '38.4739', 'Dingxiang');
INSERT INTO `ctshop_region` VALUES ('140922', '五台县', '140900', '五台', '3', '0350', '035500', '中国,山西省,忻州市,五台县', '113.253', '38.7277', 'Wutai');
INSERT INTO `ctshop_region` VALUES ('140923', '代县', '140900', '代县', '3', '0350', '034200', '中国,山西省,忻州市,代县', '112.959', '39.0672', 'Daixian');
INSERT INTO `ctshop_region` VALUES ('140924', '繁峙县', '140900', '繁峙', '3', '0350', '034300', '中国,山西省,忻州市,繁峙县', '113.263', '39.1889', 'Fanshi');
INSERT INTO `ctshop_region` VALUES ('140925', '宁武县', '140900', '宁武', '3', '0350', '036700', '中国,山西省,忻州市,宁武县', '112.304', '39.0021', 'Ningwu');
INSERT INTO `ctshop_region` VALUES ('140926', '静乐县', '140900', '静乐', '3', '0350', '035100', '中国,山西省,忻州市,静乐县', '111.942', '38.3602', 'Jingle');
INSERT INTO `ctshop_region` VALUES ('140927', '神池县', '140900', '神池', '3', '0350', '036100', '中国,山西省,忻州市,神池县', '112.205', '39.09', 'Shenchi');
INSERT INTO `ctshop_region` VALUES ('140928', '五寨县', '140900', '五寨', '3', '0350', '036200', '中国,山西省,忻州市,五寨县', '111.849', '38.9076', 'Wuzhai');
INSERT INTO `ctshop_region` VALUES ('140929', '岢岚县', '140900', '岢岚', '3', '0350', '036300', '中国,山西省,忻州市,岢岚县', '111.574', '38.7045', 'Kelan');
INSERT INTO `ctshop_region` VALUES ('140930', '河曲县', '140900', '河曲', '3', '0350', '036500', '中国,山西省,忻州市,河曲县', '111.138', '39.3844', 'Hequ');
INSERT INTO `ctshop_region` VALUES ('140931', '保德县', '140900', '保德', '3', '0350', '036600', '中国,山西省,忻州市,保德县', '111.087', '39.0225', 'Baode');
INSERT INTO `ctshop_region` VALUES ('140932', '偏关县', '140900', '偏关', '3', '0350', '036400', '中国,山西省,忻州市,偏关县', '111.509', '39.4361', 'Pianguan');
INSERT INTO `ctshop_region` VALUES ('140981', '原平市', '140900', '原平', '3', '0350', '034100', '中国,山西省,忻州市,原平市', '112.706', '38.7318', 'Yuanping');
INSERT INTO `ctshop_region` VALUES ('141000', '临汾市', '140000', '临汾', '2', '0357', '041000', '中国,山西省,临汾市', '111.518', '36.0841', 'Linfen');
INSERT INTO `ctshop_region` VALUES ('141002', '尧都区', '141000', '尧都', '3', '0357', '041000', '中国,山西省,临汾市,尧都区', '111.579', '36.083', 'Yaodu');
INSERT INTO `ctshop_region` VALUES ('141021', '曲沃县', '141000', '曲沃', '3', '0357', '043400', '中国,山西省,临汾市,曲沃县', '111.475', '35.6412', 'Quwo');
INSERT INTO `ctshop_region` VALUES ('141022', '翼城县', '141000', '翼城', '3', '0357', '043500', '中国,山西省,临汾市,翼城县', '111.718', '35.7388', 'Yicheng');
INSERT INTO `ctshop_region` VALUES ('141023', '襄汾县', '141000', '襄汾', '3', '0357', '041500', '中国,山西省,临汾市,襄汾县', '111.442', '35.8771', 'Xiangfen');
INSERT INTO `ctshop_region` VALUES ('141024', '洪洞县', '141000', '洪洞', '3', '0357', '041600', '中国,山西省,临汾市,洪洞县', '111.675', '36.2542', 'Hongtong');
INSERT INTO `ctshop_region` VALUES ('141025', '古县', '141000', '古县', '3', '0357', '042400', '中国,山西省,临汾市,古县', '111.92', '36.2669', 'Guxian');
INSERT INTO `ctshop_region` VALUES ('141026', '安泽县', '141000', '安泽', '3', '0357', '042500', '中国,山西省,临汾市,安泽县', '112.25', '36.148', 'Anze');
INSERT INTO `ctshop_region` VALUES ('141027', '浮山县', '141000', '浮山', '3', '0357', '042600', '中国,山西省,临汾市,浮山县', '111.847', '35.9685', 'Fushan');
INSERT INTO `ctshop_region` VALUES ('141028', '吉县', '141000', '吉县', '3', '0357', '042200', '中国,山西省,临汾市,吉县', '110.681', '36.0987', 'Jixian');
INSERT INTO `ctshop_region` VALUES ('141029', '乡宁县', '141000', '乡宁', '3', '0357', '042100', '中国,山西省,临汾市,乡宁县', '110.847', '35.9707', 'Xiangning');
INSERT INTO `ctshop_region` VALUES ('141030', '大宁县', '141000', '大宁', '3', '0357', '042300', '中国,山西省,临汾市,大宁县', '110.752', '36.4662', 'Daning');
INSERT INTO `ctshop_region` VALUES ('141031', '隰县', '141000', '隰县', '3', '0357', '041300', '中国,山西省,临汾市,隰县', '110.939', '36.6926', 'Xixian');
INSERT INTO `ctshop_region` VALUES ('141032', '永和县', '141000', '永和', '3', '0357', '041400', '中国,山西省,临汾市,永和县', '110.632', '36.7584', 'Yonghe');
INSERT INTO `ctshop_region` VALUES ('141033', '蒲县', '141000', '蒲县', '3', '0357', '041200', '中国,山西省,临汾市,蒲县', '111.097', '36.4124', 'Puxian');
INSERT INTO `ctshop_region` VALUES ('141034', '汾西县', '141000', '汾西', '3', '0357', '031500', '中国,山西省,临汾市,汾西县', '111.568', '36.6506', 'Fenxi');
INSERT INTO `ctshop_region` VALUES ('141081', '侯马市', '141000', '侯马', '3', '0357', '043000', '中国,山西省,临汾市,侯马市', '111.372', '35.619', 'Houma');
INSERT INTO `ctshop_region` VALUES ('141082', '霍州市', '141000', '霍州', '3', '0357', '031400', '中国,山西省,临汾市,霍州市', '111.755', '36.5638', 'Huozhou');
INSERT INTO `ctshop_region` VALUES ('141100', '吕梁市', '140000', '吕梁', '2', '0358', '033000', '中国,山西省,吕梁市', '111.134', '37.5244', 'Lvliang');
INSERT INTO `ctshop_region` VALUES ('141102', '离石区', '141100', '离石', '3', '0358', '033000', '中国,山西省,吕梁市,离石区', '111.151', '37.5177', 'Lishi');
INSERT INTO `ctshop_region` VALUES ('141121', '文水县', '141100', '文水', '3', '0358', '032100', '中国,山西省,吕梁市,文水县', '112.028', '37.4384', 'Wenshui');
INSERT INTO `ctshop_region` VALUES ('141122', '交城县', '141100', '交城', '3', '0358', '030500', '中国,山西省,吕梁市,交城县', '112.159', '37.5512', 'Jiaocheng');
INSERT INTO `ctshop_region` VALUES ('141123', '兴县', '141100', '兴县', '3', '0358', '033600', '中国,山西省,吕梁市,兴县', '111.127', '38.4632', 'Xingxian');
INSERT INTO `ctshop_region` VALUES ('141124', '临县', '141100', '临县', '3', '0358', '033200', '中国,山西省,吕梁市,临县', '110.993', '37.9527', 'Linxian');
INSERT INTO `ctshop_region` VALUES ('141125', '柳林县', '141100', '柳林', '3', '0358', '033300', '中国,山西省,吕梁市,柳林县', '110.889', '37.4293', 'Liulin');
INSERT INTO `ctshop_region` VALUES ('141126', '石楼县', '141100', '石楼', '3', '0358', '032500', '中国,山西省,吕梁市,石楼县', '110.835', '36.9973', 'Shilou');
INSERT INTO `ctshop_region` VALUES ('141127', '岚县', '141100', '岚县', '3', '0358', '033500', '中国,山西省,吕梁市,岚县', '111.676', '38.2787', 'Lanxian');
INSERT INTO `ctshop_region` VALUES ('141128', '方山县', '141100', '方山', '3', '0358', '033100', '中国,山西省,吕梁市,方山县', '111.24', '37.8898', 'Fangshan');
INSERT INTO `ctshop_region` VALUES ('141129', '中阳县', '141100', '中阳', '3', '0358', '033400', '中国,山西省,吕梁市,中阳县', '111.179', '37.3572', 'Zhongyang');
INSERT INTO `ctshop_region` VALUES ('141130', '交口县', '141100', '交口', '3', '0358', '032400', '中国,山西省,吕梁市,交口县', '111.181', '36.9821', 'Jiaokou');
INSERT INTO `ctshop_region` VALUES ('141181', '孝义市', '141100', '孝义', '3', '0358', '032300', '中国,山西省,吕梁市,孝义市', '111.774', '37.1441', 'Xiaoyi');
INSERT INTO `ctshop_region` VALUES ('141182', '汾阳市', '141100', '汾阳', '3', '0358', '032200', '中国,山西省,吕梁市,汾阳市', '111.788', '37.266', 'Fenyang');
INSERT INTO `ctshop_region` VALUES ('150000', '内蒙古自治区', '100000', '内蒙古', '1', '', '', '中国,内蒙古自治区', '111.671', '40.8183', 'Inner Mongolia');
INSERT INTO `ctshop_region` VALUES ('150100', '呼和浩特市', '150000', '呼和浩特', '2', '0471', '010000', '中国,内蒙古自治区,呼和浩特市', '111.671', '40.8183', 'Hohhot');
INSERT INTO `ctshop_region` VALUES ('150102', '新城区', '150100', '新城', '3', '0471', '010050', '中国,内蒙古自治区,呼和浩特市,新城区', '111.666', '40.8583', 'Xincheng');
INSERT INTO `ctshop_region` VALUES ('150103', '回民区', '150100', '回民', '3', '0471', '010030', '中国,内蒙古自治区,呼和浩特市,回民区', '111.624', '40.8083', 'Huimin');
INSERT INTO `ctshop_region` VALUES ('150104', '玉泉区', '150100', '玉泉', '3', '0471', '010020', '中国,内蒙古自治区,呼和浩特市,玉泉区', '111.675', '40.7523', 'Yuquan');
INSERT INTO `ctshop_region` VALUES ('150105', '赛罕区', '150100', '赛罕', '3', '0471', '010020', '中国,内蒙古自治区,呼和浩特市,赛罕区', '111.702', '40.7921', 'Saihan');
INSERT INTO `ctshop_region` VALUES ('150121', '土默特左旗', '150100', '土默特左旗', '3', '0471', '010100', '中国,内蒙古自治区,呼和浩特市,土默特左旗', '111.149', '40.7223', 'Tumotezuoqi');
INSERT INTO `ctshop_region` VALUES ('150122', '托克托县', '150100', '托克托', '3', '0471', '010200', '中国,内蒙古自治区,呼和浩特市,托克托县', '111.191', '40.2749', 'Tuoketuo');
INSERT INTO `ctshop_region` VALUES ('150123', '和林格尔县', '150100', '和林格尔', '3', '0471', '011500', '中国,内蒙古自治区,呼和浩特市,和林格尔县', '111.822', '40.3789', 'Helingeer');
INSERT INTO `ctshop_region` VALUES ('150124', '清水河县', '150100', '清水河', '3', '0471', '011600', '中国,内蒙古自治区,呼和浩特市,清水河县', '111.683', '39.9097', 'Qingshuihe');
INSERT INTO `ctshop_region` VALUES ('150125', '武川县', '150100', '武川', '3', '0471', '011700', '中国,内蒙古自治区,呼和浩特市,武川县', '111.458', '41.0929', 'Wuchuan');
INSERT INTO `ctshop_region` VALUES ('150200', '包头市', '150000', '包头', '2', '0472', '014025', '中国,内蒙古自治区,包头市', '109.84', '40.6582', 'Baotou');
INSERT INTO `ctshop_region` VALUES ('150202', '东河区', '150200', '东河', '3', '0472', '014040', '中国,内蒙古自治区,包头市,东河区', '110.046', '40.5824', 'Donghe');
INSERT INTO `ctshop_region` VALUES ('150203', '昆都仑区', '150200', '昆都仑', '3', '0472', '014010', '中国,内蒙古自治区,包头市,昆都仑区', '109.839', '40.6418', 'Kundulun');
INSERT INTO `ctshop_region` VALUES ('150204', '青山区', '150200', '青山', '3', '0472', '014030', '中国,内蒙古自治区,包头市,青山区', '109.901', '40.6433', 'Qingshan');
INSERT INTO `ctshop_region` VALUES ('150205', '石拐区', '150200', '石拐', '3', '0472', '014070', '中国,内蒙古自治区,包头市,石拐区', '110.273', '40.673', 'Shiguai');
INSERT INTO `ctshop_region` VALUES ('150206', '白云鄂博矿区', '150200', '白云鄂博矿区', '3', '0472', '014080', '中国,内蒙古自治区,包头市,白云鄂博矿区', '109.974', '41.7697', 'Baiyunebokuangqu');
INSERT INTO `ctshop_region` VALUES ('150207', '九原区', '150200', '九原', '3', '0472', '014060', '中国,内蒙古自治区,包头市,九原区', '109.965', '40.6055', 'Jiuyuan');
INSERT INTO `ctshop_region` VALUES ('150221', '土默特右旗', '150200', '土默特右旗', '3', '0472', '014100', '中国,内蒙古自治区,包头市,土默特右旗', '110.524', '40.5688', 'Tumoteyouqi');
INSERT INTO `ctshop_region` VALUES ('150222', '固阳县', '150200', '固阳', '3', '0472', '014200', '中国,内蒙古自治区,包头市,固阳县', '110.064', '41.0185', 'Guyang');
INSERT INTO `ctshop_region` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '达茂旗', '3', '0472', '014500', '中国,内蒙古自治区,包头市,达尔罕茂明安联合旗', '110.433', '41.6987', 'Damaoqi');
INSERT INTO `ctshop_region` VALUES ('150300', '乌海市', '150000', '乌海', '2', '0473', '016000', '中国,内蒙古自治区,乌海市', '106.826', '39.6737', 'Wuhai');
INSERT INTO `ctshop_region` VALUES ('150302', '海勃湾区', '150300', '海勃湾', '3', '0473', '016000', '中国,内蒙古自治区,乌海市,海勃湾区', '106.822', '39.6696', 'Haibowan');
INSERT INTO `ctshop_region` VALUES ('150303', '海南区', '150300', '海南', '3', '0473', '016030', '中国,内蒙古自治区,乌海市,海南区', '106.887', '39.4413', 'Hainan');
INSERT INTO `ctshop_region` VALUES ('150304', '乌达区', '150300', '乌达', '3', '0473', '016040', '中国,内蒙古自治区,乌海市,乌达区', '106.727', '39.505', 'Wuda');
INSERT INTO `ctshop_region` VALUES ('150400', '赤峰市', '150000', '赤峰', '2', '0476', '024000', '中国,内蒙古自治区,赤峰市', '118.957', '42.2753', 'Chifeng');
INSERT INTO `ctshop_region` VALUES ('150402', '红山区', '150400', '红山', '3', '0476', '024020', '中国,内蒙古自治区,赤峰市,红山区', '118.958', '42.2431', 'Hongshan');
INSERT INTO `ctshop_region` VALUES ('150403', '元宝山区', '150400', '元宝山', '3', '0476', '024076', '中国,内蒙古自治区,赤峰市,元宝山区', '119.289', '42.0401', 'Yuanbaoshan');
INSERT INTO `ctshop_region` VALUES ('150404', '松山区', '150400', '松山', '3', '0476', '024005', '中国,内蒙古自治区,赤峰市,松山区', '118.933', '42.2861', 'Songshan');
INSERT INTO `ctshop_region` VALUES ('150421', '阿鲁科尔沁旗', '150400', '阿鲁科尔沁旗', '3', '0476', '025550', '中国,内蒙古自治区,赤峰市,阿鲁科尔沁旗', '120.065', '43.8799', 'Alukeerqinqi');
INSERT INTO `ctshop_region` VALUES ('150422', '巴林左旗', '150400', '巴林左旗', '3', '0476', '025450', '中国,内蒙古自治区,赤峰市,巴林左旗', '119.38', '43.9703', 'Balinzuoqi');
INSERT INTO `ctshop_region` VALUES ('150423', '巴林右旗', '150400', '巴林右旗', '3', '0476', '025150', '中国,内蒙古自治区,赤峰市,巴林右旗', '118.665', '43.5339', 'Balinyouqi');
INSERT INTO `ctshop_region` VALUES ('150424', '林西县', '150400', '林西', '3', '0476', '025250', '中国,内蒙古自治区,赤峰市,林西县', '118.047', '43.6116', 'Linxi');
INSERT INTO `ctshop_region` VALUES ('150425', '克什克腾旗', '150400', '克什克腾旗', '3', '0476', '025350', '中国,内蒙古自治区,赤峰市,克什克腾旗', '117.546', '43.265', 'Keshiketengqi');
INSERT INTO `ctshop_region` VALUES ('150426', '翁牛特旗', '150400', '翁牛特旗', '3', '0476', '024500', '中国,内蒙古自治区,赤峰市,翁牛特旗', '119.03', '42.9315', 'Wengniuteqi');
INSERT INTO `ctshop_region` VALUES ('150428', '喀喇沁旗', '150400', '喀喇沁旗', '3', '0476', '024400', '中国,内蒙古自治区,赤峰市,喀喇沁旗', '118.701', '41.9292', 'Kalaqinqi');
INSERT INTO `ctshop_region` VALUES ('150429', '宁城县', '150400', '宁城', '3', '0476', '024200', '中国,内蒙古自治区,赤峰市,宁城县', '119.344', '41.5966', 'Ningcheng');
INSERT INTO `ctshop_region` VALUES ('150430', '敖汉旗', '150400', '敖汉旗', '3', '0476', '024300', '中国,内蒙古自治区,赤峰市,敖汉旗', '119.922', '42.2907', 'Aohanqi');
INSERT INTO `ctshop_region` VALUES ('150500', '通辽市', '150000', '通辽', '2', '0475', '028000', '中国,内蒙古自治区,通辽市', '122.263', '43.6174', 'Tongliao');
INSERT INTO `ctshop_region` VALUES ('150502', '科尔沁区', '150500', '科尔沁', '3', '0475', '028000', '中国,内蒙古自治区,通辽市,科尔沁区', '122.256', '43.6226', 'Keerqin');
INSERT INTO `ctshop_region` VALUES ('150521', '科尔沁左翼中旗', '150500', '科尔沁左翼中旗', '3', '0475', '029300', '中国,内蒙古自治区,通辽市,科尔沁左翼中旗', '123.319', '44.1301', 'Keerqinzuoyizhongqi');
INSERT INTO `ctshop_region` VALUES ('150522', '科尔沁左翼后旗', '150500', '科尔沁左翼后旗', '3', '0475', '028100', '中国,内蒙古自治区,通辽市,科尔沁左翼后旗', '122.357', '42.949', 'Keerqinzuoyihouqi');
INSERT INTO `ctshop_region` VALUES ('150523', '开鲁县', '150500', '开鲁', '3', '0475', '028400', '中国,内蒙古自治区,通辽市,开鲁县', '121.319', '43.6', 'Kailu');
INSERT INTO `ctshop_region` VALUES ('150524', '库伦旗', '150500', '库伦旗', '3', '0475', '028200', '中国,内蒙古自治区,通辽市,库伦旗', '121.776', '42.73', 'Kulunqi');
INSERT INTO `ctshop_region` VALUES ('150525', '奈曼旗', '150500', '奈曼旗', '3', '0475', '028300', '中国,内蒙古自治区,通辽市,奈曼旗', '120.663', '42.8453', 'Naimanqi');
INSERT INTO `ctshop_region` VALUES ('150526', '扎鲁特旗', '150500', '扎鲁特旗', '3', '0475', '029100', '中国,内蒙古自治区,通辽市,扎鲁特旗', '120.915', '44.5559', 'Zhaluteqi');
INSERT INTO `ctshop_region` VALUES ('150581', '霍林郭勒市', '150500', '霍林郭勒', '3', '0475', '029200', '中国,内蒙古自治区,通辽市,霍林郭勒市', '119.654', '45.5345', 'Huolinguole');
INSERT INTO `ctshop_region` VALUES ('150600', '鄂尔多斯市', '150000', '鄂尔多斯', '2', '0477', '017004', '中国,内蒙古自治区,鄂尔多斯市', '109.99', '39.8172', 'Ordos');
INSERT INTO `ctshop_region` VALUES ('150602', '东胜区', '150600', '东胜', '3', '0477', '017000', '中国,内蒙古自治区,鄂尔多斯市,东胜区', '109.963', '39.8224', 'Dongsheng');
INSERT INTO `ctshop_region` VALUES ('150621', '达拉特旗', '150600', '达拉特旗', '3', '0477', '014300', '中国,内蒙古自治区,鄂尔多斯市,达拉特旗', '110.033', '40.4001', 'Dalateqi');
INSERT INTO `ctshop_region` VALUES ('150622', '准格尔旗', '150600', '准格尔旗', '3', '0477', '017100', '中国,内蒙古自治区,鄂尔多斯市,准格尔旗', '111.236', '39.8678', 'Zhungeerqi');
INSERT INTO `ctshop_region` VALUES ('150623', '鄂托克前旗', '150600', '鄂托克前旗', '3', '0477', '016200', '中国,内蒙古自治区,鄂尔多斯市,鄂托克前旗', '107.484', '38.184', 'Etuokeqianqi');
INSERT INTO `ctshop_region` VALUES ('150624', '鄂托克旗', '150600', '鄂托克旗', '3', '0477', '016100', '中国,内蒙古自治区,鄂尔多斯市,鄂托克旗', '107.982', '39.0946', 'Etuokeqi');
INSERT INTO `ctshop_region` VALUES ('150625', '杭锦旗', '150600', '杭锦旗', '3', '0477', '017400', '中国,内蒙古自治区,鄂尔多斯市,杭锦旗', '108.729', '39.8402', 'Hangjinqi');
INSERT INTO `ctshop_region` VALUES ('150626', '乌审旗', '150600', '乌审旗', '3', '0477', '017300', '中国,内蒙古自治区,鄂尔多斯市,乌审旗', '108.846', '38.5909', 'Wushenqi');
INSERT INTO `ctshop_region` VALUES ('150627', '伊金霍洛旗', '150600', '伊金霍洛旗', '3', '0477', '017200', '中国,内蒙古自治区,鄂尔多斯市,伊金霍洛旗', '109.749', '39.5739', 'Yijinhuoluoqi');
INSERT INTO `ctshop_region` VALUES ('150700', '呼伦贝尔市', '150000', '呼伦贝尔', '2', '0470', '021008', '中国,内蒙古自治区,呼伦贝尔市', '119.758', '49.2153', 'Hulunber');
INSERT INTO `ctshop_region` VALUES ('150702', '海拉尔区', '150700', '海拉尔', '3', '0470', '021000', '中国,内蒙古自治区,呼伦贝尔市,海拉尔区', '119.736', '49.2122', 'Hailaer');
INSERT INTO `ctshop_region` VALUES ('150703', '扎赉诺尔区', '150700', '扎赉诺尔', '3', '0470', '021410', '中国,内蒙古自治区,呼伦贝尔市,扎赉诺尔区', '117.793', '49.4869', 'Zhalainuoer');
INSERT INTO `ctshop_region` VALUES ('150721', '阿荣旗', '150700', '阿荣旗', '3', '0470', '162750', '中国,内蒙古自治区,呼伦贝尔市,阿荣旗', '123.459', '48.1258', 'Arongqi');
INSERT INTO `ctshop_region` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '莫旗', '3', '0470', '162850', '中国,内蒙古自治区,呼伦贝尔市,莫力达瓦达斡尔族自治旗', '124.515', '48.4805', 'Moqi');
INSERT INTO `ctshop_region` VALUES ('150723', '鄂伦春自治旗', '150700', '鄂伦春', '3', '0470', '165450', '中国,内蒙古自治区,呼伦贝尔市,鄂伦春自治旗', '123.726', '50.5978', 'Elunchun');
INSERT INTO `ctshop_region` VALUES ('150724', '鄂温克族自治旗', '150700', '鄂温', '3', '0470', '021100', '中国,内蒙古自治区,呼伦贝尔市,鄂温克族自治旗', '119.757', '49.1428', 'Ewen');
INSERT INTO `ctshop_region` VALUES ('150725', '陈巴尔虎旗', '150700', '陈巴尔虎旗', '3', '0470', '021500', '中国,内蒙古自治区,呼伦贝尔市,陈巴尔虎旗', '119.424', '49.3268', 'Chenbaerhuqi');
INSERT INTO `ctshop_region` VALUES ('150726', '新巴尔虎左旗', '150700', '新巴尔虎左旗', '3', '0470', '021200', '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎左旗', '118.27', '48.2184', 'Xinbaerhuzuoqi');
INSERT INTO `ctshop_region` VALUES ('150727', '新巴尔虎右旗', '150700', '新巴尔虎右旗', '3', '0470', '021300', '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎右旗', '116.824', '48.6647', 'Xinbaerhuyouqi');
INSERT INTO `ctshop_region` VALUES ('150781', '满洲里市', '150700', '满洲里', '3', '0470', '021400', '中国,内蒙古自治区,呼伦贝尔市,满洲里市', '117.479', '49.5827', 'Manzhouli');
INSERT INTO `ctshop_region` VALUES ('150782', '牙克石市', '150700', '牙克石', '3', '0470', '022150', '中国,内蒙古自治区,呼伦贝尔市,牙克石市', '120.712', '49.2856', 'Yakeshi');
INSERT INTO `ctshop_region` VALUES ('150783', '扎兰屯市', '150700', '扎兰屯', '3', '0470', '162650', '中国,内蒙古自治区,呼伦贝尔市,扎兰屯市', '122.738', '48.0136', 'Zhalantun');
INSERT INTO `ctshop_region` VALUES ('150784', '额尔古纳市', '150700', '额尔古纳', '3', '0470', '022250', '中国,内蒙古自治区,呼伦贝尔市,额尔古纳市', '120.191', '50.2425', 'Eerguna');
INSERT INTO `ctshop_region` VALUES ('150785', '根河市', '150700', '根河', '3', '0470', '022350', '中国,内蒙古自治区,呼伦贝尔市,根河市', '121.522', '50.78', 'Genhe');
INSERT INTO `ctshop_region` VALUES ('150800', '巴彦淖尔市', '150000', '巴彦淖尔', '2', '0478', '015001', '中国,内蒙古自治区,巴彦淖尔市', '107.417', '40.7574', 'Bayan Nur');
INSERT INTO `ctshop_region` VALUES ('150802', '临河区', '150800', '临河', '3', '0478', '015001', '中国,内蒙古自治区,巴彦淖尔市,临河区', '107.427', '40.7583', 'Linhe');
INSERT INTO `ctshop_region` VALUES ('150821', '五原县', '150800', '五原', '3', '0478', '015100', '中国,内蒙古自治区,巴彦淖尔市,五原县', '108.269', '41.0963', 'Wuyuan');
INSERT INTO `ctshop_region` VALUES ('150822', '磴口县', '150800', '磴口', '3', '0478', '015200', '中国,内蒙古自治区,巴彦淖尔市,磴口县', '107.009', '40.3306', 'Dengkou');
INSERT INTO `ctshop_region` VALUES ('150823', '乌拉特前旗', '150800', '乌拉特前旗', '3', '0478', '014400', '中国,内蒙古自治区,巴彦淖尔市,乌拉特前旗', '108.652', '40.7365', 'Wulateqianqi');
INSERT INTO `ctshop_region` VALUES ('150824', '乌拉特中旗', '150800', '乌拉特中旗', '3', '0478', '015300', '中国,内蒙古自治区,巴彦淖尔市,乌拉特中旗', '108.526', '41.5679', 'Wulatezhongqi');
INSERT INTO `ctshop_region` VALUES ('150825', '乌拉特后旗', '150800', '乌拉特后旗', '3', '0478', '015500', '中国,内蒙古自治区,巴彦淖尔市,乌拉特后旗', '106.99', '41.4315', 'Wulatehouqi');
INSERT INTO `ctshop_region` VALUES ('150826', '杭锦后旗', '150800', '杭锦后旗', '3', '0478', '015400', '中国,内蒙古自治区,巴彦淖尔市,杭锦后旗', '107.151', '40.8863', 'Hangjinhouqi');
INSERT INTO `ctshop_region` VALUES ('150900', '乌兰察布市', '150000', '乌兰察布', '2', '0474', '012000', '中国,内蒙古自治区,乌兰察布市', '113.115', '41.0341', 'Ulanqab');
INSERT INTO `ctshop_region` VALUES ('150902', '集宁区', '150900', '集宁', '3', '0474', '012000', '中国,内蒙古自治区,乌兰察布市,集宁区', '113.115', '41.0353', 'Jining');
INSERT INTO `ctshop_region` VALUES ('150921', '卓资县', '150900', '卓资', '3', '0474', '012300', '中国,内蒙古自治区,乌兰察布市,卓资县', '112.578', '40.8941', 'Zhuozi');
INSERT INTO `ctshop_region` VALUES ('150922', '化德县', '150900', '化德', '3', '0474', '013350', '中国,内蒙古自治区,乌兰察布市,化德县', '114.011', '41.9043', 'Huade');
INSERT INTO `ctshop_region` VALUES ('150923', '商都县', '150900', '商都', '3', '0474', '013450', '中国,内蒙古自治区,乌兰察布市,商都县', '113.578', '41.5621', 'Shangdu');
INSERT INTO `ctshop_region` VALUES ('150924', '兴和县', '150900', '兴和', '3', '0474', '013650', '中国,内蒙古自治区,乌兰察布市,兴和县', '113.834', '40.8719', 'Xinghe');
INSERT INTO `ctshop_region` VALUES ('150925', '凉城县', '150900', '凉城', '3', '0474', '013750', '中国,内蒙古自治区,乌兰察布市,凉城县', '112.496', '40.5335', 'Liangcheng');
INSERT INTO `ctshop_region` VALUES ('150926', '察哈尔右翼前旗', '150900', '察右前旗', '3', '0474', '012200', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼前旗', '113.221', '40.7788', 'Chayouqianqi');
INSERT INTO `ctshop_region` VALUES ('150927', '察哈尔右翼中旗', '150900', '察右中旗', '3', '0474', '013550', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼中旗', '112.635', '41.2774', 'Chayouzhongqi');
INSERT INTO `ctshop_region` VALUES ('150928', '察哈尔右翼后旗', '150900', '察右后旗', '3', '0474', '012400', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼后旗', '113.192', '41.4355', 'Chayouhouqi');
INSERT INTO `ctshop_region` VALUES ('150929', '四子王旗', '150900', '四子王旗', '3', '0474', '011800', '中国,内蒙古自治区,乌兰察布市,四子王旗', '111.707', '41.5331', 'Siziwangqi');
INSERT INTO `ctshop_region` VALUES ('150981', '丰镇市', '150900', '丰镇', '3', '0474', '012100', '中国,内蒙古自治区,乌兰察布市,丰镇市', '113.11', '40.4369', 'Fengzhen');
INSERT INTO `ctshop_region` VALUES ('152200', '兴安盟', '150000', '兴安盟', '2', '0482', '137401', '中国,内蒙古自治区,兴安盟', '122.07', '46.0763', 'Hinggan');
INSERT INTO `ctshop_region` VALUES ('152201', '乌兰浩特市', '152200', '乌兰浩特', '3', '0482', '137401', '中国,内蒙古自治区,兴安盟,乌兰浩特市', '122.064', '46.0624', 'Wulanhaote');
INSERT INTO `ctshop_region` VALUES ('152202', '阿尔山市', '152200', '阿尔山', '3', '0482', '137800', '中国,内蒙古自治区,兴安盟,阿尔山市', '119.943', '47.1772', 'Aershan');
INSERT INTO `ctshop_region` VALUES ('152221', '科尔沁右翼前旗', '152200', '科右前旗', '3', '0482', '137423', '中国,内蒙古自治区,兴安盟,科尔沁右翼前旗', '121.953', '46.0795', 'Keyouqianqi');
INSERT INTO `ctshop_region` VALUES ('152222', '科尔沁右翼中旗', '152200', '科右中旗', '3', '0482', '029400', '中国,内蒙古自治区,兴安盟,科尔沁右翼中旗', '121.468', '45.056', 'Keyouzhongqi');
INSERT INTO `ctshop_region` VALUES ('152223', '扎赉特旗', '152200', '扎赉特旗', '3', '0482', '137600', '中国,内蒙古自治区,兴安盟,扎赉特旗', '122.912', '46.7267', 'Zhalaiteqi');
INSERT INTO `ctshop_region` VALUES ('152224', '突泉县', '152200', '突泉', '3', '0482', '137500', '中国,内蒙古自治区,兴安盟,突泉县', '121.594', '45.3819', 'Tuquan');
INSERT INTO `ctshop_region` VALUES ('152500', '锡林郭勒盟', '150000', '锡林郭勒盟', '2', '0479', '026000', '中国,内蒙古自治区,锡林郭勒盟', '116.091', '43.944', 'Xilin Gol');
INSERT INTO `ctshop_region` VALUES ('152501', '二连浩特市', '152500', '二连浩特', '3', '0479', '011100', '中国,内蒙古自治区,锡林郭勒盟,二连浩特市', '111.983', '43.653', 'Erlianhaote');
INSERT INTO `ctshop_region` VALUES ('152502', '锡林浩特市', '152500', '锡林浩特', '3', '0479', '026021', '中国,内蒙古自治区,锡林郭勒盟,锡林浩特市', '116.086', '43.9334', 'Xilinhaote');
INSERT INTO `ctshop_region` VALUES ('152522', '阿巴嘎旗', '152500', '阿巴嘎旗', '3', '0479', '011400', '中国,内蒙古自治区,锡林郭勒盟,阿巴嘎旗', '114.968', '44.0217', 'Abagaqi');
INSERT INTO `ctshop_region` VALUES ('152523', '苏尼特左旗', '152500', '苏尼特左旗', '3', '0479', '011300', '中国,内蒙古自治区,锡林郭勒盟,苏尼特左旗', '113.651', '43.8569', 'Sunitezuoqi');
INSERT INTO `ctshop_region` VALUES ('152524', '苏尼特右旗', '152500', '苏尼特右旗', '3', '0479', '011200', '中国,内蒙古自治区,锡林郭勒盟,苏尼特右旗', '112.657', '42.7469', 'Suniteyouqi');
INSERT INTO `ctshop_region` VALUES ('152525', '东乌珠穆沁旗', '152500', '东乌旗', '3', '0479', '026300', '中国,内蒙古自治区,锡林郭勒盟,东乌珠穆沁旗', '116.973', '45.5111', 'Dongwuqi');
INSERT INTO `ctshop_region` VALUES ('152526', '西乌珠穆沁旗', '152500', '西乌旗', '3', '0479', '026200', '中国,内蒙古自治区,锡林郭勒盟,西乌珠穆沁旗', '117.61', '44.5962', 'Xiwuqi');
INSERT INTO `ctshop_region` VALUES ('152527', '太仆寺旗', '152500', '太仆寺旗', '3', '0479', '027000', '中国,内蒙古自治区,锡林郭勒盟,太仆寺旗', '115.283', '41.8773', 'Taipusiqi');
INSERT INTO `ctshop_region` VALUES ('152528', '镶黄旗', '152500', '镶黄旗', '3', '0479', '013250', '中国,内蒙古自治区,锡林郭勒盟,镶黄旗', '113.845', '42.2393', 'Xianghuangqi');
INSERT INTO `ctshop_region` VALUES ('152529', '正镶白旗', '152500', '正镶白旗', '3', '0479', '013800', '中国,内蒙古自治区,锡林郭勒盟,正镶白旗', '115.001', '42.3071', 'Zhengxiangbaiqi');
INSERT INTO `ctshop_region` VALUES ('152530', '正蓝旗', '152500', '正蓝旗', '3', '0479', '027200', '中国,内蒙古自治区,锡林郭勒盟,正蓝旗', '116.004', '42.2523', 'Zhenglanqi');
INSERT INTO `ctshop_region` VALUES ('152531', '多伦县', '152500', '多伦', '3', '0479', '027300', '中国,内蒙古自治区,锡林郭勒盟,多伦县', '116.486', '42.203', 'Duolun');
INSERT INTO `ctshop_region` VALUES ('152900', '阿拉善盟', '150000', '阿拉善盟', '2', '0483', '750306', '中国,内蒙古自治区,阿拉善盟', '105.706', '38.8448', 'Alxa');
INSERT INTO `ctshop_region` VALUES ('152921', '阿拉善左旗', '152900', '阿拉善左旗', '3', '0483', '750306', '中国,内蒙古自治区,阿拉善盟,阿拉善左旗', '105.675', '38.8293', 'Alashanzuoqi');
INSERT INTO `ctshop_region` VALUES ('152922', '阿拉善右旗', '152900', '阿拉善右旗', '3', '0483', '737300', '中国,内蒙古自治区,阿拉善盟,阿拉善右旗', '101.667', '39.2153', 'Alashanyouqi');
INSERT INTO `ctshop_region` VALUES ('152923', '额济纳旗', '152900', '额济纳旗', '3', '0483', '735400', '中国,内蒙古自治区,阿拉善盟,额济纳旗', '101.069', '41.9675', 'Ejinaqi');
INSERT INTO `ctshop_region` VALUES ('210000', '辽宁省', '100000', '辽宁', '1', '', '', '中国,辽宁省', '123.429', '41.7968', 'Liaoning');
INSERT INTO `ctshop_region` VALUES ('210100', '沈阳市', '210000', '沈阳', '2', '024', '110013', '中国,辽宁省,沈阳市', '123.429', '41.7968', 'Shenyang');
INSERT INTO `ctshop_region` VALUES ('210102', '和平区', '210100', '和平', '3', '024', '110001', '中国,辽宁省,沈阳市,和平区', '123.42', '41.79', 'Heping');
INSERT INTO `ctshop_region` VALUES ('210103', '沈河区', '210100', '沈河', '3', '024', '110011', '中国,辽宁省,沈阳市,沈河区', '123.459', '41.7962', 'Shenhe');
INSERT INTO `ctshop_region` VALUES ('210104', '大东区', '210100', '大东', '3', '024', '110041', '中国,辽宁省,沈阳市,大东区', '123.47', '41.8054', 'Dadong');
INSERT INTO `ctshop_region` VALUES ('210105', '皇姑区', '210100', '皇姑', '3', '024', '110031', '中国,辽宁省,沈阳市,皇姑区', '123.425', '41.8204', 'Huanggu');
INSERT INTO `ctshop_region` VALUES ('210106', '铁西区', '210100', '铁西', '3', '024', '110021', '中国,辽宁省,沈阳市,铁西区', '123.377', '41.8027', 'Tiexi');
INSERT INTO `ctshop_region` VALUES ('210111', '苏家屯区', '210100', '苏家屯', '3', '024', '110101', '中国,辽宁省,沈阳市,苏家屯区', '123.344', '41.6647', 'Sujiatun');
INSERT INTO `ctshop_region` VALUES ('210112', '浑南区', '210100', '浑南', '3', '024', '110015', '中国,辽宁省,沈阳市,浑南区', '123.458', '41.7195', 'Hunnan');
INSERT INTO `ctshop_region` VALUES ('210113', '沈北新区', '210100', '沈北新区', '3', '024', '110121', '中国,辽宁省,沈阳市,沈北新区', '123.527', '42.053', 'Shenbeixinqu');
INSERT INTO `ctshop_region` VALUES ('210114', '于洪区', '210100', '于洪', '3', '024', '110141', '中国,辽宁省,沈阳市,于洪区', '123.308', '41.794', 'Yuhong');
INSERT INTO `ctshop_region` VALUES ('210122', '辽中县', '210100', '辽中', '3', '024', '110200', '中国,辽宁省,沈阳市,辽中县', '122.727', '41.513', 'Liaozhong');
INSERT INTO `ctshop_region` VALUES ('210123', '康平县', '210100', '康平', '3', '024', '110500', '中国,辽宁省,沈阳市,康平县', '123.354', '42.7508', 'Kangping');
INSERT INTO `ctshop_region` VALUES ('210124', '法库县', '210100', '法库', '3', '024', '110400', '中国,辽宁省,沈阳市,法库县', '123.412', '42.5061', 'Faku');
INSERT INTO `ctshop_region` VALUES ('210181', '新民市', '210100', '新民', '3', '024', '110300', '中国,辽宁省,沈阳市,新民市', '122.829', '41.9985', 'Xinmin');
INSERT INTO `ctshop_region` VALUES ('210200', '大连市', '210000', '大连', '2', '0411', '116011', '中国,辽宁省,大连市', '121.619', '38.9146', 'Dalian');
INSERT INTO `ctshop_region` VALUES ('210202', '中山区', '210200', '中山', '3', '0411', '116001', '中国,辽宁省,大连市,中山区', '121.645', '38.9186', 'Zhongshan');
INSERT INTO `ctshop_region` VALUES ('210203', '西岗区', '210200', '西岗', '3', '0411', '116011', '中国,辽宁省,大连市,西岗区', '121.612', '38.9147', 'Xigang');
INSERT INTO `ctshop_region` VALUES ('210204', '沙河口区', '210200', '沙河口', '3', '0411', '116021', '中国,辽宁省,大连市,沙河口区', '121.58', '38.9054', 'Shahekou');
INSERT INTO `ctshop_region` VALUES ('210211', '甘井子区', '210200', '甘井子', '3', '0411', '116033', '中国,辽宁省,大连市,甘井子区', '121.566', '38.9502', 'Ganjingzi');
INSERT INTO `ctshop_region` VALUES ('210212', '旅顺口区', '210200', '旅顺口', '3', '0411', '116041', '中国,辽宁省,大连市,旅顺口区', '121.262', '38.8512', 'Lvshunkou');
INSERT INTO `ctshop_region` VALUES ('210213', '金州区', '210200', '金州', '3', '0411', '116100', '中国,辽宁省,大连市,金州区', '121.719', '39.1004', 'Jinzhou');
INSERT INTO `ctshop_region` VALUES ('210224', '长海县', '210200', '长海', '3', '0411', '116500', '中国,辽宁省,大连市,长海县', '122.589', '39.2727', 'Changhai');
INSERT INTO `ctshop_region` VALUES ('210281', '瓦房店市', '210200', '瓦房店', '3', '0411', '116300', '中国,辽宁省,大连市,瓦房店市', '121.981', '39.6284', 'Wafangdian');
INSERT INTO `ctshop_region` VALUES ('210282', '普兰店市', '210200', '普兰店', '3', '0411', '116200', '中国,辽宁省,大连市,普兰店市', '121.963', '39.3946', 'Pulandian');
INSERT INTO `ctshop_region` VALUES ('210283', '庄河市', '210200', '庄河', '3', '0411', '116400', '中国,辽宁省,大连市,庄河市', '122.967', '39.6881', 'Zhuanghe');
INSERT INTO `ctshop_region` VALUES ('210300', '鞍山市', '210000', '鞍山', '2', '0412', '114001', '中国,辽宁省,鞍山市', '122.996', '41.1106', 'Anshan');
INSERT INTO `ctshop_region` VALUES ('210302', '铁东区', '210300', '铁东', '3', '0412', '114001', '中国,辽宁省,鞍山市,铁东区', '122.991', '41.0897', 'Tiedong');
INSERT INTO `ctshop_region` VALUES ('210303', '铁西区', '210300', '铁西', '3', '0413', '114013', '中国,辽宁省,鞍山市,铁西区', '122.97', '41.1198', 'Tiexi');
INSERT INTO `ctshop_region` VALUES ('210304', '立山区', '210300', '立山', '3', '0414', '114031', '中国,辽宁省,鞍山市,立山区', '123.029', '41.1501', 'Lishan');
INSERT INTO `ctshop_region` VALUES ('210311', '千山区', '210300', '千山', '3', '0415', '114041', '中国,辽宁省,鞍山市,千山区', '122.96', '41.0751', 'Qianshan');
INSERT INTO `ctshop_region` VALUES ('210321', '台安县', '210300', '台安', '3', '0417', '114100', '中国,辽宁省,鞍山市,台安县', '122.436', '41.4127', 'Tai\'an');
INSERT INTO `ctshop_region` VALUES ('210323', '岫岩满族自治县', '210300', '岫岩', '3', '0418', '114300', '中国,辽宁省,鞍山市,岫岩满族自治县', '123.289', '40.28', 'Xiuyan');
INSERT INTO `ctshop_region` VALUES ('210381', '海城市', '210300', '海城', '3', '0416', '114200', '中国,辽宁省,鞍山市,海城市', '122.685', '40.8814', 'Haicheng');
INSERT INTO `ctshop_region` VALUES ('210400', '抚顺市', '210000', '抚顺', '2', '024', '113008', '中国,辽宁省,抚顺市', '123.921', '41.876', 'Fushun');
INSERT INTO `ctshop_region` VALUES ('210402', '新抚区', '210400', '新抚', '3', '024', '113008', '中国,辽宁省,抚顺市,新抚区', '123.913', '41.862', 'Xinfu');
INSERT INTO `ctshop_region` VALUES ('210403', '东洲区', '210400', '东洲', '3', '024', '113003', '中国,辽宁省,抚顺市,东洲区', '124.038', '41.8519', 'Dongzhou');
INSERT INTO `ctshop_region` VALUES ('210404', '望花区', '210400', '望花', '3', '024', '113001', '中国,辽宁省,抚顺市,望花区', '123.783', '41.8553', 'Wanghua');
INSERT INTO `ctshop_region` VALUES ('210411', '顺城区', '210400', '顺城', '3', '024', '113006', '中国,辽宁省,抚顺市,顺城区', '123.945', '41.8832', 'Shuncheng');
INSERT INTO `ctshop_region` VALUES ('210421', '抚顺县', '210400', '抚顺', '3', '024', '113006', '中国,辽宁省,抚顺市,抚顺县', '124.178', '41.7122', 'Fushun');
INSERT INTO `ctshop_region` VALUES ('210422', '新宾满族自治县', '210400', '新宾', '3', '024', '113200', '中国,辽宁省,抚顺市,新宾满族自治县', '125.04', '41.7341', 'Xinbin');
INSERT INTO `ctshop_region` VALUES ('210423', '清原满族自治县', '210400', '清原', '3', '024', '113300', '中国,辽宁省,抚顺市,清原满族自治县', '124.928', '42.1022', 'Qingyuan');
INSERT INTO `ctshop_region` VALUES ('210500', '本溪市', '210000', '本溪', '2', '0414', '117000', '中国,辽宁省,本溪市', '123.771', '41.2979', 'Benxi');
INSERT INTO `ctshop_region` VALUES ('210502', '平山区', '210500', '平山', '3', '0414', '117000', '中国,辽宁省,本溪市,平山区', '123.769', '41.2997', 'Pingshan');
INSERT INTO `ctshop_region` VALUES ('210503', '溪湖区', '210500', '溪湖', '3', '0414', '117002', '中国,辽宁省,本溪市,溪湖区', '123.768', '41.3292', 'Xihu');
INSERT INTO `ctshop_region` VALUES ('210504', '明山区', '210500', '明山', '3', '0414', '117021', '中国,辽宁省,本溪市,明山区', '123.817', '41.3083', 'Mingshan');
INSERT INTO `ctshop_region` VALUES ('210505', '南芬区', '210500', '南芬', '3', '0414', '117014', '中国,辽宁省,本溪市,南芬区', '123.745', '41.1006', 'Nanfen');
INSERT INTO `ctshop_region` VALUES ('210521', '本溪满族自治县', '210500', '本溪', '3', '0414', '117100', '中国,辽宁省,本溪市,本溪满族自治县', '124.127', '41.3006', 'Benxi');
INSERT INTO `ctshop_region` VALUES ('210522', '桓仁满族自治县', '210500', '桓仁', '3', '0414', '117200', '中国,辽宁省,本溪市,桓仁满族自治县', '125.361', '41.268', 'Huanren');
INSERT INTO `ctshop_region` VALUES ('210600', '丹东市', '210000', '丹东', '2', '0415', '118000', '中国,辽宁省,丹东市', '124.383', '40.1243', 'Dandong');
INSERT INTO `ctshop_region` VALUES ('210602', '元宝区', '210600', '元宝', '3', '0415', '118000', '中国,辽宁省,丹东市,元宝区', '124.396', '40.1365', 'Yuanbao');
INSERT INTO `ctshop_region` VALUES ('210603', '振兴区', '210600', '振兴', '3', '0415', '118002', '中国,辽宁省,丹东市,振兴区', '124.36', '40.1049', 'Zhenxing');
INSERT INTO `ctshop_region` VALUES ('210604', '振安区', '210600', '振安', '3', '0415', '118001', '中国,辽宁省,丹东市,振安区', '124.428', '40.1583', 'Zhen\'an');
INSERT INTO `ctshop_region` VALUES ('210624', '宽甸满族自治县', '210600', '宽甸', '3', '0415', '118200', '中国,辽宁省,丹东市,宽甸满族自治县', '124.782', '40.7319', 'Kuandian');
INSERT INTO `ctshop_region` VALUES ('210681', '东港市', '210600', '东港', '3', '0415', '118300', '中国,辽宁省,丹东市,东港市', '124.163', '39.8626', 'Donggang');
INSERT INTO `ctshop_region` VALUES ('210682', '凤城市', '210600', '凤城', '3', '0415', '118100', '中国,辽宁省,丹东市,凤城市', '124.067', '40.453', 'Fengcheng');
INSERT INTO `ctshop_region` VALUES ('210700', '锦州市', '210000', '锦州', '2', '0416', '121000', '中国,辽宁省,锦州市', '121.136', '41.1193', 'Jinzhou');
INSERT INTO `ctshop_region` VALUES ('210702', '古塔区', '210700', '古塔', '3', '0416', '121001', '中国,辽宁省,锦州市,古塔区', '121.128', '41.1172', 'Guta');
INSERT INTO `ctshop_region` VALUES ('210703', '凌河区', '210700', '凌河', '3', '0416', '121000', '中国,辽宁省,锦州市,凌河区', '121.151', '41.115', 'Linghe');
INSERT INTO `ctshop_region` VALUES ('210711', '太和区', '210700', '太和', '3', '0416', '121011', '中国,辽宁省,锦州市,太和区', '121.104', '41.1093', 'Taihe');
INSERT INTO `ctshop_region` VALUES ('210726', '黑山县', '210700', '黑山', '3', '0416', '121400', '中国,辽宁省,锦州市,黑山县', '122.121', '41.6942', 'Heishan');
INSERT INTO `ctshop_region` VALUES ('210727', '义县', '210700', '义县', '3', '0416', '121100', '中国,辽宁省,锦州市,义县', '121.24', '41.5346', 'Yixian');
INSERT INTO `ctshop_region` VALUES ('210781', '凌海市', '210700', '凌海', '3', '0416', '121200', '中国,辽宁省,锦州市,凌海市', '121.357', '41.1737', 'Linghai');
INSERT INTO `ctshop_region` VALUES ('210782', '北镇市', '210700', '北镇', '3', '0416', '121300', '中国,辽宁省,锦州市,北镇市', '121.799', '41.5954', 'Beizhen');
INSERT INTO `ctshop_region` VALUES ('210800', '营口市', '210000', '营口', '2', '0417', '115003', '中国,辽宁省,营口市', '122.235', '40.6674', 'Yingkou');
INSERT INTO `ctshop_region` VALUES ('210802', '站前区', '210800', '站前', '3', '0417', '115002', '中国,辽宁省,营口市,站前区', '122.259', '40.6727', 'Zhanqian');
INSERT INTO `ctshop_region` VALUES ('210803', '西市区', '210800', '西市', '3', '0417', '115004', '中国,辽宁省,营口市,西市区', '122.206', '40.6664', 'Xishi');
INSERT INTO `ctshop_region` VALUES ('210804', '鲅鱼圈区', '210800', '鲅鱼圈', '3', '0417', '115007', '中国,辽宁省,营口市,鲅鱼圈区', '122.133', '40.2687', 'Bayuquan');
INSERT INTO `ctshop_region` VALUES ('210811', '老边区', '210800', '老边', '3', '0417', '115005', '中国,辽宁省,营口市,老边区', '122.38', '40.6803', 'Laobian');
INSERT INTO `ctshop_region` VALUES ('210881', '盖州市', '210800', '盖州', '3', '0417', '115200', '中国,辽宁省,营口市,盖州市', '122.355', '40.4045', 'Gaizhou');
INSERT INTO `ctshop_region` VALUES ('210882', '大石桥市', '210800', '大石桥', '3', '0417', '115100', '中国,辽宁省,营口市,大石桥市', '122.509', '40.6457', 'Dashiqiao');
INSERT INTO `ctshop_region` VALUES ('210900', '阜新市', '210000', '阜新', '2', '0418', '123000', '中国,辽宁省,阜新市', '121.649', '42.0118', 'Fuxin');
INSERT INTO `ctshop_region` VALUES ('210902', '海州区', '210900', '海州', '3', '0418', '123000', '中国,辽宁省,阜新市,海州区', '121.656', '42.0134', 'Haizhou');
INSERT INTO `ctshop_region` VALUES ('210903', '新邱区', '210900', '新邱', '3', '0418', '123005', '中国,辽宁省,阜新市,新邱区', '121.793', '42.0918', 'Xinqiu');
INSERT INTO `ctshop_region` VALUES ('210904', '太平区', '210900', '太平', '3', '0418', '123003', '中国,辽宁省,阜新市,太平区', '121.679', '42.0107', 'Taiping');
INSERT INTO `ctshop_region` VALUES ('210905', '清河门区', '210900', '清河门', '3', '0418', '123006', '中国,辽宁省,阜新市,清河门区', '121.416', '41.7831', 'Qinghemen');
INSERT INTO `ctshop_region` VALUES ('210911', '细河区', '210900', '细河', '3', '0418', '123000', '中国,辽宁省,阜新市,细河区', '121.68', '42.0253', 'Xihe');
INSERT INTO `ctshop_region` VALUES ('210921', '阜新蒙古族自治县', '210900', '阜新', '3', '0418', '123100', '中国,辽宁省,阜新市,阜新蒙古族自治县', '121.758', '42.0651', 'Fuxin');
INSERT INTO `ctshop_region` VALUES ('210922', '彰武县', '210900', '彰武', '3', '0418', '123200', '中国,辽宁省,阜新市,彰武县', '122.54', '42.3862', 'Zhangwu');
INSERT INTO `ctshop_region` VALUES ('211000', '辽阳市', '210000', '辽阳', '2', '0419', '111000', '中国,辽宁省,辽阳市', '123.182', '41.2694', 'Liaoyang');
INSERT INTO `ctshop_region` VALUES ('211002', '白塔区', '211000', '白塔', '3', '0419', '111000', '中国,辽宁省,辽阳市,白塔区', '123.175', '41.2702', 'Baita');
INSERT INTO `ctshop_region` VALUES ('211003', '文圣区', '211000', '文圣', '3', '0419', '111000', '中国,辽宁省,辽阳市,文圣区', '123.185', '41.2627', 'Wensheng');
INSERT INTO `ctshop_region` VALUES ('211004', '宏伟区', '211000', '宏伟', '3', '0419', '111003', '中国,辽宁省,辽阳市,宏伟区', '123.193', '41.2185', 'Hongwei');
INSERT INTO `ctshop_region` VALUES ('211005', '弓长岭区', '211000', '弓长岭', '3', '0419', '111008', '中国,辽宁省,辽阳市,弓长岭区', '123.42', '41.1518', 'Gongchangling');
INSERT INTO `ctshop_region` VALUES ('211011', '太子河区', '211000', '太子河', '3', '0419', '111000', '中国,辽宁省,辽阳市,太子河区', '123.182', '41.2534', 'Taizihe');
INSERT INTO `ctshop_region` VALUES ('211021', '辽阳县', '211000', '辽阳', '3', '0419', '111200', '中国,辽宁省,辽阳市,辽阳县', '123.106', '41.2054', 'Liaoyang');
INSERT INTO `ctshop_region` VALUES ('211081', '灯塔市', '211000', '灯塔', '3', '0419', '111300', '中国,辽宁省,辽阳市,灯塔市', '123.339', '41.4261', 'Dengta');
INSERT INTO `ctshop_region` VALUES ('211100', '盘锦市', '210000', '盘锦', '2', '0427', '124010', '中国,辽宁省,盘锦市', '122.07', '41.1245', 'Panjin');
INSERT INTO `ctshop_region` VALUES ('211102', '双台子区', '211100', '双台子', '3', '0427', '124000', '中国,辽宁省,盘锦市,双台子区', '122.06', '41.1906', 'Shuangtaizi');
INSERT INTO `ctshop_region` VALUES ('211103', '兴隆台区', '211100', '兴隆台', '3', '0427', '124010', '中国,辽宁省,盘锦市,兴隆台区', '122.075', '41.124', 'Xinglongtai');
INSERT INTO `ctshop_region` VALUES ('211121', '大洼县', '211100', '大洼', '3', '0427', '124200', '中国,辽宁省,盘锦市,大洼县', '122.082', '41.0024', 'Dawa');
INSERT INTO `ctshop_region` VALUES ('211122', '盘山县', '211100', '盘山', '3', '0427', '124000', '中国,辽宁省,盘锦市,盘山县', '121.998', '41.238', 'Panshan');
INSERT INTO `ctshop_region` VALUES ('211200', '铁岭市', '210000', '铁岭', '2', '024', '112000', '中国,辽宁省,铁岭市', '123.844', '42.2906', 'Tieling');
INSERT INTO `ctshop_region` VALUES ('211202', '银州区', '211200', '银州', '3', '024', '112000', '中国,辽宁省,铁岭市,银州区', '123.857', '42.2951', 'Yinzhou');
INSERT INTO `ctshop_region` VALUES ('211204', '清河区', '211200', '清河', '3', '024', '112003', '中国,辽宁省,铁岭市,清河区', '124.159', '42.5468', 'Qinghe');
INSERT INTO `ctshop_region` VALUES ('211221', '铁岭县', '211200', '铁岭', '3', '024', '112000', '中国,辽宁省,铁岭市,铁岭县', '123.773', '42.225', 'Tieling');
INSERT INTO `ctshop_region` VALUES ('211223', '西丰县', '211200', '西丰', '3', '024', '112400', '中国,辽宁省,铁岭市,西丰县', '124.73', '42.7376', 'Xifeng');
INSERT INTO `ctshop_region` VALUES ('211224', '昌图县', '211200', '昌图', '3', '024', '112500', '中国,辽宁省,铁岭市,昌图县', '124.112', '42.7843', 'Changtu');
INSERT INTO `ctshop_region` VALUES ('211281', '调兵山市', '211200', '调兵山', '3', '024', '112700', '中国,辽宁省,铁岭市,调兵山市', '123.567', '42.4675', 'Diaobingshan');
INSERT INTO `ctshop_region` VALUES ('211282', '开原市', '211200', '开原', '3', '024', '112300', '中国,辽宁省,铁岭市,开原市', '124.039', '42.5458', 'Kaiyuan');
INSERT INTO `ctshop_region` VALUES ('211300', '朝阳市', '210000', '朝阳', '2', '0421', '122000', '中国,辽宁省,朝阳市', '120.451', '41.5768', 'Chaoyang');
INSERT INTO `ctshop_region` VALUES ('211302', '双塔区', '211300', '双塔', '3', '0421', '122000', '中国,辽宁省,朝阳市,双塔区', '120.454', '41.566', 'Shuangta');
INSERT INTO `ctshop_region` VALUES ('211303', '龙城区', '211300', '龙城', '3', '0421', '122000', '中国,辽宁省,朝阳市,龙城区', '120.437', '41.5926', 'Longcheng');
INSERT INTO `ctshop_region` VALUES ('211321', '朝阳县', '211300', '朝阳', '3', '0421', '122000', '中国,辽宁省,朝阳市,朝阳县', '120.174', '41.4324', 'Chaoyang');
INSERT INTO `ctshop_region` VALUES ('211322', '建平县', '211300', '建平', '3', '0421', '122400', '中国,辽宁省,朝阳市,建平县', '119.644', '41.4031', 'Jianping');
INSERT INTO `ctshop_region` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '喀喇沁左翼', '3', '0421', '122300', '中国,辽宁省,朝阳市,喀喇沁左翼蒙古族自治县', '119.742', '41.128', 'Kalaqinzuoyi');
INSERT INTO `ctshop_region` VALUES ('211381', '北票市', '211300', '北票', '3', '0421', '122100', '中国,辽宁省,朝阳市,北票市', '120.77', '41.802', 'Beipiao');
INSERT INTO `ctshop_region` VALUES ('211382', '凌源市', '211300', '凌源', '3', '0421', '122500', '中国,辽宁省,朝阳市,凌源市', '119.401', '41.2456', 'Lingyuan');
INSERT INTO `ctshop_region` VALUES ('211400', '葫芦岛市', '210000', '葫芦岛', '2', '0429', '125000', '中国,辽宁省,葫芦岛市', '120.856', '40.7556', 'Huludao');
INSERT INTO `ctshop_region` VALUES ('211402', '连山区', '211400', '连山', '3', '0429', '125001', '中国,辽宁省,葫芦岛市,连山区', '120.864', '40.7555', 'Lianshan');
INSERT INTO `ctshop_region` VALUES ('211403', '龙港区', '211400', '龙港', '3', '0429', '125003', '中国,辽宁省,葫芦岛市,龙港区', '120.949', '40.7192', 'Longgang');
INSERT INTO `ctshop_region` VALUES ('211404', '南票区', '211400', '南票', '3', '0429', '125027', '中国,辽宁省,葫芦岛市,南票区', '120.75', '41.1071', 'Nanpiao');
INSERT INTO `ctshop_region` VALUES ('211421', '绥中县', '211400', '绥中', '3', '0429', '125200', '中国,辽宁省,葫芦岛市,绥中县', '120.345', '40.3255', 'Suizhong');
INSERT INTO `ctshop_region` VALUES ('211422', '建昌县', '211400', '建昌', '3', '0429', '125300', '中国,辽宁省,葫芦岛市,建昌县', '119.838', '40.8245', 'Jianchang');
INSERT INTO `ctshop_region` VALUES ('211481', '兴城市', '211400', '兴城', '3', '0429', '125100', '中国,辽宁省,葫芦岛市,兴城市', '120.725', '40.6149', 'Xingcheng');
INSERT INTO `ctshop_region` VALUES ('211500', '金普新区', '210000', '金普新区', '2', '0411', '116100', '中国,辽宁省,金普新区', '121.79', '39.0555', 'Jinpuxinqu');
INSERT INTO `ctshop_region` VALUES ('211501', '金州新区', '211500', '金州新区', '3', '0411', '116100', '中国,辽宁省,金普新区,金州新区', '121.785', '39.0523', 'Jinzhouxinqu');
INSERT INTO `ctshop_region` VALUES ('211502', '普湾新区', '211500', '普湾新区', '3', '0411', '116200', '中国,辽宁省,金普新区,普湾新区', '121.813', '39.3301', 'Puwanxinqu');
INSERT INTO `ctshop_region` VALUES ('211503', '保税区', '211500', '保税区', '3', '0411', '116100', '中国,辽宁省,金普新区,保税区', '121.943', '39.2246', 'Baoshuiqu');
INSERT INTO `ctshop_region` VALUES ('220000', '吉林省', '100000', '吉林', '1', '', '', '中国,吉林省', '125.325', '43.8868', 'Jilin');
INSERT INTO `ctshop_region` VALUES ('220100', '长春市', '220000', '长春', '2', '0431', '130022', '中国,吉林省,长春市', '125.325', '43.8868', 'Changchun');
INSERT INTO `ctshop_region` VALUES ('220102', '南关区', '220100', '南关', '3', '0431', '130022', '中国,吉林省,长春市,南关区', '125.35', '43.864', 'Nanguan');
INSERT INTO `ctshop_region` VALUES ('220103', '宽城区', '220100', '宽城', '3', '0431', '130051', '中国,吉林省,长春市,宽城区', '125.326', '43.9018', 'Kuancheng');
INSERT INTO `ctshop_region` VALUES ('220104', '朝阳区', '220100', '朝阳', '3', '0431', '130012', '中国,吉林省,长春市,朝阳区', '125.288', '43.8334', 'Chaoyang');
INSERT INTO `ctshop_region` VALUES ('220105', '二道区', '220100', '二道', '3', '0431', '130031', '中国,吉林省,长春市,二道区', '125.374', '43.865', 'Erdao');
INSERT INTO `ctshop_region` VALUES ('220106', '绿园区', '220100', '绿园', '3', '0431', '130062', '中国,吉林省,长春市,绿园区', '125.256', '43.8805', 'Lvyuan');
INSERT INTO `ctshop_region` VALUES ('220112', '双阳区', '220100', '双阳', '3', '0431', '130600', '中国,吉林省,长春市,双阳区', '125.656', '43.528', 'Shuangyang');
INSERT INTO `ctshop_region` VALUES ('220113', '九台区', '220100', '九台', '3', '0431', '130500', '中国,吉林省,长春市,九台区', '125.84', '44.1516', 'Jiutai');
INSERT INTO `ctshop_region` VALUES ('220122', '农安县', '220100', '农安', '3', '0431', '130200', '中国,吉林省,长春市,农安县', '125.185', '44.4327', 'Nong\'an');
INSERT INTO `ctshop_region` VALUES ('220182', '榆树市', '220100', '榆树', '3', '0431', '130400', '中国,吉林省,长春市,榆树市', '126.557', '44.8252', 'Yushu');
INSERT INTO `ctshop_region` VALUES ('220183', '德惠市', '220100', '德惠', '3', '0431', '130300', '中国,吉林省,长春市,德惠市', '125.705', '44.5372', 'Dehui');
INSERT INTO `ctshop_region` VALUES ('220200', '吉林市', '220000', '吉林', '2', '0432', '132011', '中国,吉林省,吉林市', '126.553', '43.8436', 'Jilin');
INSERT INTO `ctshop_region` VALUES ('220202', '昌邑区', '220200', '昌邑', '3', '0432', '132002', '中国,吉林省,吉林市,昌邑区', '126.574', '43.8818', 'Changyi');
INSERT INTO `ctshop_region` VALUES ('220203', '龙潭区', '220200', '龙潭', '3', '0432', '132021', '中国,吉林省,吉林市,龙潭区', '126.562', '43.9105', 'Longtan');
INSERT INTO `ctshop_region` VALUES ('220204', '船营区', '220200', '船营', '3', '0432', '132011', '中国,吉林省,吉林市,船营区', '126.541', '43.8334', 'Chuanying');
INSERT INTO `ctshop_region` VALUES ('220211', '丰满区', '220200', '丰满', '3', '0432', '132013', '中国,吉林省,吉林市,丰满区', '126.562', '43.8224', 'Fengman');
INSERT INTO `ctshop_region` VALUES ('220221', '永吉县', '220200', '永吉', '3', '0432', '132200', '中国,吉林省,吉林市,永吉县', '126.496', '43.672', 'Yongji');
INSERT INTO `ctshop_region` VALUES ('220281', '蛟河市', '220200', '蛟河', '3', '0432', '132500', '中国,吉林省,吉林市,蛟河市', '127.344', '43.727', 'Jiaohe');
INSERT INTO `ctshop_region` VALUES ('220282', '桦甸市', '220200', '桦甸', '3', '0432', '132400', '中国,吉林省,吉林市,桦甸市', '126.746', '42.9721', 'Huadian');
INSERT INTO `ctshop_region` VALUES ('220283', '舒兰市', '220200', '舒兰', '3', '0432', '132600', '中国,吉林省,吉林市,舒兰市', '126.965', '44.4058', 'Shulan');
INSERT INTO `ctshop_region` VALUES ('220284', '磐石市', '220200', '磐石', '3', '0432', '132300', '中国,吉林省,吉林市,磐石市', '126.062', '42.9463', 'Panshi');
INSERT INTO `ctshop_region` VALUES ('220300', '四平市', '220000', '四平', '2', '0434', '136000', '中国,吉林省,四平市', '124.371', '43.1703', 'Siping');
INSERT INTO `ctshop_region` VALUES ('220302', '铁西区', '220300', '铁西', '3', '0434', '136000', '中国,吉林省,四平市,铁西区', '124.374', '43.1746', 'Tiexi');
INSERT INTO `ctshop_region` VALUES ('220303', '铁东区', '220300', '铁东', '3', '0434', '136001', '中国,吉林省,四平市,铁东区', '124.41', '43.1624', 'Tiedong');
INSERT INTO `ctshop_region` VALUES ('220322', '梨树县', '220300', '梨树', '3', '0434', '136500', '中国,吉林省,四平市,梨树县', '124.336', '43.3072', 'Lishu');
INSERT INTO `ctshop_region` VALUES ('220323', '伊通满族自治县', '220300', '伊通', '3', '0434', '130700', '中国,吉林省,四平市,伊通满族自治县', '125.306', '43.3443', 'Yitong');
INSERT INTO `ctshop_region` VALUES ('220381', '公主岭市', '220300', '公主岭', '3', '0434', '136100', '中国,吉林省,四平市,公主岭市', '124.823', '43.5045', 'Gongzhuling');
INSERT INTO `ctshop_region` VALUES ('220382', '双辽市', '220300', '双辽', '3', '0434', '136400', '中国,吉林省,四平市,双辽市', '123.501', '43.521', 'Shuangliao');
INSERT INTO `ctshop_region` VALUES ('220400', '辽源市', '220000', '辽源', '2', '0437', '136200', '中国,吉林省,辽源市', '125.145', '42.9027', 'Liaoyuan');
INSERT INTO `ctshop_region` VALUES ('220402', '龙山区', '220400', '龙山', '3', '0437', '136200', '中国,吉林省,辽源市,龙山区', '125.136', '42.8971', 'Longshan');
INSERT INTO `ctshop_region` VALUES ('220403', '西安区', '220400', '西安', '3', '0437', '136201', '中国,吉林省,辽源市,西安区', '125.149', '42.927', 'Xi\'an');
INSERT INTO `ctshop_region` VALUES ('220421', '东丰县', '220400', '东丰', '3', '0437', '136300', '中国,吉林省,辽源市,东丰县', '125.532', '42.6783', 'Dongfeng');
INSERT INTO `ctshop_region` VALUES ('220422', '东辽县', '220400', '东辽', '3', '0437', '136600', '中国,吉林省,辽源市,东辽县', '124.986', '42.9249', 'Dongliao');
INSERT INTO `ctshop_region` VALUES ('220500', '通化市', '220000', '通化', '2', '0435', '134001', '中国,吉林省,通化市', '125.937', '41.7212', 'Tonghua');
INSERT INTO `ctshop_region` VALUES ('220502', '东昌区', '220500', '东昌', '3', '0435', '134001', '中国,吉林省,通化市,东昌区', '125.955', '41.7285', 'Dongchang');
INSERT INTO `ctshop_region` VALUES ('220503', '二道江区', '220500', '二道江', '3', '0435', '134003', '中国,吉林省,通化市,二道江区', '126.043', '41.7741', 'Erdaojiang');
INSERT INTO `ctshop_region` VALUES ('220521', '通化县', '220500', '通化', '3', '0435', '134100', '中国,吉林省,通化市,通化县', '125.759', '41.6793', 'Tonghua');
INSERT INTO `ctshop_region` VALUES ('220523', '辉南县', '220500', '辉南', '3', '0435', '135100', '中国,吉林省,通化市,辉南县', '126.047', '42.685', 'Huinan');
INSERT INTO `ctshop_region` VALUES ('220524', '柳河县', '220500', '柳河', '3', '0435', '135300', '中国,吉林省,通化市,柳河县', '125.745', '42.2847', 'Liuhe');
INSERT INTO `ctshop_region` VALUES ('220581', '梅河口市', '220500', '梅河口', '3', '0435', '135000', '中国,吉林省,通化市,梅河口市', '125.71', '42.5383', 'Meihekou');
INSERT INTO `ctshop_region` VALUES ('220582', '集安市', '220500', '集安', '3', '0435', '134200', '中国,吉林省,通化市,集安市', '126.188', '41.1227', 'Ji\'an');
INSERT INTO `ctshop_region` VALUES ('220600', '白山市', '220000', '白山', '2', '0439', '134300', '中国,吉林省,白山市', '126.428', '41.9425', 'Baishan');
INSERT INTO `ctshop_region` VALUES ('220602', '浑江区', '220600', '浑江', '3', '0439', '134300', '中国,吉林省,白山市,浑江区', '126.422', '41.9457', 'Hunjiang');
INSERT INTO `ctshop_region` VALUES ('220605', '江源区', '220600', '江源', '3', '0439', '134700', '中国,吉林省,白山市,江源区', '126.591', '42.0566', 'Jiangyuan');
INSERT INTO `ctshop_region` VALUES ('220621', '抚松县', '220600', '抚松', '3', '0439', '134500', '中国,吉林省,白山市,抚松县', '127.28', '42.342', 'Fusong');
INSERT INTO `ctshop_region` VALUES ('220622', '靖宇县', '220600', '靖宇', '3', '0439', '135200', '中国,吉林省,白山市,靖宇县', '126.813', '42.3886', 'Jingyu');
INSERT INTO `ctshop_region` VALUES ('220623', '长白朝鲜族自治县', '220600', '长白', '3', '0439', '134400', '中国,吉林省,白山市,长白朝鲜族自治县', '128.2', '41.42', 'Changbai');
INSERT INTO `ctshop_region` VALUES ('220681', '临江市', '220600', '临江', '3', '0439', '134600', '中国,吉林省,白山市,临江市', '126.918', '41.8114', 'Linjiang');
INSERT INTO `ctshop_region` VALUES ('220700', '松原市', '220000', '松原', '2', '0438', '138000', '中国,吉林省,松原市', '124.824', '45.1182', 'Songyuan');
INSERT INTO `ctshop_region` VALUES ('220702', '宁江区', '220700', '宁江', '3', '0438', '138000', '中国,吉林省,松原市,宁江区', '124.817', '45.1717', 'Ningjiang');
INSERT INTO `ctshop_region` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '前郭尔罗斯', '3', '0438', '138000', '中国,吉林省,松原市,前郭尔罗斯蒙古族自治县', '124.824', '45.1173', 'Qianguoerluosi');
INSERT INTO `ctshop_region` VALUES ('220722', '长岭县', '220700', '长岭', '3', '0438', '131500', '中国,吉林省,松原市,长岭县', '123.967', '44.2758', 'Changling');
INSERT INTO `ctshop_region` VALUES ('220723', '乾安县', '220700', '乾安', '3', '0438', '131400', '中国,吉林省,松原市,乾安县', '124.027', '45.0107', 'Qian\'an');
INSERT INTO `ctshop_region` VALUES ('220781', '扶余市', '220700', '扶余', '3', '0438', '131200', '中国,吉林省,松原市,扶余市', '126.043', '44.9862', 'Fuyu');
INSERT INTO `ctshop_region` VALUES ('220800', '白城市', '220000', '白城', '2', '0436', '137000', '中国,吉林省,白城市', '122.841', '45.619', 'Baicheng');
INSERT INTO `ctshop_region` VALUES ('220802', '洮北区', '220800', '洮北', '3', '0436', '137000', '中国,吉林省,白城市,洮北区', '122.851', '45.6217', 'Taobei');
INSERT INTO `ctshop_region` VALUES ('220821', '镇赉县', '220800', '镇赉', '3', '0436', '137300', '中国,吉林省,白城市,镇赉县', '123.199', '45.8478', 'Zhenlai');
INSERT INTO `ctshop_region` VALUES ('220822', '通榆县', '220800', '通榆', '3', '0436', '137200', '中国,吉林省,白城市,通榆县', '123.088', '44.8139', 'Tongyu');
INSERT INTO `ctshop_region` VALUES ('220881', '洮南市', '220800', '洮南', '3', '0436', '137100', '中国,吉林省,白城市,洮南市', '122.788', '45.335', 'Taonan');
INSERT INTO `ctshop_region` VALUES ('220882', '大安市', '220800', '大安', '3', '0436', '131300', '中国,吉林省,白城市,大安市', '124.295', '45.5085', 'Da\'an');
INSERT INTO `ctshop_region` VALUES ('222400', '延边朝鲜族自治州', '220000', '延边', '2', '0433', '133000', '中国,吉林省,延边朝鲜族自治州', '129.513', '42.9048', 'Yanbian');
INSERT INTO `ctshop_region` VALUES ('222401', '延吉市', '222400', '延吉', '3', '0433', '133000', '中国,吉林省,延边朝鲜族自治州,延吉市', '129.514', '42.9068', 'Yanji');
INSERT INTO `ctshop_region` VALUES ('222402', '图们市', '222400', '图们', '3', '0433', '133100', '中国,吉林省,延边朝鲜族自治州,图们市', '129.844', '42.968', 'Tumen');
INSERT INTO `ctshop_region` VALUES ('222403', '敦化市', '222400', '敦化', '3', '0433', '133700', '中国,吉林省,延边朝鲜族自治州,敦化市', '128.232', '43.373', 'Dunhua');
INSERT INTO `ctshop_region` VALUES ('222404', '珲春市', '222400', '珲春', '3', '0433', '133300', '中国,吉林省,延边朝鲜族自治州,珲春市', '130.366', '42.8624', 'Hunchun');
INSERT INTO `ctshop_region` VALUES ('222405', '龙井市', '222400', '龙井', '3', '0433', '133400', '中国,吉林省,延边朝鲜族自治州,龙井市', '129.426', '42.768', 'Longjing');
INSERT INTO `ctshop_region` VALUES ('222406', '和龙市', '222400', '和龙', '3', '0433', '133500', '中国,吉林省,延边朝鲜族自治州,和龙市', '129.011', '42.5464', 'Helong');
INSERT INTO `ctshop_region` VALUES ('222424', '汪清县', '222400', '汪清', '3', '0433', '133200', '中国,吉林省,延边朝鲜族自治州,汪清县', '129.771', '43.3128', 'Wangqing');
INSERT INTO `ctshop_region` VALUES ('222426', '安图县', '222400', '安图', '3', '0433', '133600', '中国,吉林省,延边朝鲜族自治州,安图县', '128.906', '43.1153', 'Antu');
INSERT INTO `ctshop_region` VALUES ('230000', '黑龙江省', '100000', '黑龙江', '1', '', '', '中国,黑龙江省', '126.642', '45.757', 'Heilongjiang');
INSERT INTO `ctshop_region` VALUES ('230100', '哈尔滨市', '230000', '哈尔滨', '2', '0451', '150010', '中国,黑龙江省,哈尔滨市', '126.642', '45.757', 'Harbin');
INSERT INTO `ctshop_region` VALUES ('230102', '道里区', '230100', '道里', '3', '0451', '150010', '中国,黑龙江省,哈尔滨市,道里区', '126.617', '45.7559', 'Daoli');
INSERT INTO `ctshop_region` VALUES ('230103', '南岗区', '230100', '南岗', '3', '0451', '150006', '中国,黑龙江省,哈尔滨市,南岗区', '126.669', '45.76', 'Nangang');
INSERT INTO `ctshop_region` VALUES ('230104', '道外区', '230100', '道外', '3', '0451', '150020', '中国,黑龙江省,哈尔滨市,道外区', '126.649', '45.7919', 'Daowai');
INSERT INTO `ctshop_region` VALUES ('230108', '平房区', '230100', '平房', '3', '0451', '150060', '中国,黑龙江省,哈尔滨市,平房区', '126.637', '45.5978', 'Pingfang');
INSERT INTO `ctshop_region` VALUES ('230109', '松北区', '230100', '松北', '3', '0451', '150028', '中国,黑龙江省,哈尔滨市,松北区', '126.563', '45.8083', 'Songbei');
INSERT INTO `ctshop_region` VALUES ('230110', '香坊区', '230100', '香坊', '3', '0451', '150036', '中国,黑龙江省,哈尔滨市,香坊区', '126.68', '45.7238', 'Xiangfang');
INSERT INTO `ctshop_region` VALUES ('230111', '呼兰区', '230100', '呼兰', '3', '0451', '150500', '中国,黑龙江省,哈尔滨市,呼兰区', '126.588', '45.889', 'Hulan');
INSERT INTO `ctshop_region` VALUES ('230112', '阿城区', '230100', '阿城', '3', '0451', '150300', '中国,黑龙江省,哈尔滨市,阿城区', '126.975', '45.5414', 'A\'cheng');
INSERT INTO `ctshop_region` VALUES ('230113', '双城区', '230100', '双城', '3', '0451', '150100', '中国,黑龙江省,哈尔滨市,双城区', '126.309', '45.3779', 'Shuangcheng');
INSERT INTO `ctshop_region` VALUES ('230123', '依兰县', '230100', '依兰', '3', '0451', '154800', '中国,黑龙江省,哈尔滨市,依兰县', '129.568', '46.3247', 'Yilan');
INSERT INTO `ctshop_region` VALUES ('230124', '方正县', '230100', '方正', '3', '0451', '150800', '中国,黑龙江省,哈尔滨市,方正县', '128.83', '45.8516', 'Fangzheng');
INSERT INTO `ctshop_region` VALUES ('230125', '宾县', '230100', '宾县', '3', '0451', '150400', '中国,黑龙江省,哈尔滨市,宾县', '127.487', '45.755', 'Binxian');
INSERT INTO `ctshop_region` VALUES ('230126', '巴彦县', '230100', '巴彦', '3', '0451', '151800', '中国,黑龙江省,哈尔滨市,巴彦县', '127.408', '46.0815', 'Bayan');
INSERT INTO `ctshop_region` VALUES ('230127', '木兰县', '230100', '木兰', '3', '0451', '151900', '中国,黑龙江省,哈尔滨市,木兰县', '128.045', '45.9494', 'Mulan');
INSERT INTO `ctshop_region` VALUES ('230128', '通河县', '230100', '通河', '3', '0451', '150900', '中国,黑龙江省,哈尔滨市,通河县', '128.746', '45.9901', 'Tonghe');
INSERT INTO `ctshop_region` VALUES ('230129', '延寿县', '230100', '延寿', '3', '0451', '150700', '中国,黑龙江省,哈尔滨市,延寿县', '128.334', '45.4554', 'Yanshou');
INSERT INTO `ctshop_region` VALUES ('230183', '尚志市', '230100', '尚志', '3', '0451', '150600', '中国,黑龙江省,哈尔滨市,尚志市', '127.962', '45.2174', 'Shangzhi');
INSERT INTO `ctshop_region` VALUES ('230184', '五常市', '230100', '五常', '3', '0451', '150200', '中国,黑龙江省,哈尔滨市,五常市', '127.168', '44.9318', 'Wuchang');
INSERT INTO `ctshop_region` VALUES ('230200', '齐齐哈尔市', '230000', '齐齐哈尔', '2', '0452', '161005', '中国,黑龙江省,齐齐哈尔市', '123.953', '47.3481', 'Qiqihar');
INSERT INTO `ctshop_region` VALUES ('230202', '龙沙区', '230200', '龙沙', '3', '0452', '161000', '中国,黑龙江省,齐齐哈尔市,龙沙区', '123.958', '47.3178', 'Longsha');
INSERT INTO `ctshop_region` VALUES ('230203', '建华区', '230200', '建华', '3', '0452', '161006', '中国,黑龙江省,齐齐哈尔市,建华区', '124.013', '47.3672', 'Jianhua');
INSERT INTO `ctshop_region` VALUES ('230204', '铁锋区', '230200', '铁锋', '3', '0452', '161000', '中国,黑龙江省,齐齐哈尔市,铁锋区', '123.978', '47.3408', 'Tiefeng');
INSERT INTO `ctshop_region` VALUES ('230205', '昂昂溪区', '230200', '昂昂溪', '3', '0452', '161031', '中国,黑龙江省,齐齐哈尔市,昂昂溪区', '123.822', '47.1551', 'Angangxi');
INSERT INTO `ctshop_region` VALUES ('230206', '富拉尔基区', '230200', '富拉尔基', '3', '0452', '161041', '中国,黑龙江省,齐齐哈尔市,富拉尔基区', '123.629', '47.2088', 'Fulaerji');
INSERT INTO `ctshop_region` VALUES ('230207', '碾子山区', '230200', '碾子山', '3', '0452', '161046', '中国,黑龙江省,齐齐哈尔市,碾子山区', '122.882', '47.5166', 'Nianzishan');
INSERT INTO `ctshop_region` VALUES ('230208', '梅里斯达斡尔族区', '230200', '梅里斯', '3', '0452', '161021', '中国,黑龙江省,齐齐哈尔市,梅里斯达斡尔族区', '123.753', '47.3095', 'Meilisi');
INSERT INTO `ctshop_region` VALUES ('230221', '龙江县', '230200', '龙江', '3', '0452', '161100', '中国,黑龙江省,齐齐哈尔市,龙江县', '123.205', '47.3387', 'Longjiang');
INSERT INTO `ctshop_region` VALUES ('230223', '依安县', '230200', '依安', '3', '0452', '161500', '中国,黑龙江省,齐齐哈尔市,依安县', '125.309', '47.8931', 'Yi\'an');
INSERT INTO `ctshop_region` VALUES ('230224', '泰来县', '230200', '泰来', '3', '0452', '162400', '中国,黑龙江省,齐齐哈尔市,泰来县', '123.423', '46.3939', 'Tailai');
INSERT INTO `ctshop_region` VALUES ('230225', '甘南县', '230200', '甘南', '3', '0452', '162100', '中国,黑龙江省,齐齐哈尔市,甘南县', '123.503', '47.9244', 'Gannan');
INSERT INTO `ctshop_region` VALUES ('230227', '富裕县', '230200', '富裕', '3', '0452', '161200', '中国,黑龙江省,齐齐哈尔市,富裕县', '124.475', '47.7743', 'Fuyu');
INSERT INTO `ctshop_region` VALUES ('230229', '克山县', '230200', '克山', '3', '0452', '161600', '中国,黑龙江省,齐齐哈尔市,克山县', '125.874', '48.0326', 'Keshan');
INSERT INTO `ctshop_region` VALUES ('230230', '克东县', '230200', '克东', '3', '0452', '164800', '中国,黑龙江省,齐齐哈尔市,克东县', '126.249', '48.0383', 'Kedong');
INSERT INTO `ctshop_region` VALUES ('230231', '拜泉县', '230200', '拜泉', '3', '0452', '164700', '中国,黑龙江省,齐齐哈尔市,拜泉县', '126.092', '47.6082', 'Baiquan');
INSERT INTO `ctshop_region` VALUES ('230281', '讷河市', '230200', '讷河', '3', '0452', '161300', '中国,黑龙江省,齐齐哈尔市,讷河市', '124.877', '48.4839', 'Nehe');
INSERT INTO `ctshop_region` VALUES ('230300', '鸡西市', '230000', '鸡西', '2', '0467', '158100', '中国,黑龙江省,鸡西市', '130.976', '45.3', 'Jixi');
INSERT INTO `ctshop_region` VALUES ('230302', '鸡冠区', '230300', '鸡冠', '3', '0467', '158100', '中国,黑龙江省,鸡西市,鸡冠区', '130.981', '45.304', 'Jiguan');
INSERT INTO `ctshop_region` VALUES ('230303', '恒山区', '230300', '恒山', '3', '0467', '158130', '中国,黑龙江省,鸡西市,恒山区', '130.905', '45.2107', 'Hengshan');
INSERT INTO `ctshop_region` VALUES ('230304', '滴道区', '230300', '滴道', '3', '0467', '158150', '中国,黑龙江省,鸡西市,滴道区', '130.848', '45.3511', 'Didao');
INSERT INTO `ctshop_region` VALUES ('230305', '梨树区', '230300', '梨树', '3', '0467', '158160', '中国,黑龙江省,鸡西市,梨树区', '130.698', '45.0904', 'Lishu');
INSERT INTO `ctshop_region` VALUES ('230306', '城子河区', '230300', '城子河', '3', '0467', '158170', '中国,黑龙江省,鸡西市,城子河区', '131.011', '45.3369', 'Chengzihe');
INSERT INTO `ctshop_region` VALUES ('230307', '麻山区', '230300', '麻山', '3', '0467', '158180', '中国,黑龙江省,鸡西市,麻山区', '130.478', '45.2121', 'Mashan');
INSERT INTO `ctshop_region` VALUES ('230321', '鸡东县', '230300', '鸡东', '3', '0467', '158200', '中国,黑龙江省,鸡西市,鸡东县', '131.124', '45.2603', 'Jidong');
INSERT INTO `ctshop_region` VALUES ('230381', '虎林市', '230300', '虎林', '3', '0467', '158400', '中国,黑龙江省,鸡西市,虎林市', '132.937', '45.7629', 'Hulin');
INSERT INTO `ctshop_region` VALUES ('230382', '密山市', '230300', '密山', '3', '0467', '158300', '中国,黑龙江省,鸡西市,密山市', '131.846', '45.5297', 'Mishan');
INSERT INTO `ctshop_region` VALUES ('230400', '鹤岗市', '230000', '鹤岗', '2', '0468', '154100', '中国,黑龙江省,鹤岗市', '130.277', '47.3321', 'Hegang');
INSERT INTO `ctshop_region` VALUES ('230402', '向阳区', '230400', '向阳', '3', '0468', '154100', '中国,黑龙江省,鹤岗市,向阳区', '130.294', '47.3425', 'Xiangyang');
INSERT INTO `ctshop_region` VALUES ('230403', '工农区', '230400', '工农', '3', '0468', '154101', '中国,黑龙江省,鹤岗市,工农区', '130.275', '47.3187', 'Gongnong');
INSERT INTO `ctshop_region` VALUES ('230404', '南山区', '230400', '南山', '3', '0468', '154104', '中国,黑龙江省,鹤岗市,南山区', '130.277', '47.314', 'Nanshan');
INSERT INTO `ctshop_region` VALUES ('230405', '兴安区', '230400', '兴安', '3', '0468', '154102', '中国,黑龙江省,鹤岗市,兴安区', '130.24', '47.2526', 'Xing\'an');
INSERT INTO `ctshop_region` VALUES ('230406', '东山区', '230400', '东山', '3', '0468', '154106', '中国,黑龙江省,鹤岗市,东山区', '130.317', '47.3385', 'Dongshan');
INSERT INTO `ctshop_region` VALUES ('230407', '兴山区', '230400', '兴山', '3', '0468', '154105', '中国,黑龙江省,鹤岗市,兴山区', '130.293', '47.3578', 'Xingshan');
INSERT INTO `ctshop_region` VALUES ('230421', '萝北县', '230400', '萝北', '3', '0468', '154200', '中国,黑龙江省,鹤岗市,萝北县', '130.833', '47.5796', 'Luobei');
INSERT INTO `ctshop_region` VALUES ('230422', '绥滨县', '230400', '绥滨', '3', '0468', '156200', '中国,黑龙江省,鹤岗市,绥滨县', '131.86', '47.2903', 'Suibin');
INSERT INTO `ctshop_region` VALUES ('230500', '双鸭山市', '230000', '双鸭山', '2', '0469', '155100', '中国,黑龙江省,双鸭山市', '131.157', '46.6434', 'Shuangyashan');
INSERT INTO `ctshop_region` VALUES ('230502', '尖山区', '230500', '尖山', '3', '0469', '155100', '中国,黑龙江省,双鸭山市,尖山区', '131.158', '46.6464', 'Jianshan');
INSERT INTO `ctshop_region` VALUES ('230503', '岭东区', '230500', '岭东', '3', '0469', '155120', '中国,黑龙江省,双鸭山市,岭东区', '131.165', '46.5904', 'Lingdong');
INSERT INTO `ctshop_region` VALUES ('230505', '四方台区', '230500', '四方台', '3', '0469', '155130', '中国,黑龙江省,双鸭山市,四方台区', '131.336', '46.595', 'Sifangtai');
INSERT INTO `ctshop_region` VALUES ('230506', '宝山区', '230500', '宝山', '3', '0469', '155131', '中国,黑龙江省,双鸭山市,宝山区', '131.402', '46.5772', 'Baoshan');
INSERT INTO `ctshop_region` VALUES ('230521', '集贤县', '230500', '集贤', '3', '0469', '155900', '中国,黑龙江省,双鸭山市,集贤县', '131.141', '46.7268', 'Jixian');
INSERT INTO `ctshop_region` VALUES ('230522', '友谊县', '230500', '友谊', '3', '0469', '155800', '中国,黑龙江省,双鸭山市,友谊县', '131.808', '46.7674', 'Youyi');
INSERT INTO `ctshop_region` VALUES ('230523', '宝清县', '230500', '宝清', '3', '0469', '155600', '中国,黑龙江省,双鸭山市,宝清县', '132.197', '46.3272', 'Baoqing');
INSERT INTO `ctshop_region` VALUES ('230524', '饶河县', '230500', '饶河', '3', '0469', '155700', '中国,黑龙江省,双鸭山市,饶河县', '134.02', '46.799', 'Raohe');
INSERT INTO `ctshop_region` VALUES ('230600', '大庆市', '230000', '大庆', '2', '0459', '163000', '中国,黑龙江省,大庆市', '125.113', '46.5907', 'Daqing');
INSERT INTO `ctshop_region` VALUES ('230602', '萨尔图区', '230600', '萨尔图', '3', '0459', '163001', '中国,黑龙江省,大庆市,萨尔图区', '125.088', '46.5936', 'Saertu');
INSERT INTO `ctshop_region` VALUES ('230603', '龙凤区', '230600', '龙凤', '3', '0459', '163711', '中国,黑龙江省,大庆市,龙凤区', '125.117', '46.5327', 'Longfeng');
INSERT INTO `ctshop_region` VALUES ('230604', '让胡路区', '230600', '让胡路', '3', '0459', '163712', '中国,黑龙江省,大庆市,让胡路区', '124.871', '46.6522', 'Ranghulu');
INSERT INTO `ctshop_region` VALUES ('230605', '红岗区', '230600', '红岗', '3', '0459', '163511', '中国,黑龙江省,大庆市,红岗区', '124.892', '46.4013', 'Honggang');
INSERT INTO `ctshop_region` VALUES ('230606', '大同区', '230600', '大同', '3', '0459', '163515', '中国,黑龙江省,大庆市,大同区', '124.816', '46.033', 'Datong');
INSERT INTO `ctshop_region` VALUES ('230621', '肇州县', '230600', '肇州', '3', '0459', '166400', '中国,黑龙江省,大庆市,肇州县', '125.271', '45.7041', 'Zhaozhou');
INSERT INTO `ctshop_region` VALUES ('230622', '肇源县', '230600', '肇源', '3', '0459', '166500', '中国,黑龙江省,大庆市,肇源县', '125.085', '45.5203', 'Zhaoyuan');
INSERT INTO `ctshop_region` VALUES ('230623', '林甸县', '230600', '林甸', '3', '0459', '166300', '中国,黑龙江省,大庆市,林甸县', '124.876', '47.186', 'Lindian');
INSERT INTO `ctshop_region` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '杜尔伯特', '3', '0459', '166200', '中国,黑龙江省,大庆市,杜尔伯特蒙古族自治县', '124.449', '46.8651', 'Duerbote');
INSERT INTO `ctshop_region` VALUES ('230700', '伊春市', '230000', '伊春', '2', '0458', '153000', '中国,黑龙江省,伊春市', '128.899', '47.7248', 'Yichun');
INSERT INTO `ctshop_region` VALUES ('230702', '伊春区', '230700', '伊春', '3', '0458', '153000', '中国,黑龙江省,伊春市,伊春区', '128.908', '47.728', 'Yichun');
INSERT INTO `ctshop_region` VALUES ('230703', '南岔区', '230700', '南岔', '3', '0458', '153100', '中国,黑龙江省,伊春市,南岔区', '129.284', '47.139', 'Nancha');
INSERT INTO `ctshop_region` VALUES ('230704', '友好区', '230700', '友好', '3', '0458', '153031', '中国,黑龙江省,伊春市,友好区', '128.84', '47.8537', 'Youhao');
INSERT INTO `ctshop_region` VALUES ('230705', '西林区', '230700', '西林', '3', '0458', '153025', '中国,黑龙江省,伊春市,西林区', '129.312', '47.481', 'Xilin');
INSERT INTO `ctshop_region` VALUES ('230706', '翠峦区', '230700', '翠峦', '3', '0458', '153013', '中国,黑龙江省,伊春市,翠峦区', '128.667', '47.725', 'Cuiluan');
INSERT INTO `ctshop_region` VALUES ('230707', '新青区', '230700', '新青', '3', '0458', '153036', '中国,黑龙江省,伊春市,新青区', '129.537', '48.2907', 'Xinqing');
INSERT INTO `ctshop_region` VALUES ('230708', '美溪区', '230700', '美溪', '3', '0458', '153021', '中国,黑龙江省,伊春市,美溪区', '129.137', '47.6351', 'Meixi');
INSERT INTO `ctshop_region` VALUES ('230709', '金山屯区', '230700', '金山屯', '3', '0458', '153026', '中国,黑龙江省,伊春市,金山屯区', '129.438', '47.4135', 'Jinshantun');
INSERT INTO `ctshop_region` VALUES ('230710', '五营区', '230700', '五营', '3', '0458', '153033', '中国,黑龙江省,伊春市,五营区', '129.245', '48.1079', 'Wuying');
INSERT INTO `ctshop_region` VALUES ('230711', '乌马河区', '230700', '乌马河', '3', '0458', '153011', '中国,黑龙江省,伊春市,乌马河区', '128.797', '47.728', 'Wumahe');
INSERT INTO `ctshop_region` VALUES ('230712', '汤旺河区', '230700', '汤旺河', '3', '0458', '153037', '中国,黑龙江省,伊春市,汤旺河区', '129.572', '48.4518', 'Tangwanghe');
INSERT INTO `ctshop_region` VALUES ('230713', '带岭区', '230700', '带岭', '3', '0458', '153106', '中国,黑龙江省,伊春市,带岭区', '129.024', '47.0255', 'Dailing');
INSERT INTO `ctshop_region` VALUES ('230714', '乌伊岭区', '230700', '乌伊岭', '3', '0458', '153038', '中国,黑龙江省,伊春市,乌伊岭区', '129.44', '48.596', 'Wuyiling');
INSERT INTO `ctshop_region` VALUES ('230715', '红星区', '230700', '红星', '3', '0458', '153035', '中国,黑龙江省,伊春市,红星区', '129.389', '48.2394', 'Hongxing');
INSERT INTO `ctshop_region` VALUES ('230716', '上甘岭区', '230700', '上甘岭', '3', '0458', '153032', '中国,黑龙江省,伊春市,上甘岭区', '129.024', '47.9752', 'Shangganling');
INSERT INTO `ctshop_region` VALUES ('230722', '嘉荫县', '230700', '嘉荫', '3', '0458', '153200', '中国,黑龙江省,伊春市,嘉荫县', '130.398', '48.8917', 'Jiayin');
INSERT INTO `ctshop_region` VALUES ('230781', '铁力市', '230700', '铁力', '3', '0458', '152500', '中国,黑龙江省,伊春市,铁力市', '128.032', '46.9857', 'Tieli');
INSERT INTO `ctshop_region` VALUES ('230800', '佳木斯市', '230000', '佳木斯', '2', '0454', '154002', '中国,黑龙江省,佳木斯市', '130.362', '46.8096', 'Jiamusi');
INSERT INTO `ctshop_region` VALUES ('230803', '向阳区', '230800', '向阳', '3', '0454', '154002', '中国,黑龙江省,佳木斯市,向阳区', '130.365', '46.8078', 'Xiangyang');
INSERT INTO `ctshop_region` VALUES ('230804', '前进区', '230800', '前进', '3', '0454', '154002', '中国,黑龙江省,佳木斯市,前进区', '130.375', '46.814', 'Qianjin');
INSERT INTO `ctshop_region` VALUES ('230805', '东风区', '230800', '东风', '3', '0454', '154005', '中国,黑龙江省,佳木斯市,东风区', '130.404', '46.8226', 'Dongfeng');
INSERT INTO `ctshop_region` VALUES ('230811', '郊区', '230800', '郊区', '3', '0454', '154004', '中国,黑龙江省,佳木斯市,郊区', '130.327', '46.8096', 'Jiaoqu');
INSERT INTO `ctshop_region` VALUES ('230822', '桦南县', '230800', '桦南', '3', '0454', '154400', '中国,黑龙江省,佳木斯市,桦南县', '130.554', '46.2392', 'Huanan');
INSERT INTO `ctshop_region` VALUES ('230826', '桦川县', '230800', '桦川', '3', '0454', '154300', '中国,黑龙江省,佳木斯市,桦川县', '130.719', '47.023', 'Huachuan');
INSERT INTO `ctshop_region` VALUES ('230828', '汤原县', '230800', '汤原', '3', '0454', '154700', '中国,黑龙江省,佳木斯市,汤原县', '129.91', '46.7276', 'Tangyuan');
INSERT INTO `ctshop_region` VALUES ('230833', '抚远县', '230800', '抚远', '3', '0454', '156500', '中国,黑龙江省,佳木斯市,抚远县', '134.296', '48.3679', 'Fuyuan');
INSERT INTO `ctshop_region` VALUES ('230881', '同江市', '230800', '同江', '3', '0454', '156400', '中国,黑龙江省,佳木斯市,同江市', '132.511', '47.6421', 'Tongjiang');
INSERT INTO `ctshop_region` VALUES ('230882', '富锦市', '230800', '富锦', '3', '0454', '156100', '中国,黑龙江省,佳木斯市,富锦市', '132.037', '47.2513', 'Fujin');
INSERT INTO `ctshop_region` VALUES ('230900', '七台河市', '230000', '七台河', '2', '0464', '154600', '中国,黑龙江省,七台河市', '131.016', '45.7713', 'Qitaihe');
INSERT INTO `ctshop_region` VALUES ('230902', '新兴区', '230900', '新兴', '3', '0464', '154604', '中国,黑龙江省,七台河市,新兴区', '130.932', '45.8162', 'Xinxing');
INSERT INTO `ctshop_region` VALUES ('230903', '桃山区', '230900', '桃山', '3', '0464', '154600', '中国,黑龙江省,七台河市,桃山区', '131.018', '45.7678', 'Taoshan');
INSERT INTO `ctshop_region` VALUES ('230904', '茄子河区', '230900', '茄子河', '3', '0464', '154622', '中国,黑龙江省,七台河市,茄子河区', '131.068', '45.7852', 'Qiezihe');
INSERT INTO `ctshop_region` VALUES ('230921', '勃利县', '230900', '勃利', '3', '0464', '154500', '中国,黑龙江省,七台河市,勃利县', '130.592', '45.755', 'Boli');
INSERT INTO `ctshop_region` VALUES ('231000', '牡丹江市', '230000', '牡丹江', '2', '0453', '157000', '中国,黑龙江省,牡丹江市', '129.619', '44.583', 'Mudanjiang');
INSERT INTO `ctshop_region` VALUES ('231002', '东安区', '231000', '东安', '3', '0453', '157000', '中国,黑龙江省,牡丹江市,东安区', '129.627', '44.5813', 'Dong\'an');
INSERT INTO `ctshop_region` VALUES ('231003', '阳明区', '231000', '阳明', '3', '0453', '157013', '中国,黑龙江省,牡丹江市,阳明区', '129.635', '44.596', 'Yangming');
INSERT INTO `ctshop_region` VALUES ('231004', '爱民区', '231000', '爱民', '3', '0453', '157009', '中国,黑龙江省,牡丹江市,爱民区', '129.591', '44.5965', 'Aimin');
INSERT INTO `ctshop_region` VALUES ('231005', '西安区', '231000', '西安', '3', '0453', '157000', '中国,黑龙江省,牡丹江市,西安区', '129.616', '44.5777', 'Xi\'an');
INSERT INTO `ctshop_region` VALUES ('231024', '东宁县', '231000', '东宁', '3', '0453', '157200', '中国,黑龙江省,牡丹江市,东宁县', '131.128', '44.0661', 'Dongning');
INSERT INTO `ctshop_region` VALUES ('231025', '林口县', '231000', '林口', '3', '0453', '157600', '中国,黑龙江省,牡丹江市,林口县', '130.284', '45.2781', 'Linkou');
INSERT INTO `ctshop_region` VALUES ('231081', '绥芬河市', '231000', '绥芬河', '3', '0453', '157300', '中国,黑龙江省,牡丹江市,绥芬河市', '131.151', '44.4125', 'Suifenhe');
INSERT INTO `ctshop_region` VALUES ('231083', '海林市', '231000', '海林', '3', '0453', '157100', '中国,黑龙江省,牡丹江市,海林市', '129.382', '44.59', 'Hailin');
INSERT INTO `ctshop_region` VALUES ('231084', '宁安市', '231000', '宁安', '3', '0453', '157400', '中国,黑龙江省,牡丹江市,宁安市', '129.483', '44.3402', 'Ning\'an');
INSERT INTO `ctshop_region` VALUES ('231085', '穆棱市', '231000', '穆棱', '3', '0453', '157500', '中国,黑龙江省,牡丹江市,穆棱市', '130.525', '44.919', 'Muling');
INSERT INTO `ctshop_region` VALUES ('231100', '黑河市', '230000', '黑河', '2', '0456', '164300', '中国,黑龙江省,黑河市', '127.499', '50.2496', 'Heihe');
INSERT INTO `ctshop_region` VALUES ('231102', '爱辉区', '231100', '爱辉', '3', '0456', '164300', '中国,黑龙江省,黑河市,爱辉区', '127.501', '50.252', 'Aihui');
INSERT INTO `ctshop_region` VALUES ('231121', '嫩江县', '231100', '嫩江', '3', '0456', '161400', '中国,黑龙江省,黑河市,嫩江县', '125.226', '49.1784', 'Nenjiang');
INSERT INTO `ctshop_region` VALUES ('231123', '逊克县', '231100', '逊克', '3', '0456', '164400', '中国,黑龙江省,黑河市,逊克县', '128.479', '49.5798', 'Xunke');
INSERT INTO `ctshop_region` VALUES ('231124', '孙吴县', '231100', '孙吴', '3', '0456', '164200', '中国,黑龙江省,黑河市,孙吴县', '127.336', '49.4254', 'Sunwu');
INSERT INTO `ctshop_region` VALUES ('231181', '北安市', '231100', '北安', '3', '0456', '164000', '中国,黑龙江省,黑河市,北安市', '126.482', '48.2387', 'Bei\'an');
INSERT INTO `ctshop_region` VALUES ('231182', '五大连池市', '231100', '五大连池', '3', '0456', '164100', '中国,黑龙江省,黑河市,五大连池市', '126.203', '48.5151', 'Wudalianchi');
INSERT INTO `ctshop_region` VALUES ('231200', '绥化市', '230000', '绥化', '2', '0455', '152000', '中国,黑龙江省,绥化市', '126.993', '46.6374', 'Suihua');
INSERT INTO `ctshop_region` VALUES ('231202', '北林区', '231200', '北林', '3', '0455', '152000', '中国,黑龙江省,绥化市,北林区', '126.986', '46.6373', 'Beilin');
INSERT INTO `ctshop_region` VALUES ('231221', '望奎县', '231200', '望奎', '3', '0455', '152100', '中国,黑龙江省,绥化市,望奎县', '126.482', '46.8308', 'Wangkui');
INSERT INTO `ctshop_region` VALUES ('231222', '兰西县', '231200', '兰西', '3', '0455', '151500', '中国,黑龙江省,绥化市,兰西县', '126.29', '46.2525', 'Lanxi');
INSERT INTO `ctshop_region` VALUES ('231223', '青冈县', '231200', '青冈', '3', '0455', '151600', '中国,黑龙江省,绥化市,青冈县', '126.113', '46.6853', 'Qinggang');
INSERT INTO `ctshop_region` VALUES ('231224', '庆安县', '231200', '庆安', '3', '0455', '152400', '中国,黑龙江省,绥化市,庆安县', '127.508', '46.8802', 'Qing\'an');
INSERT INTO `ctshop_region` VALUES ('231225', '明水县', '231200', '明水', '3', '0455', '151700', '中国,黑龙江省,绥化市,明水县', '125.906', '47.1733', 'Mingshui');
INSERT INTO `ctshop_region` VALUES ('231226', '绥棱县', '231200', '绥棱', '3', '0455', '152200', '中国,黑龙江省,绥化市,绥棱县', '127.116', '47.2427', 'Suileng');
INSERT INTO `ctshop_region` VALUES ('231281', '安达市', '231200', '安达', '3', '0455', '151400', '中国,黑龙江省,绥化市,安达市', '125.344', '46.4177', 'Anda');
INSERT INTO `ctshop_region` VALUES ('231282', '肇东市', '231200', '肇东', '3', '0455', '151100', '中国,黑龙江省,绥化市,肇东市', '125.962', '46.0513', 'Zhaodong');
INSERT INTO `ctshop_region` VALUES ('231283', '海伦市', '231200', '海伦', '3', '0455', '152300', '中国,黑龙江省,绥化市,海伦市', '126.968', '47.4609', 'Hailun');
INSERT INTO `ctshop_region` VALUES ('232700', '大兴安岭地区', '230000', '大兴安岭', '2', '0457', '165000', '中国,黑龙江省,大兴安岭地区', '124.712', '52.3353', 'DaXingAnLing');
INSERT INTO `ctshop_region` VALUES ('232701', '加格达奇区', '232700', '加格达奇', '3', '0457', '165000', '中国,黑龙江省,大兴安岭地区,加格达奇区', '124.31', '51.9814', 'Jiagedaqi');
INSERT INTO `ctshop_region` VALUES ('232702', '新林区', '232700', '新林', '3', '0457', '165000', '中国,黑龙江省,大兴安岭地区,新林区', '124.398', '51.6734', 'Xinlin');
INSERT INTO `ctshop_region` VALUES ('232703', '松岭区', '232700', '松岭', '3', '0457', '165000', '中国,黑龙江省,大兴安岭地区,松岭区', '124.19', '51.9855', 'Songling');
INSERT INTO `ctshop_region` VALUES ('232704', '呼中区', '232700', '呼中', '3', '0457', '165000', '中国,黑龙江省,大兴安岭地区,呼中区', '123.6', '52.0335', 'Huzhong');
INSERT INTO `ctshop_region` VALUES ('232721', '呼玛县', '232700', '呼玛', '3', '0457', '165100', '中国,黑龙江省,大兴安岭地区,呼玛县', '126.662', '51.7311', 'Huma');
INSERT INTO `ctshop_region` VALUES ('232722', '塔河县', '232700', '塔河', '3', '0457', '165200', '中国,黑龙江省,大兴安岭地区,塔河县', '124.71', '52.3343', 'Tahe');
INSERT INTO `ctshop_region` VALUES ('232723', '漠河县', '232700', '漠河', '3', '0457', '165300', '中国,黑龙江省,大兴安岭地区,漠河县', '122.538', '52.97', 'Mohe');
INSERT INTO `ctshop_region` VALUES ('310000', '上海', '100000', '上海', '1', '', '', '中国,上海', '121.473', '31.2317', 'Shanghai');
INSERT INTO `ctshop_region` VALUES ('310100', '上海市', '310000', '上海', '2', '021', '200000', '中国,上海,上海市', '121.473', '31.2317', 'Shanghai');
INSERT INTO `ctshop_region` VALUES ('310101', '黄浦区', '310100', '黄浦', '3', '021', '200001', '中国,上海,上海市,黄浦区', '121.493', '31.2234', 'Huangpu');
INSERT INTO `ctshop_region` VALUES ('310104', '徐汇区', '310100', '徐汇', '3', '021', '200030', '中国,上海,上海市,徐汇区', '121.437', '31.1883', 'Xuhui');
INSERT INTO `ctshop_region` VALUES ('310105', '长宁区', '310100', '长宁', '3', '021', '200050', '中国,上海,上海市,长宁区', '121.425', '31.2204', 'Changning');
INSERT INTO `ctshop_region` VALUES ('310106', '静安区', '310100', '静安', '3', '021', '200040', '中国,上海,上海市,静安区', '121.444', '31.2288', 'Jing\'an');
INSERT INTO `ctshop_region` VALUES ('310107', '普陀区', '310100', '普陀', '3', '021', '200333', '中国,上海,上海市,普陀区', '121.397', '31.2495', 'Putuo');
INSERT INTO `ctshop_region` VALUES ('310108', '闸北区', '310100', '闸北', '3', '021', '200070', '中国,上海,上海市,闸北区', '121.446', '31.2808', 'Zhabei');
INSERT INTO `ctshop_region` VALUES ('310109', '虹口区', '310100', '虹口', '3', '021', '200086', '中国,上海,上海市,虹口区', '121.482', '31.2779', 'Hongkou');
INSERT INTO `ctshop_region` VALUES ('310110', '杨浦区', '310100', '杨浦', '3', '021', '200082', '中国,上海,上海市,杨浦区', '121.526', '31.2595', 'Yangpu');
INSERT INTO `ctshop_region` VALUES ('310112', '闵行区', '310100', '闵行', '3', '021', '201100', '中国,上海,上海市,闵行区', '121.382', '31.1125', 'Minhang');
INSERT INTO `ctshop_region` VALUES ('310113', '宝山区', '310100', '宝山', '3', '021', '201900', '中国,上海,上海市,宝山区', '121.489', '31.4045', 'Baoshan');
INSERT INTO `ctshop_region` VALUES ('310114', '嘉定区', '310100', '嘉定', '3', '021', '201800', '中国,上海,上海市,嘉定区', '121.266', '31.3747', 'Jiading');
INSERT INTO `ctshop_region` VALUES ('310115', '浦东新区', '310100', '浦东', '3', '021', '200135', '中国,上海,上海市,浦东新区', '121.545', '31.2225', 'Pudong');
INSERT INTO `ctshop_region` VALUES ('310116', '金山区', '310100', '金山', '3', '021', '200540', '中国,上海,上海市,金山区', '121.342', '30.7416', 'Jinshan');
INSERT INTO `ctshop_region` VALUES ('310117', '松江区', '310100', '松江', '3', '021', '201600', '中国,上海,上海市,松江区', '121.229', '31.0322', 'Songjiang');
INSERT INTO `ctshop_region` VALUES ('310118', '青浦区', '310100', '青浦', '3', '021', '201700', '中国,上海,上海市,青浦区', '121.124', '31.1497', 'Qingpu');
INSERT INTO `ctshop_region` VALUES ('310120', '奉贤区', '310100', '奉贤', '3', '021', '201400', '中国,上海,上海市,奉贤区', '121.474', '30.9179', 'Fengxian');
INSERT INTO `ctshop_region` VALUES ('310230', '崇明县', '310100', '崇明', '3', '021', '202150', '中国,上海,上海市,崇明县', '121.398', '31.6228', 'Chongming');
INSERT INTO `ctshop_region` VALUES ('320000', '江苏省', '100000', '江苏', '1', '', '', '中国,江苏省', '118.767', '32.0415', 'Jiangsu');
INSERT INTO `ctshop_region` VALUES ('320100', '南京市', '320000', '南京', '2', '025', '210008', '中国,江苏省,南京市', '118.767', '32.0415', 'Nanjing');
INSERT INTO `ctshop_region` VALUES ('320102', '玄武区', '320100', '玄武', '3', '025', '210018', '中国,江苏省,南京市,玄武区', '118.798', '32.0486', 'Xuanwu');
INSERT INTO `ctshop_region` VALUES ('320104', '秦淮区', '320100', '秦淮', '3', '025', '210001', '中国,江苏省,南京市,秦淮区', '118.798', '32.0111', 'Qinhuai');
INSERT INTO `ctshop_region` VALUES ('320105', '建邺区', '320100', '建邺', '3', '025', '210004', '中国,江苏省,南京市,建邺区', '118.766', '32.031', 'Jianye');
INSERT INTO `ctshop_region` VALUES ('320106', '鼓楼区', '320100', '鼓楼', '3', '025', '210009', '中国,江苏省,南京市,鼓楼区', '118.77', '32.0663', 'Gulou');
INSERT INTO `ctshop_region` VALUES ('320111', '浦口区', '320100', '浦口', '3', '025', '211800', '中国,江苏省,南京市,浦口区', '118.628', '32.0588', 'Pukou');
INSERT INTO `ctshop_region` VALUES ('320113', '栖霞区', '320100', '栖霞', '3', '025', '210046', '中国,江苏省,南京市,栖霞区', '118.881', '32.1135', 'Qixia');
INSERT INTO `ctshop_region` VALUES ('320114', '雨花台区', '320100', '雨花台', '3', '025', '210012', '中国,江苏省,南京市,雨花台区', '118.78', '31.992', 'Yuhuatai');
INSERT INTO `ctshop_region` VALUES ('320115', '江宁区', '320100', '江宁', '3', '025', '211100', '中国,江苏省,南京市,江宁区', '118.84', '31.9526', 'Jiangning');
INSERT INTO `ctshop_region` VALUES ('320116', '六合区', '320100', '六合', '3', '025', '211500', '中国,江苏省,南京市,六合区', '118.841', '32.3422', 'Luhe');
INSERT INTO `ctshop_region` VALUES ('320117', '溧水区', '320100', '溧水', '3', '025', '211200', '中国,江苏省,南京市,溧水区', '119.029', '31.6531', 'Lishui');
INSERT INTO `ctshop_region` VALUES ('320118', '高淳区', '320100', '高淳', '3', '025', '211300', '中国,江苏省,南京市,高淳区', '118.876', '31.3271', 'Gaochun');
INSERT INTO `ctshop_region` VALUES ('320200', '无锡市', '320000', '无锡', '2', '0510', '214000', '中国,江苏省,无锡市', '120.302', '31.5747', 'Wuxi');
INSERT INTO `ctshop_region` VALUES ('320202', '崇安区', '320200', '崇安', '3', '0510', '214001', '中国,江苏省,无锡市,崇安区', '120.3', '31.58', 'Chong\'an');
INSERT INTO `ctshop_region` VALUES ('320203', '南长区', '320200', '南长', '3', '0510', '214021', '中国,江苏省,无锡市,南长区', '120.309', '31.5636', 'Nanchang');
INSERT INTO `ctshop_region` VALUES ('320204', '北塘区', '320200', '北塘', '3', '0510', '214044', '中国,江苏省,无锡市,北塘区', '120.294', '31.6059', 'Beitang');
INSERT INTO `ctshop_region` VALUES ('320205', '锡山区', '320200', '锡山', '3', '0510', '214101', '中国,江苏省,无锡市,锡山区', '120.357', '31.5886', 'Xishan');
INSERT INTO `ctshop_region` VALUES ('320206', '惠山区', '320200', '惠山', '3', '0510', '214174', '中国,江苏省,无锡市,惠山区', '120.298', '31.6809', 'Huishan');
INSERT INTO `ctshop_region` VALUES ('320211', '滨湖区', '320200', '滨湖', '3', '0510', '214123', '中国,江苏省,无锡市,滨湖区', '120.295', '31.5216', 'Binhu');
INSERT INTO `ctshop_region` VALUES ('320281', '江阴市', '320200', '江阴', '3', '0510', '214431', '中国,江苏省,无锡市,江阴市', '120.285', '31.92', 'Jiangyin');
INSERT INTO `ctshop_region` VALUES ('320282', '宜兴市', '320200', '宜兴', '3', '0510', '214200', '中国,江苏省,无锡市,宜兴市', '119.824', '31.3398', 'Yixing');
INSERT INTO `ctshop_region` VALUES ('320300', '徐州市', '320000', '徐州', '2', '0516', '221003', '中国,江苏省,徐州市', '117.185', '34.2618', 'Xuzhou');
INSERT INTO `ctshop_region` VALUES ('320302', '鼓楼区', '320300', '鼓楼', '3', '0516', '221005', '中国,江苏省,徐州市,鼓楼区', '117.186', '34.2885', 'Gulou');
INSERT INTO `ctshop_region` VALUES ('320303', '云龙区', '320300', '云龙', '3', '0516', '221007', '中国,江苏省,徐州市,云龙区', '117.231', '34.249', 'Yunlong');
INSERT INTO `ctshop_region` VALUES ('320305', '贾汪区', '320300', '贾汪', '3', '0516', '221003', '中国,江苏省,徐州市,贾汪区', '117.453', '34.4426', 'Jiawang');
INSERT INTO `ctshop_region` VALUES ('320311', '泉山区', '320300', '泉山', '3', '0516', '221006', '中国,江苏省,徐州市,泉山区', '117.194', '34.2442', 'Quanshan');
INSERT INTO `ctshop_region` VALUES ('320312', '铜山区', '320300', '铜山', '3', '0516', '221106', '中国,江苏省,徐州市,铜山区', '117.184', '34.1929', 'Tongshan');
INSERT INTO `ctshop_region` VALUES ('320321', '丰县', '320300', '丰县', '3', '0516', '221700', '中国,江苏省,徐州市,丰县', '116.6', '34.6997', 'Fengxian');
INSERT INTO `ctshop_region` VALUES ('320322', '沛县', '320300', '沛县', '3', '0516', '221600', '中国,江苏省,徐州市,沛县', '116.937', '34.7216', 'Peixian');
INSERT INTO `ctshop_region` VALUES ('320324', '睢宁县', '320300', '睢宁', '3', '0516', '221200', '中国,江苏省,徐州市,睢宁县', '117.941', '33.9127', 'Suining');
INSERT INTO `ctshop_region` VALUES ('320381', '新沂市', '320300', '新沂', '3', '0516', '221400', '中国,江苏省,徐州市,新沂市', '118.355', '34.3694', 'Xinyi');
INSERT INTO `ctshop_region` VALUES ('320382', '邳州市', '320300', '邳州', '3', '0516', '221300', '中国,江苏省,徐州市,邳州市', '117.959', '34.3333', 'Pizhou');
INSERT INTO `ctshop_region` VALUES ('320400', '常州市', '320000', '常州', '2', '0519', '213000', '中国,江苏省,常州市', '119.947', '31.7728', 'Changzhou');
INSERT INTO `ctshop_region` VALUES ('320402', '天宁区', '320400', '天宁', '3', '0519', '213000', '中国,江苏省,常州市,天宁区', '119.951', '31.7521', 'Tianning');
INSERT INTO `ctshop_region` VALUES ('320404', '钟楼区', '320400', '钟楼', '3', '0519', '213023', '中国,江苏省,常州市,钟楼区', '119.902', '31.8022', 'Zhonglou');
INSERT INTO `ctshop_region` VALUES ('320405', '戚墅堰区', '320400', '戚墅堰', '3', '0519', '213025', '中国,江苏省,常州市,戚墅堰区', '120.061', '31.7196', 'Qishuyan');
INSERT INTO `ctshop_region` VALUES ('320411', '新北区', '320400', '新北', '3', '0519', '213022', '中国,江苏省,常州市,新北区', '119.971', '31.8305', 'Xinbei');
INSERT INTO `ctshop_region` VALUES ('320412', '武进区', '320400', '武进', '3', '0519', '213100', '中国,江苏省,常州市,武进区', '119.942', '31.7009', 'Wujin');
INSERT INTO `ctshop_region` VALUES ('320481', '溧阳市', '320400', '溧阳', '3', '0519', '213300', '中国,江苏省,常州市,溧阳市', '119.484', '31.4154', 'Liyang');
INSERT INTO `ctshop_region` VALUES ('320482', '金坛市', '320400', '金坛', '3', '0519', '213200', '中国,江苏省,常州市,金坛市', '119.578', '31.7404', 'Jintan');
INSERT INTO `ctshop_region` VALUES ('320500', '苏州市', '320000', '苏州', '2', '0512', '215002', '中国,江苏省,苏州市', '120.62', '31.2994', 'Suzhou');
INSERT INTO `ctshop_region` VALUES ('320505', '虎丘区', '320500', '虎丘', '3', '0512', '215004', '中国,江苏省,苏州市,虎丘区', '120.573', '31.2953', 'Huqiu');
INSERT INTO `ctshop_region` VALUES ('320506', '吴中区', '320500', '吴中', '3', '0512', '215128', '中国,江苏省,苏州市,吴中区', '120.632', '31.2623', 'Wuzhong');
INSERT INTO `ctshop_region` VALUES ('320507', '相城区', '320500', '相城', '3', '0512', '215131', '中国,江苏省,苏州市,相城区', '120.642', '31.3689', 'Xiangcheng');
INSERT INTO `ctshop_region` VALUES ('320508', '姑苏区', '320500', '姑苏', '3', '0512', '215031', '中国,江苏省,苏州市,姑苏区', '120.62', '31.2994', 'Gusu');
INSERT INTO `ctshop_region` VALUES ('320509', '吴江区', '320500', '吴江', '3', '0512', '215200', '中国,江苏省,苏州市,吴江区', '120.638', '31.1598', 'Wujiang');
INSERT INTO `ctshop_region` VALUES ('320581', '常熟市', '320500', '常熟', '3', '0512', '215500', '中国,江苏省,苏州市,常熟市', '120.752', '31.6537', 'Changshu');
INSERT INTO `ctshop_region` VALUES ('320582', '张家港市', '320500', '张家港', '3', '0512', '215600', '中国,江苏省,苏州市,张家港市', '120.555', '31.8753', 'Zhangjiagang');
INSERT INTO `ctshop_region` VALUES ('320583', '昆山市', '320500', '昆山', '3', '0512', '215300', '中国,江苏省,苏州市,昆山市', '120.981', '31.3846', 'Kunshan');
INSERT INTO `ctshop_region` VALUES ('320585', '太仓市', '320500', '太仓', '3', '0512', '215400', '中国,江苏省,苏州市,太仓市', '121.109', '31.4497', 'Taicang');
INSERT INTO `ctshop_region` VALUES ('320600', '南通市', '320000', '南通', '2', '0513', '226001', '中国,江苏省,南通市', '120.865', '32.0162', 'Nantong');
INSERT INTO `ctshop_region` VALUES ('320602', '崇川区', '320600', '崇川', '3', '0513', '226001', '中国,江苏省,南通市,崇川区', '120.857', '32.0098', 'Chongchuan');
INSERT INTO `ctshop_region` VALUES ('320611', '港闸区', '320600', '港闸', '3', '0513', '226001', '中国,江苏省,南通市,港闸区', '120.818', '32.0316', 'Gangzha');
INSERT INTO `ctshop_region` VALUES ('320612', '通州区', '320600', '通州', '3', '0513', '226300', '中国,江苏省,南通市,通州区', '121.073', '32.0676', 'Tongzhou');
INSERT INTO `ctshop_region` VALUES ('320621', '海安县', '320600', '海安', '3', '0513', '226600', '中国,江苏省,南通市,海安县', '120.459', '32.5451', 'Hai\'an');
INSERT INTO `ctshop_region` VALUES ('320623', '如东县', '320600', '如东', '3', '0513', '226400', '中国,江苏省,南通市,如东县', '121.189', '32.3144', 'Rudong');
INSERT INTO `ctshop_region` VALUES ('320681', '启东市', '320600', '启东', '3', '0513', '226200', '中国,江苏省,南通市,启东市', '121.66', '31.8108', 'Qidong');
INSERT INTO `ctshop_region` VALUES ('320682', '如皋市', '320600', '如皋', '3', '0513', '226500', '中国,江苏省,南通市,如皋市', '120.56', '32.376', 'Rugao');
INSERT INTO `ctshop_region` VALUES ('320684', '海门市', '320600', '海门', '3', '0513', '226100', '中国,江苏省,南通市,海门市', '121.17', '31.8942', 'Haimen');
INSERT INTO `ctshop_region` VALUES ('320700', '连云港市', '320000', '连云港', '2', '0518', '222002', '中国,江苏省,连云港市', '119.179', '34.6', 'Lianyungang');
INSERT INTO `ctshop_region` VALUES ('320703', '连云区', '320700', '连云', '3', '0518', '222042', '中国,江苏省,连云港市,连云区', '119.373', '34.7529', 'Lianyun');
INSERT INTO `ctshop_region` VALUES ('320706', '海州区', '320700', '海州', '3', '0518', '222003', '中国,江苏省,连云港市,海州区', '119.131', '34.5699', 'Haizhou');
INSERT INTO `ctshop_region` VALUES ('320707', '赣榆区', '320700', '赣榆', '3', '0518', '222100', '中国,江苏省,连云港市,赣榆区', '119.129', '34.8392', 'Ganyu');
INSERT INTO `ctshop_region` VALUES ('320722', '东海县', '320700', '东海', '3', '0518', '222300', '中国,江苏省,连云港市,东海县', '118.771', '34.5421', 'Donghai');
INSERT INTO `ctshop_region` VALUES ('320723', '灌云县', '320700', '灌云', '3', '0518', '222200', '中国,江苏省,连云港市,灌云县', '119.239', '34.2839', 'Guanyun');
INSERT INTO `ctshop_region` VALUES ('320724', '灌南县', '320700', '灌南', '3', '0518', '222500', '中国,江苏省,连云港市,灌南县', '119.356', '34.09', 'Guannan');
INSERT INTO `ctshop_region` VALUES ('320800', '淮安市', '320000', '淮安', '2', '0517', '223001', '中国,江苏省,淮安市', '119.021', '33.5975', 'Huai\'an');
INSERT INTO `ctshop_region` VALUES ('320802', '清河区', '320800', '清河', '3', '0517', '223001', '中国,江苏省,淮安市,清河区', '119.008', '33.5995', 'Qinghe');
INSERT INTO `ctshop_region` VALUES ('320803', '淮安区', '320800', '淮安', '3', '0517', '223200', '中国,江苏省,淮安市,淮安区', '119.021', '33.5975', 'Huai\'an');
INSERT INTO `ctshop_region` VALUES ('320804', '淮阴区', '320800', '淮阴', '3', '0517', '223300', '中国,江苏省,淮安市,淮阴区', '119.035', '33.6317', 'Huaiyin');
INSERT INTO `ctshop_region` VALUES ('320811', '清浦区', '320800', '清浦', '3', '0517', '223002', '中国,江苏省,淮安市,清浦区', '119.026', '33.5523', 'Qingpu');
INSERT INTO `ctshop_region` VALUES ('320826', '涟水县', '320800', '涟水', '3', '0517', '223400', '中国,江苏省,淮安市,涟水县', '119.261', '33.7809', 'Lianshui');
INSERT INTO `ctshop_region` VALUES ('320829', '洪泽县', '320800', '洪泽', '3', '0517', '223100', '中国,江苏省,淮安市,洪泽县', '118.873', '33.2943', 'Hongze');
INSERT INTO `ctshop_region` VALUES ('320830', '盱眙县', '320800', '盱眙', '3', '0517', '211700', '中国,江苏省,淮安市,盱眙县', '118.545', '33.0109', 'Xuyi');
INSERT INTO `ctshop_region` VALUES ('320831', '金湖县', '320800', '金湖', '3', '0517', '211600', '中国,江苏省,淮安市,金湖县', '119.023', '33.0222', 'Jinhu');
INSERT INTO `ctshop_region` VALUES ('320900', '盐城市', '320000', '盐城', '2', '0515', '224005', '中国,江苏省,盐城市', '120.14', '33.3776', 'Yancheng');
INSERT INTO `ctshop_region` VALUES ('320902', '亭湖区', '320900', '亭湖', '3', '0515', '224005', '中国,江苏省,盐城市,亭湖区', '120.166', '33.3783', 'Tinghu');
INSERT INTO `ctshop_region` VALUES ('320903', '盐都区', '320900', '盐都', '3', '0515', '224055', '中国,江苏省,盐城市,盐都区', '120.154', '33.3373', 'Yandu');
INSERT INTO `ctshop_region` VALUES ('320921', '响水县', '320900', '响水', '3', '0515', '224600', '中国,江苏省,盐城市,响水县', '119.57', '34.2051', 'Xiangshui');
INSERT INTO `ctshop_region` VALUES ('320922', '滨海县', '320900', '滨海', '3', '0515', '224500', '中国,江苏省,盐城市,滨海县', '119.821', '33.9897', 'Binhai');
INSERT INTO `ctshop_region` VALUES ('320923', '阜宁县', '320900', '阜宁', '3', '0515', '224400', '中国,江苏省,盐城市,阜宁县', '119.802', '33.7823', 'Funing');
INSERT INTO `ctshop_region` VALUES ('320924', '射阳县', '320900', '射阳', '3', '0515', '224300', '中国,江苏省,盐城市,射阳县', '120.26', '33.7764', 'Sheyang');
INSERT INTO `ctshop_region` VALUES ('320925', '建湖县', '320900', '建湖', '3', '0515', '224700', '中国,江苏省,盐城市,建湖县', '119.799', '33.4724', 'Jianhu');
INSERT INTO `ctshop_region` VALUES ('320981', '东台市', '320900', '东台', '3', '0515', '224200', '中国,江苏省,盐城市,东台市', '120.324', '32.8508', 'Dongtai');
INSERT INTO `ctshop_region` VALUES ('320982', '大丰市', '320900', '大丰', '3', '0515', '224100', '中国,江苏省,盐城市,大丰市', '120.466', '33.1989', 'Dafeng');
INSERT INTO `ctshop_region` VALUES ('321000', '扬州市', '320000', '扬州', '2', '0514', '225002', '中国,江苏省,扬州市', '119.421', '32.3932', 'Yangzhou');
INSERT INTO `ctshop_region` VALUES ('321002', '广陵区', '321000', '广陵', '3', '0514', '225002', '中国,江苏省,扬州市,广陵区', '119.432', '32.3947', 'Guangling');
INSERT INTO `ctshop_region` VALUES ('321003', '邗江区', '321000', '邗江', '3', '0514', '225002', '中国,江苏省,扬州市,邗江区', '119.398', '32.3765', 'Hanjiang');
INSERT INTO `ctshop_region` VALUES ('321012', '江都区', '321000', '江都', '3', '0514', '225200', '中国,江苏省,扬州市,江都区', '119.567', '32.4266', 'Jiangdu');
INSERT INTO `ctshop_region` VALUES ('321023', '宝应县', '321000', '宝应', '3', '0514', '225800', '中国,江苏省,扬州市,宝应县', '119.312', '33.2355', 'Baoying');
INSERT INTO `ctshop_region` VALUES ('321081', '仪征市', '321000', '仪征', '3', '0514', '211400', '中国,江苏省,扬州市,仪征市', '119.184', '32.272', 'Yizheng');
INSERT INTO `ctshop_region` VALUES ('321084', '高邮市', '321000', '高邮', '3', '0514', '225600', '中国,江苏省,扬州市,高邮市', '119.46', '32.7813', 'Gaoyou');
INSERT INTO `ctshop_region` VALUES ('321100', '镇江市', '320000', '镇江', '2', '0511', '212004', '中国,江苏省,镇江市', '119.453', '32.2044', 'Zhenjiang');
INSERT INTO `ctshop_region` VALUES ('321102', '京口区', '321100', '京口', '3', '0511', '212003', '中国,江苏省,镇江市,京口区', '119.469', '32.1981', 'Jingkou');
INSERT INTO `ctshop_region` VALUES ('321111', '润州区', '321100', '润州', '3', '0511', '212005', '中国,江苏省,镇江市,润州区', '119.411', '32.1952', 'Runzhou');
INSERT INTO `ctshop_region` VALUES ('321112', '丹徒区', '321100', '丹徒', '3', '0511', '212028', '中国,江苏省,镇江市,丹徒区', '119.434', '32.1318', 'Dantu');
INSERT INTO `ctshop_region` VALUES ('321181', '丹阳市', '321100', '丹阳', '3', '0511', '212300', '中国,江苏省,镇江市,丹阳市', '119.575', '31.9912', 'Danyang');
INSERT INTO `ctshop_region` VALUES ('321182', '扬中市', '321100', '扬中', '3', '0511', '212200', '中国,江苏省,镇江市,扬中市', '119.797', '32.2363', 'Yangzhong');
INSERT INTO `ctshop_region` VALUES ('321183', '句容市', '321100', '句容', '3', '0511', '212400', '中国,江苏省,镇江市,句容市', '119.165', '31.9559', 'Jurong');
INSERT INTO `ctshop_region` VALUES ('321200', '泰州市', '320000', '泰州', '2', '0523', '225300', '中国,江苏省,泰州市', '119.915', '32.4849', 'Taizhou');
INSERT INTO `ctshop_region` VALUES ('321202', '海陵区', '321200', '海陵', '3', '0523', '225300', '中国,江苏省,泰州市,海陵区', '119.919', '32.491', 'Hailing');
INSERT INTO `ctshop_region` VALUES ('321203', '高港区', '321200', '高港', '3', '0523', '225321', '中国,江苏省,泰州市,高港区', '119.881', '32.3183', 'Gaogang');
INSERT INTO `ctshop_region` VALUES ('321204', '姜堰区', '321200', '姜堰', '3', '0523', '225500', '中国,江苏省,泰州市,姜堰区', '120.148', '32.5085', 'Jiangyan');
INSERT INTO `ctshop_region` VALUES ('321281', '兴化市', '321200', '兴化', '3', '0523', '225700', '中国,江苏省,泰州市,兴化市', '119.852', '32.9094', 'Xinghua');
INSERT INTO `ctshop_region` VALUES ('321282', '靖江市', '321200', '靖江', '3', '0523', '214500', '中国,江苏省,泰州市,靖江市', '120.273', '32.0159', 'Jingjiang');
INSERT INTO `ctshop_region` VALUES ('321283', '泰兴市', '321200', '泰兴', '3', '0523', '225400', '中国,江苏省,泰州市,泰兴市', '120.052', '32.1719', 'Taixing');
INSERT INTO `ctshop_region` VALUES ('321300', '宿迁市', '320000', '宿迁', '2', '0527', '223800', '中国,江苏省,宿迁市', '118.293', '33.9452', 'Suqian');
INSERT INTO `ctshop_region` VALUES ('321302', '宿城区', '321300', '宿城', '3', '0527', '223800', '中国,江苏省,宿迁市,宿城区', '118.291', '33.9422', 'Sucheng');
INSERT INTO `ctshop_region` VALUES ('321311', '宿豫区', '321300', '宿豫', '3', '0527', '223800', '中国,江苏省,宿迁市,宿豫区', '118.329', '33.9467', 'Suyu');
INSERT INTO `ctshop_region` VALUES ('321322', '沭阳县', '321300', '沭阳', '3', '0527', '223600', '中国,江苏省,宿迁市,沭阳县', '118.769', '34.1145', 'Shuyang');
INSERT INTO `ctshop_region` VALUES ('321323', '泗阳县', '321300', '泗阳', '3', '0527', '223700', '中国,江苏省,宿迁市,泗阳县', '118.703', '33.721', 'Siyang');
INSERT INTO `ctshop_region` VALUES ('321324', '泗洪县', '321300', '泗洪', '3', '0527', '223900', '中国,江苏省,宿迁市,泗洪县', '118.217', '33.46', 'Sihong');
INSERT INTO `ctshop_region` VALUES ('330000', '浙江省', '100000', '浙江', '1', '', '', '中国,浙江省', '120.154', '30.2875', 'Zhejiang');
INSERT INTO `ctshop_region` VALUES ('330100', '杭州市', '330000', '杭州', '2', '0571', '310026', '中国,浙江省,杭州市', '120.154', '30.2875', 'Hangzhou');
INSERT INTO `ctshop_region` VALUES ('330102', '上城区', '330100', '上城', '3', '0571', '310002', '中国,浙江省,杭州市,上城区', '120.169', '30.2425', 'Shangcheng');
INSERT INTO `ctshop_region` VALUES ('330103', '下城区', '330100', '下城', '3', '0571', '310006', '中国,浙江省,杭州市,下城区', '120.181', '30.2815', 'Xiacheng');
INSERT INTO `ctshop_region` VALUES ('330104', '江干区', '330100', '江干', '3', '0571', '310016', '中国,浙江省,杭州市,江干区', '120.205', '30.2572', 'Jianggan');
INSERT INTO `ctshop_region` VALUES ('330105', '拱墅区', '330100', '拱墅', '3', '0571', '310011', '中国,浙江省,杭州市,拱墅区', '120.142', '30.3197', 'Gongshu');
INSERT INTO `ctshop_region` VALUES ('330106', '西湖区', '330100', '西湖', '3', '0571', '310013', '中国,浙江省,杭州市,西湖区', '120.13', '30.2595', 'Xihu');
INSERT INTO `ctshop_region` VALUES ('330108', '滨江区', '330100', '滨江', '3', '0571', '310051', '中国,浙江省,杭州市,滨江区', '120.212', '30.2083', 'Binjiang');
INSERT INTO `ctshop_region` VALUES ('330109', '萧山区', '330100', '萧山', '3', '0571', '311200', '中国,浙江省,杭州市,萧山区', '120.265', '30.185', 'Xiaoshan');
INSERT INTO `ctshop_region` VALUES ('330110', '余杭区', '330100', '余杭', '3', '0571', '311100', '中国,浙江省,杭州市,余杭区', '120.3', '30.4183', 'Yuhang');
INSERT INTO `ctshop_region` VALUES ('330122', '桐庐县', '330100', '桐庐', '3', '0571', '311500', '中国,浙江省,杭州市,桐庐县', '119.689', '29.7978', 'Tonglu');
INSERT INTO `ctshop_region` VALUES ('330127', '淳安县', '330100', '淳安', '3', '0571', '311700', '中国,浙江省,杭州市,淳安县', '119.043', '29.6099', 'Chun\'an');
INSERT INTO `ctshop_region` VALUES ('330182', '建德市', '330100', '建德', '3', '0571', '311600', '中国,浙江省,杭州市,建德市', '119.282', '29.476', 'Jiande');
INSERT INTO `ctshop_region` VALUES ('330183', '富阳区', '330100', '富阳', '3', '0571', '311400', '中国,浙江省,杭州市,富阳区', '119.96', '30.0488', 'Fuyang');
INSERT INTO `ctshop_region` VALUES ('330185', '临安市', '330100', '临安', '3', '0571', '311300', '中国,浙江省,杭州市,临安市', '119.725', '30.2345', 'Lin\'an');
INSERT INTO `ctshop_region` VALUES ('330200', '宁波市', '330000', '宁波', '2', '0574', '315000', '中国,浙江省,宁波市', '121.55', '29.8684', 'Ningbo');
INSERT INTO `ctshop_region` VALUES ('330203', '海曙区', '330200', '海曙', '3', '0574', '315000', '中国,浙江省,宁波市,海曙区', '121.551', '29.8598', 'Haishu');
INSERT INTO `ctshop_region` VALUES ('330204', '江东区', '330200', '江东', '3', '0574', '315040', '中国,浙江省,宁波市,江东区', '121.57', '29.867', 'Jiangdong');
INSERT INTO `ctshop_region` VALUES ('330205', '江北区', '330200', '江北', '3', '0574', '315020', '中国,浙江省,宁波市,江北区', '121.557', '29.8878', 'Jiangbei');
INSERT INTO `ctshop_region` VALUES ('330206', '北仑区', '330200', '北仑', '3', '0574', '315800', '中国,浙江省,宁波市,北仑区', '121.844', '29.9007', 'Beilun');
INSERT INTO `ctshop_region` VALUES ('330211', '镇海区', '330200', '镇海', '3', '0574', '315200', '中国,浙江省,宁波市,镇海区', '121.716', '29.9489', 'Zhenhai');
INSERT INTO `ctshop_region` VALUES ('330212', '鄞州区', '330200', '鄞州', '3', '0574', '315100', '中国,浙江省,宁波市,鄞州区', '121.548', '29.8161', 'Yinzhou');
INSERT INTO `ctshop_region` VALUES ('330225', '象山县', '330200', '象山', '3', '0574', '315700', '中国,浙江省,宁波市,象山县', '121.869', '29.4776', 'Xiangshan');
INSERT INTO `ctshop_region` VALUES ('330226', '宁海县', '330200', '宁海', '3', '0574', '315600', '中国,浙江省,宁波市,宁海县', '121.431', '29.2889', 'Ninghai');
INSERT INTO `ctshop_region` VALUES ('330281', '余姚市', '330200', '余姚', '3', '0574', '315400', '中国,浙江省,宁波市,余姚市', '121.153', '30.0387', 'Yuyao');
INSERT INTO `ctshop_region` VALUES ('330282', '慈溪市', '330200', '慈溪', '3', '0574', '315300', '中国,浙江省,宁波市,慈溪市', '121.266', '30.1696', 'Cixi');
INSERT INTO `ctshop_region` VALUES ('330283', '奉化市', '330200', '奉化', '3', '0574', '315500', '中国,浙江省,宁波市,奉化市', '121.41', '29.6554', 'Fenghua');
INSERT INTO `ctshop_region` VALUES ('330300', '温州市', '330000', '温州', '2', '0577', '325000', '中国,浙江省,温州市', '120.672', '28.0006', 'Wenzhou');
INSERT INTO `ctshop_region` VALUES ('330302', '鹿城区', '330300', '鹿城', '3', '0577', '325000', '中国,浙江省,温州市,鹿城区', '120.655', '28.0149', 'Lucheng');
INSERT INTO `ctshop_region` VALUES ('330303', '龙湾区', '330300', '龙湾', '3', '0577', '325013', '中国,浙江省,温州市,龙湾区', '120.831', '27.9128', 'Longwan');
INSERT INTO `ctshop_region` VALUES ('330304', '瓯海区', '330300', '瓯海', '3', '0577', '325005', '中国,浙江省,温州市,瓯海区', '120.638', '28.0071', 'Ouhai');
INSERT INTO `ctshop_region` VALUES ('330322', '洞头县', '330300', '洞头', '3', '0577', '325700', '中国,浙江省,温州市,洞头县', '121.156', '27.8363', 'Dongtou');
INSERT INTO `ctshop_region` VALUES ('330324', '永嘉县', '330300', '永嘉', '3', '0577', '325100', '中国,浙江省,温州市,永嘉县', '120.693', '28.1546', 'Yongjia');
INSERT INTO `ctshop_region` VALUES ('330326', '平阳县', '330300', '平阳', '3', '0577', '325400', '中国,浙江省,温州市,平阳县', '120.565', '27.6625', 'Pingyang');
INSERT INTO `ctshop_region` VALUES ('330327', '苍南县', '330300', '苍南', '3', '0577', '325800', '中国,浙江省,温州市,苍南县', '120.426', '27.5174', 'Cangnan');
INSERT INTO `ctshop_region` VALUES ('330328', '文成县', '330300', '文成', '3', '0577', '325300', '中国,浙江省,温州市,文成县', '120.091', '27.7868', 'Wencheng');
INSERT INTO `ctshop_region` VALUES ('330329', '泰顺县', '330300', '泰顺', '3', '0577', '325500', '中国,浙江省,温州市,泰顺县', '119.718', '27.5569', 'Taishun');
INSERT INTO `ctshop_region` VALUES ('330381', '瑞安市', '330300', '瑞安', '3', '0577', '325200', '中国,浙江省,温州市,瑞安市', '120.655', '27.7804', 'Rui\'an');
INSERT INTO `ctshop_region` VALUES ('330382', '乐清市', '330300', '乐清', '3', '0577', '325600', '中国,浙江省,温州市,乐清市', '120.962', '28.124', 'Yueqing');
INSERT INTO `ctshop_region` VALUES ('330400', '嘉兴市', '330000', '嘉兴', '2', '0573', '314000', '中国,浙江省,嘉兴市', '120.751', '30.7627', 'Jiaxing');
INSERT INTO `ctshop_region` VALUES ('330402', '南湖区', '330400', '南湖', '3', '0573', '314051', '中国,浙江省,嘉兴市,南湖区', '120.785', '30.7486', 'Nanhu');
INSERT INTO `ctshop_region` VALUES ('330411', '秀洲区', '330400', '秀洲', '3', '0573', '314031', '中国,浙江省,嘉兴市,秀洲区', '120.709', '30.7645', 'Xiuzhou');
INSERT INTO `ctshop_region` VALUES ('330421', '嘉善县', '330400', '嘉善', '3', '0573', '314100', '中国,浙江省,嘉兴市,嘉善县', '120.926', '30.8299', 'Jiashan');
INSERT INTO `ctshop_region` VALUES ('330424', '海盐县', '330400', '海盐', '3', '0573', '314300', '中国,浙江省,嘉兴市,海盐县', '120.946', '30.5255', 'Haiyan');
INSERT INTO `ctshop_region` VALUES ('330481', '海宁市', '330400', '海宁', '3', '0573', '314400', '中国,浙江省,嘉兴市,海宁市', '120.681', '30.5097', 'Haining');
INSERT INTO `ctshop_region` VALUES ('330482', '平湖市', '330400', '平湖', '3', '0573', '314200', '中国,浙江省,嘉兴市,平湖市', '121.022', '30.6962', 'Pinghu');
INSERT INTO `ctshop_region` VALUES ('330483', '桐乡市', '330400', '桐乡', '3', '0573', '314500', '中国,浙江省,嘉兴市,桐乡市', '120.565', '30.6302', 'Tongxiang');
INSERT INTO `ctshop_region` VALUES ('330500', '湖州市', '330000', '湖州', '2', '0572', '313000', '中国,浙江省,湖州市', '120.102', '30.8672', 'Huzhou');
INSERT INTO `ctshop_region` VALUES ('330502', '吴兴区', '330500', '吴兴', '3', '0572', '313000', '中国,浙江省,湖州市,吴兴区', '120.125', '30.8575', 'Wuxing');
INSERT INTO `ctshop_region` VALUES ('330503', '南浔区', '330500', '南浔', '3', '0572', '313009', '中国,浙江省,湖州市,南浔区', '120.42', '30.8669', 'Nanxun');
INSERT INTO `ctshop_region` VALUES ('330521', '德清县', '330500', '德清', '3', '0572', '313200', '中国,浙江省,湖州市,德清县', '119.978', '30.5337', 'Deqing');
INSERT INTO `ctshop_region` VALUES ('330522', '长兴县', '330500', '长兴', '3', '0572', '313100', '中国,浙江省,湖州市,长兴县', '119.908', '31.0061', 'Changxing');
INSERT INTO `ctshop_region` VALUES ('330523', '安吉县', '330500', '安吉', '3', '0572', '313300', '中国,浙江省,湖州市,安吉县', '119.682', '30.638', 'Anji');
INSERT INTO `ctshop_region` VALUES ('330600', '绍兴市', '330000', '绍兴', '2', '0575', '312000', '中国,浙江省,绍兴市', '120.582', '29.9971', 'Shaoxing');
INSERT INTO `ctshop_region` VALUES ('330602', '越城区', '330600', '越城', '3', '0575', '312000', '中国,浙江省,绍兴市,越城区', '120.582', '29.989', 'Yuecheng');
INSERT INTO `ctshop_region` VALUES ('330603', '柯桥区', '330600', '柯桥', '3', '0575', '312030', '中国,浙江省,绍兴市,柯桥区', '120.493', '30.0876', 'Keqiao ');
INSERT INTO `ctshop_region` VALUES ('330604', '上虞区', '330600', '上虞', '3', '0575', '312300', '中国,浙江省,绍兴市,上虞区', '120.476', '30.078', 'Shangyu');
INSERT INTO `ctshop_region` VALUES ('330624', '新昌县', '330600', '新昌', '3', '0575', '312500', '中国,浙江省,绍兴市,新昌县', '120.904', '29.4999', 'Xinchang');
INSERT INTO `ctshop_region` VALUES ('330681', '诸暨市', '330600', '诸暨', '3', '0575', '311800', '中国,浙江省,绍兴市,诸暨市', '120.236', '29.7136', 'Zhuji');
INSERT INTO `ctshop_region` VALUES ('330683', '嵊州市', '330600', '嵊州', '3', '0575', '312400', '中国,浙江省,绍兴市,嵊州市', '120.822', '29.5885', 'Shengzhou');
INSERT INTO `ctshop_region` VALUES ('330700', '金华市', '330000', '金华', '2', '0579', '321000', '中国,浙江省,金华市', '119.65', '29.0895', 'Jinhua');
INSERT INTO `ctshop_region` VALUES ('330702', '婺城区', '330700', '婺城', '3', '0579', '321000', '中国,浙江省,金华市,婺城区', '119.571', '29.0952', 'Wucheng');
INSERT INTO `ctshop_region` VALUES ('330703', '金东区', '330700', '金东', '3', '0579', '321000', '中国,浙江省,金华市,金东区', '119.693', '29.0991', 'Jindong');
INSERT INTO `ctshop_region` VALUES ('330723', '武义县', '330700', '武义', '3', '0579', '321200', '中国,浙江省,金华市,武义县', '119.816', '28.8933', 'Wuyi');
INSERT INTO `ctshop_region` VALUES ('330726', '浦江县', '330700', '浦江', '3', '0579', '322200', '中国,浙江省,金华市,浦江县', '119.892', '29.4535', 'Pujiang');
INSERT INTO `ctshop_region` VALUES ('330727', '磐安县', '330700', '磐安', '3', '0579', '322300', '中国,浙江省,金华市,磐安县', '120.45', '29.0573', 'Pan\'an');
INSERT INTO `ctshop_region` VALUES ('330781', '兰溪市', '330700', '兰溪', '3', '0579', '321100', '中国,浙江省,金华市,兰溪市', '119.46', '29.2084', 'Lanxi');
INSERT INTO `ctshop_region` VALUES ('330782', '义乌市', '330700', '义乌', '3', '0579', '322000', '中国,浙江省,金华市,义乌市', '120.074', '29.3056', 'Yiwu');
INSERT INTO `ctshop_region` VALUES ('330783', '东阳市', '330700', '东阳', '3', '0579', '322100', '中国,浙江省,金华市,东阳市', '120.242', '29.2894', 'Dongyang');
INSERT INTO `ctshop_region` VALUES ('330784', '永康市', '330700', '永康', '3', '0579', '321300', '中国,浙江省,金华市,永康市', '120.047', '28.8884', 'Yongkang');
INSERT INTO `ctshop_region` VALUES ('330800', '衢州市', '330000', '衢州', '2', '0570', '324002', '中国,浙江省,衢州市', '118.873', '28.9417', 'Quzhou');
INSERT INTO `ctshop_region` VALUES ('330802', '柯城区', '330800', '柯城', '3', '0570', '324100', '中国,浙江省,衢州市,柯城区', '118.871', '28.9686', 'Kecheng');
INSERT INTO `ctshop_region` VALUES ('330803', '衢江区', '330800', '衢江', '3', '0570', '324022', '中国,浙江省,衢州市,衢江区', '118.96', '28.9798', 'Qujiang');
INSERT INTO `ctshop_region` VALUES ('330822', '常山县', '330800', '常山', '3', '0570', '324200', '中国,浙江省,衢州市,常山县', '118.51', '28.9019', 'Changshan');
INSERT INTO `ctshop_region` VALUES ('330824', '开化县', '330800', '开化', '3', '0570', '324300', '中国,浙江省,衢州市,开化县', '118.416', '29.1378', 'Kaihua');
INSERT INTO `ctshop_region` VALUES ('330825', '龙游县', '330800', '龙游', '3', '0570', '324400', '中国,浙江省,衢州市,龙游县', '119.172', '29.0282', 'Longyou');
INSERT INTO `ctshop_region` VALUES ('330881', '江山市', '330800', '江山', '3', '0570', '324100', '中国,浙江省,衢州市,江山市', '118.627', '28.7386', 'Jiangshan');
INSERT INTO `ctshop_region` VALUES ('330900', '舟山市', '330000', '舟山', '2', '0580', '316000', '中国,浙江省,舟山市', '122.107', '30.016', 'Zhoushan');
INSERT INTO `ctshop_region` VALUES ('330902', '定海区', '330900', '定海', '3', '0580', '316000', '中国,浙江省,舟山市,定海区', '122.107', '30.0198', 'Dinghai');
INSERT INTO `ctshop_region` VALUES ('330903', '普陀区', '330900', '普陀', '3', '0580', '316100', '中国,浙江省,舟山市,普陀区', '122.303', '29.9491', 'Putuo');
INSERT INTO `ctshop_region` VALUES ('330921', '岱山县', '330900', '岱山', '3', '0580', '316200', '中国,浙江省,舟山市,岱山县', '122.205', '30.2439', 'Daishan');
INSERT INTO `ctshop_region` VALUES ('330922', '嵊泗县', '330900', '嵊泗', '3', '0580', '202450', '中国,浙江省,舟山市,嵊泗县', '122.451', '30.7268', 'Shengsi');
INSERT INTO `ctshop_region` VALUES ('331000', '台州市', '330000', '台州', '2', '0576', '318000', '中国,浙江省,台州市', '121.429', '28.6614', 'Taizhou');
INSERT INTO `ctshop_region` VALUES ('331002', '椒江区', '331000', '椒江', '3', '0576', '318000', '中国,浙江省,台州市,椒江区', '121.443', '28.673', 'Jiaojiang');
INSERT INTO `ctshop_region` VALUES ('331003', '黄岩区', '331000', '黄岩', '3', '0576', '318020', '中国,浙江省,台州市,黄岩区', '121.259', '28.6508', 'Huangyan');
INSERT INTO `ctshop_region` VALUES ('331004', '路桥区', '331000', '路桥', '3', '0576', '318050', '中国,浙江省,台州市,路桥区', '121.374', '28.5802', 'Luqiao');
INSERT INTO `ctshop_region` VALUES ('331021', '玉环县', '331000', '玉环', '3', '0576', '317600', '中国,浙江省,台州市,玉环县', '121.232', '28.1364', 'Yuhuan');
INSERT INTO `ctshop_region` VALUES ('331022', '三门县', '331000', '三门', '3', '0576', '317100', '中国,浙江省,台州市,三门县', '121.394', '29.1051', 'Sanmen');
INSERT INTO `ctshop_region` VALUES ('331023', '天台县', '331000', '天台', '3', '0576', '317200', '中国,浙江省,台州市,天台县', '121.008', '29.1429', 'Tiantai');
INSERT INTO `ctshop_region` VALUES ('331024', '仙居县', '331000', '仙居', '3', '0576', '317300', '中国,浙江省,台州市,仙居县', '120.729', '28.8467', 'Xianju');
INSERT INTO `ctshop_region` VALUES ('331081', '温岭市', '331000', '温岭', '3', '0576', '317500', '中国,浙江省,台州市,温岭市', '121.386', '28.3718', 'Wenling');
INSERT INTO `ctshop_region` VALUES ('331082', '临海市', '331000', '临海', '3', '0576', '317000', '中国,浙江省,台州市,临海市', '121.139', '28.856', 'Linhai');
INSERT INTO `ctshop_region` VALUES ('331100', '丽水市', '330000', '丽水', '2', '0578', '323000', '中国,浙江省,丽水市', '119.922', '28.452', 'Lishui');
INSERT INTO `ctshop_region` VALUES ('331102', '莲都区', '331100', '莲都', '3', '0578', '323000', '中国,浙江省,丽水市,莲都区', '119.913', '28.4458', 'Liandu');
INSERT INTO `ctshop_region` VALUES ('331121', '青田县', '331100', '青田', '3', '0578', '323900', '中国,浙江省,丽水市,青田县', '120.29', '28.139', 'Qingtian');
INSERT INTO `ctshop_region` VALUES ('331122', '缙云县', '331100', '缙云', '3', '0578', '321400', '中国,浙江省,丽水市,缙云县', '120.09', '28.6594', 'Jinyun');
INSERT INTO `ctshop_region` VALUES ('331123', '遂昌县', '331100', '遂昌', '3', '0578', '323300', '中国,浙江省,丽水市,遂昌县', '119.276', '28.5929', 'Suichang');
INSERT INTO `ctshop_region` VALUES ('331124', '松阳县', '331100', '松阳', '3', '0578', '323400', '中国,浙江省,丽水市,松阳县', '119.482', '28.4494', 'Songyang');
INSERT INTO `ctshop_region` VALUES ('331125', '云和县', '331100', '云和', '3', '0578', '323600', '中国,浙江省,丽水市,云和县', '119.573', '28.1164', 'Yunhe');
INSERT INTO `ctshop_region` VALUES ('331126', '庆元县', '331100', '庆元', '3', '0578', '323800', '中国,浙江省,丽水市,庆元县', '119.063', '27.6184', 'Qingyuan');
INSERT INTO `ctshop_region` VALUES ('331127', '景宁畲族自治县', '331100', '景宁', '3', '0578', '323500', '中国,浙江省,丽水市,景宁畲族自治县', '119.638', '27.9739', 'Jingning');
INSERT INTO `ctshop_region` VALUES ('331181', '龙泉市', '331100', '龙泉', '3', '0578', '323700', '中国,浙江省,丽水市,龙泉市', '119.142', '28.0743', 'Longquan');
INSERT INTO `ctshop_region` VALUES ('331200', '舟山群岛新区', '330000', '舟山新区', '2', '0580', '316000', '中国,浙江省,舟山群岛新区', '122.318', '29.8132', 'Zhoushan');
INSERT INTO `ctshop_region` VALUES ('331201', '金塘岛', '331200', '金塘', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,金塘岛', '121.893', '30.0406', 'Jintang');
INSERT INTO `ctshop_region` VALUES ('331202', '六横岛', '331200', '六横', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,六横岛', '122.143', '29.6629', 'Liuheng');
INSERT INTO `ctshop_region` VALUES ('331203', '衢山岛', '331200', '衢山', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,衢山岛', '122.358', '30.4426', 'Qushan');
INSERT INTO `ctshop_region` VALUES ('331204', '舟山本岛西北部', '331200', '舟山', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,舟山本岛西北部', '122.031', '30.1404', 'Zhoushan');
INSERT INTO `ctshop_region` VALUES ('331205', '岱山岛西南部', '331200', '岱山', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,岱山岛西南部', '122.18', '30.2773', 'Daishan');
INSERT INTO `ctshop_region` VALUES ('331206', '泗礁岛', '331200', '泗礁', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,泗礁岛', '122.458', '30.7251', 'Sijiao');
INSERT INTO `ctshop_region` VALUES ('331207', '朱家尖岛', '331200', '朱家尖', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,朱家尖岛', '122.391', '29.9163', 'Zhujiajian');
INSERT INTO `ctshop_region` VALUES ('331208', '洋山岛', '331200', '洋山', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,洋山岛', '121.996', '30.0946', 'Yangshan');
INSERT INTO `ctshop_region` VALUES ('331209', '长涂岛', '331200', '长涂', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,长涂岛', '122.285', '30.2489', 'Changtu');
INSERT INTO `ctshop_region` VALUES ('331210', '虾峙岛', '331200', '虾峙', '3', '0580', '316000', '中国,浙江省,舟山群岛新区,虾峙岛', '122.245', '29.7529', 'Xiazhi');
INSERT INTO `ctshop_region` VALUES ('340000', '安徽省', '100000', '安徽', '1', '', '', '中国,安徽省', '117.283', '31.8612', 'Anhui');
INSERT INTO `ctshop_region` VALUES ('340100', '合肥市', '340000', '合肥', '2', '0551', '230001', '中国,安徽省,合肥市', '117.283', '31.8612', 'Hefei');
INSERT INTO `ctshop_region` VALUES ('340102', '瑶海区', '340100', '瑶海', '3', '0551', '230011', '中国,安徽省,合肥市,瑶海区', '117.309', '31.8581', 'Yaohai');
INSERT INTO `ctshop_region` VALUES ('340103', '庐阳区', '340100', '庐阳', '3', '0551', '230001', '中国,安徽省,合肥市,庐阳区', '117.265', '31.8787', 'Luyang');
INSERT INTO `ctshop_region` VALUES ('340104', '蜀山区', '340100', '蜀山', '3', '0551', '230031', '中国,安徽省,合肥市,蜀山区', '117.261', '31.8512', 'Shushan');
INSERT INTO `ctshop_region` VALUES ('340111', '包河区', '340100', '包河', '3', '0551', '230041', '中国,安徽省,合肥市,包河区', '117.31', '31.795', 'Baohe');
INSERT INTO `ctshop_region` VALUES ('340121', '长丰县', '340100', '长丰', '3', '0551', '231100', '中国,安徽省,合肥市,长丰县', '117.165', '32.4796', 'Changfeng');
INSERT INTO `ctshop_region` VALUES ('340122', '肥东县', '340100', '肥东', '3', '0551', '231600', '中国,安徽省,合肥市,肥东县', '117.471', '31.8853', 'Feidong');
INSERT INTO `ctshop_region` VALUES ('340123', '肥西县', '340100', '肥西', '3', '0551', '231200', '中国,安徽省,合肥市,肥西县', '117.168', '31.7214', 'Feixi');
INSERT INTO `ctshop_region` VALUES ('340124', '庐江县', '340100', '庐江', '3', '0565', '231500', '中国,安徽省,合肥市,庐江县', '117.29', '31.2515', 'Lujiang');
INSERT INTO `ctshop_region` VALUES ('340181', '巢湖市', '340100', '巢湖', '3', '0565', '238000', '中国,安徽省,合肥市,巢湖市', '117.874', '31.6005', 'Chaohu');
INSERT INTO `ctshop_region` VALUES ('340200', '芜湖市', '340000', '芜湖', '2', '0551', '241000', '中国,安徽省,芜湖市', '118.376', '31.3263', 'Wuhu');
INSERT INTO `ctshop_region` VALUES ('340202', '镜湖区', '340200', '镜湖', '3', '0553', '241000', '中国,安徽省,芜湖市,镜湖区', '118.385', '31.3404', 'Jinghu');
INSERT INTO `ctshop_region` VALUES ('340203', '弋江区', '340200', '弋江', '3', '0553', '241000', '中国,安徽省,芜湖市,弋江区', '118.373', '31.3118', 'Yijiang');
INSERT INTO `ctshop_region` VALUES ('340207', '鸠江区', '340200', '鸠江', '3', '0553', '241000', '中国,安徽省,芜湖市,鸠江区', '118.392', '31.3693', 'Jiujiang');
INSERT INTO `ctshop_region` VALUES ('340208', '三山区', '340200', '三山', '3', '0553', '241000', '中国,安徽省,芜湖市,三山区', '118.225', '31.207', 'Sanshan');
INSERT INTO `ctshop_region` VALUES ('340221', '芜湖县', '340200', '芜湖', '3', '0553', '241100', '中国,安徽省,芜湖市,芜湖县', '118.575', '31.1348', 'Wuhu');
INSERT INTO `ctshop_region` VALUES ('340222', '繁昌县', '340200', '繁昌', '3', '0553', '241200', '中国,安徽省,芜湖市,繁昌县', '118.2', '31.0832', 'Fanchang');
INSERT INTO `ctshop_region` VALUES ('340223', '南陵县', '340200', '南陵', '3', '0553', '242400', '中国,安徽省,芜湖市,南陵县', '118.337', '30.9197', 'Nanling');
INSERT INTO `ctshop_region` VALUES ('340225', '无为县', '340200', '无为', '3', '0565', '238300', '中国,安徽省,芜湖市,无为县', '117.911', '31.3031', 'Wuwei');
INSERT INTO `ctshop_region` VALUES ('340300', '蚌埠市', '340000', '蚌埠', '2', '0552', '233000', '中国,安徽省,蚌埠市', '117.362', '32.934', 'Bengbu');
INSERT INTO `ctshop_region` VALUES ('340302', '龙子湖区', '340300', '龙子湖', '3', '0552', '233000', '中国,安徽省,蚌埠市,龙子湖区', '117.394', '32.943', 'Longzihu');
INSERT INTO `ctshop_region` VALUES ('340303', '蚌山区', '340300', '蚌山', '3', '0552', '233000', '中国,安徽省,蚌埠市,蚌山区', '117.368', '32.9441', 'Bengshan');
INSERT INTO `ctshop_region` VALUES ('340304', '禹会区', '340300', '禹会', '3', '0552', '233010', '中国,安徽省,蚌埠市,禹会区', '117.353', '32.9334', 'Yuhui');
INSERT INTO `ctshop_region` VALUES ('340311', '淮上区', '340300', '淮上', '3', '0552', '233002', '中国,安徽省,蚌埠市,淮上区', '117.36', '32.9642', 'Huaishang');
INSERT INTO `ctshop_region` VALUES ('340321', '怀远县', '340300', '怀远', '3', '0552', '233400', '中国,安徽省,蚌埠市,怀远县', '117.205', '32.9701', 'Huaiyuan');
INSERT INTO `ctshop_region` VALUES ('340322', '五河县', '340300', '五河', '3', '0552', '233300', '中国,安徽省,蚌埠市,五河县', '117.891', '33.1446', 'Wuhe');
INSERT INTO `ctshop_region` VALUES ('340323', '固镇县', '340300', '固镇', '3', '0552', '233700', '中国,安徽省,蚌埠市,固镇县', '117.316', '33.318', 'Guzhen');
INSERT INTO `ctshop_region` VALUES ('340400', '淮南市', '340000', '淮南', '2', '0554', '232001', '中国,安徽省,淮南市', '117.025', '32.6459', 'Huainan');
INSERT INTO `ctshop_region` VALUES ('340402', '大通区', '340400', '大通', '3', '0554', '232033', '中国,安徽省,淮南市,大通区', '117.053', '32.6326', 'Datong');
INSERT INTO `ctshop_region` VALUES ('340403', '田家庵区', '340400', '田家庵', '3', '0554', '232000', '中国,安徽省,淮南市,田家庵区', '117.017', '32.647', 'Tianjiaan');
INSERT INTO `ctshop_region` VALUES ('340404', '谢家集区', '340400', '谢家集', '3', '0554', '232052', '中国,安徽省,淮南市,谢家集区', '116.864', '32.5982', 'Xiejiaji');
INSERT INTO `ctshop_region` VALUES ('340405', '八公山区', '340400', '八公山', '3', '0554', '232072', '中国,安徽省,淮南市,八公山区', '116.837', '32.6294', 'Bagongshan');
INSERT INTO `ctshop_region` VALUES ('340406', '潘集区', '340400', '潘集', '3', '0554', '232082', '中国,安徽省,淮南市,潘集区', '116.816', '32.7829', 'Panji');
INSERT INTO `ctshop_region` VALUES ('340421', '凤台县', '340400', '凤台', '3', '0554', '232100', '中国,安徽省,淮南市,凤台县', '116.716', '32.7075', 'Fengtai');
INSERT INTO `ctshop_region` VALUES ('340500', '马鞍山市', '340000', '马鞍山', '2', '0555', '243001', '中国,安徽省,马鞍山市', '118.508', '31.6894', 'Ma\'anshan');
INSERT INTO `ctshop_region` VALUES ('340503', '花山区', '340500', '花山', '3', '0555', '243000', '中国,安徽省,马鞍山市,花山区', '118.512', '31.7001', 'Huashan');
INSERT INTO `ctshop_region` VALUES ('340504', '雨山区', '340500', '雨山', '3', '0555', '243071', '中国,安徽省,马鞍山市,雨山区', '118.499', '31.6822', 'Yushan');
INSERT INTO `ctshop_region` VALUES ('340506', '博望区', '340500', '博望', '3', '0555', '243131', '中国,安徽省,马鞍山市,博望区', '118.844', '31.5619', 'Bowang');
INSERT INTO `ctshop_region` VALUES ('340521', '当涂县', '340500', '当涂', '3', '0555', '243100', '中国,安徽省,马鞍山市,当涂县', '118.498', '31.571', 'Dangtu');
INSERT INTO `ctshop_region` VALUES ('340522', '含山县', '340500', '含山', '3', '0555', '238100', '中国,安徽省,马鞍山市,含山县', '118.106', '31.7278', 'Hanshan ');
INSERT INTO `ctshop_region` VALUES ('340523', '和县', '340500', '和县', '3', '0555', '238200', '中国,安徽省,马鞍山市,和县', '118.351', '31.7418', 'Hexian');
INSERT INTO `ctshop_region` VALUES ('340600', '淮北市', '340000', '淮北', '2', '0561', '235000', '中国,安徽省,淮北市', '116.795', '33.9717', 'Huaibei');
INSERT INTO `ctshop_region` VALUES ('340602', '杜集区', '340600', '杜集', '3', '0561', '235000', '中国,安徽省,淮北市,杜集区', '116.83', '33.9936', 'Duji');
INSERT INTO `ctshop_region` VALUES ('340603', '相山区', '340600', '相山', '3', '0561', '235000', '中国,安徽省,淮北市,相山区', '116.795', '33.9598', 'Xiangshan');
INSERT INTO `ctshop_region` VALUES ('340604', '烈山区', '340600', '烈山', '3', '0561', '235000', '中国,安徽省,淮北市,烈山区', '116.814', '33.8936', 'Lieshan');
INSERT INTO `ctshop_region` VALUES ('340621', '濉溪县', '340600', '濉溪', '3', '0561', '235100', '中国,安徽省,淮北市,濉溪县', '116.768', '33.9146', 'Suixi');
INSERT INTO `ctshop_region` VALUES ('340700', '铜陵市', '340000', '铜陵', '2', '0562', '244000', '中国,安徽省,铜陵市', '117.817', '30.9299', 'Tongling');
INSERT INTO `ctshop_region` VALUES ('340702', '铜官山区', '340700', '铜官山', '3', '0562', '244000', '中国,安徽省,铜陵市,铜官山区', '117.815', '30.9342', 'Tongguanshan');
INSERT INTO `ctshop_region` VALUES ('340703', '狮子山区', '340700', '狮子山', '3', '0562', '244000', '中国,安徽省,铜陵市,狮子山区', '117.892', '30.9263', 'Shizishan');
INSERT INTO `ctshop_region` VALUES ('340711', '郊区', '340700', '郊区', '3', '0562', '244000', '中国,安徽省,铜陵市,郊区', '117.809', '30.9198', 'Jiaoqu');
INSERT INTO `ctshop_region` VALUES ('340721', '铜陵县', '340700', '铜陵', '3', '0562', '244100', '中国,安徽省,铜陵市,铜陵县', '117.791', '30.9536', 'Tongling');
INSERT INTO `ctshop_region` VALUES ('340800', '安庆市', '340000', '安庆', '2', '0556', '246001', '中国,安徽省,安庆市', '117.054', '30.5248', 'Anqing');
INSERT INTO `ctshop_region` VALUES ('340802', '迎江区', '340800', '迎江', '3', '0556', '246001', '中国,安徽省,安庆市,迎江区', '117.049', '30.5042', 'Yingjiang');
INSERT INTO `ctshop_region` VALUES ('340803', '大观区', '340800', '大观', '3', '0556', '246002', '中国,安徽省,安庆市,大观区', '117.034', '30.5122', 'Daguan');
INSERT INTO `ctshop_region` VALUES ('340811', '宜秀区', '340800', '宜秀', '3', '0556', '246003', '中国,安徽省,安庆市,宜秀区', '117.061', '30.5078', 'Yixiu');
INSERT INTO `ctshop_region` VALUES ('340822', '怀宁县', '340800', '怀宁', '3', '0556', '246100', '中国,安徽省,安庆市,怀宁县', '116.83', '30.7338', 'Huaining');
INSERT INTO `ctshop_region` VALUES ('340823', '枞阳县', '340800', '枞阳', '3', '0556', '246700', '中国,安徽省,安庆市,枞阳县', '117.22', '30.6996', 'Zongyang');
INSERT INTO `ctshop_region` VALUES ('340824', '潜山县', '340800', '潜山', '3', '0556', '246300', '中国,安徽省,安庆市,潜山县', '116.576', '30.6304', 'Qianshan');
INSERT INTO `ctshop_region` VALUES ('340825', '太湖县', '340800', '太湖', '3', '0556', '246400', '中国,安徽省,安庆市,太湖县', '116.309', '30.4541', 'Taihu');
INSERT INTO `ctshop_region` VALUES ('340826', '宿松县', '340800', '宿松', '3', '0556', '246500', '中国,安徽省,安庆市,宿松县', '116.129', '30.1536', 'Susong');
INSERT INTO `ctshop_region` VALUES ('340827', '望江县', '340800', '望江', '3', '0556', '246200', '中国,安徽省,安庆市,望江县', '116.688', '30.1259', 'Wangjiang');
INSERT INTO `ctshop_region` VALUES ('340828', '岳西县', '340800', '岳西', '3', '0556', '246600', '中国,安徽省,安庆市,岳西县', '116.36', '30.8498', 'Yuexi');
INSERT INTO `ctshop_region` VALUES ('340881', '桐城市', '340800', '桐城', '3', '0556', '231400', '中国,安徽省,安庆市,桐城市', '116.951', '31.0522', 'Tongcheng');
INSERT INTO `ctshop_region` VALUES ('341000', '黄山市', '340000', '黄山', '2', '0559', '245000', '中国,安徽省,黄山市', '118.317', '29.7092', 'Huangshan');
INSERT INTO `ctshop_region` VALUES ('341002', '屯溪区', '341000', '屯溪', '3', '0559', '245000', '中国,安徽省,黄山市,屯溪区', '118.334', '29.7114', 'Tunxi');
INSERT INTO `ctshop_region` VALUES ('341003', '黄山区', '341000', '黄山', '3', '0559', '242700', '中国,安徽省,黄山市,黄山区', '118.142', '30.2729', 'Huangshan');
INSERT INTO `ctshop_region` VALUES ('341004', '徽州区', '341000', '徽州', '3', '0559', '245061', '中国,安徽省,黄山市,徽州区', '118.337', '29.8278', 'Huizhou');
INSERT INTO `ctshop_region` VALUES ('341021', '歙县', '341000', '歙县', '3', '0559', '245200', '中国,安徽省,黄山市,歙县', '118.437', '29.8675', 'Shexian');
INSERT INTO `ctshop_region` VALUES ('341022', '休宁县', '341000', '休宁', '3', '0559', '245400', '中国,安徽省,黄山市,休宁县', '118.181', '29.7861', 'Xiuning');
INSERT INTO `ctshop_region` VALUES ('341023', '黟县', '341000', '黟县', '3', '0559', '245500', '中国,安徽省,黄山市,黟县', '117.941', '29.9259', 'Yixian');
INSERT INTO `ctshop_region` VALUES ('341024', '祁门县', '341000', '祁门', '3', '0559', '245600', '中国,安徽省,黄山市,祁门县', '117.718', '29.8572', 'Qimen');
INSERT INTO `ctshop_region` VALUES ('341100', '滁州市', '340000', '滁州', '2', '0550', '239000', '中国,安徽省,滁州市', '118.316', '32.3036', 'Chuzhou');
INSERT INTO `ctshop_region` VALUES ('341102', '琅琊区', '341100', '琅琊', '3', '0550', '239000', '中国,安徽省,滁州市,琅琊区', '118.305', '32.2952', 'Langya');
INSERT INTO `ctshop_region` VALUES ('341103', '南谯区', '341100', '南谯', '3', '0550', '239000', '中国,安徽省,滁州市,南谯区', '118.312', '32.3186', 'Nanqiao');
INSERT INTO `ctshop_region` VALUES ('341122', '来安县', '341100', '来安', '3', '0550', '239200', '中国,安徽省,滁州市,来安县', '118.434', '32.4518', 'Lai\'an');
INSERT INTO `ctshop_region` VALUES ('341124', '全椒县', '341100', '全椒', '3', '0550', '239500', '中国,安徽省,滁州市,全椒县', '118.273', '32.0852', 'Quanjiao');
INSERT INTO `ctshop_region` VALUES ('341125', '定远县', '341100', '定远', '3', '0550', '233200', '中国,安徽省,滁州市,定远县', '117.68', '32.5249', 'Dingyuan');
INSERT INTO `ctshop_region` VALUES ('341126', '凤阳县', '341100', '凤阳', '3', '0550', '233100', '中国,安徽省,滁州市,凤阳县', '117.565', '32.8651', 'Fengyang');
INSERT INTO `ctshop_region` VALUES ('341181', '天长市', '341100', '天长', '3', '0550', '239300', '中国,安徽省,滁州市,天长市', '118.999', '32.6912', 'Tianchang');
INSERT INTO `ctshop_region` VALUES ('341182', '明光市', '341100', '明光', '3', '0550', '239400', '中国,安徽省,滁州市,明光市', '117.991', '32.7782', 'Mingguang');
INSERT INTO `ctshop_region` VALUES ('341200', '阜阳市', '340000', '阜阳', '2', '0558', '236033', '中国,安徽省,阜阳市', '115.82', '32.897', 'Fuyang');
INSERT INTO `ctshop_region` VALUES ('341202', '颍州区', '341200', '颍州', '3', '0558', '236001', '中国,安徽省,阜阳市,颍州区', '115.807', '32.8835', 'Yingzhou');
INSERT INTO `ctshop_region` VALUES ('341203', '颍东区', '341200', '颍东', '3', '0558', '236058', '中国,安徽省,阜阳市,颍东区', '115.857', '32.913', 'Yingdong');
INSERT INTO `ctshop_region` VALUES ('341204', '颍泉区', '341200', '颍泉', '3', '0558', '236045', '中国,安徽省,阜阳市,颍泉区', '115.807', '32.9249', 'Yingquan');
INSERT INTO `ctshop_region` VALUES ('341221', '临泉县', '341200', '临泉', '3', '0558', '236400', '中国,安徽省,阜阳市,临泉县', '115.262', '33.0676', 'Linquan');
INSERT INTO `ctshop_region` VALUES ('341222', '太和县', '341200', '太和', '3', '0558', '236600', '中国,安徽省,阜阳市,太和县', '115.622', '33.1603', 'Taihe');
INSERT INTO `ctshop_region` VALUES ('341225', '阜南县', '341200', '阜南', '3', '0558', '236300', '中国,安徽省,阜阳市,阜南县', '115.586', '32.6355', 'Funan');
INSERT INTO `ctshop_region` VALUES ('341226', '颍上县', '341200', '颍上', '3', '0558', '236200', '中国,安徽省,阜阳市,颍上县', '116.265', '32.63', 'Yingshang');
INSERT INTO `ctshop_region` VALUES ('341282', '界首市', '341200', '界首', '3', '0558', '236500', '中国,安徽省,阜阳市,界首市', '115.374', '33.2571', 'Jieshou');
INSERT INTO `ctshop_region` VALUES ('341300', '宿州市', '340000', '宿州', '2', '0557', '234000', '中国,安徽省,宿州市', '116.984', '33.6339', 'Suzhou');
INSERT INTO `ctshop_region` VALUES ('341302', '埇桥区', '341300', '埇桥', '3', '0557', '234000', '中国,安徽省,宿州市,埇桥区', '116.977', '33.6406', 'Yongqiao');
INSERT INTO `ctshop_region` VALUES ('341321', '砀山县', '341300', '砀山', '3', '0557', '235300', '中国,安徽省,宿州市,砀山县', '116.354', '34.4236', 'Dangshan');
INSERT INTO `ctshop_region` VALUES ('341322', '萧县', '341300', '萧县', '3', '0557', '235200', '中国,安徽省,宿州市,萧县', '116.945', '34.1879', 'Xiaoxian');
INSERT INTO `ctshop_region` VALUES ('341323', '灵璧县', '341300', '灵璧', '3', '0557', '234200', '中国,安徽省,宿州市,灵璧县', '117.558', '33.5434', 'Lingbi');
INSERT INTO `ctshop_region` VALUES ('341324', '泗县', '341300', '泗县', '3', '0557', '234300', '中国,安徽省,宿州市,泗县', '117.91', '33.4829', 'Sixian');
INSERT INTO `ctshop_region` VALUES ('341500', '六安市', '340000', '六安', '2', '0564', '237000', '中国,安徽省,六安市', '116.508', '31.7529', 'Lu\'an');
INSERT INTO `ctshop_region` VALUES ('341502', '金安区', '341500', '金安', '3', '0564', '237005', '中国,安徽省,六安市,金安区', '116.509', '31.7557', 'Jin\'an');
INSERT INTO `ctshop_region` VALUES ('341503', '裕安区', '341500', '裕安', '3', '0564', '237010', '中国,安徽省,六安市,裕安区', '116.48', '31.7379', 'Yu\'an');
INSERT INTO `ctshop_region` VALUES ('341521', '寿县', '341500', '寿县', '3', '0564', '232200', '中国,安徽省,六安市,寿县', '116.785', '32.5765', 'Shouxian');
INSERT INTO `ctshop_region` VALUES ('341522', '霍邱县', '341500', '霍邱', '3', '0564', '237400', '中国,安徽省,六安市,霍邱县', '116.278', '32.353', 'Huoqiu');
INSERT INTO `ctshop_region` VALUES ('341523', '舒城县', '341500', '舒城', '3', '0564', '231300', '中国,安徽省,六安市,舒城县', '116.945', '31.4641', 'Shucheng');
INSERT INTO `ctshop_region` VALUES ('341524', '金寨县', '341500', '金寨', '3', '0564', '237300', '中国,安徽省,六安市,金寨县', '115.935', '31.7351', 'Jinzhai');
INSERT INTO `ctshop_region` VALUES ('341525', '霍山县', '341500', '霍山', '3', '0564', '237200', '中国,安徽省,六安市,霍山县', '116.333', '31.3929', 'Huoshan');
INSERT INTO `ctshop_region` VALUES ('341600', '亳州市', '340000', '亳州', '2', '0558', '236802', '中国,安徽省,亳州市', '115.783', '33.8693', 'Bozhou');
INSERT INTO `ctshop_region` VALUES ('341602', '谯城区', '341600', '谯城', '3', '0558', '236800', '中国,安徽省,亳州市,谯城区', '115.779', '33.8753', 'Qiaocheng');
INSERT INTO `ctshop_region` VALUES ('341621', '涡阳县', '341600', '涡阳', '3', '0558', '233600', '中国,安徽省,亳州市,涡阳县', '116.217', '33.5091', 'Guoyang');
INSERT INTO `ctshop_region` VALUES ('341622', '蒙城县', '341600', '蒙城', '3', '0558', '233500', '中国,安徽省,亳州市,蒙城县', '116.565', '33.2648', 'Mengcheng');
INSERT INTO `ctshop_region` VALUES ('341623', '利辛县', '341600', '利辛', '3', '0558', '236700', '中国,安徽省,亳州市,利辛县', '116.208', '33.142', 'Lixin');
INSERT INTO `ctshop_region` VALUES ('341700', '池州市', '340000', '池州', '2', '0566', '247100', '中国,安徽省,池州市', '117.489', '30.656', 'Chizhou');
INSERT INTO `ctshop_region` VALUES ('341702', '贵池区', '341700', '贵池', '3', '0566', '247100', '中国,安徽省,池州市,贵池区', '117.487', '30.6528', 'Guichi');
INSERT INTO `ctshop_region` VALUES ('341721', '东至县', '341700', '东至', '3', '0566', '247200', '中国,安徽省,池州市,东至县', '117.027', '30.0969', 'Dongzhi');
INSERT INTO `ctshop_region` VALUES ('341722', '石台县', '341700', '石台', '3', '0566', '245100', '中国,安徽省,池州市,石台县', '117.487', '30.2104', 'Shitai');
INSERT INTO `ctshop_region` VALUES ('341723', '青阳县', '341700', '青阳', '3', '0566', '242800', '中国,安徽省,池州市,青阳县', '117.847', '30.6393', 'Qingyang');
INSERT INTO `ctshop_region` VALUES ('341800', '宣城市', '340000', '宣城', '2', '0563', '242000', '中国,安徽省,宣城市', '118.758', '30.9457', 'Xuancheng');
INSERT INTO `ctshop_region` VALUES ('341802', '宣州区', '341800', '宣州', '3', '0563', '242000', '中国,安徽省,宣城市,宣州区', '118.755', '30.9444', 'Xuanzhou');
INSERT INTO `ctshop_region` VALUES ('341821', '郎溪县', '341800', '郎溪', '3', '0563', '242100', '中国,安徽省,宣城市,郎溪县', '119.179', '31.126', 'Langxi');
INSERT INTO `ctshop_region` VALUES ('341822', '广德县', '341800', '广德', '3', '0563', '242200', '中国,安徽省,宣城市,广德县', '119.418', '30.8937', 'Guangde');
INSERT INTO `ctshop_region` VALUES ('341823', '泾县', '341800', '泾县', '3', '0563', '242500', '中国,安徽省,宣城市,泾县', '118.42', '30.695', 'Jingxian');
INSERT INTO `ctshop_region` VALUES ('341824', '绩溪县', '341800', '绩溪', '3', '0563', '245300', '中国,安徽省,宣城市,绩溪县', '118.598', '30.0707', 'Jixi');
INSERT INTO `ctshop_region` VALUES ('341825', '旌德县', '341800', '旌德', '3', '0563', '242600', '中国,安徽省,宣城市,旌德县', '118.543', '30.289', 'Jingde');
INSERT INTO `ctshop_region` VALUES ('341881', '宁国市', '341800', '宁国', '3', '0563', '242300', '中国,安徽省,宣城市,宁国市', '118.983', '30.6238', 'Ningguo');
INSERT INTO `ctshop_region` VALUES ('350000', '福建省', '100000', '福建', '1', '', '', '中国,福建省', '119.306', '26.0753', 'Fujian');
INSERT INTO `ctshop_region` VALUES ('350100', '福州市', '350000', '福州', '2', '0591', '350001', '中国,福建省,福州市', '119.306', '26.0753', 'Fuzhou');
INSERT INTO `ctshop_region` VALUES ('350102', '鼓楼区', '350100', '鼓楼', '3', '0591', '350001', '中国,福建省,福州市,鼓楼区', '119.304', '26.0823', 'Gulou');
INSERT INTO `ctshop_region` VALUES ('350103', '台江区', '350100', '台江', '3', '0591', '350004', '中国,福建省,福州市,台江区', '119.309', '26.062', 'Taijiang');
INSERT INTO `ctshop_region` VALUES ('350104', '仓山区', '350100', '仓山', '3', '0591', '350007', '中国,福建省,福州市,仓山区', '119.315', '26.0434', 'Cangshan');
INSERT INTO `ctshop_region` VALUES ('350105', '马尾区', '350100', '马尾', '3', '0591', '350015', '中国,福建省,福州市,马尾区', '119.455', '25.9894', 'Mawei');
INSERT INTO `ctshop_region` VALUES ('350111', '晋安区', '350100', '晋安', '3', '0591', '350011', '中国,福建省,福州市,晋安区', '119.328', '26.0818', 'Jin\'an');
INSERT INTO `ctshop_region` VALUES ('350121', '闽侯县', '350100', '闽侯', '3', '0591', '350100', '中国,福建省,福州市,闽侯县', '119.134', '26.1501', 'Minhou');
INSERT INTO `ctshop_region` VALUES ('350122', '连江县', '350100', '连江', '3', '0591', '350500', '中国,福建省,福州市,连江县', '119.534', '26.1947', 'Lianjiang');
INSERT INTO `ctshop_region` VALUES ('350123', '罗源县', '350100', '罗源', '3', '0591', '350600', '中国,福建省,福州市,罗源县', '119.551', '26.4875', 'Luoyuan');
INSERT INTO `ctshop_region` VALUES ('350124', '闽清县', '350100', '闽清', '3', '0591', '350800', '中国,福建省,福州市,闽清县', '118.862', '26.219', 'Minqing');
INSERT INTO `ctshop_region` VALUES ('350125', '永泰县', '350100', '永泰', '3', '0591', '350700', '中国,福建省,福州市,永泰县', '118.936', '25.8682', 'Yongtai');
INSERT INTO `ctshop_region` VALUES ('350128', '平潭县', '350100', '平潭', '3', '0591', '350400', '中国,福建省,福州市,平潭县', '119.791', '25.5037', 'Pingtan');
INSERT INTO `ctshop_region` VALUES ('350181', '福清市', '350100', '福清', '3', '0591', '350300', '中国,福建省,福州市,福清市', '119.385', '25.7209', 'Fuqing');
INSERT INTO `ctshop_region` VALUES ('350182', '长乐市', '350100', '长乐', '3', '0591', '350200', '中国,福建省,福州市,长乐市', '119.523', '25.9628', 'Changle');
INSERT INTO `ctshop_region` VALUES ('350200', '厦门市', '350000', '厦门', '2', '0592', '361003', '中国,福建省,厦门市', '118.11', '24.4905', 'Xiamen');
INSERT INTO `ctshop_region` VALUES ('350203', '思明区', '350200', '思明', '3', '0592', '361001', '中国,福建省,厦门市,思明区', '118.082', '24.4454', 'Siming');
INSERT INTO `ctshop_region` VALUES ('350205', '海沧区', '350200', '海沧', '3', '0592', '361026', '中国,福建省,厦门市,海沧区', '118.033', '24.4846', 'Haicang');
INSERT INTO `ctshop_region` VALUES ('350206', '湖里区', '350200', '湖里', '3', '0592', '361006', '中国,福建省,厦门市,湖里区', '118.146', '24.5125', 'Huli');
INSERT INTO `ctshop_region` VALUES ('350211', '集美区', '350200', '集美', '3', '0592', '361021', '中国,福建省,厦门市,集美区', '118.097', '24.5758', 'Jimei');
INSERT INTO `ctshop_region` VALUES ('350212', '同安区', '350200', '同安', '3', '0592', '361100', '中国,福建省,厦门市,同安区', '118.152', '24.7231', 'Tong\'an');
INSERT INTO `ctshop_region` VALUES ('350213', '翔安区', '350200', '翔安', '3', '0592', '361101', '中国,福建省,厦门市,翔安区', '118.248', '24.6186', 'Xiang\'an');
INSERT INTO `ctshop_region` VALUES ('350300', '莆田市', '350000', '莆田', '2', '0594', '351100', '中国,福建省,莆田市', '119.008', '25.431', 'Putian');
INSERT INTO `ctshop_region` VALUES ('350302', '城厢区', '350300', '城厢', '3', '0594', '351100', '中国,福建省,莆田市,城厢区', '118.995', '25.4187', 'Chengxiang');
INSERT INTO `ctshop_region` VALUES ('350303', '涵江区', '350300', '涵江', '3', '0594', '351111', '中国,福建省,莆田市,涵江区', '119.116', '25.4588', 'Hanjiang');
INSERT INTO `ctshop_region` VALUES ('350304', '荔城区', '350300', '荔城', '3', '0594', '351100', '中国,福建省,莆田市,荔城区', '119.013', '25.4337', 'Licheng');
INSERT INTO `ctshop_region` VALUES ('350305', '秀屿区', '350300', '秀屿', '3', '0594', '351152', '中国,福建省,莆田市,秀屿区', '119.106', '25.3183', 'Xiuyu');
INSERT INTO `ctshop_region` VALUES ('350322', '仙游县', '350300', '仙游', '3', '0594', '351200', '中国,福建省,莆田市,仙游县', '118.692', '25.3621', 'Xianyou');
INSERT INTO `ctshop_region` VALUES ('350400', '三明市', '350000', '三明', '2', '0598', '365000', '中国,福建省,三明市', '117.635', '26.2654', 'Sanming');
INSERT INTO `ctshop_region` VALUES ('350402', '梅列区', '350400', '梅列', '3', '0598', '365000', '中国,福建省,三明市,梅列区', '117.646', '26.2717', 'Meilie');
INSERT INTO `ctshop_region` VALUES ('350403', '三元区', '350400', '三元', '3', '0598', '365001', '中国,福建省,三明市,三元区', '117.608', '26.2337', 'Sanyuan');
INSERT INTO `ctshop_region` VALUES ('350421', '明溪县', '350400', '明溪', '3', '0598', '365200', '中国,福建省,三明市,明溪县', '117.205', '26.3529', 'Mingxi');
INSERT INTO `ctshop_region` VALUES ('350423', '清流县', '350400', '清流', '3', '0598', '365300', '中国,福建省,三明市,清流县', '116.815', '26.1714', 'Qingliu');
INSERT INTO `ctshop_region` VALUES ('350424', '宁化县', '350400', '宁化', '3', '0598', '365400', '中国,福建省,三明市,宁化县', '116.661', '26.2587', 'Ninghua');
INSERT INTO `ctshop_region` VALUES ('350425', '大田县', '350400', '大田', '3', '0598', '366100', '中国,福建省,三明市,大田县', '117.847', '25.6926', 'Datian');
INSERT INTO `ctshop_region` VALUES ('350426', '尤溪县', '350400', '尤溪', '3', '0598', '365100', '中国,福建省,三明市,尤溪县', '118.19', '26.17', 'Youxi');
INSERT INTO `ctshop_region` VALUES ('350427', '沙县', '350400', '沙县', '3', '0598', '365500', '中国,福建省,三明市,沙县', '117.793', '26.3962', 'Shaxian');
INSERT INTO `ctshop_region` VALUES ('350428', '将乐县', '350400', '将乐', '3', '0598', '353300', '中国,福建省,三明市,将乐县', '117.473', '26.7284', 'Jiangle');
INSERT INTO `ctshop_region` VALUES ('350429', '泰宁县', '350400', '泰宁', '3', '0598', '354400', '中国,福建省,三明市,泰宁县', '117.176', '26.9001', 'Taining');
INSERT INTO `ctshop_region` VALUES ('350430', '建宁县', '350400', '建宁', '3', '0598', '354500', '中国,福建省,三明市,建宁县', '116.846', '26.8309', 'Jianning');
INSERT INTO `ctshop_region` VALUES ('350481', '永安市', '350400', '永安', '3', '0598', '366000', '中国,福建省,三明市,永安市', '117.365', '25.9414', 'Yong\'an');
INSERT INTO `ctshop_region` VALUES ('350500', '泉州市', '350000', '泉州', '2', '0595', '362000', '中国,福建省,泉州市', '118.589', '24.9089', 'Quanzhou');
INSERT INTO `ctshop_region` VALUES ('350502', '鲤城区', '350500', '鲤城', '3', '0595', '362000', '中国,福建省,泉州市,鲤城区', '118.566', '24.8874', 'Licheng');
INSERT INTO `ctshop_region` VALUES ('350503', '丰泽区', '350500', '丰泽', '3', '0595', '362000', '中国,福建省,泉州市,丰泽区', '118.613', '24.8912', 'Fengze');
INSERT INTO `ctshop_region` VALUES ('350504', '洛江区', '350500', '洛江', '3', '0595', '362011', '中国,福建省,泉州市,洛江区', '118.671', '24.9398', 'Luojiang');
INSERT INTO `ctshop_region` VALUES ('350505', '泉港区', '350500', '泉港', '3', '0595', '362114', '中国,福建省,泉州市,泉港区', '118.916', '25.1201', 'Quangang');
INSERT INTO `ctshop_region` VALUES ('350521', '惠安县', '350500', '惠安', '3', '0595', '362100', '中国,福建省,泉州市,惠安县', '118.797', '25.0306', 'Hui\'an');
INSERT INTO `ctshop_region` VALUES ('350524', '安溪县', '350500', '安溪', '3', '0595', '362400', '中国,福建省,泉州市,安溪县', '118.187', '25.0563', 'Anxi');
INSERT INTO `ctshop_region` VALUES ('350525', '永春县', '350500', '永春', '3', '0595', '362600', '中国,福建省,泉州市,永春县', '118.294', '25.3218', 'Yongchun');
INSERT INTO `ctshop_region` VALUES ('350526', '德化县', '350500', '德化', '3', '0595', '362500', '中国,福建省,泉州市,德化县', '118.242', '25.4922', 'Dehua');
INSERT INTO `ctshop_region` VALUES ('350527', '金门县', '350500', '金门', '3', '', '', '中国,福建省,泉州市,金门县', '118.323', '24.4292', 'Jinmen');
INSERT INTO `ctshop_region` VALUES ('350581', '石狮市', '350500', '石狮', '3', '0595', '362700', '中国,福建省,泉州市,石狮市', '118.648', '24.7324', 'Shishi');
INSERT INTO `ctshop_region` VALUES ('350582', '晋江市', '350500', '晋江', '3', '0595', '362200', '中国,福建省,泉州市,晋江市', '118.552', '24.7814', 'Jinjiang');
INSERT INTO `ctshop_region` VALUES ('350583', '南安市', '350500', '南安', '3', '0595', '362300', '中国,福建省,泉州市,南安市', '118.386', '24.9606', 'Nan\'an');
INSERT INTO `ctshop_region` VALUES ('350600', '漳州市', '350000', '漳州', '2', '0596', '363005', '中国,福建省,漳州市', '117.662', '24.5109', 'Zhangzhou');
INSERT INTO `ctshop_region` VALUES ('350602', '芗城区', '350600', '芗城', '3', '0596', '363000', '中国,福建省,漳州市,芗城区', '117.654', '24.5108', 'Xiangcheng');
INSERT INTO `ctshop_region` VALUES ('350603', '龙文区', '350600', '龙文', '3', '0596', '363005', '中国,福建省,漳州市,龙文区', '117.71', '24.5032', 'Longwen');
INSERT INTO `ctshop_region` VALUES ('350622', '云霄县', '350600', '云霄', '3', '0596', '363300', '中国,福建省,漳州市,云霄县', '117.341', '23.9553', 'Yunxiao');
INSERT INTO `ctshop_region` VALUES ('350623', '漳浦县', '350600', '漳浦', '3', '0596', '363200', '中国,福建省,漳州市,漳浦县', '117.614', '24.1171', 'Zhangpu');
INSERT INTO `ctshop_region` VALUES ('350624', '诏安县', '350600', '诏安', '3', '0596', '363500', '中国,福建省,漳州市,诏安县', '117.175', '23.7115', 'Zhao\'an');
INSERT INTO `ctshop_region` VALUES ('350625', '长泰县', '350600', '长泰', '3', '0596', '363900', '中国,福建省,漳州市,长泰县', '117.759', '24.6253', 'Changtai');
INSERT INTO `ctshop_region` VALUES ('350626', '东山县', '350600', '东山', '3', '0596', '363400', '中国,福建省,漳州市,东山县', '117.428', '23.7011', 'Dongshan');
INSERT INTO `ctshop_region` VALUES ('350627', '南靖县', '350600', '南靖', '3', '0596', '363600', '中国,福建省,漳州市,南靖县', '117.357', '24.5145', 'Nanjing');
INSERT INTO `ctshop_region` VALUES ('350628', '平和县', '350600', '平和', '3', '0596', '363700', '中国,福建省,漳州市,平和县', '117.312', '24.364', 'Pinghe');
INSERT INTO `ctshop_region` VALUES ('350629', '华安县', '350600', '华安', '3', '0596', '363800', '中国,福建省,漳州市,华安县', '117.541', '25.0056', 'Hua\'an');
INSERT INTO `ctshop_region` VALUES ('350681', '龙海市', '350600', '龙海', '3', '0596', '363100', '中国,福建省,漳州市,龙海市', '117.818', '24.4466', 'Longhai');
INSERT INTO `ctshop_region` VALUES ('350700', '南平市', '350000', '南平', '2', '0599', '353000', '中国,福建省,南平市', '118.178', '26.6356', 'Nanping');
INSERT INTO `ctshop_region` VALUES ('350702', '延平区', '350700', '延平', '3', '0600', '353000', '中国,福建省,南平市,延平区', '118.182', '26.6374', 'Yanping');
INSERT INTO `ctshop_region` VALUES ('350703', '建阳区', '350700', '建阳', '3', '0599', '354200', '中国,福建省,南平市,建阳区', '118.123', '27.3321', 'Jianyang');
INSERT INTO `ctshop_region` VALUES ('350721', '顺昌县', '350700', '顺昌', '3', '0605', '353200', '中国,福建省,南平市,顺昌县', '117.81', '26.793', 'Shunchang');
INSERT INTO `ctshop_region` VALUES ('350722', '浦城县', '350700', '浦城', '3', '0606', '353400', '中国,福建省,南平市,浦城县', '118.54', '27.9189', 'Pucheng');
INSERT INTO `ctshop_region` VALUES ('350723', '光泽县', '350700', '光泽', '3', '0607', '354100', '中国,福建省,南平市,光泽县', '117.333', '27.5423', 'Guangze');
INSERT INTO `ctshop_region` VALUES ('350724', '松溪县', '350700', '松溪', '3', '0608', '353500', '中国,福建省,南平市,松溪县', '118.785', '27.5262', 'Songxi');
INSERT INTO `ctshop_region` VALUES ('350725', '政和县', '350700', '政和', '3', '0609', '353600', '中国,福建省,南平市,政和县', '118.856', '27.3677', 'Zhenghe');
INSERT INTO `ctshop_region` VALUES ('350781', '邵武市', '350700', '邵武', '3', '0601', '354000', '中国,福建省,南平市,邵武市', '117.492', '27.3403', 'Shaowu');
INSERT INTO `ctshop_region` VALUES ('350782', '武夷山市', '350700', '武夷山', '3', '0602', '354300', '中国,福建省,南平市,武夷山市', '118.037', '27.7554', 'Wuyishan');
INSERT INTO `ctshop_region` VALUES ('350783', '建瓯市', '350700', '建瓯', '3', '0603', '353100', '中国,福建省,南平市,建瓯市', '118.298', '27.023', 'Jianou');
INSERT INTO `ctshop_region` VALUES ('350800', '龙岩市', '350000', '龙岩', '2', '0597', '364000', '中国,福建省,龙岩市', '117.03', '25.0916', 'Longyan');
INSERT INTO `ctshop_region` VALUES ('350802', '新罗区', '350800', '新罗', '3', '0597', '364000', '中国,福建省,龙岩市,新罗区', '117.037', '25.0983', 'Xinluo');
INSERT INTO `ctshop_region` VALUES ('350821', '长汀县', '350800', '长汀', '3', '0597', '366300', '中国,福建省,龙岩市,长汀县', '116.359', '25.8277', 'Changting');
INSERT INTO `ctshop_region` VALUES ('350822', '永定区', '350800', '永定', '3', '0597', '364100', '中国,福建省,龙岩市,永定区', '116.732', '24.723', 'Yongding');
INSERT INTO `ctshop_region` VALUES ('350823', '上杭县', '350800', '上杭', '3', '0597', '364200', '中国,福建省,龙岩市,上杭县', '116.42', '25.0494', 'Shanghang');
INSERT INTO `ctshop_region` VALUES ('350824', '武平县', '350800', '武平', '3', '0597', '364300', '中国,福建省,龙岩市,武平县', '116.102', '25.0924', 'Wuping');
INSERT INTO `ctshop_region` VALUES ('350825', '连城县', '350800', '连城', '3', '0597', '366200', '中国,福建省,龙岩市,连城县', '116.755', '25.7103', 'Liancheng');
INSERT INTO `ctshop_region` VALUES ('350881', '漳平市', '350800', '漳平', '3', '0597', '364400', '中国,福建省,龙岩市,漳平市', '117.42', '25.2911', 'Zhangping');
INSERT INTO `ctshop_region` VALUES ('350900', '宁德市', '350000', '宁德', '2', '0593', '352100', '中国,福建省,宁德市', '119.527', '26.6592', 'Ningde');
INSERT INTO `ctshop_region` VALUES ('350902', '蕉城区', '350900', '蕉城', '3', '0593', '352100', '中国,福建省,宁德市,蕉城区', '119.526', '26.6605', 'Jiaocheng');
INSERT INTO `ctshop_region` VALUES ('350921', '霞浦县', '350900', '霞浦', '3', '0593', '355100', '中国,福建省,宁德市,霞浦县', '119.999', '26.8858', 'Xiapu');
INSERT INTO `ctshop_region` VALUES ('350922', '古田县', '350900', '古田', '3', '0593', '352200', '中国,福建省,宁德市,古田县', '118.747', '26.5768', 'Gutian');
INSERT INTO `ctshop_region` VALUES ('350923', '屏南县', '350900', '屏南', '3', '0593', '352300', '中国,福建省,宁德市,屏南县', '118.989', '26.911', 'Pingnan');
INSERT INTO `ctshop_region` VALUES ('350924', '寿宁县', '350900', '寿宁', '3', '0593', '355500', '中国,福建省,宁德市,寿宁县', '119.504', '27.46', 'Shouning');
INSERT INTO `ctshop_region` VALUES ('350925', '周宁县', '350900', '周宁', '3', '0593', '355400', '中国,福建省,宁德市,周宁县', '119.338', '27.1066', 'Zhouning');
INSERT INTO `ctshop_region` VALUES ('350926', '柘荣县', '350900', '柘荣', '3', '0593', '355300', '中国,福建省,宁德市,柘荣县', '119.9', '27.2354', 'Zherong');
INSERT INTO `ctshop_region` VALUES ('350981', '福安市', '350900', '福安', '3', '0593', '355000', '中国,福建省,宁德市,福安市', '119.649', '27.0867', 'Fu\'an');
INSERT INTO `ctshop_region` VALUES ('350982', '福鼎市', '350900', '福鼎', '3', '0593', '355200', '中国,福建省,宁德市,福鼎市', '120.217', '27.3243', 'Fuding');
INSERT INTO `ctshop_region` VALUES ('360000', '江西省', '100000', '江西', '1', '', '', '中国,江西省', '115.892', '28.6765', 'Jiangxi');
INSERT INTO `ctshop_region` VALUES ('360100', '南昌市', '360000', '南昌', '2', '0791', '330008', '中国,江西省,南昌市', '115.892', '28.6765', 'Nanchang');
INSERT INTO `ctshop_region` VALUES ('360102', '东湖区', '360100', '东湖', '3', '0791', '330006', '中国,江西省,南昌市,东湖区', '115.899', '28.685', 'Donghu');
INSERT INTO `ctshop_region` VALUES ('360103', '西湖区', '360100', '西湖', '3', '0791', '330009', '中国,江西省,南昌市,西湖区', '115.877', '28.6569', 'Xihu');
INSERT INTO `ctshop_region` VALUES ('360104', '青云谱区', '360100', '青云谱', '3', '0791', '330001', '中国,江西省,南昌市,青云谱区', '115.915', '28.632', 'Qingyunpu');
INSERT INTO `ctshop_region` VALUES ('360105', '湾里区', '360100', '湾里', '3', '0791', '330004', '中国,江西省,南昌市,湾里区', '115.731', '28.7153', 'Wanli');
INSERT INTO `ctshop_region` VALUES ('360111', '青山湖区', '360100', '青山湖', '3', '0791', '330029', '中国,江西省,南昌市,青山湖区', '115.962', '28.6821', 'Qingshanhu');
INSERT INTO `ctshop_region` VALUES ('360121', '南昌县', '360100', '南昌', '3', '0791', '330200', '中国,江西省,南昌市,南昌县', '115.944', '28.5456', 'Nanchang');
INSERT INTO `ctshop_region` VALUES ('360122', '新建县', '360100', '新建', '3', '0791', '330100', '中国,江西省,南昌市,新建县', '115.815', '28.6925', 'Xinjian');
INSERT INTO `ctshop_region` VALUES ('360123', '安义县', '360100', '安义', '3', '0791', '330500', '中国,江西省,南昌市,安义县', '115.549', '28.846', 'Anyi');
INSERT INTO `ctshop_region` VALUES ('360124', '进贤县', '360100', '进贤', '3', '0791', '331700', '中国,江西省,南昌市,进贤县', '116.241', '28.3768', 'Jinxian');
INSERT INTO `ctshop_region` VALUES ('360200', '景德镇市', '360000', '景德镇', '2', '0798', '333000', '中国,江西省,景德镇市', '117.215', '29.2926', 'Jingdezhen');
INSERT INTO `ctshop_region` VALUES ('360202', '昌江区', '360200', '昌江', '3', '0799', '333000', '中国,江西省,景德镇市,昌江区', '117.184', '29.2732', 'Changjiang');
INSERT INTO `ctshop_region` VALUES ('360203', '珠山区', '360200', '珠山', '3', '0800', '333000', '中国,江西省,景德镇市,珠山区', '117.202', '29.3013', 'Zhushan');
INSERT INTO `ctshop_region` VALUES ('360222', '浮梁县', '360200', '浮梁', '3', '0802', '333400', '中国,江西省,景德镇市,浮梁县', '117.215', '29.3516', 'Fuliang');
INSERT INTO `ctshop_region` VALUES ('360281', '乐平市', '360200', '乐平', '3', '0801', '333300', '中国,江西省,景德镇市,乐平市', '117.129', '28.9629', 'Leping');
INSERT INTO `ctshop_region` VALUES ('360300', '萍乡市', '360000', '萍乡', '2', '0799', '337000', '中国,江西省,萍乡市', '113.852', '27.6229', 'Pingxiang');
INSERT INTO `ctshop_region` VALUES ('360302', '安源区', '360300', '安源', '3', '0800', '337000', '中国,江西省,萍乡市,安源区', '113.891', '27.6165', 'Anyuan');
INSERT INTO `ctshop_region` VALUES ('360313', '湘东区', '360300', '湘东', '3', '0801', '337016', '中国,江西省,萍乡市,湘东区', '113.733', '27.6401', 'Xiangdong');
INSERT INTO `ctshop_region` VALUES ('360321', '莲花县', '360300', '莲花', '3', '0802', '337100', '中国,江西省,萍乡市,莲花县', '113.961', '27.1287', 'Lianhua');
INSERT INTO `ctshop_region` VALUES ('360322', '上栗县', '360300', '上栗', '3', '0803', '337009', '中国,江西省,萍乡市,上栗县', '113.794', '27.8747', 'Shangli');
INSERT INTO `ctshop_region` VALUES ('360323', '芦溪县', '360300', '芦溪', '3', '0804', '337053', '中国,江西省,萍乡市,芦溪县', '114.03', '27.6306', 'Luxi');
INSERT INTO `ctshop_region` VALUES ('360400', '九江市', '360000', '九江', '2', '0792', '332000', '中国,江西省,九江市', '115.993', '29.712', 'Jiujiang');
INSERT INTO `ctshop_region` VALUES ('360402', '庐山区', '360400', '庐山', '3', '0792', '332005', '中国,江西省,九江市,庐山区', '115.989', '29.6718', 'Lushan');
INSERT INTO `ctshop_region` VALUES ('360403', '浔阳区', '360400', '浔阳', '3', '0792', '332000', '中国,江西省,九江市,浔阳区', '115.99', '29.7279', 'Xunyang');
INSERT INTO `ctshop_region` VALUES ('360421', '九江县', '360400', '九江', '3', '0792', '332100', '中国,江西省,九江市,九江县', '115.911', '29.6085', 'Jiujiang');
INSERT INTO `ctshop_region` VALUES ('360423', '武宁县', '360400', '武宁', '3', '0792', '332300', '中国,江西省,九江市,武宁县', '115.101', '29.2584', 'Wuning');
INSERT INTO `ctshop_region` VALUES ('360424', '修水县', '360400', '修水', '3', '0792', '332400', '中国,江西省,九江市,修水县', '114.547', '29.0254', 'Xiushui');
INSERT INTO `ctshop_region` VALUES ('360425', '永修县', '360400', '永修', '3', '0792', '330300', '中国,江西省,九江市,永修县', '115.809', '29.0209', 'Yongxiu');
INSERT INTO `ctshop_region` VALUES ('360426', '德安县', '360400', '德安', '3', '0792', '330400', '中国,江西省,九江市,德安县', '115.756', '29.3134', 'De\'an');
INSERT INTO `ctshop_region` VALUES ('360427', '星子县', '360400', '星子', '3', '0792', '332800', '中国,江西省,九江市,星子县', '116.045', '29.4461', 'Xingzi');
INSERT INTO `ctshop_region` VALUES ('360428', '都昌县', '360400', '都昌', '3', '0792', '332600', '中国,江西省,九江市,都昌县', '116.204', '29.2733', 'Duchang');
INSERT INTO `ctshop_region` VALUES ('360429', '湖口县', '360400', '湖口', '3', '0792', '332500', '中国,江西省,九江市,湖口县', '116.219', '29.7382', 'Hukou');
INSERT INTO `ctshop_region` VALUES ('360430', '彭泽县', '360400', '彭泽', '3', '0792', '332700', '中国,江西省,九江市,彭泽县', '116.55', '29.8959', 'Pengze');
INSERT INTO `ctshop_region` VALUES ('360481', '瑞昌市', '360400', '瑞昌', '3', '0792', '332200', '中国,江西省,九江市,瑞昌市', '115.667', '29.6718', 'Ruichang');
INSERT INTO `ctshop_region` VALUES ('360482', '共青城市', '360400', '共青城', '3', '0792', '332020', '中国,江西省,九江市,共青城市', '115.802', '29.2388', 'Gongqingcheng');
INSERT INTO `ctshop_region` VALUES ('360500', '新余市', '360000', '新余', '2', '0790', '338025', '中国,江西省,新余市', '114.931', '27.8108', 'Xinyu');
INSERT INTO `ctshop_region` VALUES ('360502', '渝水区', '360500', '渝水', '3', '0790', '338025', '中国,江西省,新余市,渝水区', '114.944', '27.801', 'Yushui');
INSERT INTO `ctshop_region` VALUES ('360521', '分宜县', '360500', '分宜', '3', '0790', '336600', '中国,江西省,新余市,分宜县', '114.692', '27.8148', 'Fenyi');
INSERT INTO `ctshop_region` VALUES ('360600', '鹰潭市', '360000', '鹰潭', '2', '0701', '335000', '中国,江西省,鹰潭市', '117.034', '28.2386', 'Yingtan');
INSERT INTO `ctshop_region` VALUES ('360602', '月湖区', '360600', '月湖', '3', '0701', '335000', '中国,江西省,鹰潭市,月湖区', '117.037', '28.2391', 'Yuehu');
INSERT INTO `ctshop_region` VALUES ('360622', '余江县', '360600', '余江', '3', '0701', '335200', '中国,江西省,鹰潭市,余江县', '116.819', '28.2103', 'Yujiang');
INSERT INTO `ctshop_region` VALUES ('360681', '贵溪市', '360600', '贵溪', '3', '0701', '335400', '中国,江西省,鹰潭市,贵溪市', '117.242', '28.2926', 'Guixi');
INSERT INTO `ctshop_region` VALUES ('360700', '赣州市', '360000', '赣州', '2', '0797', '341000', '中国,江西省,赣州市', '114.94', '25.851', 'Ganzhou');
INSERT INTO `ctshop_region` VALUES ('360702', '章贡区', '360700', '章贡', '3', '0797', '341000', '中国,江西省,赣州市,章贡区', '114.943', '25.8624', 'Zhanggong');
INSERT INTO `ctshop_region` VALUES ('360703', '南康区', '360700', '南康', '3', '0797', '341400', '中国,江西省,赣州市,南康区', '114.757', '25.6617', 'Nankang');
INSERT INTO `ctshop_region` VALUES ('360721', '赣县', '360700', '赣县', '3', '0797', '341100', '中国,江西省,赣州市,赣县', '115.012', '25.8615', 'Ganxian');
INSERT INTO `ctshop_region` VALUES ('360722', '信丰县', '360700', '信丰', '3', '0797', '341600', '中国,江西省,赣州市,信丰县', '114.923', '25.3861', 'Xinfeng');
INSERT INTO `ctshop_region` VALUES ('360723', '大余县', '360700', '大余', '3', '0797', '341500', '中国,江西省,赣州市,大余县', '114.358', '25.3956', 'Dayu');
INSERT INTO `ctshop_region` VALUES ('360724', '上犹县', '360700', '上犹', '3', '0797', '341200', '中国,江西省,赣州市,上犹县', '114.541', '25.7957', 'Shangyou');
INSERT INTO `ctshop_region` VALUES ('360725', '崇义县', '360700', '崇义', '3', '0797', '341300', '中国,江西省,赣州市,崇义县', '114.308', '25.6819', 'Chongyi');
INSERT INTO `ctshop_region` VALUES ('360726', '安远县', '360700', '安远', '3', '0797', '342100', '中国,江西省,赣州市,安远县', '115.395', '25.1371', 'Anyuan');
INSERT INTO `ctshop_region` VALUES ('360727', '龙南县', '360700', '龙南', '3', '0797', '341700', '中国,江西省,赣州市,龙南县', '114.79', '24.9109', 'Longnan');
INSERT INTO `ctshop_region` VALUES ('360728', '定南县', '360700', '定南', '3', '0797', '341900', '中国,江西省,赣州市,定南县', '115.027', '24.784', 'Dingnan');
INSERT INTO `ctshop_region` VALUES ('360729', '全南县', '360700', '全南', '3', '0797', '341800', '中国,江西省,赣州市,全南县', '114.529', '24.7432', 'Quannan');
INSERT INTO `ctshop_region` VALUES ('360730', '宁都县', '360700', '宁都', '3', '0797', '342800', '中国,江西省,赣州市,宁都县', '116.016', '26.4723', 'Ningdu');
INSERT INTO `ctshop_region` VALUES ('360731', '于都县', '360700', '于都', '3', '0797', '342300', '中国,江西省,赣州市,于都县', '115.414', '25.9526', 'Yudu');
INSERT INTO `ctshop_region` VALUES ('360732', '兴国县', '360700', '兴国', '3', '0797', '342400', '中国,江西省,赣州市,兴国县', '115.363', '26.3378', 'Xingguo');
INSERT INTO `ctshop_region` VALUES ('360733', '会昌县', '360700', '会昌', '3', '0797', '342600', '中国,江西省,赣州市,会昌县', '115.786', '25.6007', 'Huichang');
INSERT INTO `ctshop_region` VALUES ('360734', '寻乌县', '360700', '寻乌', '3', '0797', '342200', '中国,江西省,赣州市,寻乌县', '115.649', '24.9551', 'Xunwu');
INSERT INTO `ctshop_region` VALUES ('360735', '石城县', '360700', '石城', '3', '0797', '342700', '中国,江西省,赣州市,石城县', '116.344', '26.3262', 'Shicheng');
INSERT INTO `ctshop_region` VALUES ('360781', '瑞金市', '360700', '瑞金', '3', '0797', '342500', '中国,江西省,赣州市,瑞金市', '116.027', '25.8856', 'Ruijin');
INSERT INTO `ctshop_region` VALUES ('360800', '吉安市', '360000', '吉安', '2', '0796', '343000', '中国,江西省,吉安市', '114.986', '27.1117', 'Ji\'an');
INSERT INTO `ctshop_region` VALUES ('360802', '吉州区', '360800', '吉州', '3', '0796', '343000', '中国,江西省,吉安市,吉州区', '114.976', '27.1067', 'Jizhou');
INSERT INTO `ctshop_region` VALUES ('360803', '青原区', '360800', '青原', '3', '0796', '343009', '中国,江西省,吉安市,青原区', '115.017', '27.1058', 'Qingyuan');
INSERT INTO `ctshop_region` VALUES ('360821', '吉安县', '360800', '吉安', '3', '0796', '343100', '中国,江西省,吉安市,吉安县', '114.907', '27.0405', 'Ji\'an');
INSERT INTO `ctshop_region` VALUES ('360822', '吉水县', '360800', '吉水', '3', '0796', '331600', '中国,江西省,吉安市,吉水县', '115.134', '27.2107', 'Jishui');
INSERT INTO `ctshop_region` VALUES ('360823', '峡江县', '360800', '峡江', '3', '0796', '331409', '中国,江西省,吉安市,峡江县', '115.317', '27.576', 'Xiajiang');
INSERT INTO `ctshop_region` VALUES ('360824', '新干县', '360800', '新干', '3', '0796', '331300', '中国,江西省,吉安市,新干县', '115.393', '27.7409', 'Xingan');
INSERT INTO `ctshop_region` VALUES ('360825', '永丰县', '360800', '永丰', '3', '0796', '331500', '中国,江西省,吉安市,永丰县', '115.442', '27.3179', 'Yongfeng');
INSERT INTO `ctshop_region` VALUES ('360826', '泰和县', '360800', '泰和', '3', '0796', '343700', '中国,江西省,吉安市,泰和县', '114.908', '26.7911', 'Taihe');
INSERT INTO `ctshop_region` VALUES ('360827', '遂川县', '360800', '遂川', '3', '0796', '343900', '中国,江西省,吉安市,遂川县', '114.516', '26.326', 'Suichuan');
INSERT INTO `ctshop_region` VALUES ('360828', '万安县', '360800', '万安', '3', '0796', '343800', '中国,江西省,吉安市,万安县', '114.787', '26.4593', 'Wan\'an');
INSERT INTO `ctshop_region` VALUES ('360829', '安福县', '360800', '安福', '3', '0796', '343200', '中国,江西省,吉安市,安福县', '114.62', '27.3928', 'Anfu');
INSERT INTO `ctshop_region` VALUES ('360830', '永新县', '360800', '永新', '3', '0796', '343400', '中国,江西省,吉安市,永新县', '114.242', '26.9449', 'Yongxin');
INSERT INTO `ctshop_region` VALUES ('360881', '井冈山市', '360800', '井冈山', '3', '0796', '343600', '中国,江西省,吉安市,井冈山市', '114.289', '26.748', 'Jinggangshan');
INSERT INTO `ctshop_region` VALUES ('360900', '宜春市', '360000', '宜春', '2', '0795', '336000', '中国,江西省,宜春市', '114.391', '27.8043', 'Yichun');
INSERT INTO `ctshop_region` VALUES ('360902', '袁州区', '360900', '袁州', '3', '0795', '336000', '中国,江西省,宜春市,袁州区', '114.382', '27.7965', 'Yuanzhou');
INSERT INTO `ctshop_region` VALUES ('360921', '奉新县', '360900', '奉新', '3', '0795', '330700', '中国,江西省,宜春市,奉新县', '115.4', '28.6879', 'Fengxin');
INSERT INTO `ctshop_region` VALUES ('360922', '万载县', '360900', '万载', '3', '0795', '336100', '中国,江西省,宜春市,万载县', '114.446', '28.1066', 'Wanzai');
INSERT INTO `ctshop_region` VALUES ('360923', '上高县', '360900', '上高', '3', '0795', '336400', '中国,江西省,宜春市,上高县', '114.925', '28.2342', 'Shanggao');
INSERT INTO `ctshop_region` VALUES ('360924', '宜丰县', '360900', '宜丰', '3', '0795', '336300', '中国,江西省,宜春市,宜丰县', '114.78', '28.3855', 'Yifeng');
INSERT INTO `ctshop_region` VALUES ('360925', '靖安县', '360900', '靖安', '3', '0795', '330600', '中国,江西省,宜春市,靖安县', '115.363', '28.8617', 'Jing\'an');
INSERT INTO `ctshop_region` VALUES ('360926', '铜鼓县', '360900', '铜鼓', '3', '0795', '336200', '中国,江西省,宜春市,铜鼓县', '114.37', '28.5231', 'Tonggu');
INSERT INTO `ctshop_region` VALUES ('360981', '丰城市', '360900', '丰城', '3', '0795', '331100', '中国,江西省,宜春市,丰城市', '115.771', '28.1592', 'Fengcheng');
INSERT INTO `ctshop_region` VALUES ('360982', '樟树市', '360900', '樟树', '3', '0795', '331200', '中国,江西省,宜春市,樟树市', '115.547', '28.0533', 'Zhangshu');
INSERT INTO `ctshop_region` VALUES ('360983', '高安市', '360900', '高安', '3', '0795', '330800', '中国,江西省,宜春市,高安市', '115.375', '28.4178', 'Gao\'an');
INSERT INTO `ctshop_region` VALUES ('361000', '抚州市', '360000', '抚州', '2', '0794', '344000', '中国,江西省,抚州市', '116.358', '27.9839', 'Fuzhou');
INSERT INTO `ctshop_region` VALUES ('361002', '临川区', '361000', '临川', '3', '0794', '344000', '中国,江西省,抚州市,临川区', '116.359', '27.9772', 'Linchuan');
INSERT INTO `ctshop_region` VALUES ('361021', '南城县', '361000', '南城', '3', '0794', '344700', '中国,江西省,抚州市,南城县', '116.644', '27.5538', 'Nancheng');
INSERT INTO `ctshop_region` VALUES ('361022', '黎川县', '361000', '黎川', '3', '0794', '344600', '中国,江西省,抚州市,黎川县', '116.908', '27.2823', 'Lichuan');
INSERT INTO `ctshop_region` VALUES ('361023', '南丰县', '361000', '南丰', '3', '0794', '344500', '中国,江西省,抚州市,南丰县', '116.526', '27.2184', 'Nanfeng');
INSERT INTO `ctshop_region` VALUES ('361024', '崇仁县', '361000', '崇仁', '3', '0794', '344200', '中国,江西省,抚州市,崇仁县', '116.06', '27.7596', 'Chongren');
INSERT INTO `ctshop_region` VALUES ('361025', '乐安县', '361000', '乐安', '3', '0794', '344300', '中国,江西省,抚州市,乐安县', '115.831', '27.4281', 'Le\'an');
INSERT INTO `ctshop_region` VALUES ('361026', '宜黄县', '361000', '宜黄', '3', '0794', '344400', '中国,江西省,抚州市,宜黄县', '116.236', '27.5549', 'Yihuang');
INSERT INTO `ctshop_region` VALUES ('361027', '金溪县', '361000', '金溪', '3', '0794', '344800', '中国,江西省,抚州市,金溪县', '116.774', '27.9075', 'Jinxi');
INSERT INTO `ctshop_region` VALUES ('361028', '资溪县', '361000', '资溪', '3', '0794', '335300', '中国,江西省,抚州市,资溪县', '117.069', '27.7049', 'Zixi');
INSERT INTO `ctshop_region` VALUES ('361029', '东乡县', '361000', '东乡', '3', '0794', '331800', '中国,江西省,抚州市,东乡县', '116.59', '28.2361', 'Dongxiang');
INSERT INTO `ctshop_region` VALUES ('361030', '广昌县', '361000', '广昌', '3', '0794', '344900', '中国,江西省,抚州市,广昌县', '116.325', '26.8341', 'Guangchang');
INSERT INTO `ctshop_region` VALUES ('361100', '上饶市', '360000', '上饶', '2', '0793', '334000', '中国,江西省,上饶市', '117.971', '28.4444', 'Shangrao');
INSERT INTO `ctshop_region` VALUES ('361102', '信州区', '361100', '信州', '3', '0793', '334000', '中国,江西省,上饶市,信州区', '117.967', '28.4312', 'Xinzhou');
INSERT INTO `ctshop_region` VALUES ('361121', '上饶县', '361100', '上饶', '3', '0793', '334100', '中国,江西省,上饶市,上饶县', '117.909', '28.4486', 'Shangrao');
INSERT INTO `ctshop_region` VALUES ('361122', '广丰县', '361100', '广丰', '3', '0793', '334600', '中国,江西省,上饶市,广丰县', '118.192', '28.4377', 'Guangfeng');
INSERT INTO `ctshop_region` VALUES ('361123', '玉山县', '361100', '玉山', '3', '0793', '334700', '中国,江西省,上饶市,玉山县', '118.245', '28.6818', 'Yushan');
INSERT INTO `ctshop_region` VALUES ('361124', '铅山县', '361100', '铅山', '3', '0793', '334500', '中国,江西省,上饶市,铅山县', '117.71', '28.3155', 'Yanshan');
INSERT INTO `ctshop_region` VALUES ('361125', '横峰县', '361100', '横峰', '3', '0793', '334300', '中国,江西省,上饶市,横峰县', '117.596', '28.4072', 'Hengfeng');
INSERT INTO `ctshop_region` VALUES ('361126', '弋阳县', '361100', '弋阳', '3', '0793', '334400', '中国,江西省,上饶市,弋阳县', '117.459', '28.3745', 'Yiyang');
INSERT INTO `ctshop_region` VALUES ('361127', '余干县', '361100', '余干', '3', '0793', '335100', '中国,江西省,上饶市,余干县', '116.696', '28.7021', 'Yugan');
INSERT INTO `ctshop_region` VALUES ('361128', '鄱阳县', '361100', '鄱阳', '3', '0793', '333100', '中国,江西省,上饶市,鄱阳县', '116.7', '29.0118', 'Poyang');
INSERT INTO `ctshop_region` VALUES ('361129', '万年县', '361100', '万年', '3', '0793', '335500', '中国,江西省,上饶市,万年县', '117.069', '28.6954', 'Wannian');
INSERT INTO `ctshop_region` VALUES ('361130', '婺源县', '361100', '婺源', '3', '0793', '333200', '中国,江西省,上饶市,婺源县', '117.861', '29.2484', 'Wuyuan');
INSERT INTO `ctshop_region` VALUES ('361181', '德兴市', '361100', '德兴', '3', '0793', '334200', '中国,江西省,上饶市,德兴市', '117.579', '28.9474', 'Dexing');
INSERT INTO `ctshop_region` VALUES ('370000', '山东省', '100000', '山东', '1', '', '', '中国,山东省', '117.001', '36.6758', 'Shandong');
INSERT INTO `ctshop_region` VALUES ('370100', '济南市', '370000', '济南', '2', '0531', '250001', '中国,山东省,济南市', '117.001', '36.6758', 'Jinan');
INSERT INTO `ctshop_region` VALUES ('370102', '历下区', '370100', '历下', '3', '0531', '250014', '中国,山东省,济南市,历下区', '117.077', '36.6666', 'Lixia');
INSERT INTO `ctshop_region` VALUES ('370103', '市中区', '370100', '市中区', '3', '0531', '250001', '中国,山东省,济南市,市中区', '116.997', '36.651', 'Shizhongqu');
INSERT INTO `ctshop_region` VALUES ('370104', '槐荫区', '370100', '槐荫', '3', '0531', '250117', '中国,山东省,济南市,槐荫区', '116.901', '36.6514', 'Huaiyin');
INSERT INTO `ctshop_region` VALUES ('370105', '天桥区', '370100', '天桥', '3', '0531', '250031', '中国,山东省,济南市,天桥区', '116.987', '36.678', 'Tianqiao');
INSERT INTO `ctshop_region` VALUES ('370112', '历城区', '370100', '历城', '3', '0531', '250100', '中国,山东省,济南市,历城区', '117.065', '36.68', 'Licheng');
INSERT INTO `ctshop_region` VALUES ('370113', '长清区', '370100', '长清', '3', '0531', '250300', '中国,山东省,济南市,长清区', '116.752', '36.5535', 'Changqing');
INSERT INTO `ctshop_region` VALUES ('370124', '平阴县', '370100', '平阴', '3', '0531', '250400', '中国,山东省,济南市,平阴县', '116.456', '36.2896', 'Pingyin');
INSERT INTO `ctshop_region` VALUES ('370125', '济阳县', '370100', '济阳', '3', '0531', '251400', '中国,山东省,济南市,济阳县', '117.173', '36.9785', 'Jiyang');
INSERT INTO `ctshop_region` VALUES ('370126', '商河县', '370100', '商河', '3', '0531', '251600', '中国,山东省,济南市,商河县', '117.157', '37.3112', 'Shanghe');
INSERT INTO `ctshop_region` VALUES ('370181', '章丘市', '370100', '章丘', '3', '0531', '250200', '中国,山东省,济南市,章丘市', '117.537', '36.7139', 'Zhangqiu');
INSERT INTO `ctshop_region` VALUES ('370200', '青岛市', '370000', '青岛', '2', '0532', '266001', '中国,山东省,青岛市', '120.37', '36.0944', 'Qingdao');
INSERT INTO `ctshop_region` VALUES ('370202', '市南区', '370200', '市南', '3', '0532', '266001', '中国,山东省,青岛市,市南区', '120.388', '36.0667', 'Shinan');
INSERT INTO `ctshop_region` VALUES ('370203', '市北区', '370200', '市北', '3', '0532', '266011', '中国,山东省,青岛市,市北区', '120.375', '36.0873', 'Shibei');
INSERT INTO `ctshop_region` VALUES ('370211', '黄岛区', '370200', '黄岛', '3', '0532', '266500', '中国,山东省,青岛市,黄岛区', '120.198', '35.9607', 'Huangdao');
INSERT INTO `ctshop_region` VALUES ('370212', '崂山区', '370200', '崂山', '3', '0532', '266100', '中国,山东省,青岛市,崂山区', '120.469', '36.1072', 'Laoshan');
INSERT INTO `ctshop_region` VALUES ('370213', '李沧区', '370200', '李沧', '3', '0532', '266021', '中国,山东省,青岛市,李沧区', '120.433', '36.145', 'Licang');
INSERT INTO `ctshop_region` VALUES ('370214', '城阳区', '370200', '城阳', '3', '0532', '266041', '中国,山东省,青岛市,城阳区', '120.396', '36.3074', 'Chengyang');
INSERT INTO `ctshop_region` VALUES ('370281', '胶州市', '370200', '胶州', '3', '0532', '266300', '中国,山东省,青岛市,胶州市', '120.034', '36.2644', 'Jiaozhou');
INSERT INTO `ctshop_region` VALUES ('370282', '即墨市', '370200', '即墨', '3', '0532', '266200', '中国,山东省,青岛市,即墨市', '120.447', '36.3891', 'Jimo');
INSERT INTO `ctshop_region` VALUES ('370283', '平度市', '370200', '平度', '3', '0532', '266700', '中国,山东省,青岛市,平度市', '119.96', '36.7869', 'Pingdu');
INSERT INTO `ctshop_region` VALUES ('370285', '莱西市', '370200', '莱西', '3', '0532', '266600', '中国,山东省,青岛市,莱西市', '120.518', '36.888', 'Laixi');
INSERT INTO `ctshop_region` VALUES ('370286', '西海岸新区', '370200', '西海岸', '3', '0532', '266500', '中国,山东省,青岛市,西海岸新区', '120.198', '35.9607', 'Xihai\'an');
INSERT INTO `ctshop_region` VALUES ('370300', '淄博市', '370000', '淄博', '2', '0533', '255039', '中国,山东省,淄博市', '118.048', '36.8149', 'Zibo');
INSERT INTO `ctshop_region` VALUES ('370302', '淄川区', '370300', '淄川', '3', '0533', '255100', '中国,山东省,淄博市,淄川区', '117.967', '36.6434', 'Zichuan');
INSERT INTO `ctshop_region` VALUES ('370303', '张店区', '370300', '张店', '3', '0533', '255022', '中国,山东省,淄博市,张店区', '118.018', '36.8068', 'Zhangdian');
INSERT INTO `ctshop_region` VALUES ('370304', '博山区', '370300', '博山', '3', '0533', '255200', '中国,山东省,淄博市,博山区', '117.862', '36.4947', 'Boshan');
INSERT INTO `ctshop_region` VALUES ('370305', '临淄区', '370300', '临淄', '3', '0533', '255400', '中国,山东省,淄博市,临淄区', '118.31', '36.8259', 'Linzi');
INSERT INTO `ctshop_region` VALUES ('370306', '周村区', '370300', '周村', '3', '0533', '255300', '中国,山东省,淄博市,周村区', '117.87', '36.8032', 'Zhoucun');
INSERT INTO `ctshop_region` VALUES ('370321', '桓台县', '370300', '桓台', '3', '0533', '256400', '中国,山东省,淄博市,桓台县', '118.097', '36.9604', 'Huantai');
INSERT INTO `ctshop_region` VALUES ('370322', '高青县', '370300', '高青', '3', '0533', '256300', '中国,山东省,淄博市,高青县', '117.827', '37.172', 'Gaoqing');
INSERT INTO `ctshop_region` VALUES ('370323', '沂源县', '370300', '沂源', '3', '0533', '256100', '中国,山东省,淄博市,沂源县', '118.171', '36.1854', 'Yiyuan');
INSERT INTO `ctshop_region` VALUES ('370400', '枣庄市', '370000', '枣庄', '2', '0632', '277101', '中国,山东省,枣庄市', '117.558', '34.8564', 'Zaozhuang');
INSERT INTO `ctshop_region` VALUES ('370402', '市中区', '370400', '市中区', '3', '0632', '277101', '中国,山东省,枣庄市,市中区', '117.556', '34.8639', 'Shizhongqu');
INSERT INTO `ctshop_region` VALUES ('370403', '薛城区', '370400', '薛城', '3', '0632', '277000', '中国,山东省,枣庄市,薛城区', '117.263', '34.795', 'Xuecheng');
INSERT INTO `ctshop_region` VALUES ('370404', '峄城区', '370400', '峄城', '3', '0632', '277300', '中国,山东省,枣庄市,峄城区', '117.591', '34.7723', 'Yicheng');
INSERT INTO `ctshop_region` VALUES ('370405', '台儿庄区', '370400', '台儿庄', '3', '0632', '277400', '中国,山东省,枣庄市,台儿庄区', '117.735', '34.5636', 'Taierzhuang');
INSERT INTO `ctshop_region` VALUES ('370406', '山亭区', '370400', '山亭', '3', '0632', '277200', '中国,山东省,枣庄市,山亭区', '117.466', '35.0954', 'Shanting');
INSERT INTO `ctshop_region` VALUES ('370481', '滕州市', '370400', '滕州', '3', '0632', '277500', '中国,山东省,枣庄市,滕州市', '117.165', '35.1053', 'Tengzhou');
INSERT INTO `ctshop_region` VALUES ('370500', '东营市', '370000', '东营', '2', '0546', '257093', '中国,山东省,东营市', '118.496', '37.4613', 'Dongying');
INSERT INTO `ctshop_region` VALUES ('370502', '东营区', '370500', '东营', '3', '0546', '257029', '中国,山东省,东营市,东营区', '118.582', '37.4487', 'Dongying');
INSERT INTO `ctshop_region` VALUES ('370503', '河口区', '370500', '河口', '3', '0546', '257200', '中国,山东省,东营市,河口区', '118.525', '37.8854', 'Hekou');
INSERT INTO `ctshop_region` VALUES ('370521', '垦利县', '370500', '垦利', '3', '0546', '257500', '中国,山东省,东营市,垦利县', '118.548', '37.5882', 'Kenli');
INSERT INTO `ctshop_region` VALUES ('370522', '利津县', '370500', '利津', '3', '0546', '257400', '中国,山东省,东营市,利津县', '118.256', '37.4916', 'Lijin');
INSERT INTO `ctshop_region` VALUES ('370523', '广饶县', '370500', '广饶', '3', '0546', '257300', '中国,山东省,东营市,广饶县', '118.407', '37.0538', 'Guangrao');
INSERT INTO `ctshop_region` VALUES ('370600', '烟台市', '370000', '烟台', '2', '0635', '264010', '中国,山东省,烟台市', '121.391', '37.5393', 'Yantai');
INSERT INTO `ctshop_region` VALUES ('370602', '芝罘区', '370600', '芝罘', '3', '0635', '264001', '中国,山东省,烟台市,芝罘区', '121.4', '37.5406', 'Zhifu');
INSERT INTO `ctshop_region` VALUES ('370611', '福山区', '370600', '福山', '3', '0635', '265500', '中国,山东省,烟台市,福山区', '121.268', '37.4984', 'Fushan');
INSERT INTO `ctshop_region` VALUES ('370612', '牟平区', '370600', '牟平', '3', '0635', '264100', '中国,山东省,烟台市,牟平区', '121.601', '37.3885', 'Muping');
INSERT INTO `ctshop_region` VALUES ('370613', '莱山区', '370600', '莱山', '3', '0635', '264600', '中国,山东省,烟台市,莱山区', '121.445', '37.5117', 'Laishan');
INSERT INTO `ctshop_region` VALUES ('370634', '长岛县', '370600', '长岛', '3', '0635', '265800', '中国,山东省,烟台市,长岛县', '120.738', '37.9175', 'Changdao');
INSERT INTO `ctshop_region` VALUES ('370681', '龙口市', '370600', '龙口', '3', '0635', '265700', '中国,山东省,烟台市,龙口市', '120.506', '37.6406', 'Longkou');
INSERT INTO `ctshop_region` VALUES ('370682', '莱阳市', '370600', '莱阳', '3', '0635', '265200', '中国,山东省,烟台市,莱阳市', '120.711', '36.9801', 'Laiyang');
INSERT INTO `ctshop_region` VALUES ('370683', '莱州市', '370600', '莱州', '3', '0635', '261400', '中国,山东省,烟台市,莱州市', '119.941', '37.1781', 'Laizhou');
INSERT INTO `ctshop_region` VALUES ('370684', '蓬莱市', '370600', '蓬莱', '3', '0635', '265600', '中国,山东省,烟台市,蓬莱市', '120.76', '37.8112', 'Penglai');
INSERT INTO `ctshop_region` VALUES ('370685', '招远市', '370600', '招远', '3', '0635', '265400', '中国,山东省,烟台市,招远市', '120.405', '37.3627', 'Zhaoyuan');
INSERT INTO `ctshop_region` VALUES ('370686', '栖霞市', '370600', '栖霞', '3', '0635', '265300', '中国,山东省,烟台市,栖霞市', '120.85', '37.3357', 'Qixia');
INSERT INTO `ctshop_region` VALUES ('370687', '海阳市', '370600', '海阳', '3', '0635', '265100', '中国,山东省,烟台市,海阳市', '121.16', '36.7762', 'Haiyang');
INSERT INTO `ctshop_region` VALUES ('370700', '潍坊市', '370000', '潍坊', '2', '0536', '261041', '中国,山东省,潍坊市', '119.107', '36.7093', 'Weifang');
INSERT INTO `ctshop_region` VALUES ('370702', '潍城区', '370700', '潍城', '3', '0536', '261021', '中国,山东省,潍坊市,潍城区', '119.106', '36.7139', 'Weicheng');
INSERT INTO `ctshop_region` VALUES ('370703', '寒亭区', '370700', '寒亭', '3', '0536', '261100', '中国,山东省,潍坊市,寒亭区', '119.218', '36.775', 'Hanting');
INSERT INTO `ctshop_region` VALUES ('370704', '坊子区', '370700', '坊子', '3', '0536', '261200', '中国,山东省,潍坊市,坊子区', '119.165', '36.6522', 'Fangzi');
INSERT INTO `ctshop_region` VALUES ('370705', '奎文区', '370700', '奎文', '3', '0536', '261031', '中国,山东省,潍坊市,奎文区', '119.125', '36.7072', 'Kuiwen');
INSERT INTO `ctshop_region` VALUES ('370724', '临朐县', '370700', '临朐', '3', '0536', '262600', '中国,山东省,潍坊市,临朐县', '118.544', '36.5122', 'Linqu');
INSERT INTO `ctshop_region` VALUES ('370725', '昌乐县', '370700', '昌乐', '3', '0536', '262400', '中国,山东省,潍坊市,昌乐县', '118.83', '36.7078', 'Changle');
INSERT INTO `ctshop_region` VALUES ('370781', '青州市', '370700', '青州', '3', '0536', '262500', '中国,山东省,潍坊市,青州市', '118.479', '36.6851', 'Qingzhou');
INSERT INTO `ctshop_region` VALUES ('370782', '诸城市', '370700', '诸城', '3', '0536', '262200', '中国,山东省,潍坊市,诸城市', '119.41', '35.9966', 'Zhucheng');
INSERT INTO `ctshop_region` VALUES ('370783', '寿光市', '370700', '寿光', '3', '0536', '262700', '中国,山东省,潍坊市,寿光市', '118.74', '36.8813', 'Shouguang');
INSERT INTO `ctshop_region` VALUES ('370784', '安丘市', '370700', '安丘', '3', '0536', '262100', '中国,山东省,潍坊市,安丘市', '119.219', '36.4785', 'Anqiu');
INSERT INTO `ctshop_region` VALUES ('370785', '高密市', '370700', '高密', '3', '0536', '261500', '中国,山东省,潍坊市,高密市', '119.757', '36.384', 'Gaomi');
INSERT INTO `ctshop_region` VALUES ('370786', '昌邑市', '370700', '昌邑', '3', '0536', '261300', '中国,山东省,潍坊市,昌邑市', '119.398', '36.8601', 'Changyi');
INSERT INTO `ctshop_region` VALUES ('370800', '济宁市', '370000', '济宁', '2', '0537', '272119', '中国,山东省,济宁市', '116.587', '35.4154', 'Jining');
INSERT INTO `ctshop_region` VALUES ('370811', '任城区', '370800', '任城', '3', '0537', '272113', '中国,山东省,济宁市,任城区', '116.595', '35.4066', 'Rencheng');
INSERT INTO `ctshop_region` VALUES ('370812', '兖州区', '370800', '兖州', '3', '0537', '272000', '中国,山东省,济宁市,兖州区', '116.827', '35.5523', 'Yanzhou ');
INSERT INTO `ctshop_region` VALUES ('370826', '微山县', '370800', '微山', '3', '0537', '277600', '中国,山东省,济宁市,微山县', '117.129', '34.8071', 'Weishan');
INSERT INTO `ctshop_region` VALUES ('370827', '鱼台县', '370800', '鱼台', '3', '0537', '272300', '中国,山东省,济宁市,鱼台县', '116.648', '34.9967', 'Yutai');
INSERT INTO `ctshop_region` VALUES ('370828', '金乡县', '370800', '金乡', '3', '0537', '272200', '中国,山东省,济宁市,金乡县', '116.311', '35.065', 'Jinxiang');
INSERT INTO `ctshop_region` VALUES ('370829', '嘉祥县', '370800', '嘉祥', '3', '0537', '272400', '中国,山东省,济宁市,嘉祥县', '116.342', '35.4084', 'Jiaxiang');
INSERT INTO `ctshop_region` VALUES ('370830', '汶上县', '370800', '汶上', '3', '0537', '272501', '中国,山东省,济宁市,汶上县', '116.487', '35.7329', 'Wenshang');
INSERT INTO `ctshop_region` VALUES ('370831', '泗水县', '370800', '泗水', '3', '0537', '273200', '中国,山东省,济宁市,泗水县', '117.279', '35.6611', 'Sishui');
INSERT INTO `ctshop_region` VALUES ('370832', '梁山县', '370800', '梁山', '3', '0537', '272600', '中国,山东省,济宁市,梁山县', '116.097', '35.8032', 'Liangshan');
INSERT INTO `ctshop_region` VALUES ('370881', '曲阜市', '370800', '曲阜', '3', '0537', '273100', '中国,山东省,济宁市,曲阜市', '116.986', '35.5809', 'Qufu');
INSERT INTO `ctshop_region` VALUES ('370883', '邹城市', '370800', '邹城', '3', '0537', '273500', '中国,山东省,济宁市,邹城市', '116.973', '35.4053', 'Zoucheng');
INSERT INTO `ctshop_region` VALUES ('370900', '泰安市', '370000', '泰安', '2', '0538', '271000', '中国,山东省,泰安市', '117.129', '36.195', 'Tai\'an');
INSERT INTO `ctshop_region` VALUES ('370902', '泰山区', '370900', '泰山', '3', '0538', '271000', '中国,山东省,泰安市,泰山区', '117.134', '36.1941', 'Taishan');
INSERT INTO `ctshop_region` VALUES ('370911', '岱岳区', '370900', '岱岳', '3', '0538', '271000', '中国,山东省,泰安市,岱岳区', '117.042', '36.1875', 'Daiyue');
INSERT INTO `ctshop_region` VALUES ('370921', '宁阳县', '370900', '宁阳', '3', '0538', '271400', '中国,山东省,泰安市,宁阳县', '116.805', '35.7599', 'Ningyang');
INSERT INTO `ctshop_region` VALUES ('370923', '东平县', '370900', '东平', '3', '0538', '271500', '中国,山东省,泰安市,东平县', '116.471', '35.9379', 'Dongping');
INSERT INTO `ctshop_region` VALUES ('370982', '新泰市', '370900', '新泰', '3', '0538', '271200', '中国,山东省,泰安市,新泰市', '117.77', '35.9089', 'Xintai');
INSERT INTO `ctshop_region` VALUES ('370983', '肥城市', '370900', '肥城', '3', '0538', '271600', '中国,山东省,泰安市,肥城市', '116.768', '36.1825', 'Feicheng');
INSERT INTO `ctshop_region` VALUES ('371000', '威海市', '370000', '威海', '2', '0631', '264200', '中国,山东省,威海市', '122.116', '37.5097', 'Weihai');
INSERT INTO `ctshop_region` VALUES ('371002', '环翠区', '371000', '环翠', '3', '0631', '264200', '中国,山东省,威海市,环翠区', '122.123', '37.502', 'Huancui');
INSERT INTO `ctshop_region` VALUES ('371003', '文登区', '371000', '文登', '3', '0631', '266440', '中国,山东省,威海市,文登区', '122.057', '37.1962', 'Wendeng');
INSERT INTO `ctshop_region` VALUES ('371082', '荣成市', '371000', '荣成', '3', '0631', '264300', '中国,山东省,威海市,荣成市', '122.488', '37.1652', 'Rongcheng');
INSERT INTO `ctshop_region` VALUES ('371083', '乳山市', '371000', '乳山', '3', '0631', '264500', '中国,山东省,威海市,乳山市', '121.538', '36.9192', 'Rushan');
INSERT INTO `ctshop_region` VALUES ('371100', '日照市', '370000', '日照', '2', '0633', '276800', '中国,山东省,日照市', '119.461', '35.4286', 'Rizhao');
INSERT INTO `ctshop_region` VALUES ('371102', '东港区', '371100', '东港', '3', '0633', '276800', '中国,山东省,日照市,东港区', '119.462', '35.4254', 'Donggang');
INSERT INTO `ctshop_region` VALUES ('371103', '岚山区', '371100', '岚山', '3', '0633', '276808', '中国,山东省,日照市,岚山区', '119.319', '35.122', 'Lanshan');
INSERT INTO `ctshop_region` VALUES ('371121', '五莲县', '371100', '五莲', '3', '0633', '262300', '中国,山东省,日照市,五莲县', '119.207', '35.75', 'Wulian');
INSERT INTO `ctshop_region` VALUES ('371122', '莒县', '371100', '莒县', '3', '0633', '276500', '中国,山东省,日照市,莒县', '118.838', '35.5805', 'Juxian');
INSERT INTO `ctshop_region` VALUES ('371200', '莱芜市', '370000', '莱芜', '2', '0634', '271100', '中国,山东省,莱芜市', '117.678', '36.2144', 'Laiwu');
INSERT INTO `ctshop_region` VALUES ('371202', '莱城区', '371200', '莱城', '3', '0634', '271199', '中国,山东省,莱芜市,莱城区', '117.66', '36.2032', 'Laicheng');
INSERT INTO `ctshop_region` VALUES ('371203', '钢城区', '371200', '钢城', '3', '0634', '271100', '中国,山东省,莱芜市,钢城区', '117.805', '36.0632', 'Gangcheng');
INSERT INTO `ctshop_region` VALUES ('371300', '临沂市', '370000', '临沂', '2', '0539', '253000', '中国,山东省,临沂市', '118.326', '35.0653', 'Linyi');
INSERT INTO `ctshop_region` VALUES ('371302', '兰山区', '371300', '兰山', '3', '0539', '276002', '中国,山东省,临沂市,兰山区', '118.348', '35.0687', 'Lanshan');
INSERT INTO `ctshop_region` VALUES ('371311', '罗庄区', '371300', '罗庄', '3', '0539', '276022', '中国,山东省,临沂市,罗庄区', '118.285', '34.9963', 'Luozhuang');
INSERT INTO `ctshop_region` VALUES ('371312', '河东区', '371300', '河东', '3', '0539', '276034', '中国,山东省,临沂市,河东区', '118.411', '35.088', 'Hedong');
INSERT INTO `ctshop_region` VALUES ('371321', '沂南县', '371300', '沂南', '3', '0539', '276300', '中国,山东省,临沂市,沂南县', '118.471', '35.5513', 'Yinan');
INSERT INTO `ctshop_region` VALUES ('371322', '郯城县', '371300', '郯城', '3', '0539', '276100', '中国,山东省,临沂市,郯城县', '118.367', '34.6135', 'Tancheng');
INSERT INTO `ctshop_region` VALUES ('371323', '沂水县', '371300', '沂水', '3', '0539', '276400', '中国,山东省,临沂市,沂水县', '118.63', '35.7873', 'Yishui');
INSERT INTO `ctshop_region` VALUES ('371324', '兰陵县', '371300', '兰陵', '3', '0539', '277700', '中国,山东省,临沂市,兰陵县', '117.857', '34.7383', 'Lanling');
INSERT INTO `ctshop_region` VALUES ('371325', '费县', '371300', '费县', '3', '0539', '273400', '中国,山东省,临沂市,费县', '117.978', '35.2656', 'Feixian');
INSERT INTO `ctshop_region` VALUES ('371326', '平邑县', '371300', '平邑', '3', '0539', '273300', '中国,山东省,临沂市,平邑县', '117.639', '35.5057', 'Pingyi');
INSERT INTO `ctshop_region` VALUES ('371327', '莒南县', '371300', '莒南', '3', '0539', '276600', '中国,山东省,临沂市,莒南县', '118.832', '35.1754', 'Junan');
INSERT INTO `ctshop_region` VALUES ('371328', '蒙阴县', '371300', '蒙阴', '3', '0539', '276200', '中国,山东省,临沂市,蒙阴县', '117.946', '35.71', 'Mengyin');
INSERT INTO `ctshop_region` VALUES ('371329', '临沭县', '371300', '临沭', '3', '0539', '276700', '中国,山东省,临沂市,临沭县', '118.653', '34.9209', 'Linshu');
INSERT INTO `ctshop_region` VALUES ('371400', '德州市', '370000', '德州', '2', '0534', '253000', '中国,山东省,德州市', '116.307', '37.454', 'Dezhou');
INSERT INTO `ctshop_region` VALUES ('371402', '德城区', '371400', '德城', '3', '0534', '253012', '中国,山东省,德州市,德城区', '116.299', '37.4513', 'Decheng');
INSERT INTO `ctshop_region` VALUES ('371403', '陵城区', '371400', '陵城', '3', '0534', '253500', '中国,山东省,德州市,陵城区', '116.576', '37.3357', 'Lingcheng');
INSERT INTO `ctshop_region` VALUES ('371422', '宁津县', '371400', '宁津', '3', '0534', '253400', '中国,山东省,德州市,宁津县', '116.797', '37.653', 'Ningjin');
INSERT INTO `ctshop_region` VALUES ('371423', '庆云县', '371400', '庆云', '3', '0534', '253700', '中国,山东省,德州市,庆云县', '117.386', '37.7762', 'Qingyun');
INSERT INTO `ctshop_region` VALUES ('371424', '临邑县', '371400', '临邑', '3', '0534', '251500', '中国,山东省,德州市,临邑县', '116.865', '37.1905', 'Linyi');
INSERT INTO `ctshop_region` VALUES ('371425', '齐河县', '371400', '齐河', '3', '0534', '251100', '中国,山东省,德州市,齐河县', '116.755', '36.7953', 'Qihe');
INSERT INTO `ctshop_region` VALUES ('371426', '平原县', '371400', '平原', '3', '0534', '253100', '中国,山东省,德州市,平原县', '116.434', '37.1663', 'Pingyuan');
INSERT INTO `ctshop_region` VALUES ('371427', '夏津县', '371400', '夏津', '3', '0534', '253200', '中国,山东省,德州市,夏津县', '116.002', '36.9485', 'Xiajin');
INSERT INTO `ctshop_region` VALUES ('371428', '武城县', '371400', '武城', '3', '0534', '253300', '中国,山东省,德州市,武城县', '116.07', '37.214', 'Wucheng');
INSERT INTO `ctshop_region` VALUES ('371481', '乐陵市', '371400', '乐陵', '3', '0534', '253600', '中国,山东省,德州市,乐陵市', '117.231', '37.7316', 'Leling');
INSERT INTO `ctshop_region` VALUES ('371482', '禹城市', '371400', '禹城', '3', '0534', '251200', '中国,山东省,德州市,禹城市', '116.643', '36.9344', 'Yucheng');
INSERT INTO `ctshop_region` VALUES ('371500', '聊城市', '370000', '聊城', '2', '0635', '252052', '中国,山东省,聊城市', '115.98', '36.456', 'Liaocheng');
INSERT INTO `ctshop_region` VALUES ('371502', '东昌府区', '371500', '东昌府', '3', '0635', '252000', '中国,山东省,聊城市,东昌府区', '115.974', '36.4446', 'Dongchangfu');
INSERT INTO `ctshop_region` VALUES ('371521', '阳谷县', '371500', '阳谷', '3', '0635', '252300', '中国,山东省,聊城市,阳谷县', '115.791', '36.1144', 'Yanggu');
INSERT INTO `ctshop_region` VALUES ('371522', '莘县', '371500', '莘县', '3', '0635', '252400', '中国,山东省,聊城市,莘县', '115.67', '36.2342', 'Shenxian');
INSERT INTO `ctshop_region` VALUES ('371523', '茌平县', '371500', '茌平', '3', '0635', '252100', '中国,山东省,聊城市,茌平县', '116.255', '36.5797', 'Chiping');
INSERT INTO `ctshop_region` VALUES ('371524', '东阿县', '371500', '东阿', '3', '0635', '252200', '中国,山东省,聊城市,东阿县', '116.25', '36.3321', 'Dong\'e');
INSERT INTO `ctshop_region` VALUES ('371525', '冠县', '371500', '冠县', '3', '0635', '252500', '中国,山东省,聊城市,冠县', '115.442', '36.4843', 'Guanxian');
INSERT INTO `ctshop_region` VALUES ('371526', '高唐县', '371500', '高唐', '3', '0635', '252800', '中国,山东省,聊城市,高唐县', '116.232', '36.8653', 'Gaotang');
INSERT INTO `ctshop_region` VALUES ('371581', '临清市', '371500', '临清', '3', '0635', '252600', '中国,山东省,聊城市,临清市', '115.706', '36.8395', 'Linqing');
INSERT INTO `ctshop_region` VALUES ('371600', '滨州市', '370000', '滨州', '2', '0543', '256619', '中国,山东省,滨州市', '118.017', '37.3835', 'Binzhou');
INSERT INTO `ctshop_region` VALUES ('371602', '滨城区', '371600', '滨城', '3', '0543', '256613', '中国,山东省,滨州市,滨城区', '118.02', '37.3852', 'Bincheng');
INSERT INTO `ctshop_region` VALUES ('371603', '沾化区', '371600', '沾化', '3', '0543', '256800', '中国,山东省,滨州市,沾化区', '118.132', '37.6983', 'Zhanhua');
INSERT INTO `ctshop_region` VALUES ('371621', '惠民县', '371600', '惠民', '3', '0543', '251700', '中国,山东省,滨州市,惠民县', '117.511', '37.4901', 'Huimin');
INSERT INTO `ctshop_region` VALUES ('371622', '阳信县', '371600', '阳信', '3', '0543', '251800', '中国,山东省,滨州市,阳信县', '117.581', '37.642', 'Yangxin');
INSERT INTO `ctshop_region` VALUES ('371623', '无棣县', '371600', '无棣', '3', '0543', '251900', '中国,山东省,滨州市,无棣县', '117.614', '37.7401', 'Wudi');
INSERT INTO `ctshop_region` VALUES ('371625', '博兴县', '371600', '博兴', '3', '0543', '256500', '中国,山东省,滨州市,博兴县', '118.134', '37.1432', 'Boxing');
INSERT INTO `ctshop_region` VALUES ('371626', '邹平县', '371600', '邹平', '3', '0543', '256200', '中国,山东省,滨州市,邹平县', '117.743', '36.8629', 'Zouping');
INSERT INTO `ctshop_region` VALUES ('371627', '北海新区', '371600', '北海新区', '3', '0543', '256200', '中国,山东省,滨州市,北海新区', '118.017', '37.3835', 'Beihaixinqu');
INSERT INTO `ctshop_region` VALUES ('371700', '菏泽市', '370000', '菏泽', '2', '0530', '274020', '中国,山东省,菏泽市', '115.469', '35.2465', 'Heze');
INSERT INTO `ctshop_region` VALUES ('371702', '牡丹区', '371700', '牡丹', '3', '0530', '274009', '中国,山东省,菏泽市,牡丹区', '115.417', '35.2509', 'Mudan');
INSERT INTO `ctshop_region` VALUES ('371721', '曹县', '371700', '曹县', '3', '0530', '274400', '中国,山东省,菏泽市,曹县', '115.542', '34.8266', 'Caoxian');
INSERT INTO `ctshop_region` VALUES ('371722', '单县', '371700', '单县', '3', '0530', '273700', '中国,山东省,菏泽市,单县', '116.087', '34.7951', 'Shanxian');
INSERT INTO `ctshop_region` VALUES ('371723', '成武县', '371700', '成武', '3', '0530', '274200', '中国,山东省,菏泽市,成武县', '115.89', '34.9533', 'Chengwu');
INSERT INTO `ctshop_region` VALUES ('371724', '巨野县', '371700', '巨野', '3', '0530', '274900', '中国,山东省,菏泽市,巨野县', '116.095', '35.3979', 'Juye');
INSERT INTO `ctshop_region` VALUES ('371725', '郓城县', '371700', '郓城', '3', '0530', '274700', '中国,山东省,菏泽市,郓城县', '115.944', '35.6004', 'Yuncheng');
INSERT INTO `ctshop_region` VALUES ('371726', '鄄城县', '371700', '鄄城', '3', '0530', '274600', '中国,山东省,菏泽市,鄄城县', '115.51', '35.5641', 'Juancheng');
INSERT INTO `ctshop_region` VALUES ('371727', '定陶县', '371700', '定陶', '3', '0530', '274100', '中国,山东省,菏泽市,定陶县', '115.573', '35.0712', 'Dingtao');
INSERT INTO `ctshop_region` VALUES ('371728', '东明县', '371700', '东明', '3', '0530', '274500', '中国,山东省,菏泽市,东明县', '115.091', '35.2891', 'Dongming');
INSERT INTO `ctshop_region` VALUES ('410000', '河南省', '100000', '河南', '1', '', '', '中国,河南省', '113.665', '34.758', 'Henan');
INSERT INTO `ctshop_region` VALUES ('410100', '郑州市', '410000', '郑州', '2', '0371', '450000', '中国,河南省,郑州市', '113.665', '34.758', 'Zhengzhou');
INSERT INTO `ctshop_region` VALUES ('410102', '中原区', '410100', '中原', '3', '0371', '450007', '中国,河南省,郑州市,中原区', '113.613', '34.7483', 'Zhongyuan');
INSERT INTO `ctshop_region` VALUES ('410103', '二七区', '410100', '二七', '3', '0371', '450052', '中国,河南省,郑州市,二七区', '113.639', '34.7234', 'Erqi');
INSERT INTO `ctshop_region` VALUES ('410104', '管城回族区', '410100', '管城', '3', '0371', '450000', '中国,河南省,郑州市,管城回族区', '113.677', '34.7538', 'Guancheng');
INSERT INTO `ctshop_region` VALUES ('410105', '金水区', '410100', '金水', '3', '0371', '450003', '中国,河南省,郑州市,金水区', '113.661', '34.8003', 'Jinshui');
INSERT INTO `ctshop_region` VALUES ('410106', '上街区', '410100', '上街', '3', '0371', '450041', '中国,河南省,郑州市,上街区', '113.309', '34.8028', 'Shangjie');
INSERT INTO `ctshop_region` VALUES ('410108', '惠济区', '410100', '惠济', '3', '0371', '450053', '中国,河南省,郑州市,惠济区', '113.617', '34.8674', 'Huiji');
INSERT INTO `ctshop_region` VALUES ('410122', '中牟县', '410100', '中牟', '3', '0371', '451450', '中国,河南省,郑州市,中牟县', '113.976', '34.719', 'Zhongmu');
INSERT INTO `ctshop_region` VALUES ('410181', '巩义市', '410100', '巩义', '3', '0371', '451200', '中国,河南省,郑州市,巩义市', '113.022', '34.7479', 'Gongyi');
INSERT INTO `ctshop_region` VALUES ('410182', '荥阳市', '410100', '荥阳', '3', '0371', '450100', '中国,河南省,郑州市,荥阳市', '113.383', '34.7876', 'Xingyang');
INSERT INTO `ctshop_region` VALUES ('410183', '新密市', '410100', '新密', '3', '0371', '452300', '中国,河南省,郑州市,新密市', '113.387', '34.537', 'Xinmi');
INSERT INTO `ctshop_region` VALUES ('410184', '新郑市', '410100', '新郑', '3', '0371', '451100', '中国,河南省,郑州市,新郑市', '113.736', '34.3955', 'Xinzheng');
INSERT INTO `ctshop_region` VALUES ('410185', '登封市', '410100', '登封', '3', '0371', '452470', '中国,河南省,郑州市,登封市', '113.05', '34.4534', 'Dengfeng');
INSERT INTO `ctshop_region` VALUES ('410200', '开封市', '410000', '开封', '2', '0378', '475001', '中国,河南省,开封市', '114.341', '34.7971', 'Kaifeng');
INSERT INTO `ctshop_region` VALUES ('410202', '龙亭区', '410200', '龙亭', '3', '0378', '475100', '中国,河南省,开封市,龙亭区', '114.355', '34.7999', 'Longting');
INSERT INTO `ctshop_region` VALUES ('410203', '顺河回族区', '410200', '顺河', '3', '0378', '475000', '中国,河南省,开封市,顺河回族区', '114.361', '34.7959', 'Shunhe');
INSERT INTO `ctshop_region` VALUES ('410204', '鼓楼区', '410200', '鼓楼', '3', '0378', '475000', '中国,河南省,开封市,鼓楼区', '114.356', '34.7952', 'Gulou');
INSERT INTO `ctshop_region` VALUES ('410205', '禹王台区', '410200', '禹王台', '3', '0378', '475003', '中国,河南省,开封市,禹王台区', '114.348', '34.7769', 'Yuwangtai');
INSERT INTO `ctshop_region` VALUES ('410212', '祥符区', '410200', '祥符', '3', '0378', '475100', '中国,河南省,开封市,祥符区', '114.439', '34.7587', 'Xiangfu');
INSERT INTO `ctshop_region` VALUES ('410221', '杞县', '410200', '杞县', '3', '0378', '475200', '中国,河南省,开封市,杞县', '114.783', '34.5503', 'Qixian');
INSERT INTO `ctshop_region` VALUES ('410222', '通许县', '410200', '通许', '3', '0378', '475400', '中国,河南省,开封市,通许县', '114.467', '34.4752', 'Tongxu');
INSERT INTO `ctshop_region` VALUES ('410223', '尉氏县', '410200', '尉氏', '3', '0378', '475500', '中国,河南省,开封市,尉氏县', '114.193', '34.4122', 'Weishi');
INSERT INTO `ctshop_region` VALUES ('410225', '兰考县', '410200', '兰考', '3', '0378', '475300', '中国,河南省,开封市,兰考县', '114.82', '34.8235', 'Lankao');
INSERT INTO `ctshop_region` VALUES ('410300', '洛阳市', '410000', '洛阳', '2', '0379', '471000', '中国,河南省,洛阳市', '112.434', '34.663', 'Luoyang');
INSERT INTO `ctshop_region` VALUES ('410302', '老城区', '410300', '老城', '3', '0379', '471002', '中国,河南省,洛阳市,老城区', '112.469', '34.6836', 'Laocheng');
INSERT INTO `ctshop_region` VALUES ('410303', '西工区', '410300', '西工', '3', '0379', '471000', '中国,河南省,洛阳市,西工区', '112.437', '34.67', 'Xigong');
INSERT INTO `ctshop_region` VALUES ('410304', '瀍河回族区', '410300', '瀍河', '3', '0379', '471002', '中国,河南省,洛阳市,瀍河回族区', '112.5', '34.6799', 'Chanhe');
INSERT INTO `ctshop_region` VALUES ('410305', '涧西区', '410300', '涧西', '3', '0379', '471003', '中国,河南省,洛阳市,涧西区', '112.396', '34.6582', 'Jianxi');
INSERT INTO `ctshop_region` VALUES ('410306', '吉利区', '410300', '吉利', '3', '0379', '471012', '中国,河南省,洛阳市,吉利区', '112.589', '34.9009', 'Jili');
INSERT INTO `ctshop_region` VALUES ('410311', '洛龙区', '410300', '洛龙', '3', '0379', '471000', '中国,河南省,洛阳市,洛龙区', '112.464', '34.6187', 'Luolong');
INSERT INTO `ctshop_region` VALUES ('410322', '孟津县', '410300', '孟津', '3', '0379', '471100', '中国,河南省,洛阳市,孟津县', '112.444', '34.826', 'Mengjin');
INSERT INTO `ctshop_region` VALUES ('410323', '新安县', '410300', '新安', '3', '0379', '471800', '中国,河南省,洛阳市,新安县', '112.132', '34.7281', 'Xin\'an');
INSERT INTO `ctshop_region` VALUES ('410324', '栾川县', '410300', '栾川', '3', '0379', '471500', '中国,河南省,洛阳市,栾川县', '111.618', '33.7858', 'Luanchuan');
INSERT INTO `ctshop_region` VALUES ('410325', '嵩县', '410300', '嵩县', '3', '0379', '471400', '中国,河南省,洛阳市,嵩县', '112.085', '34.1347', 'Songxian');
INSERT INTO `ctshop_region` VALUES ('410326', '汝阳县', '410300', '汝阳', '3', '0379', '471200', '中国,河南省,洛阳市,汝阳县', '112.473', '34.1539', 'Ruyang');
INSERT INTO `ctshop_region` VALUES ('410327', '宜阳县', '410300', '宜阳', '3', '0379', '471600', '中国,河南省,洛阳市,宜阳县', '112.179', '34.5152', 'Yiyang');
INSERT INTO `ctshop_region` VALUES ('410328', '洛宁县', '410300', '洛宁', '3', '0379', '471700', '中国,河南省,洛阳市,洛宁县', '111.651', '34.3891', 'Luoning');
INSERT INTO `ctshop_region` VALUES ('410329', '伊川县', '410300', '伊川', '3', '0379', '471300', '中国,河南省,洛阳市,伊川县', '112.429', '34.4221', 'Yichuan');
INSERT INTO `ctshop_region` VALUES ('410381', '偃师市', '410300', '偃师', '3', '0379', '471900', '中国,河南省,洛阳市,偃师市', '112.792', '34.7281', 'Yanshi');
INSERT INTO `ctshop_region` VALUES ('410400', '平顶山市', '410000', '平顶山', '2', '0375', '467000', '中国,河南省,平顶山市', '113.308', '33.7352', 'Pingdingshan');
INSERT INTO `ctshop_region` VALUES ('410402', '新华区', '410400', '新华', '3', '0375', '467002', '中国,河南省,平顶山市,新华区', '113.294', '33.7373', 'Xinhua');
INSERT INTO `ctshop_region` VALUES ('410403', '卫东区', '410400', '卫东', '3', '0375', '467021', '中国,河南省,平顶山市,卫东区', '113.335', '33.7347', 'Weidong');
INSERT INTO `ctshop_region` VALUES ('410404', '石龙区', '410400', '石龙', '3', '0375', '467045', '中国,河南省,平顶山市,石龙区', '112.899', '33.8988', 'Shilong');
INSERT INTO `ctshop_region` VALUES ('410411', '湛河区', '410400', '湛河', '3', '0375', '467000', '中国,河南省,平顶山市,湛河区', '113.293', '33.7362', 'Zhanhe');
INSERT INTO `ctshop_region` VALUES ('410421', '宝丰县', '410400', '宝丰', '3', '0375', '467400', '中国,河南省,平顶山市,宝丰县', '113.055', '33.8692', 'Baofeng');
INSERT INTO `ctshop_region` VALUES ('410422', '叶县', '410400', '叶县', '3', '0375', '467200', '中国,河南省,平顶山市,叶县', '113.351', '33.6222', 'Yexian');
INSERT INTO `ctshop_region` VALUES ('410423', '鲁山县', '410400', '鲁山', '3', '0375', '467300', '中国,河南省,平顶山市,鲁山县', '112.906', '33.7388', 'Lushan');
INSERT INTO `ctshop_region` VALUES ('410425', '郏县', '410400', '郏县', '3', '0375', '467100', '中国,河南省,平顶山市,郏县', '113.216', '33.9707', 'Jiaxian');
INSERT INTO `ctshop_region` VALUES ('410481', '舞钢市', '410400', '舞钢', '3', '0375', '462500', '中国,河南省,平顶山市,舞钢市', '113.524', '33.2938', 'Wugang');
INSERT INTO `ctshop_region` VALUES ('410482', '汝州市', '410400', '汝州', '3', '0375', '467500', '中国,河南省,平顶山市,汝州市', '112.843', '34.1614', 'Ruzhou');
INSERT INTO `ctshop_region` VALUES ('410500', '安阳市', '410000', '安阳', '2', '0372', '455000', '中国,河南省,安阳市', '114.352', '36.1034', 'Anyang');
INSERT INTO `ctshop_region` VALUES ('410502', '文峰区', '410500', '文峰', '3', '0372', '455000', '中国,河南省,安阳市,文峰区', '114.357', '36.0905', 'Wenfeng');
INSERT INTO `ctshop_region` VALUES ('410503', '北关区', '410500', '北关', '3', '0372', '455001', '中国,河南省,安阳市,北关区', '114.357', '36.1187', 'Beiguan');
INSERT INTO `ctshop_region` VALUES ('410505', '殷都区', '410500', '殷都', '3', '0372', '455004', '中国,河南省,安阳市,殷都区', '114.303', '36.1099', 'Yindu');
INSERT INTO `ctshop_region` VALUES ('410506', '龙安区', '410500', '龙安', '3', '0372', '455001', '中国,河南省,安阳市,龙安区', '114.348', '36.119', 'Long\'an');
INSERT INTO `ctshop_region` VALUES ('410522', '安阳县', '410500', '安阳', '3', '0372', '455000', '中国,河南省,安阳市,安阳县', '114.366', '36.067', 'Anyang');
INSERT INTO `ctshop_region` VALUES ('410523', '汤阴县', '410500', '汤阴', '3', '0372', '456150', '中国,河南省,安阳市,汤阴县', '114.358', '35.9215', 'Tangyin');
INSERT INTO `ctshop_region` VALUES ('410526', '滑县', '410500', '滑县', '3', '0372', '456400', '中国,河南省,安阳市,滑县', '114.521', '35.5807', 'Huaxian');
INSERT INTO `ctshop_region` VALUES ('410527', '内黄县', '410500', '内黄', '3', '0372', '456350', '中国,河南省,安阳市,内黄县', '114.907', '35.9527', 'Neihuang');
INSERT INTO `ctshop_region` VALUES ('410581', '林州市', '410500', '林州', '3', '0372', '456550', '中国,河南省,安阳市,林州市', '113.816', '36.078', 'Linzhou');
INSERT INTO `ctshop_region` VALUES ('410600', '鹤壁市', '410000', '鹤壁', '2', '0392', '458030', '中国,河南省,鹤壁市', '114.295', '35.7482', 'Hebi');
INSERT INTO `ctshop_region` VALUES ('410602', '鹤山区', '410600', '鹤山', '3', '0392', '458010', '中国,河南省,鹤壁市,鹤山区', '114.163', '35.9546', 'Heshan');
INSERT INTO `ctshop_region` VALUES ('410603', '山城区', '410600', '山城', '3', '0392', '458000', '中国,河南省,鹤壁市,山城区', '114.184', '35.8977', 'Shancheng');
INSERT INTO `ctshop_region` VALUES ('410611', '淇滨区', '410600', '淇滨', '3', '0392', '458000', '中国,河南省,鹤壁市,淇滨区', '114.299', '35.7413', 'Qibin');
INSERT INTO `ctshop_region` VALUES ('410621', '浚县', '410600', '浚县', '3', '0392', '456250', '中国,河南省,鹤壁市,浚县', '114.549', '35.6708', 'Xunxian');
INSERT INTO `ctshop_region` VALUES ('410622', '淇县', '410600', '淇县', '3', '0392', '456750', '中国,河南省,鹤壁市,淇县', '114.198', '35.6078', 'Qixian');
INSERT INTO `ctshop_region` VALUES ('410700', '新乡市', '410000', '新乡', '2', '0373', '453000', '中国,河南省,新乡市', '113.884', '35.3026', 'Xinxiang');
INSERT INTO `ctshop_region` VALUES ('410702', '红旗区', '410700', '红旗', '3', '0373', '453000', '中国,河南省,新乡市,红旗区', '113.875', '35.3037', 'Hongqi');
INSERT INTO `ctshop_region` VALUES ('410703', '卫滨区', '410700', '卫滨', '3', '0373', '453000', '中国,河南省,新乡市,卫滨区', '113.866', '35.3021', 'Weibin');
INSERT INTO `ctshop_region` VALUES ('410704', '凤泉区', '410700', '凤泉', '3', '0373', '453011', '中国,河南省,新乡市,凤泉区', '113.915', '35.384', 'Fengquan');
INSERT INTO `ctshop_region` VALUES ('410711', '牧野区', '410700', '牧野', '3', '0373', '453002', '中国,河南省,新乡市,牧野区', '113.909', '35.3149', 'Muye');
INSERT INTO `ctshop_region` VALUES ('410721', '新乡县', '410700', '新乡', '3', '0373', '453700', '中国,河南省,新乡市,新乡县', '113.805', '35.1908', 'Xinxiang');
INSERT INTO `ctshop_region` VALUES ('410724', '获嘉县', '410700', '获嘉', '3', '0373', '453800', '中国,河南省,新乡市,获嘉县', '113.662', '35.2652', 'Huojia');
INSERT INTO `ctshop_region` VALUES ('410725', '原阳县', '410700', '原阳', '3', '0373', '453500', '中国,河南省,新乡市,原阳县', '113.94', '35.0657', 'Yuanyang');
INSERT INTO `ctshop_region` VALUES ('410726', '延津县', '410700', '延津', '3', '0373', '453200', '中国,河南省,新乡市,延津县', '114.203', '35.1433', 'Yanjin');
INSERT INTO `ctshop_region` VALUES ('410727', '封丘县', '410700', '封丘', '3', '0373', '453300', '中国,河南省,新乡市,封丘县', '114.419', '35.0417', 'Fengqiu');
INSERT INTO `ctshop_region` VALUES ('410728', '长垣县', '410700', '长垣', '3', '0373', '453400', '中国,河南省,新乡市,长垣县', '114.669', '35.2005', 'Changyuan');
INSERT INTO `ctshop_region` VALUES ('410781', '卫辉市', '410700', '卫辉', '3', '0373', '453100', '中国,河南省,新乡市,卫辉市', '114.065', '35.3984', 'Weihui');
INSERT INTO `ctshop_region` VALUES ('410782', '辉县市', '410700', '辉县', '3', '0373', '453600', '中国,河南省,新乡市,辉县市', '113.807', '35.4631', 'Huixian');
INSERT INTO `ctshop_region` VALUES ('410800', '焦作市', '410000', '焦作', '2', '0391', '454002', '中国,河南省,焦作市', '113.238', '35.239', 'Jiaozuo');
INSERT INTO `ctshop_region` VALUES ('410802', '解放区', '410800', '解放', '3', '0391', '454000', '中国,河南省,焦作市,解放区', '113.229', '35.2402', 'Jiefang');
INSERT INTO `ctshop_region` VALUES ('410803', '中站区', '410800', '中站', '3', '0391', '454191', '中国,河南省,焦作市,中站区', '113.183', '35.2366', 'Zhongzhan');
INSERT INTO `ctshop_region` VALUES ('410804', '马村区', '410800', '马村', '3', '0391', '454171', '中国,河南省,焦作市,马村区', '113.319', '35.2691', 'Macun');
INSERT INTO `ctshop_region` VALUES ('410811', '山阳区', '410800', '山阳', '3', '0391', '454002', '中国,河南省,焦作市,山阳区', '113.255', '35.2144', 'Shanyang');
INSERT INTO `ctshop_region` VALUES ('410821', '修武县', '410800', '修武', '3', '0391', '454350', '中国,河南省,焦作市,修武县', '113.448', '35.2236', 'Xiuwu');
INSERT INTO `ctshop_region` VALUES ('410822', '博爱县', '410800', '博爱', '3', '0391', '454450', '中国,河南省,焦作市,博爱县', '113.067', '35.1694', 'Boai');
INSERT INTO `ctshop_region` VALUES ('410823', '武陟县', '410800', '武陟', '3', '0391', '454950', '中国,河南省,焦作市,武陟县', '113.397', '35.0951', 'Wuzhi');
INSERT INTO `ctshop_region` VALUES ('410825', '温县', '410800', '温县', '3', '0391', '454850', '中国,河南省,焦作市,温县', '113.081', '34.9402', 'Wenxian');
INSERT INTO `ctshop_region` VALUES ('410882', '沁阳市', '410800', '沁阳', '3', '0391', '454550', '中国,河南省,焦作市,沁阳市', '112.945', '35.0894', 'Qinyang');
INSERT INTO `ctshop_region` VALUES ('410883', '孟州市', '410800', '孟州', '3', '0391', '454750', '中国,河南省,焦作市,孟州市', '112.791', '34.9071', 'Mengzhou');
INSERT INTO `ctshop_region` VALUES ('410900', '濮阳市', '410000', '濮阳', '2', '0393', '457000', '中国,河南省,濮阳市', '115.041', '35.7682', 'Puyang');
INSERT INTO `ctshop_region` VALUES ('410902', '华龙区', '410900', '华龙', '3', '0393', '457001', '中国,河南省,濮阳市,华龙区', '115.074', '35.7774', 'Hualong');
INSERT INTO `ctshop_region` VALUES ('410922', '清丰县', '410900', '清丰', '3', '0393', '457300', '中国,河南省,濮阳市,清丰县', '115.104', '35.8851', 'Qingfeng');
INSERT INTO `ctshop_region` VALUES ('410923', '南乐县', '410900', '南乐', '3', '0393', '457400', '中国,河南省,濮阳市,南乐县', '115.206', '36.0769', 'Nanle');
INSERT INTO `ctshop_region` VALUES ('410926', '范县', '410900', '范县', '3', '0393', '457500', '中国,河南省,濮阳市,范县', '115.504', '35.8518', 'Fanxian');
INSERT INTO `ctshop_region` VALUES ('410927', '台前县', '410900', '台前', '3', '0393', '457600', '中国,河南省,濮阳市,台前县', '115.872', '35.9692', 'Taiqian');
INSERT INTO `ctshop_region` VALUES ('410928', '濮阳县', '410900', '濮阳', '3', '0393', '457100', '中国,河南省,濮阳市,濮阳县', '115.031', '35.7075', 'Puyang');
INSERT INTO `ctshop_region` VALUES ('411000', '许昌市', '410000', '许昌', '2', '0374', '461000', '中国,河南省,许昌市', '113.826', '34.023', 'Xuchang');
INSERT INTO `ctshop_region` VALUES ('411002', '魏都区', '411000', '魏都', '3', '0374', '461000', '中国,河南省,许昌市,魏都区', '113.823', '34.0254', 'Weidu');
INSERT INTO `ctshop_region` VALUES ('411023', '许昌县', '411000', '许昌', '3', '0374', '461100', '中国,河南省,许昌市,许昌县', '113.847', '34.0041', 'Xuchang');
INSERT INTO `ctshop_region` VALUES ('411024', '鄢陵县', '411000', '鄢陵', '3', '0374', '461200', '中国,河南省,许昌市,鄢陵县', '114.188', '34.1032', 'Yanling');
INSERT INTO `ctshop_region` VALUES ('411025', '襄城县', '411000', '襄城', '3', '0374', '461700', '中国,河南省,许昌市,襄城县', '113.482', '33.8493', 'Xiangcheng');
INSERT INTO `ctshop_region` VALUES ('411081', '禹州市', '411000', '禹州', '3', '0374', '461670', '中国,河南省,许昌市,禹州市', '113.488', '34.1405', 'Yuzhou');
INSERT INTO `ctshop_region` VALUES ('411082', '长葛市', '411000', '长葛', '3', '0374', '461500', '中国,河南省,许昌市,长葛市', '113.773', '34.2185', 'Changge');
INSERT INTO `ctshop_region` VALUES ('411100', '漯河市', '410000', '漯河', '2', '0395', '462000', '中国,河南省,漯河市', '114.026', '33.5759', 'Luohe');
INSERT INTO `ctshop_region` VALUES ('411102', '源汇区', '411100', '源汇', '3', '0395', '462000', '中国,河南省,漯河市,源汇区', '114.006', '33.5563', 'Yuanhui');
INSERT INTO `ctshop_region` VALUES ('411103', '郾城区', '411100', '郾城', '3', '0395', '462300', '中国,河南省,漯河市,郾城区', '114.007', '33.5872', 'Yancheng');
INSERT INTO `ctshop_region` VALUES ('411104', '召陵区', '411100', '召陵', '3', '0395', '462300', '中国,河南省,漯河市,召陵区', '114.094', '33.586', 'Zhaoling');
INSERT INTO `ctshop_region` VALUES ('411121', '舞阳县', '411100', '舞阳', '3', '0395', '462400', '中国,河南省,漯河市,舞阳县', '113.598', '33.4324', 'Wuyang');
INSERT INTO `ctshop_region` VALUES ('411122', '临颍县', '411100', '临颍', '3', '0395', '462600', '中国,河南省,漯河市,临颍县', '113.937', '33.8112', 'Linying');
INSERT INTO `ctshop_region` VALUES ('411200', '三门峡市', '410000', '三门峡', '2', '0398', '472000', '中国,河南省,三门峡市', '111.194', '34.7773', 'Sanmenxia');
INSERT INTO `ctshop_region` VALUES ('411202', '湖滨区', '411200', '湖滨', '3', '0398', '472000', '中国,河南省,三门峡市,湖滨区', '111.2', '34.7787', 'Hubin');
INSERT INTO `ctshop_region` VALUES ('411221', '渑池县', '411200', '渑池', '3', '0398', '472400', '中国,河南省,三门峡市,渑池县', '111.762', '34.7673', 'Mianchi');
INSERT INTO `ctshop_region` VALUES ('411222', '陕县', '411200', '陕县', '3', '0398', '472100', '中国,河南省,三门峡市,陕县', '111.103', '34.7205', 'Shanxian');
INSERT INTO `ctshop_region` VALUES ('411224', '卢氏县', '411200', '卢氏', '3', '0398', '472200', '中国,河南省,三门峡市,卢氏县', '111.048', '34.0544', 'Lushi');
INSERT INTO `ctshop_region` VALUES ('411281', '义马市', '411200', '义马', '3', '0398', '472300', '中国,河南省,三门峡市,义马市', '111.874', '34.7472', 'Yima');
INSERT INTO `ctshop_region` VALUES ('411282', '灵宝市', '411200', '灵宝', '3', '0398', '472500', '中国,河南省,三门峡市,灵宝市', '110.895', '34.5168', 'Lingbao');
INSERT INTO `ctshop_region` VALUES ('411300', '南阳市', '410000', '南阳', '2', '0377', '473002', '中国,河南省,南阳市', '112.541', '32.9991', 'Nanyang');
INSERT INTO `ctshop_region` VALUES ('411302', '宛城区', '411300', '宛城', '3', '0377', '473001', '中国,河南省,南阳市,宛城区', '112.54', '33.0038', 'Wancheng');
INSERT INTO `ctshop_region` VALUES ('411303', '卧龙区', '411300', '卧龙', '3', '0377', '473003', '中国,河南省,南阳市,卧龙区', '112.535', '32.9861', 'Wolong');
INSERT INTO `ctshop_region` VALUES ('411321', '南召县', '411300', '南召', '3', '0377', '474650', '中国,河南省,南阳市,南召县', '112.432', '33.491', 'Nanzhao');
INSERT INTO `ctshop_region` VALUES ('411322', '方城县', '411300', '方城', '3', '0377', '473200', '中国,河南省,南阳市,方城县', '113.013', '33.2545', 'Fangcheng');
INSERT INTO `ctshop_region` VALUES ('411323', '西峡县', '411300', '西峡', '3', '0377', '474550', '中国,河南省,南阳市,西峡县', '111.482', '33.2977', 'Xixia');
INSERT INTO `ctshop_region` VALUES ('411324', '镇平县', '411300', '镇平', '3', '0377', '474250', '中国,河南省,南阳市,镇平县', '112.24', '33.0363', 'Zhenping');
INSERT INTO `ctshop_region` VALUES ('411325', '内乡县', '411300', '内乡', '3', '0377', '474350', '中国,河南省,南阳市,内乡县', '111.85', '33.0467', 'Neixiang');
INSERT INTO `ctshop_region` VALUES ('411326', '淅川县', '411300', '淅川', '3', '0377', '474450', '中国,河南省,南阳市,淅川县', '111.487', '33.1371', 'Xichuan');
INSERT INTO `ctshop_region` VALUES ('411327', '社旗县', '411300', '社旗', '3', '0377', '473300', '中国,河南省,南阳市,社旗县', '112.947', '33.055', 'Sheqi');
INSERT INTO `ctshop_region` VALUES ('411328', '唐河县', '411300', '唐河', '3', '0377', '473400', '中国,河南省,南阳市,唐河县', '112.836', '32.6945', 'Tanghe');
INSERT INTO `ctshop_region` VALUES ('411329', '新野县', '411300', '新野', '3', '0377', '473500', '中国,河南省,南阳市,新野县', '112.362', '32.517', 'Xinye');
INSERT INTO `ctshop_region` VALUES ('411330', '桐柏县', '411300', '桐柏', '3', '0377', '474750', '中国,河南省,南阳市,桐柏县', '113.429', '32.3792', 'Tongbai');
INSERT INTO `ctshop_region` VALUES ('411381', '邓州市', '411300', '邓州', '3', '0377', '474150', '中国,河南省,南阳市,邓州市', '112.09', '32.6858', 'Dengzhou');
INSERT INTO `ctshop_region` VALUES ('411400', '商丘市', '410000', '商丘', '2', '0370', '476000', '中国,河南省,商丘市', '115.65', '34.4371', 'Shangqiu');
INSERT INTO `ctshop_region` VALUES ('411402', '梁园区', '411400', '梁园', '3', '0370', '476000', '中国,河南省,商丘市,梁园区', '115.645', '34.4434', 'Liangyuan');
INSERT INTO `ctshop_region` VALUES ('411403', '睢阳区', '411400', '睢阳', '3', '0370', '476100', '中国,河南省,商丘市,睢阳区', '115.653', '34.388', 'Suiyang');
INSERT INTO `ctshop_region` VALUES ('411421', '民权县', '411400', '民权', '3', '0370', '476800', '中国,河南省,商丘市,民权县', '115.146', '34.6493', 'Minquan');
INSERT INTO `ctshop_region` VALUES ('411422', '睢县', '411400', '睢县', '3', '0370', '476900', '中国,河南省,商丘市,睢县', '115.072', '34.4454', 'Suixian');
INSERT INTO `ctshop_region` VALUES ('411423', '宁陵县', '411400', '宁陵', '3', '0370', '476700', '中国,河南省,商丘市,宁陵县', '115.305', '34.4546', 'Ningling');
INSERT INTO `ctshop_region` VALUES ('411424', '柘城县', '411400', '柘城', '3', '0370', '476200', '中国,河南省,商丘市,柘城县', '115.305', '34.0911', 'Zhecheng');
INSERT INTO `ctshop_region` VALUES ('411425', '虞城县', '411400', '虞城', '3', '0370', '476300', '中国,河南省,商丘市,虞城县', '115.863', '34.4019', 'Yucheng');
INSERT INTO `ctshop_region` VALUES ('411426', '夏邑县', '411400', '夏邑', '3', '0370', '476400', '中国,河南省,商丘市,夏邑县', '116.133', '34.2324', 'Xiayi');
INSERT INTO `ctshop_region` VALUES ('411481', '永城市', '411400', '永城', '3', '0370', '476600', '中国,河南省,商丘市,永城市', '116.449', '33.9291', 'Yongcheng');
INSERT INTO `ctshop_region` VALUES ('411500', '信阳市', '410000', '信阳', '2', '0376', '464000', '中国,河南省,信阳市', '114.075', '32.1233', 'Xinyang');
INSERT INTO `ctshop_region` VALUES ('411502', '浉河区', '411500', '浉河', '3', '0376', '464000', '中国,河南省,信阳市,浉河区', '114.059', '32.1168', 'Shihe');
INSERT INTO `ctshop_region` VALUES ('411503', '平桥区', '411500', '平桥', '3', '0376', '464100', '中国,河南省,信阳市,平桥区', '114.124', '32.1009', 'Pingqiao');
INSERT INTO `ctshop_region` VALUES ('411521', '罗山县', '411500', '罗山', '3', '0376', '464200', '中国,河南省,信阳市,罗山县', '114.531', '32.2028', 'Luoshan');
INSERT INTO `ctshop_region` VALUES ('411522', '光山县', '411500', '光山', '3', '0376', '465450', '中国,河南省,信阳市,光山县', '114.919', '32.0099', 'Guangshan');
INSERT INTO `ctshop_region` VALUES ('411523', '新县', '411500', '新县', '3', '0376', '465550', '中国,河南省,信阳市,新县', '114.879', '31.6439', 'Xinxian');
INSERT INTO `ctshop_region` VALUES ('411524', '商城县', '411500', '商城', '3', '0376', '465350', '中国,河南省,信阳市,商城县', '115.409', '31.7999', 'Shangcheng');
INSERT INTO `ctshop_region` VALUES ('411525', '固始县', '411500', '固始', '3', '0376', '465250', '中国,河南省,信阳市,固始县', '115.683', '32.1801', 'Gushi');
INSERT INTO `ctshop_region` VALUES ('411526', '潢川县', '411500', '潢川', '3', '0376', '465150', '中国,河南省,信阳市,潢川县', '115.047', '32.1376', 'Huangchuan');
INSERT INTO `ctshop_region` VALUES ('411527', '淮滨县', '411500', '淮滨', '3', '0376', '464400', '中国,河南省,信阳市,淮滨县', '115.421', '32.4661', 'Huaibin');
INSERT INTO `ctshop_region` VALUES ('411528', '息县', '411500', '息县', '3', '0376', '464300', '中国,河南省,信阳市,息县', '114.74', '32.3428', 'Xixian');
INSERT INTO `ctshop_region` VALUES ('411600', '周口市', '410000', '周口', '2', '0394', '466000', '中国,河南省,周口市', '114.65', '33.6204', 'Zhoukou');
INSERT INTO `ctshop_region` VALUES ('411602', '川汇区', '411600', '川汇', '3', '0394', '466000', '中国,河南省,周口市,川汇区', '114.642', '33.6256', 'Chuanhui');
INSERT INTO `ctshop_region` VALUES ('411621', '扶沟县', '411600', '扶沟', '3', '0394', '461300', '中国,河南省,周口市,扶沟县', '114.395', '34.06', 'Fugou');
INSERT INTO `ctshop_region` VALUES ('411622', '西华县', '411600', '西华', '3', '0394', '466600', '中国,河南省,周口市,西华县', '114.523', '33.7855', 'Xihua');
INSERT INTO `ctshop_region` VALUES ('411623', '商水县', '411600', '商水', '3', '0394', '466100', '中国,河南省,周口市,商水县', '114.606', '33.5391', 'Shangshui');
INSERT INTO `ctshop_region` VALUES ('411624', '沈丘县', '411600', '沈丘', '3', '0394', '466300', '中国,河南省,周口市,沈丘县', '115.099', '33.4094', 'Shenqiu');
INSERT INTO `ctshop_region` VALUES ('411625', '郸城县', '411600', '郸城', '3', '0394', '477150', '中国,河南省,周口市,郸城县', '115.177', '33.6449', 'Dancheng');
INSERT INTO `ctshop_region` VALUES ('411626', '淮阳县', '411600', '淮阳', '3', '0394', '466700', '中国,河南省,周口市,淮阳县', '114.888', '33.7321', 'Huaiyang');
INSERT INTO `ctshop_region` VALUES ('411627', '太康县', '411600', '太康', '3', '0394', '461400', '中国,河南省,周口市,太康县', '114.838', '34.0638', 'Taikang');
INSERT INTO `ctshop_region` VALUES ('411628', '鹿邑县', '411600', '鹿邑', '3', '0394', '477200', '中国,河南省,周口市,鹿邑县', '115.486', '33.8593', 'Luyi');
INSERT INTO `ctshop_region` VALUES ('411681', '项城市', '411600', '项城', '3', '0394', '466200', '中国,河南省,周口市,项城市', '114.876', '33.4672', 'Xiangcheng');
INSERT INTO `ctshop_region` VALUES ('411700', '驻马店市', '410000', '驻马店', '2', '0396', '463000', '中国,河南省,驻马店市', '114.025', '32.9802', 'Zhumadian');
INSERT INTO `ctshop_region` VALUES ('411702', '驿城区', '411700', '驿城', '3', '0396', '463000', '中国,河南省,驻马店市,驿城区', '113.994', '32.9732', 'Yicheng');
INSERT INTO `ctshop_region` VALUES ('411721', '西平县', '411700', '西平', '3', '0396', '463900', '中国,河南省,驻马店市,西平县', '114.023', '33.3845', 'Xiping');
INSERT INTO `ctshop_region` VALUES ('411722', '上蔡县', '411700', '上蔡', '3', '0396', '463800', '中国,河南省,驻马店市,上蔡县', '114.268', '33.2682', 'Shangcai');
INSERT INTO `ctshop_region` VALUES ('411723', '平舆县', '411700', '平舆', '3', '0396', '463400', '中国,河南省,驻马店市,平舆县', '114.636', '32.9573', 'Pingyu');
INSERT INTO `ctshop_region` VALUES ('411724', '正阳县', '411700', '正阳', '3', '0396', '463600', '中国,河南省,驻马店市,正阳县', '114.39', '32.6039', 'Zhengyang');
INSERT INTO `ctshop_region` VALUES ('411725', '确山县', '411700', '确山', '3', '0396', '463200', '中国,河南省,驻马店市,确山县', '114.029', '32.8028', 'Queshan');
INSERT INTO `ctshop_region` VALUES ('411726', '泌阳县', '411700', '泌阳', '3', '0396', '463700', '中国,河南省,驻马店市,泌阳县', '113.327', '32.7178', 'Biyang');
INSERT INTO `ctshop_region` VALUES ('411727', '汝南县', '411700', '汝南', '3', '0396', '463300', '中国,河南省,驻马店市,汝南县', '114.361', '33.0046', 'Runan');
INSERT INTO `ctshop_region` VALUES ('411728', '遂平县', '411700', '遂平', '3', '0396', '463100', '中国,河南省,驻马店市,遂平县', '114.013', '33.1457', 'Suiping');
INSERT INTO `ctshop_region` VALUES ('411729', '新蔡县', '411700', '新蔡', '3', '0396', '463500', '中国,河南省,驻马店市,新蔡县', '114.982', '32.7502', 'Xincai');
INSERT INTO `ctshop_region` VALUES ('419000', '直辖县级', '410000', ' ', '2', '', '', '中国,河南省,直辖县级', '113.665', '34.758', '');
INSERT INTO `ctshop_region` VALUES ('419001', '济源市', '419000', '济源', '3', '0391', '454650', '中国,河南省,直辖县级,济源市', '112.59', '35.0904', 'Jiyuan');
INSERT INTO `ctshop_region` VALUES ('420000', '湖北省', '100000', '湖北', '1', '', '', '中国,湖北省', '114.299', '30.5844', 'Hubei');
INSERT INTO `ctshop_region` VALUES ('420100', '武汉市', '420000', '武汉', '2', '', '430014', '中国,湖北省,武汉市', '114.299', '30.5844', 'Wuhan');
INSERT INTO `ctshop_region` VALUES ('420102', '江岸区', '420100', '江岸', '3', '027', '430014', '中国,湖北省,武汉市,江岸区', '114.309', '30.5998', 'Jiang\'an');
INSERT INTO `ctshop_region` VALUES ('420103', '江汉区', '420100', '江汉', '3', '027', '430021', '中国,湖北省,武汉市,江汉区', '114.271', '30.6015', 'Jianghan');
INSERT INTO `ctshop_region` VALUES ('420104', '硚口区', '420100', '硚口', '3', '027', '430033', '中国,湖北省,武汉市,硚口区', '114.264', '30.5695', 'Qiaokou');
INSERT INTO `ctshop_region` VALUES ('420105', '汉阳区', '420100', '汉阳', '3', '027', '430050', '中国,湖北省,武汉市,汉阳区', '114.275', '30.5492', 'Hanyang');
INSERT INTO `ctshop_region` VALUES ('420106', '武昌区', '420100', '武昌', '3', '027', '430061', '中国,湖北省,武汉市,武昌区', '114.316', '30.5539', 'Wuchang');
INSERT INTO `ctshop_region` VALUES ('420107', '青山区', '420100', '青山', '3', '027', '430080', '中国,湖北省,武汉市,青山区', '114.391', '30.6343', 'Qingshan');
INSERT INTO `ctshop_region` VALUES ('420111', '洪山区', '420100', '洪山', '3', '027', '430070', '中国,湖北省,武汉市,洪山区', '114.344', '30.4999', 'Hongshan');
INSERT INTO `ctshop_region` VALUES ('420112', '东西湖区', '420100', '东西湖', '3', '027', '430040', '中国,湖北省,武汉市,东西湖区', '114.137', '30.6199', 'Dongxihu');
INSERT INTO `ctshop_region` VALUES ('420113', '汉南区', '420100', '汉南', '3', '027', '430090', '中国,湖北省,武汉市,汉南区', '114.085', '30.3088', 'Hannan');
INSERT INTO `ctshop_region` VALUES ('420114', '蔡甸区', '420100', '蔡甸', '3', '027', '430100', '中国,湖北省,武汉市,蔡甸区', '114.029', '30.582', 'Caidian');
INSERT INTO `ctshop_region` VALUES ('420115', '江夏区', '420100', '江夏', '3', '027', '430200', '中国,湖北省,武汉市,江夏区', '114.313', '30.3465', 'Jiangxia');
INSERT INTO `ctshop_region` VALUES ('420116', '黄陂区', '420100', '黄陂', '3', '027', '432200', '中国,湖北省,武汉市,黄陂区', '114.375', '30.8815', 'Huangpi');
INSERT INTO `ctshop_region` VALUES ('420117', '新洲区', '420100', '新洲', '3', '027', '431400', '中国,湖北省,武汉市,新洲区', '114.801', '30.8414', 'Xinzhou');
INSERT INTO `ctshop_region` VALUES ('420200', '黄石市', '420000', '黄石', '2', '0714', '435003', '中国,湖北省,黄石市', '115.077', '30.2201', 'Huangshi');
INSERT INTO `ctshop_region` VALUES ('420202', '黄石港区', '420200', '黄石港', '3', '0714', '435000', '中国,湖北省,黄石市,黄石港区', '115.066', '30.2228', 'Huangshigang');
INSERT INTO `ctshop_region` VALUES ('420203', '西塞山区', '420200', '西塞山', '3', '0714', '435001', '中国,湖北省,黄石市,西塞山区', '115.11', '30.2049', 'Xisaishan');
INSERT INTO `ctshop_region` VALUES ('420204', '下陆区', '420200', '下陆', '3', '0714', '435005', '中国,湖北省,黄石市,下陆区', '114.961', '30.1737', 'Xialu');
INSERT INTO `ctshop_region` VALUES ('420205', '铁山区', '420200', '铁山', '3', '0714', '435006', '中国,湖北省,黄石市,铁山区', '114.901', '30.2068', 'Tieshan');
INSERT INTO `ctshop_region` VALUES ('420222', '阳新县', '420200', '阳新', '3', '0714', '435200', '中国,湖北省,黄石市,阳新县', '115.215', '29.8304', 'Yangxin');
INSERT INTO `ctshop_region` VALUES ('420281', '大冶市', '420200', '大冶', '3', '0714', '435100', '中国,湖北省,黄石市,大冶市', '114.972', '30.0944', 'Daye');
INSERT INTO `ctshop_region` VALUES ('420300', '十堰市', '420000', '十堰', '2', '0719', '442000', '中国,湖北省,十堰市', '110.785', '32.647', 'Shiyan');
INSERT INTO `ctshop_region` VALUES ('420302', '茅箭区', '420300', '茅箭', '3', '0719', '442012', '中国,湖北省,十堰市,茅箭区', '110.813', '32.5915', 'Maojian');
INSERT INTO `ctshop_region` VALUES ('420303', '张湾区', '420300', '张湾', '3', '0719', '442001', '中国,湖北省,十堰市,张湾区', '110.771', '32.652', 'Zhangwan');
INSERT INTO `ctshop_region` VALUES ('420304', '郧阳区', '420300', '郧阳', '3', '0719', '442500', '中国,湖北省,十堰市,郧阳区', '110.819', '32.8359', 'Yunyang');
INSERT INTO `ctshop_region` VALUES ('420322', '郧西县', '420300', '郧西', '3', '0719', '442600', '中国,湖北省,十堰市,郧西县', '110.426', '32.9935', 'Yunxi');
INSERT INTO `ctshop_region` VALUES ('420323', '竹山县', '420300', '竹山', '3', '0719', '442200', '中国,湖北省,十堰市,竹山县', '110.231', '32.2254', 'Zhushan');
INSERT INTO `ctshop_region` VALUES ('420324', '竹溪县', '420300', '竹溪', '3', '0719', '442300', '中国,湖北省,十堰市,竹溪县', '109.718', '32.319', 'Zhuxi');
INSERT INTO `ctshop_region` VALUES ('420325', '房县', '420300', '房县', '3', '0719', '442100', '中国,湖北省,十堰市,房县', '110.744', '32.0579', 'Fangxian');
INSERT INTO `ctshop_region` VALUES ('420381', '丹江口市', '420300', '丹江口', '3', '0719', '442700', '中国,湖北省,十堰市,丹江口市', '111.515', '32.5409', 'Danjiangkou');
INSERT INTO `ctshop_region` VALUES ('420500', '宜昌市', '420000', '宜昌', '2', '0717', '443000', '中国,湖北省,宜昌市', '111.291', '30.7026', 'Yichang');
INSERT INTO `ctshop_region` VALUES ('420502', '西陵区', '420500', '西陵', '3', '0717', '443000', '中国,湖北省,宜昌市,西陵区', '111.286', '30.7108', 'Xiling');
INSERT INTO `ctshop_region` VALUES ('420503', '伍家岗区', '420500', '伍家岗', '3', '0717', '443001', '中国,湖北省,宜昌市,伍家岗区', '111.361', '30.6443', 'Wujiagang');
INSERT INTO `ctshop_region` VALUES ('420504', '点军区', '420500', '点军', '3', '0717', '443006', '中国,湖北省,宜昌市,点军区', '111.268', '30.6934', 'Dianjun');
INSERT INTO `ctshop_region` VALUES ('420505', '猇亭区', '420500', '猇亭', '3', '0717', '443007', '中国,湖北省,宜昌市,猇亭区', '111.441', '30.5266', 'Xiaoting');
INSERT INTO `ctshop_region` VALUES ('420506', '夷陵区', '420500', '夷陵', '3', '0717', '443100', '中国,湖北省,宜昌市,夷陵区', '111.326', '30.7688', 'Yiling');
INSERT INTO `ctshop_region` VALUES ('420525', '远安县', '420500', '远安', '3', '0717', '444200', '中国,湖北省,宜昌市,远安县', '111.642', '31.0599', 'Yuan\'an');
INSERT INTO `ctshop_region` VALUES ('420526', '兴山县', '420500', '兴山', '3', '0717', '443711', '中国,湖北省,宜昌市,兴山县', '110.75', '31.3469', 'Xingshan');
INSERT INTO `ctshop_region` VALUES ('420527', '秭归县', '420500', '秭归', '3', '0717', '443600', '中国,湖北省,宜昌市,秭归县', '110.982', '30.827', 'Zigui');
INSERT INTO `ctshop_region` VALUES ('420528', '长阳土家族自治县', '420500', '长阳', '3', '0717', '443500', '中国,湖北省,宜昌市,长阳土家族自治县', '111.201', '30.4705', 'Changyang');
INSERT INTO `ctshop_region` VALUES ('420529', '五峰土家族自治县', '420500', '五峰', '3', '0717', '443413', '中国,湖北省,宜昌市,五峰土家族自治县', '110.675', '30.1986', 'Wufeng');
INSERT INTO `ctshop_region` VALUES ('420581', '宜都市', '420500', '宜都', '3', '0717', '443300', '中国,湖北省,宜昌市,宜都市', '111.45', '30.3781', 'Yidu');
INSERT INTO `ctshop_region` VALUES ('420582', '当阳市', '420500', '当阳', '3', '0717', '444100', '中国,湖北省,宜昌市,当阳市', '111.789', '30.8208', 'Dangyang');
INSERT INTO `ctshop_region` VALUES ('420583', '枝江市', '420500', '枝江', '3', '0717', '443200', '中国,湖北省,宜昌市,枝江市', '111.769', '30.4261', 'Zhijiang');
INSERT INTO `ctshop_region` VALUES ('420600', '襄阳市', '420000', '襄阳', '2', '0710', '441021', '中国,湖北省,襄阳市', '112.144', '32.0424', 'Xiangyang');
INSERT INTO `ctshop_region` VALUES ('420602', '襄城区', '420600', '襄城', '3', '0710', '441021', '中国,湖北省,襄阳市,襄城区', '112.134', '32.0102', 'Xiangcheng');
INSERT INTO `ctshop_region` VALUES ('420606', '樊城区', '420600', '樊城', '3', '0710', '441001', '中国,湖北省,襄阳市,樊城区', '112.135', '32.0448', 'Fancheng');
INSERT INTO `ctshop_region` VALUES ('420607', '襄州区', '420600', '襄州', '3', '0710', '441100', '中国,湖北省,襄阳市,襄州区', '112.15', '32.0151', 'Xiangzhou');
INSERT INTO `ctshop_region` VALUES ('420624', '南漳县', '420600', '南漳', '3', '0710', '441500', '中国,湖北省,襄阳市,南漳县', '111.846', '31.7765', 'Nanzhang');
INSERT INTO `ctshop_region` VALUES ('420625', '谷城县', '420600', '谷城', '3', '0710', '441700', '中国,湖北省,襄阳市,谷城县', '111.653', '32.2638', 'Gucheng');
INSERT INTO `ctshop_region` VALUES ('420626', '保康县', '420600', '保康', '3', '0710', '441600', '中国,湖北省,襄阳市,保康县', '111.261', '31.8787', 'Baokang');
INSERT INTO `ctshop_region` VALUES ('420682', '老河口市', '420600', '老河口', '3', '0710', '441800', '中国,湖北省,襄阳市,老河口市', '111.671', '32.3848', 'Laohekou');
INSERT INTO `ctshop_region` VALUES ('420683', '枣阳市', '420600', '枣阳', '3', '0710', '441200', '中国,湖北省,襄阳市,枣阳市', '112.774', '32.1314', 'Zaoyang');
INSERT INTO `ctshop_region` VALUES ('420684', '宜城市', '420600', '宜城', '3', '0710', '441400', '中国,湖北省,襄阳市,宜城市', '112.258', '31.7197', 'Yicheng');
INSERT INTO `ctshop_region` VALUES ('420700', '鄂州市', '420000', '鄂州', '2', '0711', '436000', '中国,湖北省,鄂州市', '114.891', '30.3965', 'Ezhou');
INSERT INTO `ctshop_region` VALUES ('420702', '梁子湖区', '420700', '梁子湖', '3', '0711', '436064', '中国,湖北省,鄂州市,梁子湖区', '114.685', '30.1', 'Liangzihu');
INSERT INTO `ctshop_region` VALUES ('420703', '华容区', '420700', '华容', '3', '0711', '436030', '中国,湖北省,鄂州市,华容区', '114.736', '30.5333', 'Huarong');
INSERT INTO `ctshop_region` VALUES ('420704', '鄂城区', '420700', '鄂城', '3', '0711', '436000', '中国,湖北省,鄂州市,鄂城区', '114.892', '30.4002', 'Echeng');
INSERT INTO `ctshop_region` VALUES ('420800', '荆门市', '420000', '荆门', '2', '0724', '448000', '中国,湖北省,荆门市', '112.204', '31.0354', 'Jingmen');
INSERT INTO `ctshop_region` VALUES ('420802', '东宝区', '420800', '东宝', '3', '0724', '448004', '中国,湖北省,荆门市,东宝区', '112.201', '31.0519', 'Dongbao');
INSERT INTO `ctshop_region` VALUES ('420804', '掇刀区', '420800', '掇刀', '3', '0724', '448124', '中国,湖北省,荆门市,掇刀区', '112.208', '30.9732', 'Duodao');
INSERT INTO `ctshop_region` VALUES ('420821', '京山县', '420800', '京山', '3', '0724', '431800', '中国,湖北省,荆门市,京山县', '113.111', '31.0224', 'Jingshan');
INSERT INTO `ctshop_region` VALUES ('420822', '沙洋县', '420800', '沙洋', '3', '0724', '448200', '中国,湖北省,荆门市,沙洋县', '112.589', '30.7092', 'Shayang');
INSERT INTO `ctshop_region` VALUES ('420881', '钟祥市', '420800', '钟祥', '3', '0724', '431900', '中国,湖北省,荆门市,钟祥市', '112.589', '31.1678', 'Zhongxiang');
INSERT INTO `ctshop_region` VALUES ('420900', '孝感市', '420000', '孝感', '2', '0712', '432100', '中国,湖北省,孝感市', '113.927', '30.9264', 'Xiaogan');
INSERT INTO `ctshop_region` VALUES ('420902', '孝南区', '420900', '孝南', '3', '0712', '432100', '中国,湖北省,孝感市,孝南区', '113.911', '30.9168', 'Xiaonan');
INSERT INTO `ctshop_region` VALUES ('420921', '孝昌县', '420900', '孝昌', '3', '0712', '432900', '中国,湖北省,孝感市,孝昌县', '113.998', '31.258', 'Xiaochang');
INSERT INTO `ctshop_region` VALUES ('420922', '大悟县', '420900', '大悟', '3', '0712', '432800', '中国,湖北省,孝感市,大悟县', '114.126', '31.5618', 'Dawu');
INSERT INTO `ctshop_region` VALUES ('420923', '云梦县', '420900', '云梦', '3', '0712', '432500', '中国,湖北省,孝感市,云梦县', '113.753', '31.0209', 'Yunmeng');
INSERT INTO `ctshop_region` VALUES ('420981', '应城市', '420900', '应城', '3', '0712', '432400', '中国,湖北省,孝感市,应城市', '113.573', '30.9283', 'Yingcheng');
INSERT INTO `ctshop_region` VALUES ('420982', '安陆市', '420900', '安陆', '3', '0712', '432600', '中国,湖北省,孝感市,安陆市', '113.686', '31.2569', 'Anlu');
INSERT INTO `ctshop_region` VALUES ('420984', '汉川市', '420900', '汉川', '3', '0712', '432300', '中国,湖北省,孝感市,汉川市', '113.839', '30.6612', 'Hanchuan');
INSERT INTO `ctshop_region` VALUES ('421000', '荆州市', '420000', '荆州', '2', '0716', '434000', '中国,湖北省,荆州市', '112.238', '30.3269', 'Jingzhou');
INSERT INTO `ctshop_region` VALUES ('421002', '沙市区', '421000', '沙市', '3', '0716', '434000', '中国,湖北省,荆州市,沙市区', '112.255', '30.3111', 'Shashi');
INSERT INTO `ctshop_region` VALUES ('421003', '荆州区', '421000', '荆州', '3', '0716', '434020', '中国,湖北省,荆州市,荆州区', '112.19', '30.3526', 'Jingzhou');
INSERT INTO `ctshop_region` VALUES ('421022', '公安县', '421000', '公安', '3', '0716', '434300', '中国,湖北省,荆州市,公安县', '112.232', '30.059', 'Gong\'an');
INSERT INTO `ctshop_region` VALUES ('421023', '监利县', '421000', '监利', '3', '0716', '433300', '中国,湖北省,荆州市,监利县', '112.895', '29.8149', 'Jianli');
INSERT INTO `ctshop_region` VALUES ('421024', '江陵县', '421000', '江陵', '3', '0716', '434101', '中国,湖北省,荆州市,江陵县', '112.425', '30.0417', 'Jiangling');
INSERT INTO `ctshop_region` VALUES ('421081', '石首市', '421000', '石首', '3', '0716', '434400', '中国,湖北省,荆州市,石首市', '112.426', '29.7213', 'Shishou');
INSERT INTO `ctshop_region` VALUES ('421083', '洪湖市', '421000', '洪湖', '3', '0716', '433200', '中国,湖北省,荆州市,洪湖市', '113.476', '29.827', 'Honghu');
INSERT INTO `ctshop_region` VALUES ('421087', '松滋市', '421000', '松滋', '3', '0716', '434200', '中国,湖北省,荆州市,松滋市', '111.767', '30.1696', 'Songzi');
INSERT INTO `ctshop_region` VALUES ('421100', '黄冈市', '420000', '黄冈', '2', '0713', '438000', '中国,湖北省,黄冈市', '114.879', '30.4477', 'Huanggang');
INSERT INTO `ctshop_region` VALUES ('421102', '黄州区', '421100', '黄州', '3', '0713', '438000', '中国,湖北省,黄冈市,黄州区', '114.88', '30.4344', 'Huangzhou');
INSERT INTO `ctshop_region` VALUES ('421121', '团风县', '421100', '团风', '3', '0713', '438800', '中国,湖北省,黄冈市,团风县', '114.872', '30.6436', 'Tuanfeng');
INSERT INTO `ctshop_region` VALUES ('421122', '红安县', '421100', '红安', '3', '0713', '438401', '中国,湖北省,黄冈市,红安县', '114.622', '31.2867', 'Hong\'an');
INSERT INTO `ctshop_region` VALUES ('421123', '罗田县', '421100', '罗田', '3', '0713', '438600', '中国,湖北省,黄冈市,罗田县', '115.4', '30.7826', 'Luotian');
INSERT INTO `ctshop_region` VALUES ('421124', '英山县', '421100', '英山', '3', '0713', '438700', '中国,湖北省,黄冈市,英山县', '115.681', '30.7352', 'Yingshan');
INSERT INTO `ctshop_region` VALUES ('421125', '浠水县', '421100', '浠水', '3', '0713', '438200', '中国,湖北省,黄冈市,浠水县', '115.269', '30.4527', 'Xishui');
INSERT INTO `ctshop_region` VALUES ('421126', '蕲春县', '421100', '蕲春', '3', '0713', '435300', '中国,湖北省,黄冈市,蕲春县', '115.436', '30.2261', 'Qichun');
INSERT INTO `ctshop_region` VALUES ('421127', '黄梅县', '421100', '黄梅', '3', '0713', '435500', '中国,湖北省,黄冈市,黄梅县', '115.944', '30.0703', 'Huangmei');
INSERT INTO `ctshop_region` VALUES ('421181', '麻城市', '421100', '麻城', '3', '0713', '438300', '中国,湖北省,黄冈市,麻城市', '115.01', '31.1723', 'Macheng');
INSERT INTO `ctshop_region` VALUES ('421182', '武穴市', '421100', '武穴', '3', '0713', '435400', '中国,湖北省,黄冈市,武穴市', '115.56', '29.8445', 'Wuxue');
INSERT INTO `ctshop_region` VALUES ('421200', '咸宁市', '420000', '咸宁', '2', '0715', '437000', '中国,湖北省,咸宁市', '114.329', '29.8328', 'Xianning');
INSERT INTO `ctshop_region` VALUES ('421202', '咸安区', '421200', '咸安', '3', '0715', '437000', '中国,湖北省,咸宁市,咸安区', '114.299', '29.8529', 'Xian\'an');
INSERT INTO `ctshop_region` VALUES ('421221', '嘉鱼县', '421200', '嘉鱼', '3', '0715', '437200', '中国,湖北省,咸宁市,嘉鱼县', '113.939', '29.9705', 'Jiayu');
INSERT INTO `ctshop_region` VALUES ('421222', '通城县', '421200', '通城', '3', '0715', '437400', '中国,湖北省,咸宁市,通城县', '113.816', '29.2457', 'Tongcheng');
INSERT INTO `ctshop_region` VALUES ('421223', '崇阳县', '421200', '崇阳', '3', '0715', '437500', '中国,湖北省,咸宁市,崇阳县', '114.04', '29.5556', 'Chongyang');
INSERT INTO `ctshop_region` VALUES ('421224', '通山县', '421200', '通山', '3', '0715', '437600', '中国,湖北省,咸宁市,通山县', '114.482', '29.6063', 'Tongshan');
INSERT INTO `ctshop_region` VALUES ('421281', '赤壁市', '421200', '赤壁', '3', '0715', '437300', '中国,湖北省,咸宁市,赤壁市', '113.9', '29.7245', 'Chibi');
INSERT INTO `ctshop_region` VALUES ('421300', '随州市', '420000', '随州', '2', '0722', '441300', '中国,湖北省,随州市', '113.374', '31.7175', 'Suizhou');
INSERT INTO `ctshop_region` VALUES ('421303', '曾都区', '421300', '曾都', '3', '0722', '441300', '中国,湖北省,随州市,曾都区', '113.371', '31.7161', 'Zengdu');
INSERT INTO `ctshop_region` VALUES ('421321', '随县', '421300', '随县', '3', '0722', '441309', '中国,湖北省,随州市,随县', '113.827', '31.6179', 'Suixian');
INSERT INTO `ctshop_region` VALUES ('421381', '广水市', '421300', '广水', '3', '0722', '432700', '中国,湖北省,随州市,广水市', '113.827', '31.6179', 'Guangshui');
INSERT INTO `ctshop_region` VALUES ('422800', '恩施土家族苗族自治州', '420000', '恩施', '2', '0718', '445000', '中国,湖北省,恩施土家族苗族自治州', '109.487', '30.2831', 'Enshi');
INSERT INTO `ctshop_region` VALUES ('422801', '恩施市', '422800', '恩施', '3', '0718', '445000', '中国,湖北省,恩施土家族苗族自治州,恩施市', '109.479', '30.295', 'Enshi');
INSERT INTO `ctshop_region` VALUES ('422802', '利川市', '422800', '利川', '3', '0718', '445400', '中国,湖北省,恩施土家族苗族自治州,利川市', '108.936', '30.2912', 'Lichuan');
INSERT INTO `ctshop_region` VALUES ('422822', '建始县', '422800', '建始', '3', '0718', '445300', '中国,湖北省,恩施土家族苗族自治州,建始县', '109.722', '30.6021', 'Jianshi');
INSERT INTO `ctshop_region` VALUES ('422823', '巴东县', '422800', '巴东', '3', '0718', '444300', '中国,湖北省,恩施土家族苗族自治州,巴东县', '110.341', '31.0423', 'Badong');
INSERT INTO `ctshop_region` VALUES ('422825', '宣恩县', '422800', '宣恩', '3', '0718', '445500', '中国,湖北省,恩施土家族苗族自治州,宣恩县', '109.492', '29.9871', 'Xuanen');
INSERT INTO `ctshop_region` VALUES ('422826', '咸丰县', '422800', '咸丰', '3', '0718', '445600', '中国,湖北省,恩施土家族苗族自治州,咸丰县', '109.152', '29.6798', 'Xianfeng');
INSERT INTO `ctshop_region` VALUES ('422827', '来凤县', '422800', '来凤', '3', '0718', '445700', '中国,湖北省,恩施土家族苗族自治州,来凤县', '109.407', '29.4937', 'Laifeng');
INSERT INTO `ctshop_region` VALUES ('422828', '鹤峰县', '422800', '鹤峰', '3', '0718', '445800', '中国,湖北省,恩施土家族苗族自治州,鹤峰县', '110.031', '29.8907', 'Hefeng');
INSERT INTO `ctshop_region` VALUES ('429000', '直辖县级', '420000', ' ', '2', '', '', '中国,湖北省,直辖县级', '114.299', '30.5844', '');
INSERT INTO `ctshop_region` VALUES ('429004', '仙桃市', '429000', '仙桃', '3', '0728', '433000', '中国,湖北省,直辖县级,仙桃市', '113.454', '30.365', 'Xiantao');
INSERT INTO `ctshop_region` VALUES ('429005', '潜江市', '429000', '潜江', '3', '0728', '433100', '中国,湖北省,直辖县级,潜江市', '112.897', '30.4212', 'Qianjiang');
INSERT INTO `ctshop_region` VALUES ('429006', '天门市', '429000', '天门', '3', '0728', '431700', '中国,湖北省,直辖县级,天门市', '113.166', '30.6531', 'Tianmen');
INSERT INTO `ctshop_region` VALUES ('429021', '神农架林区', '429000', '神农架', '3', '0719', '442400', '中国,湖北省,直辖县级,神农架林区', '110.672', '31.7444', 'Shennongjia');
INSERT INTO `ctshop_region` VALUES ('430000', '湖南省', '100000', '湖南', '1', '', '', '中国,湖南省', '112.982', '28.1941', 'Hunan');
INSERT INTO `ctshop_region` VALUES ('430100', '长沙市', '430000', '长沙', '2', '0731', '410005', '中国,湖南省,长沙市', '112.982', '28.1941', 'Changsha');
INSERT INTO `ctshop_region` VALUES ('430102', '芙蓉区', '430100', '芙蓉', '3', '0731', '410011', '中国,湖南省,长沙市,芙蓉区', '113.032', '28.1844', 'Furong');
INSERT INTO `ctshop_region` VALUES ('430103', '天心区', '430100', '天心', '3', '0731', '410004', '中国,湖南省,长沙市,天心区', '112.99', '28.1127', 'Tianxin');
INSERT INTO `ctshop_region` VALUES ('430104', '岳麓区', '430100', '岳麓', '3', '0731', '410013', '中国,湖南省,长沙市,岳麓区', '112.931', '28.2351', 'Yuelu');
INSERT INTO `ctshop_region` VALUES ('430105', '开福区', '430100', '开福', '3', '0731', '410008', '中国,湖南省,长沙市,开福区', '112.986', '28.2558', 'Kaifu');
INSERT INTO `ctshop_region` VALUES ('430111', '雨花区', '430100', '雨花', '3', '0731', '410011', '中国,湖南省,长沙市,雨花区', '113.036', '28.1354', 'Yuhua');
INSERT INTO `ctshop_region` VALUES ('430112', '望城区', '430100', '望城', '3', '0731', '410200', '中国,湖南省,长沙市,望城区', '112.82', '28.3475', 'Wangcheng');
INSERT INTO `ctshop_region` VALUES ('430121', '长沙县', '430100', '长沙', '3', '0731', '410100', '中国,湖南省,长沙市,长沙县', '113.081', '28.246', 'Changsha');
INSERT INTO `ctshop_region` VALUES ('430124', '宁乡县', '430100', '宁乡', '3', '0731', '410600', '中国,湖南省,长沙市,宁乡县', '112.557', '28.2536', 'Ningxiang');
INSERT INTO `ctshop_region` VALUES ('430181', '浏阳市', '430100', '浏阳', '3', '0731', '410300', '中国,湖南省,长沙市,浏阳市', '113.643', '28.1637', 'Liuyang');
INSERT INTO `ctshop_region` VALUES ('430200', '株洲市', '430000', '株洲', '2', '0731', '412000', '中国,湖南省,株洲市', '113.152', '27.8358', 'Zhuzhou');
INSERT INTO `ctshop_region` VALUES ('430202', '荷塘区', '430200', '荷塘', '3', '0731', '412000', '中国,湖南省,株洲市,荷塘区', '113.173', '27.8557', 'Hetang');
INSERT INTO `ctshop_region` VALUES ('430203', '芦淞区', '430200', '芦淞', '3', '0731', '412000', '中国,湖南省,株洲市,芦淞区', '113.156', '27.7852', 'Lusong');
INSERT INTO `ctshop_region` VALUES ('430204', '石峰区', '430200', '石峰', '3', '0731', '412005', '中国,湖南省,株洲市,石峰区', '113.118', '27.8755', 'Shifeng');
INSERT INTO `ctshop_region` VALUES ('430211', '天元区', '430200', '天元', '3', '0731', '412007', '中国,湖南省,株洲市,天元区', '113.123', '27.831', 'Tianyuan');
INSERT INTO `ctshop_region` VALUES ('430221', '株洲县', '430200', '株洲', '3', '0731', '412100', '中国,湖南省,株洲市,株洲县', '113.144', '27.6983', 'Zhuzhou');
INSERT INTO `ctshop_region` VALUES ('430223', '攸县', '430200', '攸县', '3', '0731', '412300', '中国,湖南省,株洲市,攸县', '113.344', '27.0035', 'Youxian');
INSERT INTO `ctshop_region` VALUES ('430224', '茶陵县', '430200', '茶陵', '3', '0731', '412400', '中国,湖南省,株洲市,茶陵县', '113.544', '26.7915', 'Chaling');
INSERT INTO `ctshop_region` VALUES ('430225', '炎陵县', '430200', '炎陵', '3', '0731', '412500', '中国,湖南省,株洲市,炎陵县', '113.772', '26.4882', 'Yanling');
INSERT INTO `ctshop_region` VALUES ('430281', '醴陵市', '430200', '醴陵', '3', '0731', '412200', '中国,湖南省,株洲市,醴陵市', '113.497', '27.6462', 'Liling');
INSERT INTO `ctshop_region` VALUES ('430300', '湘潭市', '430000', '湘潭', '2', '0731', '411100', '中国,湖南省,湘潭市', '112.925', '27.8467', 'Xiangtan');
INSERT INTO `ctshop_region` VALUES ('430302', '雨湖区', '430300', '雨湖', '3', '0731', '411100', '中国,湖南省,湘潭市,雨湖区', '112.904', '27.8686', 'Yuhu');
INSERT INTO `ctshop_region` VALUES ('430304', '岳塘区', '430300', '岳塘', '3', '0731', '411101', '中国,湖南省,湘潭市,岳塘区', '112.961', '27.8578', 'Yuetang');
INSERT INTO `ctshop_region` VALUES ('430321', '湘潭县', '430300', '湘潭', '3', '0731', '411228', '中国,湖南省,湘潭市,湘潭县', '112.951', '27.7789', 'Xiangtan');
INSERT INTO `ctshop_region` VALUES ('430381', '湘乡市', '430300', '湘乡', '3', '0731', '411400', '中国,湖南省,湘潭市,湘乡市', '112.535', '27.7354', 'Xiangxiang');
INSERT INTO `ctshop_region` VALUES ('430382', '韶山市', '430300', '韶山', '3', '0731', '411300', '中国,湖南省,湘潭市,韶山市', '112.527', '27.915', 'Shaoshan');
INSERT INTO `ctshop_region` VALUES ('430400', '衡阳市', '430000', '衡阳', '2', '0734', '421001', '中国,湖南省,衡阳市', '112.608', '26.9004', 'Hengyang');
INSERT INTO `ctshop_region` VALUES ('430405', '珠晖区', '430400', '珠晖', '3', '0734', '421002', '中国,湖南省,衡阳市,珠晖区', '112.621', '26.8936', 'Zhuhui');
INSERT INTO `ctshop_region` VALUES ('430406', '雁峰区', '430400', '雁峰', '3', '0734', '421001', '中国,湖南省,衡阳市,雁峰区', '112.617', '26.8887', 'Yanfeng');
INSERT INTO `ctshop_region` VALUES ('430407', '石鼓区', '430400', '石鼓', '3', '0734', '421005', '中国,湖南省,衡阳市,石鼓区', '112.611', '26.9023', 'Shigu');
INSERT INTO `ctshop_region` VALUES ('430408', '蒸湘区', '430400', '蒸湘', '3', '0734', '421001', '中国,湖南省,衡阳市,蒸湘区', '112.603', '26.8965', 'Zhengxiang');
INSERT INTO `ctshop_region` VALUES ('430412', '南岳区', '430400', '南岳', '3', '0734', '421900', '中国,湖南省,衡阳市,南岳区', '112.738', '27.2326', 'Nanyue');
INSERT INTO `ctshop_region` VALUES ('430421', '衡阳县', '430400', '衡阳', '3', '0734', '421200', '中国,湖南省,衡阳市,衡阳县', '112.371', '26.9706', 'Hengyang');
INSERT INTO `ctshop_region` VALUES ('430422', '衡南县', '430400', '衡南', '3', '0734', '421131', '中国,湖南省,衡阳市,衡南县', '112.678', '26.7383', 'Hengnan');
INSERT INTO `ctshop_region` VALUES ('430423', '衡山县', '430400', '衡山', '3', '0734', '421300', '中国,湖南省,衡阳市,衡山县', '112.868', '27.2313', 'Hengshan');
INSERT INTO `ctshop_region` VALUES ('430424', '衡东县', '430400', '衡东', '3', '0734', '421400', '中国,湖南省,衡阳市,衡东县', '112.948', '27.0809', 'Hengdong');
INSERT INTO `ctshop_region` VALUES ('430426', '祁东县', '430400', '祁东', '3', '0734', '421600', '中国,湖南省,衡阳市,祁东县', '112.09', '26.7996', 'Qidong');
INSERT INTO `ctshop_region` VALUES ('430481', '耒阳市', '430400', '耒阳', '3', '0734', '421800', '中国,湖南省,衡阳市,耒阳市', '112.86', '26.4213', 'Leiyang');
INSERT INTO `ctshop_region` VALUES ('430482', '常宁市', '430400', '常宁', '3', '0734', '421500', '中国,湖南省,衡阳市,常宁市', '112.401', '26.4069', 'Changning');
INSERT INTO `ctshop_region` VALUES ('430500', '邵阳市', '430000', '邵阳', '2', '0739', '422000', '中国,湖南省,邵阳市', '111.469', '27.2378', 'Shaoyang');
INSERT INTO `ctshop_region` VALUES ('430502', '双清区', '430500', '双清', '3', '0739', '422001', '中国,湖南省,邵阳市,双清区', '111.497', '27.2329', 'Shuangqing');
INSERT INTO `ctshop_region` VALUES ('430503', '大祥区', '430500', '大祥', '3', '0739', '422000', '中国,湖南省,邵阳市,大祥区', '111.454', '27.2333', 'Daxiang');
INSERT INTO `ctshop_region` VALUES ('430511', '北塔区', '430500', '北塔', '3', '0739', '422007', '中国,湖南省,邵阳市,北塔区', '111.452', '27.2465', 'Beita');
INSERT INTO `ctshop_region` VALUES ('430521', '邵东县', '430500', '邵东', '3', '0739', '422800', '中国,湖南省,邵阳市,邵东县', '111.744', '27.2584', 'Shaodong');
INSERT INTO `ctshop_region` VALUES ('430522', '新邵县', '430500', '新邵', '3', '0739', '422900', '中国,湖南省,邵阳市,新邵县', '111.461', '27.3217', 'Xinshao');
INSERT INTO `ctshop_region` VALUES ('430523', '邵阳县', '430500', '邵阳', '3', '0739', '422100', '中国,湖南省,邵阳市,邵阳县', '111.275', '26.9914', 'Shaoyang');
INSERT INTO `ctshop_region` VALUES ('430524', '隆回县', '430500', '隆回', '3', '0739', '422200', '中国,湖南省,邵阳市,隆回县', '111.032', '27.1094', 'Longhui');
INSERT INTO `ctshop_region` VALUES ('430525', '洞口县', '430500', '洞口', '3', '0739', '422300', '中国,湖南省,邵阳市,洞口县', '110.574', '27.0546', 'Dongkou');
INSERT INTO `ctshop_region` VALUES ('430527', '绥宁县', '430500', '绥宁', '3', '0739', '422600', '中国,湖南省,邵阳市,绥宁县', '110.156', '26.5864', 'Suining');
INSERT INTO `ctshop_region` VALUES ('430528', '新宁县', '430500', '新宁', '3', '0739', '422700', '中国,湖南省,邵阳市,新宁县', '110.851', '26.4294', 'Xinning');
INSERT INTO `ctshop_region` VALUES ('430529', '城步苗族自治县', '430500', '城步', '3', '0739', '422500', '中国,湖南省,邵阳市,城步苗族自治县', '110.322', '26.3905', 'Chengbu');
INSERT INTO `ctshop_region` VALUES ('430581', '武冈市', '430500', '武冈', '3', '0739', '422400', '中国,湖南省,邵阳市,武冈市', '110.633', '26.7282', 'Wugang');
INSERT INTO `ctshop_region` VALUES ('430600', '岳阳市', '430000', '岳阳', '2', '0730', '414000', '中国,湖南省,岳阳市', '113.133', '29.3703', 'Yueyang');
INSERT INTO `ctshop_region` VALUES ('430602', '岳阳楼区', '430600', '岳阳楼', '3', '0730', '414000', '中国,湖南省,岳阳市,岳阳楼区', '113.129', '29.3719', 'Yueyanglou');
INSERT INTO `ctshop_region` VALUES ('430603', '云溪区', '430600', '云溪', '3', '0730', '414009', '中国,湖南省,岳阳市,云溪区', '113.277', '29.4736', 'Yunxi');
INSERT INTO `ctshop_region` VALUES ('430611', '君山区', '430600', '君山', '3', '0730', '414005', '中国,湖南省,岳阳市,君山区', '113.004', '29.4594', 'Junshan');
INSERT INTO `ctshop_region` VALUES ('430621', '岳阳县', '430600', '岳阳', '3', '0730', '414100', '中国,湖南省,岳阳市,岳阳县', '113.12', '29.1431', 'Yueyang');
INSERT INTO `ctshop_region` VALUES ('430623', '华容县', '430600', '华容', '3', '0730', '414200', '中国,湖南省,岳阳市,华容县', '112.541', '29.5302', 'Huarong');
INSERT INTO `ctshop_region` VALUES ('430624', '湘阴县', '430600', '湘阴', '3', '0730', '414600', '中国,湖南省,岳阳市,湘阴县', '112.909', '28.6892', 'Xiangyin');
INSERT INTO `ctshop_region` VALUES ('430626', '平江县', '430600', '平江', '3', '0730', '414500', '中国,湖南省,岳阳市,平江县', '113.581', '28.7066', 'Pingjiang');
INSERT INTO `ctshop_region` VALUES ('430681', '汨罗市', '430600', '汨罗', '3', '0730', '414400', '中国,湖南省,岳阳市,汨罗市', '113.067', '28.8063', 'Miluo');
INSERT INTO `ctshop_region` VALUES ('430682', '临湘市', '430600', '临湘', '3', '0730', '414300', '中国,湖南省,岳阳市,临湘市', '113.45', '29.477', 'Linxiang');
INSERT INTO `ctshop_region` VALUES ('430700', '常德市', '430000', '常德', '2', '0736', '415000', '中国,湖南省,常德市', '111.691', '29.0402', 'Changde');
INSERT INTO `ctshop_region` VALUES ('430702', '武陵区', '430700', '武陵', '3', '0736', '415000', '中国,湖南省,常德市,武陵区', '111.698', '29.0288', 'Wuling');
INSERT INTO `ctshop_region` VALUES ('430703', '鼎城区', '430700', '鼎城', '3', '0736', '415101', '中国,湖南省,常德市,鼎城区', '111.681', '29.0186', 'Dingcheng');
INSERT INTO `ctshop_region` VALUES ('430721', '安乡县', '430700', '安乡', '3', '0736', '415600', '中国,湖南省,常德市,安乡县', '112.167', '29.4133', 'Anxiang');
INSERT INTO `ctshop_region` VALUES ('430722', '汉寿县', '430700', '汉寿', '3', '0736', '415900', '中国,湖南省,常德市,汉寿县', '111.967', '28.903', 'Hanshou');
INSERT INTO `ctshop_region` VALUES ('430723', '澧县', '430700', '澧县', '3', '0736', '415500', '中国,湖南省,常德市,澧县', '111.759', '29.6332', 'Lixian');
INSERT INTO `ctshop_region` VALUES ('430724', '临澧县', '430700', '临澧', '3', '0736', '415200', '中国,湖南省,常德市,临澧县', '111.652', '29.4416', 'Linli');
INSERT INTO `ctshop_region` VALUES ('430725', '桃源县', '430700', '桃源', '3', '0736', '415700', '中国,湖南省,常德市,桃源县', '111.489', '28.9047', 'Taoyuan');
INSERT INTO `ctshop_region` VALUES ('430726', '石门县', '430700', '石门', '3', '0736', '415300', '中国,湖南省,常德市,石门县', '111.38', '29.5842', 'Shimen');
INSERT INTO `ctshop_region` VALUES ('430781', '津市市', '430700', '津市', '3', '0736', '415400', '中国,湖南省,常德市,津市市', '111.878', '29.6056', 'Jinshi');
INSERT INTO `ctshop_region` VALUES ('430800', '张家界市', '430000', '张家界', '2', '0744', '427000', '中国,湖南省,张家界市', '110.48', '29.1274', 'Zhangjiajie');
INSERT INTO `ctshop_region` VALUES ('430802', '永定区', '430800', '永定', '3', '0744', '427000', '中国,湖南省,张家界市,永定区', '110.475', '29.1339', 'Yongding');
INSERT INTO `ctshop_region` VALUES ('430811', '武陵源区', '430800', '武陵源', '3', '0744', '427400', '中国,湖南省,张家界市,武陵源区', '110.55', '29.3457', 'Wulingyuan');
INSERT INTO `ctshop_region` VALUES ('430821', '慈利县', '430800', '慈利', '3', '0744', '427200', '中国,湖南省,张家界市,慈利县', '111.139', '29.4299', 'Cili');
INSERT INTO `ctshop_region` VALUES ('430822', '桑植县', '430800', '桑植', '3', '0744', '427100', '中国,湖南省,张家界市,桑植县', '110.163', '29.3981', 'Sangzhi');
INSERT INTO `ctshop_region` VALUES ('430900', '益阳市', '430000', '益阳', '2', '0737', '413000', '中国,湖南省,益阳市', '112.355', '28.5701', 'Yiyang');
INSERT INTO `ctshop_region` VALUES ('430902', '资阳区', '430900', '资阳', '3', '0737', '413001', '中国,湖南省,益阳市,资阳区', '112.324', '28.591', 'Ziyang');
INSERT INTO `ctshop_region` VALUES ('430903', '赫山区', '430900', '赫山', '3', '0737', '413002', '中国,湖南省,益阳市,赫山区', '112.373', '28.5742', 'Heshan');
INSERT INTO `ctshop_region` VALUES ('430921', '南县', '430900', '南县', '3', '0737', '413200', '中国,湖南省,益阳市,南县', '112.396', '29.3616', 'Nanxian');
INSERT INTO `ctshop_region` VALUES ('430922', '桃江县', '430900', '桃江', '3', '0737', '413400', '中国,湖南省,益阳市,桃江县', '112.156', '28.5181', 'Taojiang');
INSERT INTO `ctshop_region` VALUES ('430923', '安化县', '430900', '安化', '3', '0737', '413500', '中国,湖南省,益阳市,安化县', '111.213', '28.3742', 'Anhua');
INSERT INTO `ctshop_region` VALUES ('430981', '沅江市', '430900', '沅江', '3', '0737', '413100', '中国,湖南省,益阳市,沅江市', '112.354', '28.844', 'Yuanjiang');
INSERT INTO `ctshop_region` VALUES ('431000', '郴州市', '430000', '郴州', '2', '0735', '423000', '中国,湖南省,郴州市', '113.032', '25.7936', 'Chenzhou');
INSERT INTO `ctshop_region` VALUES ('431002', '北湖区', '431000', '北湖', '3', '0735', '423000', '中国,湖南省,郴州市,北湖区', '113.011', '25.784', 'Beihu');
INSERT INTO `ctshop_region` VALUES ('431003', '苏仙区', '431000', '苏仙', '3', '0735', '423000', '中国,湖南省,郴州市,苏仙区', '113.042', '25.8004', 'Suxian');
INSERT INTO `ctshop_region` VALUES ('431021', '桂阳县', '431000', '桂阳', '3', '0735', '424400', '中国,湖南省,郴州市,桂阳县', '112.734', '25.7541', 'Guiyang');
INSERT INTO `ctshop_region` VALUES ('431022', '宜章县', '431000', '宜章', '3', '0735', '424200', '中国,湖南省,郴州市,宜章县', '112.951', '25.3993', 'Yizhang');
INSERT INTO `ctshop_region` VALUES ('431023', '永兴县', '431000', '永兴', '3', '0735', '423300', '中国,湖南省,郴州市,永兴县', '113.112', '26.1265', 'Yongxing');
INSERT INTO `ctshop_region` VALUES ('431024', '嘉禾县', '431000', '嘉禾', '3', '0735', '424500', '中国,湖南省,郴州市,嘉禾县', '112.369', '25.5879', 'Jiahe');
INSERT INTO `ctshop_region` VALUES ('431025', '临武县', '431000', '临武', '3', '0735', '424300', '中国,湖南省,郴州市,临武县', '112.564', '25.276', 'Linwu');
INSERT INTO `ctshop_region` VALUES ('431026', '汝城县', '431000', '汝城', '3', '0735', '424100', '中国,湖南省,郴州市,汝城县', '113.686', '25.552', 'Rucheng');
INSERT INTO `ctshop_region` VALUES ('431027', '桂东县', '431000', '桂东', '3', '0735', '423500', '中国,湖南省,郴州市,桂东县', '113.947', '26.0799', 'Guidong');
INSERT INTO `ctshop_region` VALUES ('431028', '安仁县', '431000', '安仁', '3', '0735', '423600', '中国,湖南省,郴州市,安仁县', '113.269', '26.7093', 'Anren');
INSERT INTO `ctshop_region` VALUES ('431081', '资兴市', '431000', '资兴', '3', '0735', '423400', '中国,湖南省,郴州市,资兴市', '113.237', '25.9767', 'Zixing');
INSERT INTO `ctshop_region` VALUES ('431100', '永州市', '430000', '永州', '2', '0746', '425000', '中国,湖南省,永州市', '111.608', '26.4345', 'Yongzhou');
INSERT INTO `ctshop_region` VALUES ('431102', '零陵区', '431100', '零陵', '3', '0746', '425100', '中国,湖南省,永州市,零陵区', '111.621', '26.2211', 'Lingling');
INSERT INTO `ctshop_region` VALUES ('431103', '冷水滩区', '431100', '冷水滩', '3', '0746', '425100', '中国,湖南省,永州市,冷水滩区', '111.592', '26.4611', 'Lengshuitan');
INSERT INTO `ctshop_region` VALUES ('431121', '祁阳县', '431100', '祁阳', '3', '0746', '426100', '中国,湖南省,永州市,祁阳县', '111.84', '26.5801', 'Qiyang');
INSERT INTO `ctshop_region` VALUES ('431122', '东安县', '431100', '东安', '3', '0746', '425900', '中国,湖南省,永州市,东安县', '111.316', '26.392', 'Dong\'an');
INSERT INTO `ctshop_region` VALUES ('431123', '双牌县', '431100', '双牌', '3', '0746', '425200', '中国,湖南省,永州市,双牌县', '111.659', '25.9599', 'Shuangpai');
INSERT INTO `ctshop_region` VALUES ('431124', '道县', '431100', '道县', '3', '0746', '425300', '中国,湖南省,永州市,道县', '111.602', '25.5277', 'Daoxian');
INSERT INTO `ctshop_region` VALUES ('431125', '江永县', '431100', '江永', '3', '0746', '425400', '中国,湖南省,永州市,江永县', '111.341', '25.2723', 'Jiangyong');
INSERT INTO `ctshop_region` VALUES ('431126', '宁远县', '431100', '宁远', '3', '0746', '425600', '中国,湖南省,永州市,宁远县', '111.946', '25.5691', 'Ningyuan');
INSERT INTO `ctshop_region` VALUES ('431127', '蓝山县', '431100', '蓝山', '3', '0746', '425800', '中国,湖南省,永州市,蓝山县', '112.194', '25.3679', 'Lanshan');
INSERT INTO `ctshop_region` VALUES ('431128', '新田县', '431100', '新田', '3', '0746', '425700', '中国,湖南省,永州市,新田县', '112.221', '25.9095', 'Xintian');
INSERT INTO `ctshop_region` VALUES ('431129', '江华瑶族自治县', '431100', '江华', '3', '0746', '425500', '中国,湖南省,永州市,江华瑶族自治县', '111.588', '25.1845', 'Jianghua');
INSERT INTO `ctshop_region` VALUES ('431200', '怀化市', '430000', '怀化', '2', '0745', '418000', '中国,湖南省,怀化市', '109.978', '27.5501', 'Huaihua');
INSERT INTO `ctshop_region` VALUES ('431202', '鹤城区', '431200', '鹤城', '3', '0745', '418000', '中国,湖南省,怀化市,鹤城区', '109.965', '27.5494', 'Hecheng');
INSERT INTO `ctshop_region` VALUES ('431221', '中方县', '431200', '中方', '3', '0745', '418005', '中国,湖南省,怀化市,中方县', '109.945', '27.4399', 'Zhongfang');
INSERT INTO `ctshop_region` VALUES ('431222', '沅陵县', '431200', '沅陵', '3', '0745', '419600', '中国,湖南省,怀化市,沅陵县', '110.396', '28.4555', 'Yuanling');
INSERT INTO `ctshop_region` VALUES ('431223', '辰溪县', '431200', '辰溪', '3', '0745', '419500', '中国,湖南省,怀化市,辰溪县', '110.189', '28.0041', 'Chenxi');
INSERT INTO `ctshop_region` VALUES ('431224', '溆浦县', '431200', '溆浦', '3', '0745', '419300', '中国,湖南省,怀化市,溆浦县', '110.594', '27.9084', 'Xupu');
INSERT INTO `ctshop_region` VALUES ('431225', '会同县', '431200', '会同', '3', '0745', '418300', '中国,湖南省,怀化市,会同县', '109.736', '26.8872', 'Huitong');
INSERT INTO `ctshop_region` VALUES ('431226', '麻阳苗族自治县', '431200', '麻阳', '3', '0745', '419400', '中国,湖南省,怀化市,麻阳苗族自治县', '109.802', '27.866', 'Mayang');
INSERT INTO `ctshop_region` VALUES ('431227', '新晃侗族自治县', '431200', '新晃', '3', '0745', '419200', '中国,湖南省,怀化市,新晃侗族自治县', '109.172', '27.3594', 'Xinhuang');
INSERT INTO `ctshop_region` VALUES ('431228', '芷江侗族自治县', '431200', '芷江', '3', '0745', '419100', '中国,湖南省,怀化市,芷江侗族自治县', '109.685', '27.443', 'Zhijiang');
INSERT INTO `ctshop_region` VALUES ('431229', '靖州苗族侗族自治县', '431200', '靖州', '3', '0745', '418400', '中国,湖南省,怀化市,靖州苗族侗族自治县', '109.698', '26.5765', 'Jingzhou');
INSERT INTO `ctshop_region` VALUES ('431230', '通道侗族自治县', '431200', '通道', '3', '0745', '418500', '中国,湖南省,怀化市,通道侗族自治县', '109.785', '26.1571', 'Tongdao');
INSERT INTO `ctshop_region` VALUES ('431281', '洪江市', '431200', '洪江', '3', '0745', '418100', '中国,湖南省,怀化市,洪江市', '109.837', '27.2092', 'Hongjiang');
INSERT INTO `ctshop_region` VALUES ('431300', '娄底市', '430000', '娄底', '2', '0738', '417000', '中国,湖南省,娄底市', '112.008', '27.7281', 'Loudi');
INSERT INTO `ctshop_region` VALUES ('431302', '娄星区', '431300', '娄星', '3', '0738', '417000', '中国,湖南省,娄底市,娄星区', '112.002', '27.7299', 'Louxing');
INSERT INTO `ctshop_region` VALUES ('431321', '双峰县', '431300', '双峰', '3', '0738', '417700', '中国,湖南省,娄底市,双峰县', '112.199', '27.4542', 'Shuangfeng');
INSERT INTO `ctshop_region` VALUES ('431322', '新化县', '431300', '新化', '3', '0738', '417600', '中国,湖南省,娄底市,新化县', '111.327', '27.7266', 'Xinhua');
INSERT INTO `ctshop_region` VALUES ('431381', '冷水江市', '431300', '冷水江', '3', '0738', '417500', '中国,湖南省,娄底市,冷水江市', '111.436', '27.6815', 'Lengshuijiang');
INSERT INTO `ctshop_region` VALUES ('431382', '涟源市', '431300', '涟源', '3', '0738', '417100', '中国,湖南省,娄底市,涟源市', '111.672', '27.6883', 'Lianyuan');
INSERT INTO `ctshop_region` VALUES ('433100', '湘西土家族苗族自治州', '430000', '湘西', '2', '0743', '416000', '中国,湖南省,湘西土家族苗族自治州', '109.74', '28.3143', 'Xiangxi');
INSERT INTO `ctshop_region` VALUES ('433101', '吉首市', '433100', '吉首', '3', '0743', '416000', '中国,湖南省,湘西土家族苗族自治州,吉首市', '109.698', '28.2625', 'Jishou');
INSERT INTO `ctshop_region` VALUES ('433122', '泸溪县', '433100', '泸溪', '3', '0743', '416100', '中国,湖南省,湘西土家族苗族自治州,泸溪县', '110.217', '28.2205', 'Luxi');
INSERT INTO `ctshop_region` VALUES ('433123', '凤凰县', '433100', '凤凰', '3', '0743', '416200', '中国,湖南省,湘西土家族苗族自治州,凤凰县', '109.602', '27.9482', 'Fenghuang');
INSERT INTO `ctshop_region` VALUES ('433124', '花垣县', '433100', '花垣', '3', '0743', '416400', '中国,湖南省,湘西土家族苗族自治州,花垣县', '109.482', '28.5721', 'Huayuan');
INSERT INTO `ctshop_region` VALUES ('433125', '保靖县', '433100', '保靖', '3', '0743', '416500', '中国,湖南省,湘西土家族苗族自治州,保靖县', '109.66', '28.7', 'Baojing');
INSERT INTO `ctshop_region` VALUES ('433126', '古丈县', '433100', '古丈', '3', '0743', '416300', '中国,湖南省,湘西土家族苗族自治州,古丈县', '109.948', '28.6194', 'Guzhang');
INSERT INTO `ctshop_region` VALUES ('433127', '永顺县', '433100', '永顺', '3', '0743', '416700', '中国,湖南省,湘西土家族苗族自治州,永顺县', '109.853', '29.001', 'Yongshun');
INSERT INTO `ctshop_region` VALUES ('433130', '龙山县', '433100', '龙山', '3', '0743', '416800', '中国,湖南省,湘西土家族苗族自治州,龙山县', '109.443', '29.4569', 'Longshan');
INSERT INTO `ctshop_region` VALUES ('440000', '广东省', '100000', '广东', '1', '', '', '中国,广东省', '113.281', '23.1252', 'Guangdong');
INSERT INTO `ctshop_region` VALUES ('440100', '广州市', '440000', '广州', '2', '020', '510032', '中国,广东省,广州市', '113.281', '23.1252', 'Guangzhou');
INSERT INTO `ctshop_region` VALUES ('440103', '荔湾区', '440100', '荔湾', '3', '020', '510170', '中国,广东省,广州市,荔湾区', '113.244', '23.1259', 'Liwan');
INSERT INTO `ctshop_region` VALUES ('440104', '越秀区', '440100', '越秀', '3', '020', '510030', '中国,广东省,广州市,越秀区', '113.267', '23.129', 'Yuexiu');
INSERT INTO `ctshop_region` VALUES ('440105', '海珠区', '440100', '海珠', '3', '020', '510300', '中国,广东省,广州市,海珠区', '113.262', '23.1038', 'Haizhu');
INSERT INTO `ctshop_region` VALUES ('440106', '天河区', '440100', '天河', '3', '020', '510665', '中国,广东省,广州市,天河区', '113.361', '23.1247', 'Tianhe');
INSERT INTO `ctshop_region` VALUES ('440111', '白云区', '440100', '白云', '3', '020', '510405', '中国,广东省,广州市,白云区', '113.273', '23.1579', 'Baiyun');
INSERT INTO `ctshop_region` VALUES ('440112', '黄埔区', '440100', '黄埔', '3', '020', '510700', '中国,广东省,广州市,黄埔区', '113.459', '23.1064', 'Huangpu');
INSERT INTO `ctshop_region` VALUES ('440113', '番禺区', '440100', '番禺', '3', '020', '511400', '中国,广东省,广州市,番禺区', '113.384', '22.936', 'Panyu');
INSERT INTO `ctshop_region` VALUES ('440114', '花都区', '440100', '花都', '3', '020', '510800', '中国,广东省,广州市,花都区', '113.22', '23.4036', 'Huadu');
INSERT INTO `ctshop_region` VALUES ('440115', '南沙区', '440100', '南沙', '3', '020', '511458', '中国,广东省,广州市,南沙区', '113.608', '22.7714', 'Nansha');
INSERT INTO `ctshop_region` VALUES ('440117', '从化区', '440100', '从化', '3', '020', '510900', '中国,广东省,广州市,从化区', '113.587', '23.5453', 'Conghua');
INSERT INTO `ctshop_region` VALUES ('440118', '增城区', '440100', '增城', '3', '020', '511300', '中国,广东省,广州市,增城区', '113.83', '23.2905', 'Zengcheng');
INSERT INTO `ctshop_region` VALUES ('440200', '韶关市', '440000', '韶关', '2', '0751', '512002', '中国,广东省,韶关市', '113.592', '24.8013', 'Shaoguan');
INSERT INTO `ctshop_region` VALUES ('440203', '武江区', '440200', '武江', '3', '0751', '512026', '中国,广东省,韶关市,武江区', '113.588', '24.7926', 'Wujiang');
INSERT INTO `ctshop_region` VALUES ('440204', '浈江区', '440200', '浈江', '3', '0751', '512023', '中国,广东省,韶关市,浈江区', '113.611', '24.8044', 'Zhenjiang');
INSERT INTO `ctshop_region` VALUES ('440205', '曲江区', '440200', '曲江', '3', '0751', '512101', '中国,广东省,韶关市,曲江区', '113.602', '24.6791', 'Qujiang');
INSERT INTO `ctshop_region` VALUES ('440222', '始兴县', '440200', '始兴', '3', '0751', '512500', '中国,广东省,韶关市,始兴县', '114.068', '24.9476', 'Shixing');
INSERT INTO `ctshop_region` VALUES ('440224', '仁化县', '440200', '仁化', '3', '0751', '512300', '中国,广东省,韶关市,仁化县', '113.747', '25.0874', 'Renhua');
INSERT INTO `ctshop_region` VALUES ('440229', '翁源县', '440200', '翁源', '3', '0751', '512600', '中国,广东省,韶关市,翁源县', '114.134', '24.3495', 'Wengyuan');
INSERT INTO `ctshop_region` VALUES ('440232', '乳源瑶族自治县', '440200', '乳源', '3', '0751', '512700', '中国,广东省,韶关市,乳源瑶族自治县', '113.277', '24.778', 'Ruyuan');
INSERT INTO `ctshop_region` VALUES ('440233', '新丰县', '440200', '新丰', '3', '0751', '511100', '中国,广东省,韶关市,新丰县', '114.208', '24.0592', 'Xinfeng');
INSERT INTO `ctshop_region` VALUES ('440281', '乐昌市', '440200', '乐昌', '3', '0751', '512200', '中国,广东省,韶关市,乐昌市', '113.357', '25.128', 'Lechang');
INSERT INTO `ctshop_region` VALUES ('440282', '南雄市', '440200', '南雄', '3', '0751', '512400', '中国,广东省,韶关市,南雄市', '114.31', '25.1171', 'Nanxiong');
INSERT INTO `ctshop_region` VALUES ('440300', '深圳市', '440000', '深圳', '2', '0755', '518035', '中国,广东省,深圳市', '114.086', '22.547', 'Shenzhen');
INSERT INTO `ctshop_region` VALUES ('440303', '罗湖区', '440300', '罗湖', '3', '0755', '518021', '中国,广东省,深圳市,罗湖区', '114.131', '22.5484', 'Luohu');
INSERT INTO `ctshop_region` VALUES ('440304', '福田区', '440300', '福田', '3', '0755', '518048', '中国,广东省,深圳市,福田区', '114.056', '22.5224', 'Futian');
INSERT INTO `ctshop_region` VALUES ('440305', '南山区', '440300', '南山', '3', '0755', '518051', '中国,广东省,深圳市,南山区', '113.93', '22.5329', 'Nanshan');
INSERT INTO `ctshop_region` VALUES ('440306', '宝安区', '440300', '宝安', '3', '0755', '518101', '中国,广东省,深圳市,宝安区', '113.883', '22.5537', 'Bao\'an');
INSERT INTO `ctshop_region` VALUES ('440307', '龙岗区', '440300', '龙岗', '3', '0755', '518172', '中国,广东省,深圳市,龙岗区', '114.248', '22.7199', 'Longgang');
INSERT INTO `ctshop_region` VALUES ('440308', '盐田区', '440300', '盐田', '3', '0755', '518081', '中国,广东省,深圳市,盐田区', '114.237', '22.5578', 'Yantian');
INSERT INTO `ctshop_region` VALUES ('440309', '光明新区', '440300', '光明新区', '3', '0755', '518100', '中国,广东省,深圳市,光明新区', '113.896', '22.7773', 'Guangmingxinqu');
INSERT INTO `ctshop_region` VALUES ('440310', '坪山新区', '440300', '坪山新区', '3', '0755', '518000', '中国,广东省,深圳市,坪山新区', '114.346', '22.6905', 'Pingshanxinqu');
INSERT INTO `ctshop_region` VALUES ('440311', '大鹏新区', '440300', '大鹏新区', '3', '0755', '518000', '中国,广东省,深圳市,大鹏新区', '114.48', '22.5879', 'Dapengxinqu');
INSERT INTO `ctshop_region` VALUES ('440312', '龙华新区', '440300', '龙华新区', '3', '0755', '518100', '中国,广东省,深圳市,龙华新区', '114.037', '22.687', 'Longhuaxinqu');
INSERT INTO `ctshop_region` VALUES ('440400', '珠海市', '440000', '珠海', '2', '0756', '519000', '中国,广东省,珠海市', '113.553', '22.2559', 'Zhuhai');
INSERT INTO `ctshop_region` VALUES ('440402', '香洲区', '440400', '香洲', '3', '0756', '519000', '中国,广东省,珠海市,香洲区', '113.544', '22.2665', 'Xiangzhou');
INSERT INTO `ctshop_region` VALUES ('440403', '斗门区', '440400', '斗门', '3', '0756', '519110', '中国,广东省,珠海市,斗门区', '113.296', '22.209', 'Doumen');
INSERT INTO `ctshop_region` VALUES ('440404', '金湾区', '440400', '金湾', '3', '0756', '519040', '中国,广东省,珠海市,金湾区', '113.364', '22.1469', 'Jinwan');
INSERT INTO `ctshop_region` VALUES ('440500', '汕头市', '440000', '汕头', '2', '0754', '515041', '中国,广东省,汕头市', '116.708', '23.371', 'Shantou');
INSERT INTO `ctshop_region` VALUES ('440507', '龙湖区', '440500', '龙湖', '3', '0754', '515041', '中国,广东省,汕头市,龙湖区', '116.716', '23.3717', 'Longhu');
INSERT INTO `ctshop_region` VALUES ('440511', '金平区', '440500', '金平', '3', '0754', '515041', '中国,广东省,汕头市,金平区', '116.704', '23.3664', 'Jinping');
INSERT INTO `ctshop_region` VALUES ('440512', '濠江区', '440500', '濠江', '3', '0754', '515071', '中国,广东省,汕头市,濠江区', '116.727', '23.2859', 'Haojiang');
INSERT INTO `ctshop_region` VALUES ('440513', '潮阳区', '440500', '潮阳', '3', '0754', '515100', '中国,广东省,汕头市,潮阳区', '116.602', '23.2649', 'Chaoyang');
INSERT INTO `ctshop_region` VALUES ('440514', '潮南区', '440500', '潮南', '3', '0754', '515144', '中国,广东省,汕头市,潮南区', '116.432', '23.25', 'Chaonan');
INSERT INTO `ctshop_region` VALUES ('440515', '澄海区', '440500', '澄海', '3', '0754', '515800', '中国,广东省,汕头市,澄海区', '116.756', '23.4673', 'Chenghai');
INSERT INTO `ctshop_region` VALUES ('440523', '南澳县', '440500', '南澳', '3', '0754', '515900', '中国,广东省,汕头市,南澳县', '117.019', '23.4223', 'Nanao');
INSERT INTO `ctshop_region` VALUES ('440600', '佛山市', '440000', '佛山', '2', '0757', '528000', '中国,广东省,佛山市', '113.123', '23.0288', 'Foshan');
INSERT INTO `ctshop_region` VALUES ('440604', '禅城区', '440600', '禅城', '3', '0757', '528000', '中国,广东省,佛山市,禅城区', '113.123', '23.0084', 'Chancheng');
INSERT INTO `ctshop_region` VALUES ('440605', '南海区', '440600', '南海', '3', '0757', '528251', '中国,广东省,佛山市,南海区', '113.143', '23.0288', 'Nanhai');
INSERT INTO `ctshop_region` VALUES ('440606', '顺德区', '440600', '顺德', '3', '0757', '528300', '中国,广东省,佛山市,顺德区', '113.294', '22.8045', 'Shunde');
INSERT INTO `ctshop_region` VALUES ('440607', '三水区', '440600', '三水', '3', '0757', '528133', '中国,广东省,佛山市,三水区', '112.897', '23.1556', 'Sanshui');
INSERT INTO `ctshop_region` VALUES ('440608', '高明区', '440600', '高明', '3', '0757', '528500', '中国,广东省,佛山市,高明区', '112.893', '22.9002', 'Gaoming');
INSERT INTO `ctshop_region` VALUES ('440700', '江门市', '440000', '江门', '2', '0750', '529000', '中国,广东省,江门市', '113.095', '22.5904', 'Jiangmen');
INSERT INTO `ctshop_region` VALUES ('440703', '蓬江区', '440700', '蓬江', '3', '0750', '529000', '中国,广东省,江门市,蓬江区', '113.078', '22.5951', 'Pengjiang');
INSERT INTO `ctshop_region` VALUES ('440704', '江海区', '440700', '江海', '3', '0750', '529040', '中国,广东省,江门市,江海区', '113.111', '22.5602', 'Jianghai');
INSERT INTO `ctshop_region` VALUES ('440705', '新会区', '440700', '新会', '3', '0750', '529100', '中国,广东省,江门市,新会区', '113.032', '22.4588', 'Xinhui');
INSERT INTO `ctshop_region` VALUES ('440781', '台山市', '440700', '台山', '3', '0750', '529200', '中国,广东省,江门市,台山市', '112.794', '22.2515', 'Taishan');
INSERT INTO `ctshop_region` VALUES ('440783', '开平市', '440700', '开平', '3', '0750', '529337', '中国,广东省,江门市,开平市', '112.698', '22.3762', 'Kaiping');
INSERT INTO `ctshop_region` VALUES ('440784', '鹤山市', '440700', '鹤山', '3', '0750', '529700', '中国,广东省,江门市,鹤山市', '112.964', '22.7652', 'Heshan');
INSERT INTO `ctshop_region` VALUES ('440785', '恩平市', '440700', '恩平', '3', '0750', '529400', '中国,广东省,江门市,恩平市', '112.305', '22.1829', 'Enping');
INSERT INTO `ctshop_region` VALUES ('440800', '湛江市', '440000', '湛江', '2', '0759', '524047', '中国,广东省,湛江市', '110.406', '21.1953', 'Zhanjiang');
INSERT INTO `ctshop_region` VALUES ('440802', '赤坎区', '440800', '赤坎', '3', '0759', '524033', '中国,广东省,湛江市,赤坎区', '110.366', '21.2661', 'Chikan');
INSERT INTO `ctshop_region` VALUES ('440803', '霞山区', '440800', '霞山', '3', '0759', '524011', '中国,广东省,湛江市,霞山区', '110.398', '21.1918', 'Xiashan');
INSERT INTO `ctshop_region` VALUES ('440804', '坡头区', '440800', '坡头', '3', '0759', '524057', '中国,广东省,湛江市,坡头区', '110.455', '21.2447', 'Potou');
INSERT INTO `ctshop_region` VALUES ('440811', '麻章区', '440800', '麻章', '3', '0759', '524094', '中国,广东省,湛江市,麻章区', '110.334', '21.2633', 'Mazhang');
INSERT INTO `ctshop_region` VALUES ('440823', '遂溪县', '440800', '遂溪', '3', '0759', '524300', '中国,广东省,湛江市,遂溪县', '110.25', '21.3772', 'Suixi');
INSERT INTO `ctshop_region` VALUES ('440825', '徐闻县', '440800', '徐闻', '3', '0759', '524100', '中国,广东省,湛江市,徐闻县', '110.174', '20.3281', 'Xuwen');
INSERT INTO `ctshop_region` VALUES ('440881', '廉江市', '440800', '廉江', '3', '0759', '524400', '中国,广东省,湛江市,廉江市', '110.284', '21.6092', 'Lianjiang');
INSERT INTO `ctshop_region` VALUES ('440882', '雷州市', '440800', '雷州', '3', '0759', '524200', '中国,广东省,湛江市,雷州市', '110.101', '20.9143', 'Leizhou');
INSERT INTO `ctshop_region` VALUES ('440883', '吴川市', '440800', '吴川', '3', '0759', '524500', '中国,广东省,湛江市,吴川市', '110.777', '21.4458', 'Wuchuan');
INSERT INTO `ctshop_region` VALUES ('440900', '茂名市', '440000', '茂名', '2', '0668', '525000', '中国,广东省,茂名市', '110.919', '21.6598', 'Maoming');
INSERT INTO `ctshop_region` VALUES ('440902', '茂南区', '440900', '茂南', '3', '0668', '525000', '中国,广东省,茂名市,茂南区', '110.919', '21.641', 'Maonan');
INSERT INTO `ctshop_region` VALUES ('440904', '电白区', '440900', '电白', '3', '0668', '525400', '中国,广东省,茂名市,电白区', '111.007', '21.5072', 'Dianbai');
INSERT INTO `ctshop_region` VALUES ('440981', '高州市', '440900', '高州', '3', '0668', '525200', '中国,广东省,茂名市,高州市', '110.855', '21.9206', 'Gaozhou');
INSERT INTO `ctshop_region` VALUES ('440982', '化州市', '440900', '化州', '3', '0668', '525100', '中国,广东省,茂名市,化州市', '110.639', '21.6639', 'Huazhou');
INSERT INTO `ctshop_region` VALUES ('440983', '信宜市', '440900', '信宜', '3', '0668', '525300', '中国,广东省,茂名市,信宜市', '110.946', '22.3535', 'Xinyi');
INSERT INTO `ctshop_region` VALUES ('441200', '肇庆市', '440000', '肇庆', '2', '0758', '526040', '中国,广东省,肇庆市', '112.473', '23.0515', 'Zhaoqing');
INSERT INTO `ctshop_region` VALUES ('441202', '端州区', '441200', '端州', '3', '0758', '526060', '中国,广东省,肇庆市,端州区', '112.485', '23.0519', 'Duanzhou');
INSERT INTO `ctshop_region` VALUES ('441203', '鼎湖区', '441200', '鼎湖', '3', '0758', '526070', '中国,广东省,肇庆市,鼎湖区', '112.566', '23.1585', 'Dinghu');
INSERT INTO `ctshop_region` VALUES ('441223', '广宁县', '441200', '广宁', '3', '0758', '526300', '中国,广东省,肇庆市,广宁县', '112.441', '23.6346', 'Guangning');
INSERT INTO `ctshop_region` VALUES ('441224', '怀集县', '441200', '怀集', '3', '0758', '526400', '中国,广东省,肇庆市,怀集县', '112.184', '23.9092', 'Huaiji');
INSERT INTO `ctshop_region` VALUES ('441225', '封开县', '441200', '封开', '3', '0758', '526500', '中国,广东省,肇庆市,封开县', '111.503', '23.4357', 'Fengkai');
INSERT INTO `ctshop_region` VALUES ('441226', '德庆县', '441200', '德庆', '3', '0758', '526600', '中国,广东省,肇庆市,德庆县', '111.786', '23.1437', 'Deqing');
INSERT INTO `ctshop_region` VALUES ('441283', '高要市', '441200', '高要', '3', '0758', '526100', '中国,广东省,肇庆市,高要市', '112.458', '23.0258', 'Gaoyao');
INSERT INTO `ctshop_region` VALUES ('441284', '四会市', '441200', '四会', '3', '0758', '526200', '中国,广东省,肇庆市,四会市', '112.734', '23.3269', 'Sihui');
INSERT INTO `ctshop_region` VALUES ('441300', '惠州市', '440000', '惠州', '2', '0752', '516000', '中国,广东省,惠州市', '114.413', '23.0794', 'Huizhou');
INSERT INTO `ctshop_region` VALUES ('441302', '惠城区', '441300', '惠城', '3', '0752', '516008', '中国,广东省,惠州市,惠城区', '114.383', '23.0838', 'Huicheng');
INSERT INTO `ctshop_region` VALUES ('441303', '惠阳区', '441300', '惠阳', '3', '0752', '516211', '中国,广东省,惠州市,惠阳区', '114.456', '22.7885', 'Huiyang');
INSERT INTO `ctshop_region` VALUES ('441322', '博罗县', '441300', '博罗', '3', '0752', '516100', '中国,广东省,惠州市,博罗县', '114.29', '23.1731', 'Boluo');
INSERT INTO `ctshop_region` VALUES ('441323', '惠东县', '441300', '惠东', '3', '0752', '516300', '中国,广东省,惠州市,惠东县', '114.72', '22.9848', 'Huidong');
INSERT INTO `ctshop_region` VALUES ('441324', '龙门县', '441300', '龙门', '3', '0752', '516800', '中国,广东省,惠州市,龙门县', '114.255', '23.7276', 'Longmen');
INSERT INTO `ctshop_region` VALUES ('441400', '梅州市', '440000', '梅州', '2', '0753', '514021', '中国,广东省,梅州市', '116.118', '24.2991', 'Meizhou');
INSERT INTO `ctshop_region` VALUES ('441402', '梅江区', '441400', '梅江', '3', '0753', '514000', '中国,广东省,梅州市,梅江区', '116.117', '24.3106', 'Meijiang');
INSERT INTO `ctshop_region` VALUES ('441403', '梅县区', '441400', '梅县', '3', '0753', '514787', '中国,广东省,梅州市,梅县区', '116.098', '24.2867', 'Meixian');
INSERT INTO `ctshop_region` VALUES ('441422', '大埔县', '441400', '大埔', '3', '0753', '514200', '中国,广东省,梅州市,大埔县', '116.697', '24.3533', 'Dabu');
INSERT INTO `ctshop_region` VALUES ('441423', '丰顺县', '441400', '丰顺', '3', '0753', '514300', '中国,广东省,梅州市,丰顺县', '116.182', '23.7409', 'Fengshun');
INSERT INTO `ctshop_region` VALUES ('441424', '五华县', '441400', '五华', '3', '0753', '514400', '中国,广东省,梅州市,五华县', '115.779', '23.9242', 'Wuhua');
INSERT INTO `ctshop_region` VALUES ('441426', '平远县', '441400', '平远', '3', '0753', '514600', '中国,广东省,梅州市,平远县', '115.896', '24.5712', 'Pingyuan');
INSERT INTO `ctshop_region` VALUES ('441427', '蕉岭县', '441400', '蕉岭', '3', '0753', '514100', '中国,广东省,梅州市,蕉岭县', '116.171', '24.6573', 'Jiaoling');
INSERT INTO `ctshop_region` VALUES ('441481', '兴宁市', '441400', '兴宁', '3', '0753', '514500', '中国,广东省,梅州市,兴宁市', '115.731', '24.14', 'Xingning');
INSERT INTO `ctshop_region` VALUES ('441500', '汕尾市', '440000', '汕尾', '2', '0660', '516600', '中国,广东省,汕尾市', '115.364', '22.7745', 'Shanwei');
INSERT INTO `ctshop_region` VALUES ('441502', '城区', '441500', '城区', '3', '0660', '516600', '中国,广东省,汕尾市,城区', '115.365', '22.7789', 'Chengqu');
INSERT INTO `ctshop_region` VALUES ('441521', '海丰县', '441500', '海丰', '3', '0660', '516400', '中国,广东省,汕尾市,海丰县', '115.323', '22.9665', 'Haifeng');
INSERT INTO `ctshop_region` VALUES ('441523', '陆河县', '441500', '陆河', '3', '0660', '516700', '中国,广东省,汕尾市,陆河县', '115.656', '23.3036', 'Luhe');
INSERT INTO `ctshop_region` VALUES ('441581', '陆丰市', '441500', '陆丰', '3', '0660', '516500', '中国,广东省,汕尾市,陆丰市', '115.648', '22.9433', 'Lufeng');
INSERT INTO `ctshop_region` VALUES ('441600', '河源市', '440000', '河源', '2', '0762', '517000', '中国,广东省,河源市', '114.698', '23.7463', 'Heyuan');
INSERT INTO `ctshop_region` VALUES ('441602', '源城区', '441600', '源城', '3', '0762', '517000', '中国,广东省,河源市,源城区', '114.702', '23.7341', 'Yuancheng');
INSERT INTO `ctshop_region` VALUES ('441621', '紫金县', '441600', '紫金', '3', '0762', '517400', '中国,广东省,河源市,紫金县', '115.184', '23.6387', 'Zijin');
INSERT INTO `ctshop_region` VALUES ('441622', '龙川县', '441600', '龙川', '3', '0762', '517300', '中国,广东省,河源市,龙川县', '115.26', '24.1014', 'Longchuan');
INSERT INTO `ctshop_region` VALUES ('441623', '连平县', '441600', '连平', '3', '0762', '517100', '中国,广东省,河源市,连平县', '114.49', '24.3716', 'Lianping');
INSERT INTO `ctshop_region` VALUES ('441624', '和平县', '441600', '和平', '3', '0762', '517200', '中国,广东省,河源市,和平县', '114.938', '24.4432', 'Heping');
INSERT INTO `ctshop_region` VALUES ('441625', '东源县', '441600', '东源', '3', '0762', '517583', '中国,广东省,河源市,东源县', '114.746', '23.7883', 'Dongyuan');
INSERT INTO `ctshop_region` VALUES ('441700', '阳江市', '440000', '阳江', '2', '0662', '529500', '中国,广东省,阳江市', '111.975', '21.8592', 'Yangjiang');
INSERT INTO `ctshop_region` VALUES ('441702', '江城区', '441700', '江城', '3', '0662', '529500', '中国,广东省,阳江市,江城区', '111.955', '21.8619', 'Jiangcheng');
INSERT INTO `ctshop_region` VALUES ('441704', '阳东区', '441700', '阳东', '3', '0662', '529900', '中国,广东省,阳江市,阳东区', '112.015', '21.874', 'Yangdong');
INSERT INTO `ctshop_region` VALUES ('441721', '阳西县', '441700', '阳西', '3', '0662', '529800', '中国,广东省,阳江市,阳西县', '111.618', '21.7523', 'Yangxi');
INSERT INTO `ctshop_region` VALUES ('441781', '阳春市', '441700', '阳春', '3', '0662', '529600', '中国,广东省,阳江市,阳春市', '111.789', '22.1723', 'Yangchun');
INSERT INTO `ctshop_region` VALUES ('441800', '清远市', '440000', '清远', '2', '0763', '511500', '中国,广东省,清远市', '113.037', '23.7042', 'Qingyuan');
INSERT INTO `ctshop_region` VALUES ('441802', '清城区', '441800', '清城', '3', '0763', '511515', '中国,广东省,清远市,清城区', '113.063', '23.6978', 'Qingcheng');
INSERT INTO `ctshop_region` VALUES ('441803', '清新区', '441800', '清新', '3', '0763', '511810', '中国,广东省,清远市,清新区', '113.015', '23.7369', 'Qingxin');
INSERT INTO `ctshop_region` VALUES ('441821', '佛冈县', '441800', '佛冈', '3', '0763', '511600', '中国,广东省,清远市,佛冈县', '113.533', '23.8723', 'Fogang');
INSERT INTO `ctshop_region` VALUES ('441823', '阳山县', '441800', '阳山', '3', '0763', '513100', '中国,广东省,清远市,阳山县', '112.641', '24.4652', 'Yangshan');
INSERT INTO `ctshop_region` VALUES ('441825', '连山壮族瑶族自治县', '441800', '连山', '3', '0763', '513200', '中国,广东省,清远市,连山壮族瑶族自治县', '112.08', '24.5681', 'Lianshan');
INSERT INTO `ctshop_region` VALUES ('441826', '连南瑶族自治县', '441800', '连南', '3', '0763', '513300', '中国,广东省,清远市,连南瑶族自治县', '112.288', '24.7173', 'Liannan');
INSERT INTO `ctshop_region` VALUES ('441881', '英德市', '441800', '英德', '3', '0763', '513000', '中国,广东省,清远市,英德市', '113.415', '24.1857', 'Yingde');
INSERT INTO `ctshop_region` VALUES ('441882', '连州市', '441800', '连州', '3', '0763', '513400', '中国,广东省,清远市,连州市', '112.382', '24.7791', 'Lianzhou');
INSERT INTO `ctshop_region` VALUES ('441900', '东莞市', '440000', '东莞', '2', '0769', '523888', '中国,广东省,东莞市', '113.76', '23.0489', 'Dongguan');
INSERT INTO `ctshop_region` VALUES ('441901', '莞城区', '441900', '莞城', '3', '0769', '523128', '中国,广东省,东莞市,莞城区', '113.751', '23.0534', 'Guancheng');
INSERT INTO `ctshop_region` VALUES ('441902', '南城区', '441900', '南城', '3', '0769', '523617', '中国,广东省,东莞市,南城区', '113.752', '23.0202', 'Nancheng');
INSERT INTO `ctshop_region` VALUES ('441904', '万江区', '441900', '万江', '3', '0769', '523039', '中国,广东省,东莞市,万江区', '113.739', '23.0438', 'Wanjiang');
INSERT INTO `ctshop_region` VALUES ('441905', '石碣镇', '441900', '石碣', '3', '0769', '523290', '中国,广东省,东莞市,石碣镇', '113.802', '23.099', 'Shijie');
INSERT INTO `ctshop_region` VALUES ('441906', '石龙镇', '441900', '石龙', '3', '0769', '523326', '中国,广东省,东莞市,石龙镇', '113.876', '23.1074', 'Shilong');
INSERT INTO `ctshop_region` VALUES ('441907', '茶山镇', '441900', '茶山', '3', '0769', '523380', '中国,广东省,东莞市,茶山镇', '113.884', '23.0624', 'Chashan');
INSERT INTO `ctshop_region` VALUES ('441908', '石排镇', '441900', '石排', '3', '0769', '523346', '中国,广东省,东莞市,石排镇', '113.92', '23.0863', 'Shipai');
INSERT INTO `ctshop_region` VALUES ('441909', '企石镇', '441900', '企石', '3', '0769', '523507', '中国,广东省,东莞市,企石镇', '114.013', '23.066', 'Qishi');
INSERT INTO `ctshop_region` VALUES ('441910', '横沥镇', '441900', '横沥', '3', '0769', '523471', '中国,广东省,东莞市,横沥镇', '113.957', '23.0257', 'Hengli');
INSERT INTO `ctshop_region` VALUES ('441911', '桥头镇', '441900', '桥头', '3', '0769', '523520', '中国,广东省,东莞市,桥头镇', '114.014', '22.9397', 'Qiaotou');
INSERT INTO `ctshop_region` VALUES ('441912', '谢岗镇', '441900', '谢岗', '3', '0769', '523592', '中国,广东省,东莞市,谢岗镇', '114.141', '22.9597', 'Xiegang');
INSERT INTO `ctshop_region` VALUES ('441913', '东坑镇', '441900', '东坑', '3', '0769', '523451', '中国,广东省,东莞市,东坑镇', '113.94', '22.9928', 'Dongkeng');
INSERT INTO `ctshop_region` VALUES ('441914', '常平镇', '441900', '常平', '3', '0769', '523560', '中国,广东省,东莞市,常平镇', '114.03', '23.0161', 'Changping');
INSERT INTO `ctshop_region` VALUES ('441915', '寮步镇', '441900', '寮步', '3', '0769', '523411', '中国,广东省,东莞市,寮步镇', '113.885', '22.9917', 'Liaobu');
INSERT INTO `ctshop_region` VALUES ('441916', '大朗镇', '441900', '大朗', '3', '0769', '523770', '中国,广东省,东莞市,大朗镇', '113.927', '22.9657', 'Dalang');
INSERT INTO `ctshop_region` VALUES ('441917', '麻涌镇', '441900', '麻涌', '3', '0769', '523143', '中国,广东省,东莞市,麻涌镇', '113.546', '23.0453', 'Machong');
INSERT INTO `ctshop_region` VALUES ('441918', '中堂镇', '441900', '中堂', '3', '0769', '523233', '中国,广东省,东莞市,中堂镇', '113.654', '23.0902', 'Zhongtang');
INSERT INTO `ctshop_region` VALUES ('441919', '高埗镇', '441900', '高埗', '3', '0769', '523282', '中国,广东省,东莞市,高埗镇', '113.736', '23.0684', 'Gaobu');
INSERT INTO `ctshop_region` VALUES ('441920', '樟木头镇', '441900', '樟木头', '3', '0769', '523619', '中国,广东省,东莞市,樟木头镇', '114.066', '22.9567', 'Zhangmutou');
INSERT INTO `ctshop_region` VALUES ('441921', '大岭山镇', '441900', '大岭山', '3', '0769', '523835', '中国,广东省,东莞市,大岭山镇', '113.783', '22.8854', 'Dalingshan');
INSERT INTO `ctshop_region` VALUES ('441922', '望牛墩镇', '441900', '望牛墩', '3', '0769', '523203', '中国,广东省,东莞市,望牛墩镇', '113.659', '23.055', 'Wangniudun');
INSERT INTO `ctshop_region` VALUES ('441923', '黄江镇', '441900', '黄江', '3', '0769', '523755', '中国,广东省,东莞市,黄江镇', '113.993', '22.8775', 'Huangjiang');
INSERT INTO `ctshop_region` VALUES ('441924', '洪梅镇', '441900', '洪梅', '3', '0769', '523163', '中国,广东省,东莞市,洪梅镇', '113.613', '22.9927', 'Hongmei');
INSERT INTO `ctshop_region` VALUES ('441925', '清溪镇', '441900', '清溪', '3', '0769', '523660', '中国,广东省,东莞市,清溪镇', '114.156', '22.8445', 'Qingxi');
INSERT INTO `ctshop_region` VALUES ('441926', '沙田镇', '441900', '沙田', '3', '0769', '523988', '中国,广东省,东莞市,沙田镇', '113.76', '23.0489', 'Shatian');
INSERT INTO `ctshop_region` VALUES ('441927', '道滘镇', '441900', '道滘', '3', '0769', '523171', '中国,广东省,东莞市,道滘镇', '113.76', '23.0489', 'Daojiao');
INSERT INTO `ctshop_region` VALUES ('441928', '塘厦镇', '441900', '塘厦', '3', '0769', '523713', '中国,广东省,东莞市,塘厦镇', '114.108', '22.8229', 'Tangxia');
INSERT INTO `ctshop_region` VALUES ('441929', '虎门镇', '441900', '虎门', '3', '0769', '523932', '中国,广东省,东莞市,虎门镇', '113.711', '22.8262', 'Humen');
INSERT INTO `ctshop_region` VALUES ('441930', '厚街镇', '441900', '厚街', '3', '0769', '523960', '中国,广东省,东莞市,厚街镇', '113.673', '22.9408', 'Houjie');
INSERT INTO `ctshop_region` VALUES ('441931', '凤岗镇', '441900', '凤岗', '3', '0769', '523690', '中国,广东省,东莞市,凤岗镇', '114.141', '22.7446', 'Fenggang');
INSERT INTO `ctshop_region` VALUES ('441932', '长安镇', '441900', '长安', '3', '0769', '523850', '中国,广东省,东莞市,长安镇', '113.804', '22.8166', 'Chang\'an');
INSERT INTO `ctshop_region` VALUES ('442000', '中山市', '440000', '中山', '2', '0760', '528403', '中国,广东省,中山市', '113.382', '22.5211', 'Zhongshan');
INSERT INTO `ctshop_region` VALUES ('442001', '石岐区', '442000', '石岐', '3', '0760', '528400', '中国,广东省,中山市,石岐区', '113.379', '22.5252', 'Shiqi');
INSERT INTO `ctshop_region` VALUES ('442004', '南区', '442000', '南区', '3', '0760', '528400', '中国,广东省,中山市,南区', '113.356', '22.4866', 'Nanqu');
INSERT INTO `ctshop_region` VALUES ('442005', '五桂山区', '442000', '五桂山', '3', '0760', '528458', '中国,广东省,中山市,五桂山区', '113.411', '22.5197', 'Wuguishan');
INSERT INTO `ctshop_region` VALUES ('442006', '火炬开发区', '442000', '火炬', '3', '0760', '528437', '中国,广东省,中山市,火炬开发区', '113.481', '22.5661', 'Huoju');
INSERT INTO `ctshop_region` VALUES ('442007', '黄圃镇', '442000', '黄圃', '3', '0760', '528429', '中国,广东省,中山市,黄圃镇', '113.342', '22.7151', 'Huangpu');
INSERT INTO `ctshop_region` VALUES ('442008', '南头镇', '442000', '南头', '3', '0760', '528421', '中国,广东省,中山市,南头镇', '113.296', '22.7139', 'Nantou');
INSERT INTO `ctshop_region` VALUES ('442009', '东凤镇', '442000', '东凤', '3', '0760', '528425', '中国,广东省,中山市,东凤镇', '113.261', '22.6877', 'Dongfeng');
INSERT INTO `ctshop_region` VALUES ('442010', '阜沙镇', '442000', '阜沙', '3', '0760', '528434', '中国,广东省,中山市,阜沙镇', '113.353', '22.6664', 'Fusha');
INSERT INTO `ctshop_region` VALUES ('442011', '小榄镇', '442000', '小榄', '3', '0760', '528415', '中国,广东省,中山市,小榄镇', '113.244', '22.667', 'Xiaolan');
INSERT INTO `ctshop_region` VALUES ('442012', '东升镇', '442000', '东升', '3', '0760', '528400', '中国,广东省,中山市,东升镇', '113.296', '22.614', 'Dongsheng');
INSERT INTO `ctshop_region` VALUES ('442013', '古镇镇', '442000', '古镇', '3', '0760', '528422', '中国,广东省,中山市,古镇镇', '113.18', '22.611', 'Guzhen');
INSERT INTO `ctshop_region` VALUES ('442014', '横栏镇', '442000', '横栏', '3', '0760', '528478', '中国,广东省,中山市,横栏镇', '113.266', '22.5232', 'Henglan');
INSERT INTO `ctshop_region` VALUES ('442015', '三角镇', '442000', '三角', '3', '0760', '528422', '中国,广东省,中山市,三角镇', '113.424', '22.677', 'Sanjiao');
INSERT INTO `ctshop_region` VALUES ('442016', '民众镇', '442000', '民众', '3', '0760', '528441', '中国,广东省,中山市,民众镇', '113.486', '22.6235', 'Minzhong');
INSERT INTO `ctshop_region` VALUES ('442017', '南朗镇', '442000', '南朗', '3', '0760', '528454', '中国,广东省,中山市,南朗镇', '113.534', '22.4924', 'Nanlang');
INSERT INTO `ctshop_region` VALUES ('442018', '港口镇', '442000', '港口', '3', '0760', '528447', '中国,广东省,中山市,港口镇', '113.382', '22.5211', 'Gangkou');
INSERT INTO `ctshop_region` VALUES ('442019', '大涌镇', '442000', '大涌', '3', '0760', '528476', '中国,广东省,中山市,大涌镇', '113.292', '22.4677', 'Dayong');
INSERT INTO `ctshop_region` VALUES ('442020', '沙溪镇', '442000', '沙溪', '3', '0760', '528471', '中国,广东省,中山市,沙溪镇', '113.328', '22.5263', 'Shaxi');
INSERT INTO `ctshop_region` VALUES ('442021', '三乡镇', '442000', '三乡', '3', '0760', '528463', '中国,广东省,中山市,三乡镇', '113.433', '22.3525', 'Sanxiang');
INSERT INTO `ctshop_region` VALUES ('442022', '板芙镇', '442000', '板芙', '3', '0760', '528459', '中国,广东省,中山市,板芙镇', '113.32', '22.4157', 'Banfu');
INSERT INTO `ctshop_region` VALUES ('442023', '神湾镇', '442000', '神湾', '3', '0760', '528462', '中国,广东省,中山市,神湾镇', '113.359', '22.3125', 'Shenwan');
INSERT INTO `ctshop_region` VALUES ('442024', '坦洲镇', '442000', '坦洲', '3', '0760', '528467', '中国,广东省,中山市,坦洲镇', '113.486', '22.2613', 'Tanzhou');
INSERT INTO `ctshop_region` VALUES ('445100', '潮州市', '440000', '潮州', '2', '0768', '521000', '中国,广东省,潮州市', '116.632', '23.6617', 'Chaozhou');
INSERT INTO `ctshop_region` VALUES ('445102', '湘桥区', '445100', '湘桥', '3', '0768', '521000', '中国,广东省,潮州市,湘桥区', '116.628', '23.6745', 'Xiangqiao');
INSERT INTO `ctshop_region` VALUES ('445103', '潮安区', '445100', '潮安', '3', '0768', '515638', '中国,广东省,潮州市,潮安区', '116.593', '23.6437', 'Chao\'an');
INSERT INTO `ctshop_region` VALUES ('445122', '饶平县', '445100', '饶平', '3', '0768', '515700', '中国,广东省,潮州市,饶平县', '117.007', '23.6699', 'Raoping');
INSERT INTO `ctshop_region` VALUES ('445200', '揭阳市', '440000', '揭阳', '2', '0633', '522000', '中国,广东省,揭阳市', '116.356', '23.5438', 'Jieyang');
INSERT INTO `ctshop_region` VALUES ('445202', '榕城区', '445200', '榕城', '3', '0633', '522000', '中国,广东省,揭阳市,榕城区', '116.367', '23.5251', 'Rongcheng');
INSERT INTO `ctshop_region` VALUES ('445203', '揭东区', '445200', '揭东', '3', '0633', '515500', '中国,广东省,揭阳市,揭东区', '116.413', '23.5699', 'Jiedong');
INSERT INTO `ctshop_region` VALUES ('445222', '揭西县', '445200', '揭西', '3', '0633', '515400', '中国,广东省,揭阳市,揭西县', '115.839', '23.4271', 'Jiexi');
INSERT INTO `ctshop_region` VALUES ('445224', '惠来县', '445200', '惠来', '3', '0633', '515200', '中国,广东省,揭阳市,惠来县', '116.296', '23.0329', 'Huilai');
INSERT INTO `ctshop_region` VALUES ('445281', '普宁市', '445200', '普宁', '3', '0633', '515300', '中国,广东省,揭阳市,普宁市', '116.166', '23.2973', 'Puning');
INSERT INTO `ctshop_region` VALUES ('445300', '云浮市', '440000', '云浮', '2', '0766', '527300', '中国,广东省,云浮市', '112.044', '22.9298', 'Yunfu');
INSERT INTO `ctshop_region` VALUES ('445302', '云城区', '445300', '云城', '3', '0766', '527300', '中国,广东省,云浮市,云城区', '112.039', '22.93', 'Yuncheng');
INSERT INTO `ctshop_region` VALUES ('445303', '云安区', '445300', '云安', '3', '0766', '527500', '中国,广东省,云浮市,云安区', '112.009', '23.0778', 'Yun\'an');
INSERT INTO `ctshop_region` VALUES ('445321', '新兴县', '445300', '新兴', '3', '0766', '527400', '中国,广东省,云浮市,新兴县', '112.23', '22.6973', 'Xinxing');
INSERT INTO `ctshop_region` VALUES ('445322', '郁南县', '445300', '郁南', '3', '0766', '527100', '中国,广东省,云浮市,郁南县', '111.534', '23.2331', 'Yunan');
INSERT INTO `ctshop_region` VALUES ('445381', '罗定市', '445300', '罗定', '3', '0766', '527200', '中国,广东省,云浮市,罗定市', '111.57', '22.7697', 'Luoding');
INSERT INTO `ctshop_region` VALUES ('450000', '广西壮族自治区', '100000', '广西', '1', '', '', '中国,广西壮族自治区', '108.32', '22.824', 'Guangxi');
INSERT INTO `ctshop_region` VALUES ('450100', '南宁市', '450000', '南宁', '2', '0771', '530028', '中国,广西壮族自治区,南宁市', '108.32', '22.824', 'Nanning');
INSERT INTO `ctshop_region` VALUES ('450102', '兴宁区', '450100', '兴宁', '3', '0771', '530023', '中国,广西壮族自治区,南宁市,兴宁区', '108.367', '22.8535', 'Xingning');
INSERT INTO `ctshop_region` VALUES ('450103', '青秀区', '450100', '青秀', '3', '0771', '530213', '中国,广西壮族自治区,南宁市,青秀区', '108.495', '22.7851', 'Qingxiu');
INSERT INTO `ctshop_region` VALUES ('450105', '江南区', '450100', '江南', '3', '0771', '530031', '中国,广西壮族自治区,南宁市,江南区', '108.273', '22.7813', 'Jiangnan');
INSERT INTO `ctshop_region` VALUES ('450107', '西乡塘区', '450100', '西乡塘', '3', '0771', '530001', '中国,广西壮族自治区,南宁市,西乡塘区', '108.313', '22.8339', 'Xixiangtang');
INSERT INTO `ctshop_region` VALUES ('450108', '良庆区', '450100', '良庆', '3', '0771', '530219', '中国,广西壮族自治区,南宁市,良庆区', '108.413', '22.7491', 'Liangqing');
INSERT INTO `ctshop_region` VALUES ('450109', '邕宁区', '450100', '邕宁', '3', '0771', '530200', '中国,广西壮族自治区,南宁市,邕宁区', '108.487', '22.7563', 'Yongning');
INSERT INTO `ctshop_region` VALUES ('450122', '武鸣县', '450100', '武鸣', '3', '0771', '530100', '中国,广西壮族自治区,南宁市,武鸣县', '108.277', '23.1564', 'Wuming');
INSERT INTO `ctshop_region` VALUES ('450123', '隆安县', '450100', '隆安', '3', '0771', '532700', '中国,广西壮族自治区,南宁市,隆安县', '107.692', '23.1734', 'Long\'an');
INSERT INTO `ctshop_region` VALUES ('450124', '马山县', '450100', '马山', '3', '0771', '530600', '中国,广西壮族自治区,南宁市,马山县', '108.177', '23.7093', 'Mashan');
INSERT INTO `ctshop_region` VALUES ('450125', '上林县', '450100', '上林', '3', '0771', '530500', '中国,广西壮族自治区,南宁市,上林县', '108.605', '23.432', 'Shanglin');
INSERT INTO `ctshop_region` VALUES ('450126', '宾阳县', '450100', '宾阳', '3', '0771', '530400', '中国,广西壮族自治区,南宁市,宾阳县', '108.812', '23.2196', 'Binyang');
INSERT INTO `ctshop_region` VALUES ('450127', '横县', '450100', '横县', '3', '0771', '530300', '中国,广西壮族自治区,南宁市,横县', '109.266', '22.6845', 'Hengxian');
INSERT INTO `ctshop_region` VALUES ('450128', '埌东新区', '450100', '埌东', '3', '0771', '530000', '中国,广西壮族自治区,南宁市,埌东新区', '108.419', '22.813', 'Langdong');
INSERT INTO `ctshop_region` VALUES ('450200', '柳州市', '450000', '柳州', '2', '0772', '545001', '中国,广西壮族自治区,柳州市', '109.412', '24.3146', 'Liuzhou');
INSERT INTO `ctshop_region` VALUES ('450202', '城中区', '450200', '城中', '3', '0772', '545001', '中国,广西壮族自治区,柳州市,城中区', '109.411', '24.3154', 'Chengzhong');
INSERT INTO `ctshop_region` VALUES ('450203', '鱼峰区', '450200', '鱼峰', '3', '0772', '545005', '中国,广西壮族自治区,柳州市,鱼峰区', '109.453', '24.3187', 'Yufeng');
INSERT INTO `ctshop_region` VALUES ('450204', '柳南区', '450200', '柳南', '3', '0772', '545007', '中国,广西壮族自治区,柳州市,柳南区', '109.385', '24.336', 'Liunan');
INSERT INTO `ctshop_region` VALUES ('450205', '柳北区', '450200', '柳北', '3', '0772', '545002', '中国,广西壮族自治区,柳州市,柳北区', '109.402', '24.3627', 'Liubei');
INSERT INTO `ctshop_region` VALUES ('450221', '柳江县', '450200', '柳江', '3', '0772', '545100', '中国,广西壮族自治区,柳州市,柳江县', '109.333', '24.256', 'Liujiang');
INSERT INTO `ctshop_region` VALUES ('450222', '柳城县', '450200', '柳城', '3', '0772', '545200', '中国,广西壮族自治区,柳州市,柳城县', '109.239', '24.6495', 'Liucheng');
INSERT INTO `ctshop_region` VALUES ('450223', '鹿寨县', '450200', '鹿寨', '3', '0772', '545600', '中国,广西壮族自治区,柳州市,鹿寨县', '109.752', '24.4731', 'Luzhai');
INSERT INTO `ctshop_region` VALUES ('450224', '融安县', '450200', '融安', '3', '0772', '545400', '中国,广西壮族自治区,柳州市,融安县', '109.398', '25.2246', 'Rong\'an');
INSERT INTO `ctshop_region` VALUES ('450225', '融水苗族自治县', '450200', '融水', '3', '0772', '545300', '中国,广西壮族自治区,柳州市,融水苗族自治县', '109.256', '25.0663', 'Rongshui');
INSERT INTO `ctshop_region` VALUES ('450226', '三江侗族自治县', '450200', '三江', '3', '0772', '545500', '中国,广西壮族自治区,柳州市,三江侗族自治县', '109.604', '25.7843', 'Sanjiang');
INSERT INTO `ctshop_region` VALUES ('450227', '柳东新区', '450200', '柳东', '3', '0772', '545000', '中国,广西壮族自治区,柳州市,柳东新区', '109.437', '24.3292', 'Liudong');
INSERT INTO `ctshop_region` VALUES ('450300', '桂林市', '450000', '桂林', '2', '0773', '541100', '中国,广西壮族自治区,桂林市', '110.299', '25.2742', 'Guilin');
INSERT INTO `ctshop_region` VALUES ('450302', '秀峰区', '450300', '秀峰', '3', '0773', '541001', '中国,广西壮族自治区,桂林市,秀峰区', '110.289', '25.2825', 'Xiufeng');
INSERT INTO `ctshop_region` VALUES ('450303', '叠彩区', '450300', '叠彩', '3', '0773', '541001', '中国,广西壮族自治区,桂林市,叠彩区', '110.302', '25.3138', 'Diecai');
INSERT INTO `ctshop_region` VALUES ('450304', '象山区', '450300', '象山', '3', '0773', '541002', '中国,广西壮族自治区,桂林市,象山区', '110.281', '25.2617', 'Xiangshan');
INSERT INTO `ctshop_region` VALUES ('450305', '七星区', '450300', '七星', '3', '0773', '541004', '中国,广西壮族自治区,桂林市,七星区', '110.318', '25.2525', 'Qixing');
INSERT INTO `ctshop_region` VALUES ('450311', '雁山区', '450300', '雁山', '3', '0773', '541006', '中国,广西壮族自治区,桂林市,雁山区', '110.309', '25.0604', 'Yanshan');
INSERT INTO `ctshop_region` VALUES ('450312', '临桂区', '450300', '临桂', '3', '0773', '541100', '中国,广西壮族自治区,桂林市,临桂区', '110.205', '25.2463', 'Lingui');
INSERT INTO `ctshop_region` VALUES ('450321', '阳朔县', '450300', '阳朔', '3', '0773', '541900', '中国,广西壮族自治区,桂林市,阳朔县', '110.495', '24.7758', 'Yangshuo');
INSERT INTO `ctshop_region` VALUES ('450323', '灵川县', '450300', '灵川', '3', '0773', '541200', '中国,广西壮族自治区,桂林市,灵川县', '110.329', '25.4129', 'Lingchuan');
INSERT INTO `ctshop_region` VALUES ('450324', '全州县', '450300', '全州', '3', '0773', '541503', '中国,广西壮族自治区,桂林市,全州县', '111.072', '25.928', 'Quanzhou');
INSERT INTO `ctshop_region` VALUES ('450325', '兴安县', '450300', '兴安', '3', '0773', '541300', '中国,广西壮族自治区,桂林市,兴安县', '110.671', '25.6117', 'Xing\'an');
INSERT INTO `ctshop_region` VALUES ('450326', '永福县', '450300', '永福', '3', '0773', '541800', '中国,广西壮族自治区,桂林市,永福县', '109.983', '24.98', 'Yongfu');
INSERT INTO `ctshop_region` VALUES ('450327', '灌阳县', '450300', '灌阳', '3', '0773', '541600', '中国,广西壮族自治区,桂林市,灌阳县', '111.16', '25.488', 'Guanyang');
INSERT INTO `ctshop_region` VALUES ('450328', '龙胜各族自治县', '450300', '龙胜', '3', '0773', '541700', '中国,广西壮族自治区,桂林市,龙胜各族自治县', '110.012', '25.7961', 'Longsheng');
INSERT INTO `ctshop_region` VALUES ('450329', '资源县', '450300', '资源', '3', '0773', '541400', '中国,广西壮族自治区,桂林市,资源县', '110.653', '26.0424', 'Ziyuan');
INSERT INTO `ctshop_region` VALUES ('450330', '平乐县', '450300', '平乐', '3', '0773', '542400', '中国,广西壮族自治区,桂林市,平乐县', '110.642', '24.6324', 'Pingle');
INSERT INTO `ctshop_region` VALUES ('450331', '荔浦县', '450300', '荔浦', '3', '0773', '546600', '中国,广西壮族自治区,桂林市,荔浦县', '110.397', '24.4959', 'Lipu');
INSERT INTO `ctshop_region` VALUES ('450332', '恭城瑶族自治县', '450300', '恭城', '3', '0773', '542500', '中国,广西壮族自治区,桂林市,恭城瑶族自治县', '110.83', '24.8329', 'Gongcheng');
INSERT INTO `ctshop_region` VALUES ('450400', '梧州市', '450000', '梧州', '2', '0774', '543002', '中国,广西壮族自治区,梧州市', '111.316', '23.4723', 'Wuzhou');
INSERT INTO `ctshop_region` VALUES ('450403', '万秀区', '450400', '万秀', '3', '0774', '543000', '中国,广西壮族自治区,梧州市,万秀区', '111.321', '23.473', 'Wanxiu');
INSERT INTO `ctshop_region` VALUES ('450405', '长洲区', '450400', '长洲', '3', '0774', '543003', '中国,广西壮族自治区,梧州市,长洲区', '111.275', '23.4857', 'Changzhou');
INSERT INTO `ctshop_region` VALUES ('450406', '龙圩区', '450400', '龙圩', '3', '0774', '543002', '中国,广西壮族自治区,梧州市,龙圩区', '111.316', '23.4723', 'Longxu');
INSERT INTO `ctshop_region` VALUES ('450421', '苍梧县', '450400', '苍梧', '3', '0774', '543100', '中国,广西壮族自治区,梧州市,苍梧县', '111.245', '23.4205', 'Cangwu');
INSERT INTO `ctshop_region` VALUES ('450422', '藤县', '450400', '藤县', '3', '0774', '543300', '中国,广西壮族自治区,梧州市,藤县', '110.914', '23.3761', 'Tengxian');
INSERT INTO `ctshop_region` VALUES ('450423', '蒙山县', '450400', '蒙山', '3', '0774', '546700', '中国,广西壮族自治区,梧州市,蒙山县', '110.522', '24.2017', 'Mengshan');
INSERT INTO `ctshop_region` VALUES ('450481', '岑溪市', '450400', '岑溪', '3', '0774', '543200', '中国,广西壮族自治区,梧州市,岑溪市', '110.996', '22.9191', 'Cenxi');
INSERT INTO `ctshop_region` VALUES ('450500', '北海市', '450000', '北海', '2', '0779', '536000', '中国,广西壮族自治区,北海市', '109.119', '21.4733', 'Beihai');
INSERT INTO `ctshop_region` VALUES ('450502', '海城区', '450500', '海城', '3', '0779', '536000', '中国,广西壮族自治区,北海市,海城区', '109.117', '21.475', 'Haicheng');
INSERT INTO `ctshop_region` VALUES ('450503', '银海区', '450500', '银海', '3', '0779', '536000', '中国,广西壮族自治区,北海市,银海区', '109.13', '21.4783', 'Yinhai');
INSERT INTO `ctshop_region` VALUES ('450512', '铁山港区', '450500', '铁山港', '3', '0779', '536017', '中国,广西壮族自治区,北海市,铁山港区', '109.456', '21.5966', 'Tieshangang');
INSERT INTO `ctshop_region` VALUES ('450521', '合浦县', '450500', '合浦', '3', '0779', '536100', '中国,广西壮族自治区,北海市,合浦县', '109.201', '21.666', 'Hepu');
INSERT INTO `ctshop_region` VALUES ('450600', '防城港市', '450000', '防城港', '2', '0770', '538001', '中国,广西壮族自治区,防城港市', '108.345', '21.6146', 'Fangchenggang');
INSERT INTO `ctshop_region` VALUES ('450602', '港口区', '450600', '港口', '3', '0770', '538001', '中国,广西壮族自治区,防城港市,港口区', '108.38', '21.6434', 'Gangkou');
INSERT INTO `ctshop_region` VALUES ('450603', '防城区', '450600', '防城', '3', '0770', '538021', '中国,广西壮族自治区,防城港市,防城区', '108.357', '21.7646', 'Fangcheng');
INSERT INTO `ctshop_region` VALUES ('450621', '上思县', '450600', '上思', '3', '0770', '535500', '中国,广西壮族自治区,防城港市,上思县', '107.982', '22.1496', 'Shangsi');
INSERT INTO `ctshop_region` VALUES ('450681', '东兴市', '450600', '东兴', '3', '0770', '538100', '中国,广西壮族自治区,防城港市,东兴市', '107.972', '21.5471', 'Dongxing');
INSERT INTO `ctshop_region` VALUES ('450700', '钦州市', '450000', '钦州', '2', '0777', '535099', '中国,广西壮族自治区,钦州市', '108.624', '21.9671', 'Qinzhou');
INSERT INTO `ctshop_region` VALUES ('450702', '钦南区', '450700', '钦南', '3', '0777', '535099', '中国,广西壮族自治区,钦州市,钦南区', '108.618', '21.9514', 'Qinnan');
INSERT INTO `ctshop_region` VALUES ('450703', '钦北区', '450700', '钦北', '3', '0777', '535099', '中国,广西壮族自治区,钦州市,钦北区', '108.63', '21.9513', 'Qinbei');
INSERT INTO `ctshop_region` VALUES ('450721', '灵山县', '450700', '灵山', '3', '0777', '535099', '中国,广西壮族自治区,钦州市,灵山县', '109.292', '22.4165', 'Lingshan');
INSERT INTO `ctshop_region` VALUES ('450722', '浦北县', '450700', '浦北', '3', '0777', '535099', '中国,广西壮族自治区,钦州市,浦北县', '109.556', '22.2689', 'Pubei');
INSERT INTO `ctshop_region` VALUES ('450800', '贵港市', '450000', '贵港', '2', '0775', '537100', '中国,广西壮族自治区,贵港市', '109.602', '23.0936', 'Guigang');
INSERT INTO `ctshop_region` VALUES ('450802', '港北区', '450800', '港北', '3', '0775', '537100', '中国,广西壮族自治区,贵港市,港北区', '109.572', '23.1115', 'Gangbei');
INSERT INTO `ctshop_region` VALUES ('450803', '港南区', '450800', '港南', '3', '0775', '537100', '中国,广西壮族自治区,贵港市,港南区', '109.606', '23.0723', 'Gangnan');
INSERT INTO `ctshop_region` VALUES ('450804', '覃塘区', '450800', '覃塘', '3', '0775', '537121', '中国,广西壮族自治区,贵港市,覃塘区', '109.443', '23.1268', 'Qintang');
INSERT INTO `ctshop_region` VALUES ('450821', '平南县', '450800', '平南', '3', '0775', '537300', '中国,广西壮族自治区,贵港市,平南县', '110.391', '23.542', 'Pingnan');
INSERT INTO `ctshop_region` VALUES ('450881', '桂平市', '450800', '桂平', '3', '0775', '537200', '中国,广西壮族自治区,贵港市,桂平市', '110.081', '23.3934', 'Guiping');
INSERT INTO `ctshop_region` VALUES ('450900', '玉林市', '450000', '玉林', '2', '0775', '537000', '中国,广西壮族自治区,玉林市', '110.154', '22.6314', 'Yulin');
INSERT INTO `ctshop_region` VALUES ('450902', '玉州区', '450900', '玉州', '3', '0775', '537000', '中国,广西壮族自治区,玉林市,玉州区', '110.151', '22.6281', 'Yuzhou');
INSERT INTO `ctshop_region` VALUES ('450903', '福绵区', '450900', '福绵', '3', '0775', '537023', '中国,广西壮族自治区,玉林市,福绵区', '110.065', '22.5831', 'Fumian');
INSERT INTO `ctshop_region` VALUES ('450904', '玉东新区', '450900', '玉东', '3', '0775', '537000', '中国,广西壮族自治区,玉林市,玉东新区', '110.154', '22.6314', 'Yudong');
INSERT INTO `ctshop_region` VALUES ('450921', '容县', '450900', '容县', '3', '0775', '537500', '中国,广西壮族自治区,玉林市,容县', '110.556', '22.857', 'Rongxian');
INSERT INTO `ctshop_region` VALUES ('450922', '陆川县', '450900', '陆川', '3', '0775', '537700', '中国,广西壮族自治区,玉林市,陆川县', '110.264', '22.3245', 'Luchuan');
INSERT INTO `ctshop_region` VALUES ('450923', '博白县', '450900', '博白', '3', '0775', '537600', '中国,广西壮族自治区,玉林市,博白县', '109.977', '22.2729', 'Bobai');
INSERT INTO `ctshop_region` VALUES ('450924', '兴业县', '450900', '兴业', '3', '0775', '537800', '中国,广西壮族自治区,玉林市,兴业县', '109.876', '22.7424', 'Xingye');
INSERT INTO `ctshop_region` VALUES ('450981', '北流市', '450900', '北流', '3', '0775', '537400', '中国,广西壮族自治区,玉林市,北流市', '110.353', '22.7082', 'Beiliu');
INSERT INTO `ctshop_region` VALUES ('451000', '百色市', '450000', '百色', '2', '0776', '533000', '中国,广西壮族自治区,百色市', '106.616', '23.8977', 'Baise');
INSERT INTO `ctshop_region` VALUES ('451002', '右江区', '451000', '右江', '3', '0776', '533000', '中国,广西壮族自治区,百色市,右江区', '106.618', '23.9009', 'Youjiang');
INSERT INTO `ctshop_region` VALUES ('451021', '田阳县', '451000', '田阳', '3', '0776', '533600', '中国,广西壮族自治区,百色市,田阳县', '106.916', '23.7353', 'Tianyang');
INSERT INTO `ctshop_region` VALUES ('451022', '田东县', '451000', '田东', '3', '0776', '531500', '中国,广西壮族自治区,百色市,田东县', '107.124', '23.6', 'Tiandong');
INSERT INTO `ctshop_region` VALUES ('451023', '平果县', '451000', '平果', '3', '0776', '531400', '中国,广西壮族自治区,百色市,平果县', '107.59', '23.3297', 'Pingguo');
INSERT INTO `ctshop_region` VALUES ('451024', '德保县', '451000', '德保', '3', '0776', '533700', '中国,广西壮族自治区,百色市,德保县', '106.619', '23.3251', 'Debao');
INSERT INTO `ctshop_region` VALUES ('451025', '靖西县', '451000', '靖西', '3', '0776', '533800', '中国,广西壮族自治区,百色市,靖西县', '106.418', '23.1343', 'Jingxi');
INSERT INTO `ctshop_region` VALUES ('451026', '那坡县', '451000', '那坡', '3', '0776', '533900', '中国,广西壮族自治区,百色市,那坡县', '105.842', '23.4065', 'Napo');
INSERT INTO `ctshop_region` VALUES ('451027', '凌云县', '451000', '凌云', '3', '0776', '533100', '中国,广西壮族自治区,百色市,凌云县', '106.562', '24.3475', 'Lingyun');
INSERT INTO `ctshop_region` VALUES ('451028', '乐业县', '451000', '乐业', '3', '0776', '533200', '中国,广西壮族自治区,百色市,乐业县', '106.561', '24.7829', 'Leye');
INSERT INTO `ctshop_region` VALUES ('451029', '田林县', '451000', '田林', '3', '0776', '533300', '中国,广西壮族自治区,百色市,田林县', '106.229', '24.2921', 'Tianlin');
INSERT INTO `ctshop_region` VALUES ('451030', '西林县', '451000', '西林', '3', '0776', '533500', '中国,广西壮族自治区,百色市,西林县', '105.097', '24.4897', 'Xilin');
INSERT INTO `ctshop_region` VALUES ('451031', '隆林各族自治县', '451000', '隆林', '3', '0776', '533400', '中国,广西壮族自治区,百色市,隆林各族自治县', '105.343', '24.7704', 'Longlin');
INSERT INTO `ctshop_region` VALUES ('451100', '贺州市', '450000', '贺州', '2', '0774', '542800', '中国,广西壮族自治区,贺州市', '111.552', '24.4141', 'Hezhou');
INSERT INTO `ctshop_region` VALUES ('451102', '八步区', '451100', '八步', '3', '0774', '542800', '中国,广西壮族自治区,贺州市,八步区', '111.552', '24.4118', 'Babu');
INSERT INTO `ctshop_region` VALUES ('451121', '昭平县', '451100', '昭平', '3', '0774', '546800', '中国,广西壮族自治区,贺州市,昭平县', '110.811', '24.1701', 'Zhaoping');
INSERT INTO `ctshop_region` VALUES ('451122', '钟山县', '451100', '钟山', '3', '0774', '542600', '中国,广西壮族自治区,贺州市,钟山县', '111.305', '24.5248', 'Zhongshan');
INSERT INTO `ctshop_region` VALUES ('451123', '富川瑶族自治县', '451100', '富川', '3', '0774', '542700', '中国,广西壮族自治区,贺州市,富川瑶族自治县', '111.278', '24.8143', 'Fuchuan');
INSERT INTO `ctshop_region` VALUES ('451124', '平桂管理区', '451100', '平桂', '3', '0774', '542800', '中国,广西壮族自治区,贺州市,平桂管理区', '111.486', '24.458', 'Pingui');
INSERT INTO `ctshop_region` VALUES ('451200', '河池市', '450000', '河池', '2', '0778', '547000', '中国,广西壮族自治区,河池市', '108.062', '24.6959', 'Hechi');
INSERT INTO `ctshop_region` VALUES ('451202', '金城江区', '451200', '金城江', '3', '0779', '547000', '中国,广西壮族自治区,河池市,金城江区', '108.037', '24.6897', 'Jinchengjiang');
INSERT INTO `ctshop_region` VALUES ('451221', '南丹县', '451200', '南丹', '3', '0781', '547200', '中国,广西壮族自治区,河池市,南丹县', '107.546', '24.9776', 'Nandan');
INSERT INTO `ctshop_region` VALUES ('451222', '天峨县', '451200', '天峨', '3', '0782', '547300', '中国,广西壮族自治区,河池市,天峨县', '107.172', '24.9959', 'Tiane');
INSERT INTO `ctshop_region` VALUES ('451223', '凤山县', '451200', '凤山', '3', '0783', '547600', '中国,广西壮族自治区,河池市,凤山县', '107.049', '24.5422', 'Fengshan');
INSERT INTO `ctshop_region` VALUES ('451224', '东兰县', '451200', '东兰', '3', '0784', '547400', '中国,广西壮族自治区,河池市,东兰县', '107.375', '24.5105', 'Donglan');
INSERT INTO `ctshop_region` VALUES ('451225', '罗城仫佬族自治县', '451200', '罗城', '3', '0785', '546400', '中国,广西壮族自治区,河池市,罗城仫佬族自治县', '108.908', '24.7792', 'Luocheng');
INSERT INTO `ctshop_region` VALUES ('451226', '环江毛南族自治县', '451200', '环江', '3', '0786', '547100', '中国,广西壮族自治区,河池市,环江毛南族自治县', '108.261', '24.8292', 'Huanjiang');
INSERT INTO `ctshop_region` VALUES ('451227', '巴马瑶族自治县', '451200', '巴马', '3', '0787', '547500', '中国,广西壮族自治区,河池市,巴马瑶族自治县', '107.253', '24.1413', 'Bama');
INSERT INTO `ctshop_region` VALUES ('451228', '都安瑶族自治县', '451200', '都安', '3', '0788', '530700', '中国,广西壮族自治区,河池市,都安瑶族自治县', '108.101', '23.9324', 'Du\'an');
INSERT INTO `ctshop_region` VALUES ('451229', '大化瑶族自治县', '451200', '大化', '3', '0789', '530800', '中国,广西壮族自治区,河池市,大化瑶族自治县', '107.998', '23.7449', 'Dahua');
INSERT INTO `ctshop_region` VALUES ('451281', '宜州市', '451200', '宜州', '3', '0780', '546300', '中国,广西壮族自治区,河池市,宜州市', '108.653', '24.4939', 'Yizhou');
INSERT INTO `ctshop_region` VALUES ('451300', '来宾市', '450000', '来宾', '2', '0772', '546100', '中国,广西壮族自治区,来宾市', '109.23', '23.7338', 'Laibin');
INSERT INTO `ctshop_region` VALUES ('451302', '兴宾区', '451300', '兴宾', '3', '0772', '546100', '中国,广西壮族自治区,来宾市,兴宾区', '109.235', '23.7273', 'Xingbin');
INSERT INTO `ctshop_region` VALUES ('451321', '忻城县', '451300', '忻城', '3', '0772', '546200', '中国,广西壮族自治区,来宾市,忻城县', '108.664', '24.0686', 'Xincheng');
INSERT INTO `ctshop_region` VALUES ('451322', '象州县', '451300', '象州', '3', '0772', '545800', '中国,广西壮族自治区,来宾市,象州县', '109.699', '23.9736', 'Xiangzhou');
INSERT INTO `ctshop_region` VALUES ('451323', '武宣县', '451300', '武宣', '3', '0772', '545900', '中国,广西壮族自治区,来宾市,武宣县', '109.663', '23.5947', 'Wuxuan');
INSERT INTO `ctshop_region` VALUES ('451324', '金秀瑶族自治县', '451300', '金秀', '3', '0772', '545799', '中国,广西壮族自治区,来宾市,金秀瑶族自治县', '110.191', '24.1293', 'Jinxiu');
INSERT INTO `ctshop_region` VALUES ('451381', '合山市', '451300', '合山', '3', '0772', '546500', '中国,广西壮族自治区,来宾市,合山市', '108.886', '23.8062', 'Heshan');
INSERT INTO `ctshop_region` VALUES ('451400', '崇左市', '450000', '崇左', '2', '0771', '532299', '中国,广西壮族自治区,崇左市', '107.354', '22.4041', 'Chongzuo');
INSERT INTO `ctshop_region` VALUES ('451402', '江州区', '451400', '江州', '3', '0771', '532299', '中国,广西壮族自治区,崇左市,江州区', '107.347', '22.4114', 'Jiangzhou');
INSERT INTO `ctshop_region` VALUES ('451421', '扶绥县', '451400', '扶绥', '3', '0771', '532199', '中国,广西壮族自治区,崇左市,扶绥县', '107.904', '22.6341', 'Fusui');
INSERT INTO `ctshop_region` VALUES ('451422', '宁明县', '451400', '宁明', '3', '0771', '532599', '中国,广西壮族自治区,崇左市,宁明县', '107.073', '22.1366', 'Ningming');
INSERT INTO `ctshop_region` VALUES ('451423', '龙州县', '451400', '龙州', '3', '0771', '532499', '中国,广西壮族自治区,崇左市,龙州县', '106.854', '22.3394', 'Longzhou');
INSERT INTO `ctshop_region` VALUES ('451424', '大新县', '451400', '大新', '3', '0771', '532399', '中国,广西壮族自治区,崇左市,大新县', '107.198', '22.8341', 'Daxin');
INSERT INTO `ctshop_region` VALUES ('451425', '天等县', '451400', '天等', '3', '0771', '532899', '中国,广西壮族自治区,崇左市,天等县', '107.14', '23.077', 'Tiandeng');
INSERT INTO `ctshop_region` VALUES ('451481', '凭祥市', '451400', '凭祥', '3', '0771', '532699', '中国,广西壮族自治区,崇左市,凭祥市', '106.755', '22.1057', 'Pingxiang');
INSERT INTO `ctshop_region` VALUES ('460000', '海南省', '100000', '海南', '1', '', '', '中国,海南省', '110.331', '20.032', 'Hainan');
INSERT INTO `ctshop_region` VALUES ('460100', '海口市', '460000', '海口', '2', '0898', '570000', '中国,海南省,海口市', '110.331', '20.032', 'Haikou');
INSERT INTO `ctshop_region` VALUES ('460105', '秀英区', '460100', '秀英', '3', '0898', '570311', '中国,海南省,海口市,秀英区', '110.293', '20.0075', 'Xiuying');
INSERT INTO `ctshop_region` VALUES ('460106', '龙华区', '460100', '龙华', '3', '0898', '570145', '中国,海南省,海口市,龙华区', '110.302', '20.0287', 'Longhua');
INSERT INTO `ctshop_region` VALUES ('460107', '琼山区', '460100', '琼山', '3', '0898', '571100', '中国,海南省,海口市,琼山区', '110.354', '20.0032', 'Qiongshan');
INSERT INTO `ctshop_region` VALUES ('460108', '美兰区', '460100', '美兰', '3', '0898', '570203', '中国,海南省,海口市,美兰区', '110.369', '20.0286', 'Meilan');
INSERT INTO `ctshop_region` VALUES ('460200', '三亚市', '460000', '三亚', '2', '0898', '572000', '中国,海南省,三亚市', '109.508', '18.2479', 'Sanya');
INSERT INTO `ctshop_region` VALUES ('460202', '海棠区', '460200', '海棠', '3', '0898', '572000', '中国,海南省,三亚市,海棠区', '109.508', '18.2479', 'Haitang');
INSERT INTO `ctshop_region` VALUES ('460203', '吉阳区', '460200', '吉阳', '3', '0898', '572000', '中国,海南省,三亚市,吉阳区', '109.508', '18.2479', 'Jiyang');
INSERT INTO `ctshop_region` VALUES ('460204', '天涯区', '460200', '天涯', '3', '0898', '572000', '中国,海南省,三亚市,天涯区', '109.508', '18.2479', 'Tianya');
INSERT INTO `ctshop_region` VALUES ('460205', '崖州区', '460200', '崖州', '3', '0898', '572000', '中国,海南省,三亚市,崖州区', '109.508', '18.2479', 'Yazhou');
INSERT INTO `ctshop_region` VALUES ('460300', '三沙市', '460000', '三沙', '2', '0898', '573199', '中国,海南省,三沙市', '112.349', '16.831', 'Sansha');
INSERT INTO `ctshop_region` VALUES ('460321', '西沙群岛', '460300', '西沙', '3', '0898', '572000', '中国,海南省,三沙市,西沙群岛', '112.026', '16.3313', 'Xisha Islands');
INSERT INTO `ctshop_region` VALUES ('460322', '南沙群岛', '460300', '南沙', '3', '0898', '573100', '中国,海南省,三沙市,南沙群岛', '116.75', '11.4719', 'Nansha Islands');
INSERT INTO `ctshop_region` VALUES ('460323', '中沙群岛', '460300', '中沙', '3', '0898', '573100', '中国,海南省,三沙市,中沙群岛', '117.74', '15.1129', 'Zhongsha Islands');
INSERT INTO `ctshop_region` VALUES ('469000', '直辖县级', '460000', ' ', '2', '', '', '中国,海南省,直辖县级', '109.503', '18.7399', '');
INSERT INTO `ctshop_region` VALUES ('469001', '五指山市', '469000', '五指山', '3', '0898', '572200', '中国,海南省,直辖县级,五指山市', '109.517', '18.7769', 'Wuzhishan');
INSERT INTO `ctshop_region` VALUES ('469002', '琼海市', '469000', '琼海', '3', '0898', '571400', '中国,海南省,直辖县级,琼海市', '110.467', '19.246', 'Qionghai');
INSERT INTO `ctshop_region` VALUES ('469003', '儋州市', '469000', '儋州', '3', '0898', '571700', '中国,海南省,直辖县级,儋州市', '109.577', '19.5175', 'Danzhou');
INSERT INTO `ctshop_region` VALUES ('469005', '文昌市', '469000', '文昌', '3', '0898', '571339', '中国,海南省,直辖县级,文昌市', '110.754', '19.613', 'Wenchang');
INSERT INTO `ctshop_region` VALUES ('469006', '万宁市', '469000', '万宁', '3', '0898', '571500', '中国,海南省,直辖县级,万宁市', '110.389', '18.7962', 'Wanning');
INSERT INTO `ctshop_region` VALUES ('469007', '东方市', '469000', '东方', '3', '0898', '572600', '中国,海南省,直辖县级,东方市', '108.654', '19.102', 'Dongfang');
INSERT INTO `ctshop_region` VALUES ('469021', '定安县', '469000', '定安', '3', '0898', '571200', '中国,海南省,直辖县级,定安县', '110.324', '19.6992', 'Ding\'an');
INSERT INTO `ctshop_region` VALUES ('469022', '屯昌县', '469000', '屯昌', '3', '0898', '571600', '中国,海南省,直辖县级,屯昌县', '110.103', '19.3629', 'Tunchang');
INSERT INTO `ctshop_region` VALUES ('469023', '澄迈县', '469000', '澄迈', '3', '0898', '571900', '中国,海南省,直辖县级,澄迈县', '110.007', '19.7371', 'Chengmai');
INSERT INTO `ctshop_region` VALUES ('469024', '临高县', '469000', '临高', '3', '0898', '571800', '中国,海南省,直辖县级,临高县', '109.688', '19.9083', 'Lingao');
INSERT INTO `ctshop_region` VALUES ('469025', '白沙黎族自治县', '469000', '白沙', '3', '0898', '572800', '中国,海南省,直辖县级,白沙黎族自治县', '109.453', '19.2246', 'Baisha');
INSERT INTO `ctshop_region` VALUES ('469026', '昌江黎族自治县', '469000', '昌江', '3', '0898', '572700', '中国,海南省,直辖县级,昌江黎族自治县', '109.053', '19.261', 'Changjiang');
INSERT INTO `ctshop_region` VALUES ('469027', '乐东黎族自治县', '469000', '乐东', '3', '0898', '572500', '中国,海南省,直辖县级,乐东黎族自治县', '109.175', '18.7476', 'Ledong');
INSERT INTO `ctshop_region` VALUES ('469028', '陵水黎族自治县', '469000', '陵水', '3', '0898', '572400', '中国,海南省,直辖县级,陵水黎族自治县', '110.037', '18.505', 'Lingshui');
INSERT INTO `ctshop_region` VALUES ('469029', '保亭黎族苗族自治县', '469000', '保亭', '3', '0898', '572300', '中国,海南省,直辖县级,保亭黎族苗族自治县', '109.702', '18.6364', 'Baoting');
INSERT INTO `ctshop_region` VALUES ('469030', '琼中黎族苗族自治县', '469000', '琼中', '3', '0898', '572900', '中国,海南省,直辖县级,琼中黎族苗族自治县', '109.84', '19.0356', 'Qiongzhong');
INSERT INTO `ctshop_region` VALUES ('500000', '重庆', '100000', '重庆', '1', '', '', '中国,重庆', '106.505', '29.5332', 'Chongqing');
INSERT INTO `ctshop_region` VALUES ('500100', '重庆市', '500000', '重庆', '2', '023', '400000', '中国,重庆,重庆市', '106.505', '29.5332', 'Chongqing');
INSERT INTO `ctshop_region` VALUES ('500101', '万州区', '500100', '万州', '3', '023', '404000', '中国,重庆,重庆市,万州区', '108.409', '30.8079', 'Wanzhou');
INSERT INTO `ctshop_region` VALUES ('500102', '涪陵区', '500100', '涪陵', '3', '023', '408000', '中国,重庆,重庆市,涪陵区', '107.39', '29.7029', 'Fuling');
INSERT INTO `ctshop_region` VALUES ('500103', '渝中区', '500100', '渝中', '3', '023', '400010', '中国,重庆,重庆市,渝中区', '106.569', '29.5528', 'Yuzhong');
INSERT INTO `ctshop_region` VALUES ('500104', '大渡口区', '500100', '大渡口', '3', '023', '400080', '中国,重庆,重庆市,大渡口区', '106.483', '29.4845', 'Dadukou');
INSERT INTO `ctshop_region` VALUES ('500105', '江北区', '500100', '江北', '3', '023', '400020', '中国,重庆,重庆市,江北区', '106.574', '29.6066', 'Jiangbei');
INSERT INTO `ctshop_region` VALUES ('500106', '沙坪坝区', '500100', '沙坪坝', '3', '023', '400030', '中国,重庆,重庆市,沙坪坝区', '106.458', '29.5411', 'Shapingba');
INSERT INTO `ctshop_region` VALUES ('500107', '九龙坡区', '500100', '九龙坡', '3', '023', '400050', '中国,重庆,重庆市,九龙坡区', '106.511', '29.502', 'Jiulongpo');
INSERT INTO `ctshop_region` VALUES ('500108', '南岸区', '500100', '南岸', '3', '023', '400064', '中国,重庆,重庆市,南岸区', '106.563', '29.5231', 'Nan\'an');
INSERT INTO `ctshop_region` VALUES ('500109', '北碚区', '500100', '北碚', '3', '023', '400700', '中国,重庆,重庆市,北碚区', '106.396', '29.8057', 'Beibei');
INSERT INTO `ctshop_region` VALUES ('500110', '綦江区', '500100', '綦江', '3', '023', '400800', '中国,重庆,重庆市,綦江区', '106.927', '28.9607', 'Qijiang');
INSERT INTO `ctshop_region` VALUES ('500111', '大足区', '500100', '大足', '3', '023', '400900', '中国,重庆,重庆市,大足区', '105.768', '29.484', 'Dazu');
INSERT INTO `ctshop_region` VALUES ('500112', '渝北区', '500100', '渝北', '3', '023', '401120', '中国,重庆,重庆市,渝北区', '106.631', '29.7182', 'Yubei');
INSERT INTO `ctshop_region` VALUES ('500113', '巴南区', '500100', '巴南', '3', '023', '401320', '中国,重庆,重庆市,巴南区', '106.524', '29.3831', 'Banan');
INSERT INTO `ctshop_region` VALUES ('500114', '黔江区', '500100', '黔江', '3', '023', '409700', '中国,重庆,重庆市,黔江区', '108.771', '29.5332', 'Qianjiang');
INSERT INTO `ctshop_region` VALUES ('500115', '长寿区', '500100', '长寿', '3', '023', '401220', '中国,重庆,重庆市,长寿区', '107.082', '29.8536', 'Changshou');
INSERT INTO `ctshop_region` VALUES ('500116', '江津区', '500100', '江津', '3', '023', '402260', '中国,重庆,重庆市,江津区', '106.259', '29.2901', 'Jiangjin');
INSERT INTO `ctshop_region` VALUES ('500117', '合川区', '500100', '合川', '3', '023', '401520', '中国,重庆,重庆市,合川区', '106.276', '29.9723', 'Hechuan');
INSERT INTO `ctshop_region` VALUES ('500118', '永川区', '500100', '永川', '3', '023', '402160', '中国,重庆,重庆市,永川区', '105.927', '29.3559', 'Yongchuan');
INSERT INTO `ctshop_region` VALUES ('500119', '南川区', '500100', '南川', '3', '023', '408400', '中国,重庆,重庆市,南川区', '107.099', '29.1575', 'Nanchuan');
INSERT INTO `ctshop_region` VALUES ('500120', '璧山区', '500100', '璧山', '3', '023', '402760', '中国,重庆,重庆市,璧山区', '106.231', '29.5936', 'Bishan');
INSERT INTO `ctshop_region` VALUES ('500151', '铜梁区', '500100', '铜梁', '3', '023', '402560', '中国,重庆,重庆市,铜梁区', '106.055', '29.8399', 'Tongliang');
INSERT INTO `ctshop_region` VALUES ('500223', '潼南县', '500100', '潼南', '3', '023', '402660', '中国,重庆,重庆市,潼南县', '105.84', '30.1912', 'Tongnan');
INSERT INTO `ctshop_region` VALUES ('500226', '荣昌县', '500100', '荣昌', '3', '023', '402460', '中国,重庆,重庆市,荣昌县', '105.594', '29.4049', 'Rongchang');
INSERT INTO `ctshop_region` VALUES ('500228', '梁平县', '500100', '梁平', '3', '023', '405200', '中国,重庆,重庆市,梁平县', '107.8', '30.6754', 'Liangping');
INSERT INTO `ctshop_region` VALUES ('500229', '城口县', '500100', '城口', '3', '023', '405900', '中国,重庆,重庆市,城口县', '108.665', '31.948', 'Chengkou');
INSERT INTO `ctshop_region` VALUES ('500230', '丰都县', '500100', '丰都', '3', '023', '408200', '中国,重庆,重庆市,丰都县', '107.731', '29.8635', 'Fengdu');
INSERT INTO `ctshop_region` VALUES ('500231', '垫江县', '500100', '垫江', '3', '023', '408300', '中国,重庆,重庆市,垫江县', '107.354', '30.3336', 'Dianjiang');
INSERT INTO `ctshop_region` VALUES ('500232', '武隆县', '500100', '武隆', '3', '023', '408500', '中国,重庆,重庆市,武隆县', '107.76', '29.3255', 'Wulong');
INSERT INTO `ctshop_region` VALUES ('500233', '忠县', '500100', '忠县', '3', '023', '404300', '中国,重庆,重庆市,忠县', '108.037', '30.289', 'Zhongxian');
INSERT INTO `ctshop_region` VALUES ('500234', '开县', '500100', '开县', '3', '023', '405400', '中国,重庆,重庆市,开县', '108.393', '31.1609', 'Kaixian');
INSERT INTO `ctshop_region` VALUES ('500235', '云阳县', '500100', '云阳', '3', '023', '404500', '中国,重庆,重庆市,云阳县', '108.697', '30.9306', 'Yunyang');
INSERT INTO `ctshop_region` VALUES ('500236', '奉节县', '500100', '奉节', '3', '023', '404600', '中国,重庆,重庆市,奉节县', '109.465', '31.0182', 'Fengjie');
INSERT INTO `ctshop_region` VALUES ('500237', '巫山县', '500100', '巫山', '3', '023', '404700', '中国,重庆,重庆市,巫山县', '109.878', '31.0746', 'Wushan');
INSERT INTO `ctshop_region` VALUES ('500238', '巫溪县', '500100', '巫溪', '3', '023', '405800', '中国,重庆,重庆市,巫溪县', '109.631', '31.3976', 'Wuxi');
INSERT INTO `ctshop_region` VALUES ('500240', '石柱土家族自治县', '500100', '石柱', '3', '023', '409100', '中国,重庆,重庆市,石柱土家族自治县', '108.114', '30.0005', 'Shizhu');
INSERT INTO `ctshop_region` VALUES ('500241', '秀山土家族苗族自治县', '500100', '秀山', '3', '023', '409900', '中国,重庆,重庆市,秀山土家族苗族自治县', '108.989', '28.4506', 'Xiushan');
INSERT INTO `ctshop_region` VALUES ('500242', '酉阳土家族苗族自治县', '500100', '酉阳', '3', '023', '409800', '中国,重庆,重庆市,酉阳土家族苗族自治县', '108.772', '28.8446', 'Youyang');
INSERT INTO `ctshop_region` VALUES ('500243', '彭水苗族土家族自治县', '500100', '彭水', '3', '023', '409600', '中国,重庆,重庆市,彭水苗族土家族自治县', '108.166', '29.2952', 'Pengshui');
INSERT INTO `ctshop_region` VALUES ('500300', '两江新区', '500000', '两江新区', '2', '023', '400000', '中国,重庆,两江新区', '106.463', '29.7292', 'Liangjiangxinqu');
INSERT INTO `ctshop_region` VALUES ('500301', '北部新区', '500300', '北部新区', '3', '023', '400000', '中国,重庆,两江新区,北部新区', '106.489', '29.6671', 'Beibuxinqu');
INSERT INTO `ctshop_region` VALUES ('500302', '保税港区', '500300', '保税港区', '3', '023', '400000', '中国,重庆,两江新区,保税港区', '106.638', '29.7163', 'Baoshuigangqu');
INSERT INTO `ctshop_region` VALUES ('500303', '工业园区', '500300', '工业园区', '3', '023', '400000', '中国,重庆,两江新区,工业园区', '106.626', '29.5555', 'Gongyeyuanqu');
INSERT INTO `ctshop_region` VALUES ('510000', '四川省', '100000', '四川', '1', '', '', '中国,四川省', '104.066', '30.6595', 'Sichuan');
INSERT INTO `ctshop_region` VALUES ('510100', '成都市', '510000', '成都', '2', '028', '610015', '中国,四川省,成都市', '104.066', '30.6595', 'Chengdu');
INSERT INTO `ctshop_region` VALUES ('510104', '锦江区', '510100', '锦江', '3', '028', '610021', '中国,四川省,成都市,锦江区', '104.083', '30.6561', 'Jinjiang');
INSERT INTO `ctshop_region` VALUES ('510105', '青羊区', '510100', '青羊', '3', '028', '610031', '中国,四川省,成都市,青羊区', '104.062', '30.6739', 'Qingyang');
INSERT INTO `ctshop_region` VALUES ('510106', '金牛区', '510100', '金牛', '3', '028', '610036', '中国,四川省,成都市,金牛区', '104.051', '30.6913', 'Jinniu');
INSERT INTO `ctshop_region` VALUES ('510107', '武侯区', '510100', '武侯', '3', '028', '610041', '中国,四川省,成都市,武侯区', '104.043', '30.6423', 'Wuhou');
INSERT INTO `ctshop_region` VALUES ('510108', '成华区', '510100', '成华', '3', '028', '610066', '中国,四川省,成都市,成华区', '104.102', '30.6599', 'Chenghua');
INSERT INTO `ctshop_region` VALUES ('510112', '龙泉驿区', '510100', '龙泉驿', '3', '028', '610100', '中国,四川省,成都市,龙泉驿区', '104.275', '30.5566', 'Longquanyi');
INSERT INTO `ctshop_region` VALUES ('510113', '青白江区', '510100', '青白江', '3', '028', '610300', '中国,四川省,成都市,青白江区', '104.251', '30.8784', 'Qingbaijiang');
INSERT INTO `ctshop_region` VALUES ('510114', '新都区', '510100', '新都', '3', '028', '610500', '中国,四川省,成都市,新都区', '104.159', '30.8231', 'Xindu');
INSERT INTO `ctshop_region` VALUES ('510115', '温江区', '510100', '温江', '3', '028', '611130', '中国,四川省,成都市,温江区', '103.849', '30.6844', 'Wenjiang');
INSERT INTO `ctshop_region` VALUES ('510121', '金堂县', '510100', '金堂', '3', '028', '610400', '中国,四川省,成都市,金堂县', '104.412', '30.8619', 'Jintang');
INSERT INTO `ctshop_region` VALUES ('510122', '双流县', '510100', '双流', '3', '028', '610200', '中国,四川省,成都市,双流县', '103.924', '30.5744', 'Shuangliu');
INSERT INTO `ctshop_region` VALUES ('510124', '郫县', '510100', '郫县', '3', '028', '611730', '中国,四川省,成都市,郫县', '103.887', '30.8105', 'Pixian');
INSERT INTO `ctshop_region` VALUES ('510129', '大邑县', '510100', '大邑', '3', '028', '611330', '中国,四川省,成都市,大邑县', '103.521', '30.5874', 'Dayi');
INSERT INTO `ctshop_region` VALUES ('510131', '蒲江县', '510100', '蒲江', '3', '028', '611630', '中国,四川省,成都市,蒲江县', '103.506', '30.1967', 'Pujiang');
INSERT INTO `ctshop_region` VALUES ('510132', '新津县', '510100', '新津', '3', '028', '611430', '中国,四川省,成都市,新津县', '103.811', '30.4098', 'Xinjin');
INSERT INTO `ctshop_region` VALUES ('510181', '都江堰市', '510100', '都江堰', '3', '028', '611830', '中国,四川省,成都市,都江堰市', '103.619', '30.9982', 'Dujiangyan');
INSERT INTO `ctshop_region` VALUES ('510182', '彭州市', '510100', '彭州', '3', '028', '611930', '中国,四川省,成都市,彭州市', '103.958', '30.9901', 'Pengzhou');
INSERT INTO `ctshop_region` VALUES ('510183', '邛崃市', '510100', '邛崃', '3', '028', '611530', '中国,四川省,成都市,邛崃市', '103.463', '30.4149', 'Qionglai');
INSERT INTO `ctshop_region` VALUES ('510184', '崇州市', '510100', '崇州', '3', '028', '611230', '中国,四川省,成都市,崇州市', '103.673', '30.6301', 'Chongzhou');
INSERT INTO `ctshop_region` VALUES ('510300', '自贡市', '510000', '自贡', '2', '0813', '643000', '中国,四川省,自贡市', '104.773', '29.3528', 'Zigong');
INSERT INTO `ctshop_region` VALUES ('510302', '自流井区', '510300', '自流井', '3', '0813', '643000', '中国,四川省,自贡市,自流井区', '104.777', '29.3375', 'Ziliujing');
INSERT INTO `ctshop_region` VALUES ('510303', '贡井区', '510300', '贡井', '3', '0813', '643020', '中国,四川省,自贡市,贡井区', '104.715', '29.3458', 'Gongjing');
INSERT INTO `ctshop_region` VALUES ('510304', '大安区', '510300', '大安', '3', '0813', '643010', '中国,四川省,自贡市,大安区', '104.774', '29.3636', 'Da\'an');
INSERT INTO `ctshop_region` VALUES ('510311', '沿滩区', '510300', '沿滩', '3', '0813', '643030', '中国,四川省,自贡市,沿滩区', '104.88', '29.2661', 'Yantan');
INSERT INTO `ctshop_region` VALUES ('510321', '荣县', '510300', '荣县', '3', '0813', '643100', '中国,四川省,自贡市,荣县', '104.418', '29.4445', 'Rongxian');
INSERT INTO `ctshop_region` VALUES ('510322', '富顺县', '510300', '富顺', '3', '0813', '643200', '中国,四川省,自贡市,富顺县', '104.975', '29.1812', 'Fushun');
INSERT INTO `ctshop_region` VALUES ('510400', '攀枝花市', '510000', '攀枝花', '2', '0812', '617000', '中国,四川省,攀枝花市', '101.716', '26.5804', 'Panzhihua');
INSERT INTO `ctshop_region` VALUES ('510402', '东区', '510400', '东区', '3', '0812', '617067', '中国,四川省,攀枝花市,东区', '101.705', '26.5468', 'Dongqu');
INSERT INTO `ctshop_region` VALUES ('510403', '西区', '510400', '西区', '3', '0812', '617068', '中国,四川省,攀枝花市,西区', '101.631', '26.5975', 'Xiqu');
INSERT INTO `ctshop_region` VALUES ('510411', '仁和区', '510400', '仁和', '3', '0812', '617061', '中国,四川省,攀枝花市,仁和区', '101.738', '26.4984', 'Renhe');
INSERT INTO `ctshop_region` VALUES ('510421', '米易县', '510400', '米易', '3', '0812', '617200', '中国,四川省,攀枝花市,米易县', '102.111', '26.8872', 'Miyi');
INSERT INTO `ctshop_region` VALUES ('510422', '盐边县', '510400', '盐边', '3', '0812', '617100', '中国,四川省,攀枝花市,盐边县', '101.854', '26.6885', 'Yanbian');
INSERT INTO `ctshop_region` VALUES ('510500', '泸州市', '510000', '泸州', '2', '0830', '646000', '中国,四川省,泸州市', '105.443', '28.8891', 'Luzhou');
INSERT INTO `ctshop_region` VALUES ('510502', '江阳区', '510500', '江阳', '3', '0830', '646000', '中国,四川省,泸州市,江阳区', '105.453', '28.8893', 'Jiangyang');
INSERT INTO `ctshop_region` VALUES ('510503', '纳溪区', '510500', '纳溪', '3', '0830', '646300', '中国,四川省,泸州市,纳溪区', '105.373', '28.7734', 'Naxi');
INSERT INTO `ctshop_region` VALUES ('510504', '龙马潭区', '510500', '龙马潭', '3', '0830', '646000', '中国,四川省,泸州市,龙马潭区', '105.438', '28.9131', 'Longmatan');
INSERT INTO `ctshop_region` VALUES ('510521', '泸县', '510500', '泸县', '3', '0830', '646106', '中国,四川省,泸州市,泸县', '105.382', '29.1504', 'Luxian');
INSERT INTO `ctshop_region` VALUES ('510522', '合江县', '510500', '合江', '3', '0830', '646200', '中国,四川省,泸州市,合江县', '105.835', '28.81', 'Hejiang');
INSERT INTO `ctshop_region` VALUES ('510524', '叙永县', '510500', '叙永', '3', '0830', '646400', '中国,四川省,泸州市,叙永县', '105.445', '28.1559', 'Xuyong');
INSERT INTO `ctshop_region` VALUES ('510525', '古蔺县', '510500', '古蔺', '3', '0830', '646500', '中国,四川省,泸州市,古蔺县', '105.813', '28.0387', 'Gulin');
INSERT INTO `ctshop_region` VALUES ('510600', '德阳市', '510000', '德阳', '2', '0838', '618000', '中国,四川省,德阳市', '104.399', '31.128', 'Deyang');
INSERT INTO `ctshop_region` VALUES ('510603', '旌阳区', '510600', '旌阳', '3', '0838', '618000', '中国,四川省,德阳市,旌阳区', '104.394', '31.1391', 'Jingyang');
INSERT INTO `ctshop_region` VALUES ('510623', '中江县', '510600', '中江', '3', '0838', '618100', '中国,四川省,德阳市,中江县', '104.679', '31.033', 'Zhongjiang');
INSERT INTO `ctshop_region` VALUES ('510626', '罗江县', '510600', '罗江', '3', '0838', '618500', '中国,四川省,德阳市,罗江县', '104.51', '31.3167', 'Luojiang');
INSERT INTO `ctshop_region` VALUES ('510681', '广汉市', '510600', '广汉', '3', '0838', '618300', '中国,四川省,德阳市,广汉市', '104.282', '30.9769', 'Guanghan');
INSERT INTO `ctshop_region` VALUES ('510682', '什邡市', '510600', '什邡', '3', '0838', '618400', '中国,四川省,德阳市,什邡市', '104.168', '31.1264', 'Shifang');
INSERT INTO `ctshop_region` VALUES ('510683', '绵竹市', '510600', '绵竹', '3', '0838', '618200', '中国,四川省,德阳市,绵竹市', '104.221', '31.3377', 'Mianzhu');
INSERT INTO `ctshop_region` VALUES ('510700', '绵阳市', '510000', '绵阳', '2', '0816', '621000', '中国,四川省,绵阳市', '104.742', '31.464', 'Mianyang');
INSERT INTO `ctshop_region` VALUES ('510703', '涪城区', '510700', '涪城', '3', '0816', '621000', '中国,四川省,绵阳市,涪城区', '104.757', '31.4552', 'Fucheng');
INSERT INTO `ctshop_region` VALUES ('510704', '游仙区', '510700', '游仙', '3', '0816', '621022', '中国,四川省,绵阳市,游仙区', '104.771', '31.4657', 'Youxian');
INSERT INTO `ctshop_region` VALUES ('510722', '三台县', '510700', '三台', '3', '0816', '621100', '中国,四川省,绵阳市,三台县', '105.091', '31.0918', 'Santai');
INSERT INTO `ctshop_region` VALUES ('510723', '盐亭县', '510700', '盐亭', '3', '0816', '621600', '中国,四川省,绵阳市,盐亭县', '105.39', '31.2218', 'Yanting');
INSERT INTO `ctshop_region` VALUES ('510724', '安县', '510700', '安县', '3', '0816', '622650', '中国,四川省,绵阳市,安县', '104.567', '31.5349', 'Anxian');
INSERT INTO `ctshop_region` VALUES ('510725', '梓潼县', '510700', '梓潼', '3', '0816', '622150', '中国,四川省,绵阳市,梓潼县', '105.162', '31.6359', 'Zitong');
INSERT INTO `ctshop_region` VALUES ('510726', '北川羌族自治县', '510700', '北川', '3', '0816', '622750', '中国,四川省,绵阳市,北川羌族自治县', '104.464', '31.8329', 'Beichuan');
INSERT INTO `ctshop_region` VALUES ('510727', '平武县', '510700', '平武', '3', '0816', '622550', '中国,四川省,绵阳市,平武县', '104.529', '32.4079', 'Pingwu');
INSERT INTO `ctshop_region` VALUES ('510781', '江油市', '510700', '江油', '3', '0816', '621700', '中国,四川省,绵阳市,江油市', '104.745', '31.7778', 'Jiangyou');
INSERT INTO `ctshop_region` VALUES ('510800', '广元市', '510000', '广元', '2', '0839', '628000', '中国,四川省,广元市', '105.83', '32.4337', 'Guangyuan');
INSERT INTO `ctshop_region` VALUES ('510802', '利州区', '510800', '利州', '3', '0839', '628017', '中国,四川省,广元市,利州区', '105.826', '32.4323', 'Lizhou');
INSERT INTO `ctshop_region` VALUES ('510811', '昭化区', '510800', '昭化', '3', '0839', '628017', '中国,四川省,广元市,昭化区', '105.64', '32.3865', 'Zhaohua');
INSERT INTO `ctshop_region` VALUES ('510812', '朝天区', '510800', '朝天', '3', '0839', '628017', '中国,四川省,广元市,朝天区', '105.893', '32.644', 'Chaotian');
INSERT INTO `ctshop_region` VALUES ('510821', '旺苍县', '510800', '旺苍', '3', '0839', '628200', '中国,四川省,广元市,旺苍县', '106.29', '32.2285', 'Wangcang');
INSERT INTO `ctshop_region` VALUES ('510822', '青川县', '510800', '青川', '3', '0839', '628100', '中国,四川省,广元市,青川县', '105.239', '32.5856', 'Qingchuan');
INSERT INTO `ctshop_region` VALUES ('510823', '剑阁县', '510800', '剑阁', '3', '0839', '628300', '中国,四川省,广元市,剑阁县', '105.525', '32.2884', 'Jiange');
INSERT INTO `ctshop_region` VALUES ('510824', '苍溪县', '510800', '苍溪', '3', '0839', '628400', '中国,四川省,广元市,苍溪县', '105.936', '31.7321', 'Cangxi');
INSERT INTO `ctshop_region` VALUES ('510900', '遂宁市', '510000', '遂宁', '2', '0825', '629000', '中国,四川省,遂宁市', '105.571', '30.5133', 'Suining');
INSERT INTO `ctshop_region` VALUES ('510903', '船山区', '510900', '船山', '3', '0825', '629000', '中国,四川省,遂宁市,船山区', '105.581', '30.4999', 'Chuanshan');
INSERT INTO `ctshop_region` VALUES ('510904', '安居区', '510900', '安居', '3', '0825', '629000', '中国,四川省,遂宁市,安居区', '105.464', '30.3578', 'Anju');
INSERT INTO `ctshop_region` VALUES ('510921', '蓬溪县', '510900', '蓬溪', '3', '0825', '629100', '中国,四川省,遂宁市,蓬溪县', '105.708', '30.7577', 'Pengxi');
INSERT INTO `ctshop_region` VALUES ('510922', '射洪县', '510900', '射洪', '3', '0825', '629200', '中国,四川省,遂宁市,射洪县', '105.389', '30.872', 'Shehong');
INSERT INTO `ctshop_region` VALUES ('510923', '大英县', '510900', '大英', '3', '0825', '629300', '中国,四川省,遂宁市,大英县', '105.243', '30.5943', 'Daying');
INSERT INTO `ctshop_region` VALUES ('511000', '内江市', '510000', '内江', '2', '0832', '641000', '中国,四川省,内江市', '105.066', '29.5871', 'Neijiang');
INSERT INTO `ctshop_region` VALUES ('511002', '市中区', '511000', '市中区', '3', '0832', '641000', '中国,四川省,内江市,市中区', '105.068', '29.5871', 'Shizhongqu');
INSERT INTO `ctshop_region` VALUES ('511011', '东兴区', '511000', '东兴', '3', '0832', '641100', '中国,四川省,内江市,东兴区', '105.076', '29.5928', 'Dongxing');
INSERT INTO `ctshop_region` VALUES ('511024', '威远县', '511000', '威远', '3', '0832', '642450', '中国,四川省,内江市,威远县', '104.67', '29.5282', 'Weiyuan');
INSERT INTO `ctshop_region` VALUES ('511025', '资中县', '511000', '资中', '3', '0832', '641200', '中国,四川省,内江市,资中县', '104.852', '29.7641', 'Zizhong');
INSERT INTO `ctshop_region` VALUES ('511028', '隆昌县', '511000', '隆昌', '3', '0832', '642150', '中国,四川省,内江市,隆昌县', '105.287', '29.3394', 'Longchang');
INSERT INTO `ctshop_region` VALUES ('511100', '乐山市', '510000', '乐山', '2', '0833', '614000', '中国,四川省,乐山市', '103.761', '29.582', 'Leshan');
INSERT INTO `ctshop_region` VALUES ('511102', '市中区', '511100', '市中区', '3', '0833', '614000', '中国,四川省,乐山市,市中区', '103.762', '29.5554', 'Shizhongqu');
INSERT INTO `ctshop_region` VALUES ('511111', '沙湾区', '511100', '沙湾', '3', '0833', '614900', '中国,四川省,乐山市,沙湾区', '103.549', '29.4119', 'Shawan');
INSERT INTO `ctshop_region` VALUES ('511112', '五通桥区', '511100', '五通桥', '3', '0833', '614800', '中国,四川省,乐山市,五通桥区', '103.823', '29.4034', 'Wutongqiao');
INSERT INTO `ctshop_region` VALUES ('511113', '金口河区', '511100', '金口河', '3', '0833', '614700', '中国,四川省,乐山市,金口河区', '103.079', '29.2458', 'Jinkouhe');
INSERT INTO `ctshop_region` VALUES ('511123', '犍为县', '511100', '犍为', '3', '0833', '614400', '中国,四川省,乐山市,犍为县', '103.95', '29.2097', 'Qianwei');
INSERT INTO `ctshop_region` VALUES ('511124', '井研县', '511100', '井研', '3', '0833', '613100', '中国,四川省,乐山市,井研县', '104.07', '29.6523', 'Jingyan');
INSERT INTO `ctshop_region` VALUES ('511126', '夹江县', '511100', '夹江', '3', '0833', '614100', '中国,四川省,乐山市,夹江县', '103.572', '29.7387', 'Jiajiang');
INSERT INTO `ctshop_region` VALUES ('511129', '沐川县', '511100', '沐川', '3', '0833', '614500', '中国,四川省,乐山市,沐川县', '103.904', '28.9565', 'Muchuan');
INSERT INTO `ctshop_region` VALUES ('511132', '峨边彝族自治县', '511100', '峨边', '3', '0833', '614300', '中国,四川省,乐山市,峨边彝族自治县', '103.263', '29.23', 'Ebian');
INSERT INTO `ctshop_region` VALUES ('511133', '马边彝族自治县', '511100', '马边', '3', '0833', '614600', '中国,四川省,乐山市,马边彝族自治县', '103.546', '28.8359', 'Mabian');
INSERT INTO `ctshop_region` VALUES ('511181', '峨眉山市', '511100', '峨眉山', '3', '0833', '614200', '中国,四川省,乐山市,峨眉山市', '103.484', '29.6012', 'Emeishan');
INSERT INTO `ctshop_region` VALUES ('511300', '南充市', '510000', '南充', '2', '0817', '637000', '中国,四川省,南充市', '106.083', '30.7953', 'Nanchong');
INSERT INTO `ctshop_region` VALUES ('511302', '顺庆区', '511300', '顺庆', '3', '0817', '637000', '中国,四川省,南充市,顺庆区', '106.092', '30.7964', 'Shunqing');
INSERT INTO `ctshop_region` VALUES ('511303', '高坪区', '511300', '高坪', '3', '0817', '637100', '中国,四川省,南充市,高坪区', '106.119', '30.7816', 'Gaoping');
INSERT INTO `ctshop_region` VALUES ('511304', '嘉陵区', '511300', '嘉陵', '3', '0817', '637100', '中国,四川省,南充市,嘉陵区', '106.071', '30.7585', 'Jialing');
INSERT INTO `ctshop_region` VALUES ('511321', '南部县', '511300', '南部', '3', '0817', '637300', '中国,四川省,南充市,南部县', '106.067', '31.3545', 'Nanbu');
INSERT INTO `ctshop_region` VALUES ('511322', '营山县', '511300', '营山', '3', '0817', '637700', '中国,四川省,南充市,营山县', '106.566', '31.0775', 'Yingshan');
INSERT INTO `ctshop_region` VALUES ('511323', '蓬安县', '511300', '蓬安', '3', '0817', '637800', '中国,四川省,南充市,蓬安县', '106.413', '31.0296', 'Peng\'an');
INSERT INTO `ctshop_region` VALUES ('511324', '仪陇县', '511300', '仪陇', '3', '0817', '637600', '中国,四川省,南充市,仪陇县', '106.3', '31.2763', 'Yilong');
INSERT INTO `ctshop_region` VALUES ('511325', '西充县', '511300', '西充', '3', '0817', '637200', '中国,四川省,南充市,西充县', '105.9', '30.9969', 'Xichong');
INSERT INTO `ctshop_region` VALUES ('511381', '阆中市', '511300', '阆中', '3', '0817', '637400', '中国,四川省,南充市,阆中市', '106.005', '31.5583', 'Langzhong');
INSERT INTO `ctshop_region` VALUES ('511400', '眉山市', '510000', '眉山', '2', '028', '620020', '中国,四川省,眉山市', '103.832', '30.0483', 'Meishan');
INSERT INTO `ctshop_region` VALUES ('511402', '东坡区', '511400', '东坡', '3', '028', '620010', '中国,四川省,眉山市,东坡区', '103.832', '30.0422', 'Dongpo');
INSERT INTO `ctshop_region` VALUES ('511403', '彭山区', '511400', '彭山', '3', '028', '620860', '中国,四川省,眉山市,彭山区', '103.873', '30.1928', 'Pengshan');
INSERT INTO `ctshop_region` VALUES ('511421', '仁寿县', '511400', '仁寿', '3', '028', '620500', '中国,四川省,眉山市,仁寿县', '104.134', '29.996', 'Renshou');
INSERT INTO `ctshop_region` VALUES ('511423', '洪雅县', '511400', '洪雅', '3', '028', '620360', '中国,四川省,眉山市,洪雅县', '103.373', '29.9066', 'Hongya');
INSERT INTO `ctshop_region` VALUES ('511424', '丹棱县', '511400', '丹棱', '3', '028', '620200', '中国,四川省,眉山市,丹棱县', '103.513', '30.0156', 'Danling');
INSERT INTO `ctshop_region` VALUES ('511425', '青神县', '511400', '青神', '3', '028', '620460', '中国,四川省,眉山市,青神县', '103.848', '29.8323', 'Qingshen');
INSERT INTO `ctshop_region` VALUES ('511500', '宜宾市', '510000', '宜宾', '2', '0831', '644000', '中国,四川省,宜宾市', '104.631', '28.7602', 'Yibin');
INSERT INTO `ctshop_region` VALUES ('511502', '翠屏区', '511500', '翠屏', '3', '0831', '644000', '中国,四川省,宜宾市,翠屏区', '104.62', '28.7657', 'Cuiping');
INSERT INTO `ctshop_region` VALUES ('511503', '南溪区', '511500', '南溪', '3', '0831', '644100', '中国,四川省,宜宾市,南溪区', '104.981', '28.8398', 'Nanxi');
INSERT INTO `ctshop_region` VALUES ('511521', '宜宾县', '511500', '宜宾', '3', '0831', '644600', '中国,四川省,宜宾市,宜宾县', '104.533', '28.69', 'Yibin');
INSERT INTO `ctshop_region` VALUES ('511523', '江安县', '511500', '江安', '3', '0831', '644200', '中国,四川省,宜宾市,江安县', '105.067', '28.7239', 'Jiang\'an');
INSERT INTO `ctshop_region` VALUES ('511524', '长宁县', '511500', '长宁', '3', '0831', '644300', '中国,四川省,宜宾市,长宁县', '104.925', '28.5778', 'Changning');
INSERT INTO `ctshop_region` VALUES ('511525', '高县', '511500', '高县', '3', '0831', '645150', '中国,四川省,宜宾市,高县', '104.518', '28.4362', 'Gaoxian');
INSERT INTO `ctshop_region` VALUES ('511526', '珙县', '511500', '珙县', '3', '0831', '644500', '中国,四川省,宜宾市,珙县', '104.714', '28.4451', 'Gongxian');
INSERT INTO `ctshop_region` VALUES ('511527', '筠连县', '511500', '筠连', '3', '0831', '645250', '中国,四川省,宜宾市,筠连县', '104.512', '28.1649', 'Junlian');
INSERT INTO `ctshop_region` VALUES ('511528', '兴文县', '511500', '兴文', '3', '0831', '644400', '中国,四川省,宜宾市,兴文县', '105.237', '28.3044', 'Xingwen');
INSERT INTO `ctshop_region` VALUES ('511529', '屏山县', '511500', '屏山', '3', '0831', '645350', '中国,四川省,宜宾市,屏山县', '104.163', '28.6437', 'Pingshan');
INSERT INTO `ctshop_region` VALUES ('511600', '广安市', '510000', '广安', '2', '0826', '638000', '中国,四川省,广安市', '106.633', '30.4564', 'Guang\'an');
INSERT INTO `ctshop_region` VALUES ('511602', '广安区', '511600', '广安', '3', '0826', '638000', '中国,四川省,广安市,广安区', '106.642', '30.4739', 'Guang\'an');
INSERT INTO `ctshop_region` VALUES ('511603', '前锋区', '511600', '前锋', '3', '0826', '638019', '中国,四川省,广安市,前锋区', '106.894', '30.4946', 'Qianfeng');
INSERT INTO `ctshop_region` VALUES ('511621', '岳池县', '511600', '岳池', '3', '0826', '638300', '中国,四川省,广安市,岳池县', '106.441', '30.5392', 'Yuechi');
INSERT INTO `ctshop_region` VALUES ('511622', '武胜县', '511600', '武胜', '3', '0826', '638400', '中国,四川省,广安市,武胜县', '106.296', '30.3493', 'Wusheng');
INSERT INTO `ctshop_region` VALUES ('511623', '邻水县', '511600', '邻水', '3', '0826', '638500', '中国,四川省,广安市,邻水县', '106.93', '30.3345', 'Linshui');
INSERT INTO `ctshop_region` VALUES ('511681', '华蓥市', '511600', '华蓥', '3', '0826', '638600', '中国,四川省,广安市,华蓥市', '106.785', '30.3901', 'Huaying');
INSERT INTO `ctshop_region` VALUES ('511700', '达州市', '510000', '达州', '2', '0818', '635000', '中国,四川省,达州市', '107.502', '31.2095', 'Dazhou');
INSERT INTO `ctshop_region` VALUES ('511702', '通川区', '511700', '通川', '3', '0818', '635000', '中国,四川省,达州市,通川区', '107.505', '31.2147', 'Tongchuan');
INSERT INTO `ctshop_region` VALUES ('511703', '达川区', '511700', '达川', '3', '0818', '635000', '中国,四川省,达州市,达川区', '107.502', '31.2095', 'Dachuan');
INSERT INTO `ctshop_region` VALUES ('511722', '宣汉县', '511700', '宣汉', '3', '0818', '636150', '中国,四川省,达州市,宣汉县', '107.728', '31.3552', 'Xuanhan');
INSERT INTO `ctshop_region` VALUES ('511723', '开江县', '511700', '开江', '3', '0818', '636250', '中国,四川省,达州市,开江县', '107.869', '31.0841', 'Kaijiang');
INSERT INTO `ctshop_region` VALUES ('511724', '大竹县', '511700', '大竹', '3', '0818', '635100', '中国,四川省,达州市,大竹县', '107.209', '30.7415', 'Dazhu');
INSERT INTO `ctshop_region` VALUES ('511725', '渠县', '511700', '渠县', '3', '0818', '635200', '中国,四川省,达州市,渠县', '106.974', '30.8376', 'Quxian');
INSERT INTO `ctshop_region` VALUES ('511781', '万源市', '511700', '万源', '3', '0818', '636350', '中国,四川省,达州市,万源市', '108.036', '32.0809', 'Wanyuan');
INSERT INTO `ctshop_region` VALUES ('511800', '雅安市', '510000', '雅安', '2', '0835', '625000', '中国,四川省,雅安市', '103.001', '29.9877', 'Ya\'an');
INSERT INTO `ctshop_region` VALUES ('511802', '雨城区', '511800', '雨城', '3', '0835', '625000', '中国,四川省,雅安市,雨城区', '103.033', '30.0053', 'Yucheng');
INSERT INTO `ctshop_region` VALUES ('511803', '名山区', '511800', '名山', '3', '0835', '625100', '中国,四川省,雅安市,名山区', '103.112', '30.0847', 'Mingshan');
INSERT INTO `ctshop_region` VALUES ('511822', '荥经县', '511800', '荥经', '3', '0835', '625200', '中国,四川省,雅安市,荥经县', '102.847', '29.794', 'Yingjing');
INSERT INTO `ctshop_region` VALUES ('511823', '汉源县', '511800', '汉源', '3', '0835', '625300', '中国,四川省,雅安市,汉源县', '102.678', '29.3517', 'Hanyuan');
INSERT INTO `ctshop_region` VALUES ('511824', '石棉县', '511800', '石棉', '3', '0835', '625400', '中国,四川省,雅安市,石棉县', '102.359', '29.228', 'Shimian');
INSERT INTO `ctshop_region` VALUES ('511825', '天全县', '511800', '天全', '3', '0835', '625500', '中国,四川省,雅安市,天全县', '102.759', '30.0675', 'Tianquan');
INSERT INTO `ctshop_region` VALUES ('511826', '芦山县', '511800', '芦山', '3', '0835', '625600', '中国,四川省,雅安市,芦山县', '102.928', '30.1437', 'Lushan');
INSERT INTO `ctshop_region` VALUES ('511827', '宝兴县', '511800', '宝兴', '3', '0835', '625700', '中国,四川省,雅安市,宝兴县', '102.816', '30.3684', 'Baoxing');
INSERT INTO `ctshop_region` VALUES ('511900', '巴中市', '510000', '巴中', '2', '0827', '636000', '中国,四川省,巴中市', '106.754', '31.8588', 'Bazhong');
INSERT INTO `ctshop_region` VALUES ('511902', '巴州区', '511900', '巴州', '3', '0827', '636001', '中国,四川省,巴中市,巴州区', '106.769', '31.8512', 'Bazhou');
INSERT INTO `ctshop_region` VALUES ('511903', '恩阳区', '511900', '恩阳', '3', '0827', '636064', '中国,四川省,巴中市,恩阳区', '106.754', '31.8588', 'Enyang');
INSERT INTO `ctshop_region` VALUES ('511921', '通江县', '511900', '通江', '3', '0827', '636700', '中国,四川省,巴中市,通江县', '107.244', '31.9129', 'Tongjiang');
INSERT INTO `ctshop_region` VALUES ('511922', '南江县', '511900', '南江', '3', '0827', '636600', '中国,四川省,巴中市,南江县', '106.842', '32.3534', 'Nanjiang');
INSERT INTO `ctshop_region` VALUES ('511923', '平昌县', '511900', '平昌', '3', '0827', '636400', '中国,四川省,巴中市,平昌县', '107.104', '31.5594', 'Pingchang');
INSERT INTO `ctshop_region` VALUES ('512000', '资阳市', '510000', '资阳', '2', '028', '641300', '中国,四川省,资阳市', '104.642', '30.1222', 'Ziyang');
INSERT INTO `ctshop_region` VALUES ('512002', '雁江区', '512000', '雁江', '3', '028', '641300', '中国,四川省,资阳市,雁江区', '104.652', '30.1152', 'Yanjiang');
INSERT INTO `ctshop_region` VALUES ('512021', '安岳县', '512000', '安岳', '3', '028', '642350', '中国,四川省,资阳市,安岳县', '105.336', '30.0979', 'Anyue');
INSERT INTO `ctshop_region` VALUES ('512022', '乐至县', '512000', '乐至', '3', '028', '641500', '中国,四川省,资阳市,乐至县', '105.032', '30.2723', 'Lezhi');
INSERT INTO `ctshop_region` VALUES ('512081', '简阳市', '512000', '简阳', '3', '028', '641400', '中国,四川省,资阳市,简阳市', '104.549', '30.3904', 'Jianyang');
INSERT INTO `ctshop_region` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '阿坝', '2', '0837', '624000', '中国,四川省,阿坝藏族羌族自治州', '102.221', '31.8998', 'Aba');
INSERT INTO `ctshop_region` VALUES ('513221', '汶川县', '513200', '汶川', '3', '0837', '623000', '中国,四川省,阿坝藏族羌族自治州,汶川县', '103.591', '31.4733', 'Wenchuan');
INSERT INTO `ctshop_region` VALUES ('513222', '理县', '513200', '理县', '3', '0837', '623100', '中国,四川省,阿坝藏族羌族自治州,理县', '103.172', '31.436', 'Lixian');
INSERT INTO `ctshop_region` VALUES ('513223', '茂县', '513200', '茂县', '3', '0837', '623200', '中国,四川省,阿坝藏族羌族自治州,茂县', '103.854', '31.682', 'Maoxian');
INSERT INTO `ctshop_region` VALUES ('513224', '松潘县', '513200', '松潘', '3', '0837', '623300', '中国,四川省,阿坝藏族羌族自治州,松潘县', '103.599', '32.6387', 'Songpan');
INSERT INTO `ctshop_region` VALUES ('513225', '九寨沟县', '513200', '九寨沟', '3', '0837', '623400', '中国,四川省,阿坝藏族羌族自治州,九寨沟县', '104.237', '33.2632', 'Jiuzhaigou');
INSERT INTO `ctshop_region` VALUES ('513226', '金川县', '513200', '金川', '3', '0837', '624100', '中国,四川省,阿坝藏族羌族自治州,金川县', '102.066', '31.4762', 'Jinchuan');
INSERT INTO `ctshop_region` VALUES ('513227', '小金县', '513200', '小金', '3', '0837', '624200', '中国,四川省,阿坝藏族羌族自治州,小金县', '102.365', '30.9993', 'Xiaojin');
INSERT INTO `ctshop_region` VALUES ('513228', '黑水县', '513200', '黑水', '3', '0837', '623500', '中国,四川省,阿坝藏族羌族自治州,黑水县', '102.992', '32.0618', 'Heishui');
INSERT INTO `ctshop_region` VALUES ('513229', '马尔康县', '513200', '马尔康', '3', '0837', '624000', '中国,四川省,阿坝藏族羌族自治州,马尔康县', '102.206', '31.9058', 'Maerkang');
INSERT INTO `ctshop_region` VALUES ('513230', '壤塘县', '513200', '壤塘', '3', '0837', '624300', '中国,四川省,阿坝藏族羌族自治州,壤塘县', '100.978', '32.2658', 'Rangtang');
INSERT INTO `ctshop_region` VALUES ('513231', '阿坝县', '513200', '阿坝', '3', '0837', '624600', '中国,四川省,阿坝藏族羌族自治州,阿坝县', '101.706', '32.903', 'Aba');
INSERT INTO `ctshop_region` VALUES ('513232', '若尔盖县', '513200', '若尔盖', '3', '0837', '624500', '中国,四川省,阿坝藏族羌族自治州,若尔盖县', '102.96', '33.5743', 'Ruoergai');
INSERT INTO `ctshop_region` VALUES ('513233', '红原县', '513200', '红原', '3', '0837', '624400', '中国,四川省,阿坝藏族羌族自治州,红原县', '102.545', '32.7899', 'Hongyuan');
INSERT INTO `ctshop_region` VALUES ('513300', '甘孜藏族自治州', '510000', '甘孜', '2', '0836', '626000', '中国,四川省,甘孜藏族自治州', '101.964', '30.0507', 'Garze');
INSERT INTO `ctshop_region` VALUES ('513321', '康定县', '513300', '康定', '3', '0836', '626000', '中国,四川省,甘孜藏族自治州,康定县', '101.965', '30.0553', 'Kangding');
INSERT INTO `ctshop_region` VALUES ('513322', '泸定县', '513300', '泸定', '3', '0836', '626100', '中国,四川省,甘孜藏族自治州,泸定县', '102.235', '29.9147', 'Luding');
INSERT INTO `ctshop_region` VALUES ('513323', '丹巴县', '513300', '丹巴', '3', '0836', '626300', '中国,四川省,甘孜藏族自治州,丹巴县', '101.884', '30.8766', 'Danba');
INSERT INTO `ctshop_region` VALUES ('513324', '九龙县', '513300', '九龙', '3', '0836', '626200', '中国,四川省,甘孜藏族自治州,九龙县', '101.508', '29.0009', 'Jiulong');
INSERT INTO `ctshop_region` VALUES ('513325', '雅江县', '513300', '雅江', '3', '0836', '627450', '中国,四川省,甘孜藏族自治州,雅江县', '101.015', '30.0328', 'Yajiang');
INSERT INTO `ctshop_region` VALUES ('513326', '道孚县', '513300', '道孚', '3', '0836', '626400', '中国,四川省,甘孜藏族自治州,道孚县', '101.126', '30.9805', 'Daofu');
INSERT INTO `ctshop_region` VALUES ('513327', '炉霍县', '513300', '炉霍', '3', '0836', '626500', '中国,四川省,甘孜藏族自治州,炉霍县', '100.677', '31.3917', 'Luhuo');
INSERT INTO `ctshop_region` VALUES ('513328', '甘孜县', '513300', '甘孜', '3', '0836', '626700', '中国,四川省,甘孜藏族自治州,甘孜县', '99.9931', '31.6267', 'Ganzi');
INSERT INTO `ctshop_region` VALUES ('513329', '新龙县', '513300', '新龙', '3', '0836', '626800', '中国,四川省,甘孜藏族自治州,新龙县', '100.312', '30.9407', 'Xinlong');
INSERT INTO `ctshop_region` VALUES ('513330', '德格县', '513300', '德格', '3', '0836', '627250', '中国,四川省,甘孜藏族自治州,德格县', '98.5808', '31.8062', 'Dege');
INSERT INTO `ctshop_region` VALUES ('513331', '白玉县', '513300', '白玉', '3', '0836', '627150', '中国,四川省,甘孜藏族自治州,白玉县', '98.8257', '31.209', 'Baiyu');
INSERT INTO `ctshop_region` VALUES ('513332', '石渠县', '513300', '石渠', '3', '0836', '627350', '中国,四川省,甘孜藏族自治州,石渠县', '98.1016', '32.9788', 'Shiqu');
INSERT INTO `ctshop_region` VALUES ('513333', '色达县', '513300', '色达', '3', '0836', '626600', '中国,四川省,甘孜藏族自治州,色达县', '100.332', '32.2684', 'Seda');
INSERT INTO `ctshop_region` VALUES ('513334', '理塘县', '513300', '理塘', '3', '0836', '627550', '中国,四川省,甘孜藏族自治州,理塘县', '100.27', '29.9967', 'Litang');
INSERT INTO `ctshop_region` VALUES ('513335', '巴塘县', '513300', '巴塘', '3', '0836', '627650', '中国,四川省,甘孜藏族自治州,巴塘县', '99.1041', '30.0042', 'Batang');
INSERT INTO `ctshop_region` VALUES ('513336', '乡城县', '513300', '乡城', '3', '0836', '627850', '中国,四川省,甘孜藏族自治州,乡城县', '99.7994', '28.9355', 'Xiangcheng');
INSERT INTO `ctshop_region` VALUES ('513337', '稻城县', '513300', '稻城', '3', '0836', '627750', '中国,四川省,甘孜藏族自治州,稻城县', '100.298', '29.0379', 'Daocheng');
INSERT INTO `ctshop_region` VALUES ('513338', '得荣县', '513300', '得荣', '3', '0836', '627950', '中国,四川省,甘孜藏族自治州,得荣县', '99.2863', '28.713', 'Derong');
INSERT INTO `ctshop_region` VALUES ('513400', '凉山彝族自治州', '510000', '凉山', '2', '0834', '615000', '中国,四川省,凉山彝族自治州', '102.259', '27.8868', 'Liangshan');
INSERT INTO `ctshop_region` VALUES ('513401', '西昌市', '513400', '西昌', '3', '0835', '615000', '中国,四川省,凉山彝族自治州,西昌市', '102.264', '27.8952', 'Xichang');
INSERT INTO `ctshop_region` VALUES ('513422', '木里藏族自治县', '513400', '木里', '3', '0851', '615800', '中国,四川省,凉山彝族自治州,木里藏族自治县', '101.28', '27.9287', 'Muli');
INSERT INTO `ctshop_region` VALUES ('513423', '盐源县', '513400', '盐源', '3', '0836', '615700', '中国,四川省,凉山彝族自治州,盐源县', '101.51', '27.4218', 'Yanyuan');
INSERT INTO `ctshop_region` VALUES ('513424', '德昌县', '513400', '德昌', '3', '0837', '615500', '中国,四川省,凉山彝族自治州,德昌县', '102.18', '27.4048', 'Dechang');
INSERT INTO `ctshop_region` VALUES ('513425', '会理县', '513400', '会理', '3', '0838', '615100', '中国,四川省,凉山彝族自治州,会理县', '102.245', '26.6563', 'Huili');
INSERT INTO `ctshop_region` VALUES ('513426', '会东县', '513400', '会东', '3', '0839', '615200', '中国,四川省,凉山彝族自治州,会东县', '102.578', '26.6343', 'Huidong');
INSERT INTO `ctshop_region` VALUES ('513427', '宁南县', '513400', '宁南', '3', '0840', '615400', '中国,四川省,凉山彝族自治州,宁南县', '102.761', '27.0657', 'Ningnan');
INSERT INTO `ctshop_region` VALUES ('513428', '普格县', '513400', '普格', '3', '0841', '615300', '中国,四川省,凉山彝族自治州,普格县', '102.541', '27.3748', 'Puge');
INSERT INTO `ctshop_region` VALUES ('513429', '布拖县', '513400', '布拖', '3', '0842', '616350', '中国,四川省,凉山彝族自治州,布拖县', '102.812', '27.7079', 'Butuo');
INSERT INTO `ctshop_region` VALUES ('513430', '金阳县', '513400', '金阳', '3', '0843', '616250', '中国,四川省,凉山彝族自治州,金阳县', '103.248', '27.697', 'Jinyang');
INSERT INTO `ctshop_region` VALUES ('513431', '昭觉县', '513400', '昭觉', '3', '0844', '616150', '中国,四川省,凉山彝族自治州,昭觉县', '102.847', '28.0116', 'Zhaojue');
INSERT INTO `ctshop_region` VALUES ('513432', '喜德县', '513400', '喜德', '3', '0845', '616750', '中国,四川省,凉山彝族自治州,喜德县', '102.413', '28.3074', 'Xide');
INSERT INTO `ctshop_region` VALUES ('513433', '冕宁县', '513400', '冕宁', '3', '0846', '615600', '中国,四川省,凉山彝族自治州,冕宁县', '102.171', '28.5516', 'Mianning');
INSERT INTO `ctshop_region` VALUES ('513434', '越西县', '513400', '越西', '3', '0847', '616650', '中国,四川省,凉山彝族自治州,越西县', '102.508', '28.6413', 'Yuexi');
INSERT INTO `ctshop_region` VALUES ('513435', '甘洛县', '513400', '甘洛', '3', '0848', '616850', '中国,四川省,凉山彝族自治州,甘洛县', '102.772', '28.9662', 'Ganluo');
INSERT INTO `ctshop_region` VALUES ('513436', '美姑县', '513400', '美姑', '3', '0849', '616450', '中国,四川省,凉山彝族自治州,美姑县', '103.131', '28.326', 'Meigu');
INSERT INTO `ctshop_region` VALUES ('513437', '雷波县', '513400', '雷波', '3', '0850', '616550', '中国,四川省,凉山彝族自治州,雷波县', '103.573', '28.2641', 'Leibo');
INSERT INTO `ctshop_region` VALUES ('520000', '贵州省', '100000', '贵州', '1', '', '', '中国,贵州省', '106.713', '26.5783', 'Guizhou');
INSERT INTO `ctshop_region` VALUES ('520100', '贵阳市', '520000', '贵阳', '2', '0851', '550001', '中国,贵州省,贵阳市', '106.713', '26.5783', 'Guiyang');
INSERT INTO `ctshop_region` VALUES ('520102', '南明区', '520100', '南明', '3', '0851', '550001', '中国,贵州省,贵阳市,南明区', '106.715', '26.5682', 'Nanming');
INSERT INTO `ctshop_region` VALUES ('520103', '云岩区', '520100', '云岩', '3', '0851', '550001', '中国,贵州省,贵阳市,云岩区', '106.725', '26.6048', 'Yunyan');
INSERT INTO `ctshop_region` VALUES ('520111', '花溪区', '520100', '花溪', '3', '0851', '550025', '中国,贵州省,贵阳市,花溪区', '106.677', '26.4334', 'Huaxi');
INSERT INTO `ctshop_region` VALUES ('520112', '乌当区', '520100', '乌当', '3', '0851', '550018', '中国,贵州省,贵阳市,乌当区', '106.752', '26.6302', 'Wudang');
INSERT INTO `ctshop_region` VALUES ('520113', '白云区', '520100', '白云', '3', '0851', '550014', '中国,贵州省,贵阳市,白云区', '106.631', '26.6828', 'Baiyun');
INSERT INTO `ctshop_region` VALUES ('520115', '观山湖区', '520100', '观山湖', '3', '0851', '550009', '中国,贵州省,贵阳市,观山湖区', '106.625', '26.6182', 'Guanshanhu');
INSERT INTO `ctshop_region` VALUES ('520121', '开阳县', '520100', '开阳', '3', '0851', '550300', '中国,贵州省,贵阳市,开阳县', '106.969', '27.0553', 'Kaiyang');
INSERT INTO `ctshop_region` VALUES ('520122', '息烽县', '520100', '息烽', '3', '0851', '551100', '中国,贵州省,贵阳市,息烽县', '106.738', '27.0935', 'Xifeng');
INSERT INTO `ctshop_region` VALUES ('520123', '修文县', '520100', '修文', '3', '0851', '550200', '中国,贵州省,贵阳市,修文县', '106.595', '26.8378', 'Xiuwen');
INSERT INTO `ctshop_region` VALUES ('520181', '清镇市', '520100', '清镇', '3', '0851', '551400', '中国,贵州省,贵阳市,清镇市', '106.469', '26.5526', 'Qingzhen');
INSERT INTO `ctshop_region` VALUES ('520200', '六盘水市', '520000', '六盘水', '2', '0858', '553400', '中国,贵州省,六盘水市', '104.847', '26.5846', 'Liupanshui');
INSERT INTO `ctshop_region` VALUES ('520201', '钟山区', '520200', '钟山', '3', '0858', '553000', '中国,贵州省,六盘水市,钟山区', '104.878', '26.577', 'Zhongshan');
INSERT INTO `ctshop_region` VALUES ('520203', '六枝特区', '520200', '六枝', '3', '0858', '553400', '中国,贵州省,六盘水市,六枝特区', '105.481', '26.2012', 'Liuzhi');
INSERT INTO `ctshop_region` VALUES ('520221', '水城县', '520200', '水城', '3', '0858', '553000', '中国,贵州省,六盘水市,水城县', '104.958', '26.5478', 'Shuicheng');
INSERT INTO `ctshop_region` VALUES ('520222', '盘县', '520200', '盘县', '3', '0858', '561601', '中国,贵州省,六盘水市,盘县', '104.471', '25.7136', 'Panxian');
INSERT INTO `ctshop_region` VALUES ('520300', '遵义市', '520000', '遵义', '2', '0852', '563000', '中国,贵州省,遵义市', '106.937', '27.7066', 'Zunyi');
INSERT INTO `ctshop_region` VALUES ('520302', '红花岗区', '520300', '红花岗', '3', '0852', '563000', '中国,贵州省,遵义市,红花岗区', '106.894', '27.6447', 'Honghuagang');
INSERT INTO `ctshop_region` VALUES ('520303', '汇川区', '520300', '汇川', '3', '0852', '563000', '中国,贵州省,遵义市,汇川区', '106.939', '27.7062', 'Huichuan');
INSERT INTO `ctshop_region` VALUES ('520321', '遵义县', '520300', '遵义', '3', '0852', '563100', '中国,贵州省,遵义市,遵义县', '106.833', '27.5377', 'Zunyi');
INSERT INTO `ctshop_region` VALUES ('520322', '桐梓县', '520300', '桐梓', '3', '0852', '563200', '中国,贵州省,遵义市,桐梓县', '106.826', '28.1381', 'Tongzi');
INSERT INTO `ctshop_region` VALUES ('520323', '绥阳县', '520300', '绥阳', '3', '0852', '563300', '中国,贵州省,遵义市,绥阳县', '107.191', '27.947', 'Suiyang');
INSERT INTO `ctshop_region` VALUES ('520324', '正安县', '520300', '正安', '3', '0852', '563400', '中国,贵州省,遵义市,正安县', '107.444', '28.5512', 'Zheng\'an');
INSERT INTO `ctshop_region` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '道真', '3', '0852', '563500', '中国,贵州省,遵义市,道真仡佬族苗族自治县', '107.612', '28.864', 'Daozhen');
INSERT INTO `ctshop_region` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '务川', '3', '0852', '564300', '中国,贵州省,遵义市,务川仡佬族苗族自治县', '107.889', '28.5223', 'Wuchuan');
INSERT INTO `ctshop_region` VALUES ('520327', '凤冈县', '520300', '凤冈', '3', '0852', '564200', '中国,贵州省,遵义市,凤冈县', '107.717', '27.9546', 'Fenggang');
INSERT INTO `ctshop_region` VALUES ('520328', '湄潭县', '520300', '湄潭', '3', '0852', '564100', '中国,贵州省,遵义市,湄潭县', '107.488', '27.7668', 'Meitan');
INSERT INTO `ctshop_region` VALUES ('520329', '余庆县', '520300', '余庆', '3', '0852', '564400', '中国,贵州省,遵义市,余庆县', '107.888', '27.2253', 'Yuqing');
INSERT INTO `ctshop_region` VALUES ('520330', '习水县', '520300', '习水', '3', '0852', '564600', '中国,贵州省,遵义市,习水县', '106.213', '28.3198', 'Xishui');
INSERT INTO `ctshop_region` VALUES ('520381', '赤水市', '520300', '赤水', '3', '0852', '564700', '中国,贵州省,遵义市,赤水市', '105.698', '28.5892', 'Chishui');
INSERT INTO `ctshop_region` VALUES ('520382', '仁怀市', '520300', '仁怀', '3', '0852', '564500', '中国,贵州省,遵义市,仁怀市', '106.402', '27.7923', 'Renhuai');
INSERT INTO `ctshop_region` VALUES ('520400', '安顺市', '520000', '安顺', '2', '0853', '561000', '中国,贵州省,安顺市', '105.932', '26.2455', 'Anshun');
INSERT INTO `ctshop_region` VALUES ('520402', '西秀区', '520400', '西秀', '3', '0853', '561000', '中国,贵州省,安顺市,西秀区', '105.966', '26.2449', 'Xixiu');
INSERT INTO `ctshop_region` VALUES ('520421', '平坝区', '520400', '平坝', '3', '0853', '561100', '中国,贵州省,安顺市,平坝区', '106.257', '26.4054', 'Pingba');
INSERT INTO `ctshop_region` VALUES ('520422', '普定县', '520400', '普定', '3', '0853', '562100', '中国,贵州省,安顺市,普定县', '105.743', '26.3014', 'Puding');
INSERT INTO `ctshop_region` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '镇宁', '3', '0853', '561200', '中国,贵州省,安顺市,镇宁布依族苗族自治县', '105.765', '26.0553', 'Zhenning');
INSERT INTO `ctshop_region` VALUES ('520424', '关岭布依族苗族自治县', '520400', '关岭', '3', '0853', '561300', '中国,贵州省,安顺市,关岭布依族苗族自治县', '105.619', '25.9425', 'Guanling');
INSERT INTO `ctshop_region` VALUES ('520425', '紫云苗族布依族自治县', '520400', '紫云', '3', '0853', '550800', '中国,贵州省,安顺市,紫云苗族布依族自治县', '106.084', '25.7526', 'Ziyun');
INSERT INTO `ctshop_region` VALUES ('520500', '毕节市', '520000', '毕节', '2', '0857', '551700', '中国,贵州省,毕节市', '105.285', '27.3017', 'Bijie');
INSERT INTO `ctshop_region` VALUES ('520502', '七星关区', '520500', '七星关', '3', '0857', '551700', '中国,贵州省,毕节市,七星关区', '104.95', '27.1536', 'Qixingguan');
INSERT INTO `ctshop_region` VALUES ('520521', '大方县', '520500', '大方', '3', '0857', '551600', '中国,贵州省,毕节市,大方县', '105.609', '27.1435', 'Dafang');
INSERT INTO `ctshop_region` VALUES ('520522', '黔西县', '520500', '黔西', '3', '0857', '551500', '中国,贵州省,毕节市,黔西县', '106.038', '27.0249', 'Qianxi');
INSERT INTO `ctshop_region` VALUES ('520523', '金沙县', '520500', '金沙', '3', '0857', '551800', '中国,贵州省,毕节市,金沙县', '106.222', '27.4597', 'Jinsha');
INSERT INTO `ctshop_region` VALUES ('520524', '织金县', '520500', '织金', '3', '0857', '552100', '中国,贵州省,毕节市,织金县', '105.769', '26.6685', 'Zhijin');
INSERT INTO `ctshop_region` VALUES ('520525', '纳雍县', '520500', '纳雍', '3', '0857', '553300', '中国,贵州省,毕节市,纳雍县', '105.375', '26.7699', 'Nayong');
INSERT INTO `ctshop_region` VALUES ('520526', '威宁彝族回族苗族自治县', '520500', '威宁', '3', '0857', '553100', '中国,贵州省,毕节市,威宁彝族回族苗族自治县', '104.287', '26.8591', 'Weining');
INSERT INTO `ctshop_region` VALUES ('520527', '赫章县', '520500', '赫章', '3', '0857', '553200', '中国,贵州省,毕节市,赫章县', '104.726', '27.1192', 'Hezhang');
INSERT INTO `ctshop_region` VALUES ('520600', '铜仁市', '520000', '铜仁', '2', '0856', '554300', '中国,贵州省,铜仁市', '109.192', '27.7183', 'Tongren');
INSERT INTO `ctshop_region` VALUES ('520602', '碧江区', '520600', '碧江', '3', '0856', '554300', '中国,贵州省,铜仁市,碧江区', '109.192', '27.7183', 'Bijiang');
INSERT INTO `ctshop_region` VALUES ('520603', '万山区', '520600', '万山', '3', '0856', '554200', '中国,贵州省,铜仁市,万山区', '109.212', '27.519', 'Wanshan');
INSERT INTO `ctshop_region` VALUES ('520621', '江口县', '520600', '江口', '3', '0856', '554400', '中国,贵州省,铜仁市,江口县', '108.848', '27.6919', 'Jiangkou');
INSERT INTO `ctshop_region` VALUES ('520622', '玉屏侗族自治县', '520600', '玉屏', '3', '0856', '554004', '中国,贵州省,铜仁市,玉屏侗族自治县', '108.918', '27.238', 'Yuping');
INSERT INTO `ctshop_region` VALUES ('520623', '石阡县', '520600', '石阡', '3', '0856', '555100', '中国,贵州省,铜仁市,石阡县', '108.23', '27.5194', 'Shiqian');
INSERT INTO `ctshop_region` VALUES ('520624', '思南县', '520600', '思南', '3', '0856', '565100', '中国,贵州省,铜仁市,思南县', '108.256', '27.9413', 'Sinan');
INSERT INTO `ctshop_region` VALUES ('520625', '印江土家族苗族自治县', '520600', '印江', '3', '0856', '555200', '中国,贵州省,铜仁市,印江土家族苗族自治县', '108.406', '27.998', 'Yinjiang');
INSERT INTO `ctshop_region` VALUES ('520626', '德江县', '520600', '德江', '3', '0856', '565200', '中国,贵州省,铜仁市,德江县', '108.117', '28.2609', 'Dejiang');
INSERT INTO `ctshop_region` VALUES ('520627', '沿河土家族自治县', '520600', '沿河', '3', '0856', '565300', '中国,贵州省,铜仁市,沿河土家族自治县', '108.496', '28.5605', 'Yuanhe');
INSERT INTO `ctshop_region` VALUES ('520628', '松桃苗族自治县', '520600', '松桃', '3', '0856', '554100', '中国,贵州省,铜仁市,松桃苗族自治县', '109.203', '28.1654', 'Songtao');
INSERT INTO `ctshop_region` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '黔西南', '2', '0859', '562400', '中国,贵州省,黔西南布依族苗族自治州', '104.898', '25.0881', 'Qianxinan');
INSERT INTO `ctshop_region` VALUES ('522301', '兴义市 ', '522300', '兴义', '3', '0859', '562400', '中国,贵州省,黔西南布依族苗族自治州,兴义市 ', '104.895', '25.0921', 'Xingyi');
INSERT INTO `ctshop_region` VALUES ('522322', '兴仁县', '522300', '兴仁', '3', '0859', '562300', '中国,贵州省,黔西南布依族苗族自治州,兴仁县', '105.187', '25.4328', 'Xingren');
INSERT INTO `ctshop_region` VALUES ('522323', '普安县', '522300', '普安', '3', '0859', '561500', '中国,贵州省,黔西南布依族苗族自治州,普安县', '104.955', '25.786', 'Pu\'an');
INSERT INTO `ctshop_region` VALUES ('522324', '晴隆县', '522300', '晴隆', '3', '0859', '561400', '中国,贵州省,黔西南布依族苗族自治州,晴隆县', '105.219', '25.8352', 'Qinglong');
INSERT INTO `ctshop_region` VALUES ('522325', '贞丰县', '522300', '贞丰', '3', '0859', '562200', '中国,贵州省,黔西南布依族苗族自治州,贞丰县', '105.655', '25.3846', 'Zhenfeng');
INSERT INTO `ctshop_region` VALUES ('522326', '望谟县', '522300', '望谟', '3', '0859', '552300', '中国,贵州省,黔西南布依族苗族自治州,望谟县', '106.1', '25.1782', 'Wangmo');
INSERT INTO `ctshop_region` VALUES ('522327', '册亨县', '522300', '册亨', '3', '0859', '552200', '中国,贵州省,黔西南布依族苗族自治州,册亨县', '105.812', '24.9838', 'Ceheng');
INSERT INTO `ctshop_region` VALUES ('522328', '安龙县', '522300', '安龙', '3', '0859', '552400', '中国,贵州省,黔西南布依族苗族自治州,安龙县', '105.443', '25.0982', 'Anlong');
INSERT INTO `ctshop_region` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '黔东南', '2', '0855', '556000', '中国,贵州省,黔东南苗族侗族自治州', '107.977', '26.5834', 'Qiandongnan');
INSERT INTO `ctshop_region` VALUES ('522601', '凯里市', '522600', '凯里', '3', '0855', '556000', '中国,贵州省,黔东南苗族侗族自治州,凯里市', '107.981', '26.5669', 'Kaili');
INSERT INTO `ctshop_region` VALUES ('522622', '黄平县', '522600', '黄平', '3', '0855', '556100', '中国,贵州省,黔东南苗族侗族自治州,黄平县', '107.902', '26.8957', 'Huangping');
INSERT INTO `ctshop_region` VALUES ('522623', '施秉县', '522600', '施秉', '3', '0855', '556200', '中国,贵州省,黔东南苗族侗族自治州,施秉县', '108.126', '27.035', 'Shibing');
INSERT INTO `ctshop_region` VALUES ('522624', '三穗县', '522600', '三穗', '3', '0855', '556500', '中国,贵州省,黔东南苗族侗族自治州,三穗县', '108.671', '26.9477', 'Sansui');
INSERT INTO `ctshop_region` VALUES ('522625', '镇远县', '522600', '镇远', '3', '0855', '557700', '中国,贵州省,黔东南苗族侗族自治州,镇远县', '108.427', '27.0493', 'Zhenyuan');
INSERT INTO `ctshop_region` VALUES ('522626', '岑巩县', '522600', '岑巩', '3', '0855', '557800', '中国,贵州省,黔东南苗族侗族自治州,岑巩县', '108.819', '27.1754', 'Cengong');
INSERT INTO `ctshop_region` VALUES ('522627', '天柱县', '522600', '天柱', '3', '0855', '556600', '中国,贵州省,黔东南苗族侗族自治州,天柱县', '109.207', '26.9078', 'Tianzhu');
INSERT INTO `ctshop_region` VALUES ('522628', '锦屏县', '522600', '锦屏', '3', '0855', '556700', '中国,贵州省,黔东南苗族侗族自治州,锦屏县', '109.2', '26.6763', 'Jinping');
INSERT INTO `ctshop_region` VALUES ('522629', '剑河县', '522600', '剑河', '3', '0855', '556400', '中国,贵州省,黔东南苗族侗族自治州,剑河县', '108.591', '26.6525', 'Jianhe');
INSERT INTO `ctshop_region` VALUES ('522630', '台江县', '522600', '台江', '3', '0855', '556300', '中国,贵州省,黔东南苗族侗族自治州,台江县', '108.318', '26.6692', 'Taijiang');
INSERT INTO `ctshop_region` VALUES ('522631', '黎平县', '522600', '黎平', '3', '0855', '557300', '中国,贵州省,黔东南苗族侗族自治州,黎平县', '109.136', '26.2311', 'Liping');
INSERT INTO `ctshop_region` VALUES ('522632', '榕江县', '522600', '榕江', '3', '0855', '557200', '中国,贵州省,黔东南苗族侗族自治州,榕江县', '108.521', '25.9242', 'Rongjiang');
INSERT INTO `ctshop_region` VALUES ('522633', '从江县', '522600', '从江', '3', '0855', '557400', '中国,贵州省,黔东南苗族侗族自治州,从江县', '108.905', '25.7542', 'Congjiang');
INSERT INTO `ctshop_region` VALUES ('522634', '雷山县', '522600', '雷山', '3', '0855', '557100', '中国,贵州省,黔东南苗族侗族自治州,雷山县', '108.077', '26.3839', 'Leishan');
INSERT INTO `ctshop_region` VALUES ('522635', '麻江县', '522600', '麻江', '3', '0855', '557600', '中国,贵州省,黔东南苗族侗族自治州,麻江县', '107.592', '26.4923', 'Majiang');
INSERT INTO `ctshop_region` VALUES ('522636', '丹寨县', '522600', '丹寨', '3', '0855', '557500', '中国,贵州省,黔东南苗族侗族自治州,丹寨县', '107.797', '26.1982', 'Danzhai');
INSERT INTO `ctshop_region` VALUES ('522700', '黔南布依族苗族自治州', '520000', '黔南', '2', '0854', '558000', '中国,贵州省,黔南布依族苗族自治州', '107.517', '26.2582', 'Qiannan');
INSERT INTO `ctshop_region` VALUES ('522701', '都匀市', '522700', '都匀', '3', '0854', '558000', '中国,贵州省,黔南布依族苗族自治州,都匀市', '107.519', '26.2594', 'Duyun');
INSERT INTO `ctshop_region` VALUES ('522702', '福泉市', '522700', '福泉', '3', '0854', '550500', '中国,贵州省,黔南布依族苗族自治州,福泉市', '107.517', '26.6799', 'Fuquan');
INSERT INTO `ctshop_region` VALUES ('522722', '荔波县', '522700', '荔波', '3', '0854', '558400', '中国,贵州省,黔南布依族苗族自治州,荔波县', '107.886', '25.4139', 'Libo');
INSERT INTO `ctshop_region` VALUES ('522723', '贵定县', '522700', '贵定', '3', '0854', '551300', '中国,贵州省,黔南布依族苗族自治州,贵定县', '107.237', '26.5781', 'Guiding');
INSERT INTO `ctshop_region` VALUES ('522725', '瓮安县', '522700', '瓮安', '3', '0854', '550400', '中国,贵州省,黔南布依族苗族自治州,瓮安县', '107.476', '27.0681', 'Weng\'an');
INSERT INTO `ctshop_region` VALUES ('522726', '独山县', '522700', '独山', '3', '0854', '558200', '中国,贵州省,黔南布依族苗族自治州,独山县', '107.541', '25.8245', 'Dushan');
INSERT INTO `ctshop_region` VALUES ('522727', '平塘县', '522700', '平塘', '3', '0854', '558300', '中国,贵州省,黔南布依族苗族自治州,平塘县', '107.324', '25.8329', 'Pingtang');
INSERT INTO `ctshop_region` VALUES ('522728', '罗甸县', '522700', '罗甸', '3', '0854', '550100', '中国,贵州省,黔南布依族苗族自治州,罗甸县', '106.752', '25.4259', 'Luodian');
INSERT INTO `ctshop_region` VALUES ('522729', '长顺县', '522700', '长顺', '3', '0854', '550700', '中国,贵州省,黔南布依族苗族自治州,长顺县', '106.452', '26.023', 'Changshun');
INSERT INTO `ctshop_region` VALUES ('522730', '龙里县', '522700', '龙里', '3', '0854', '551200', '中国,贵州省,黔南布依族苗族自治州,龙里县', '106.977', '26.4508', 'Longli');
INSERT INTO `ctshop_region` VALUES ('522731', '惠水县', '522700', '惠水', '3', '0854', '550600', '中国,贵州省,黔南布依族苗族自治州,惠水县', '106.659', '26.1339', 'Huishui');
INSERT INTO `ctshop_region` VALUES ('522732', '三都水族自治县', '522700', '三都', '3', '0854', '558100', '中国,贵州省,黔南布依族苗族自治州,三都水族自治县', '107.875', '25.9856', 'Sandu');
INSERT INTO `ctshop_region` VALUES ('530000', '云南省', '100000', '云南', '1', '', '', '中国,云南省', '102.712', '25.0406', 'Yunnan');
INSERT INTO `ctshop_region` VALUES ('530100', '昆明市', '530000', '昆明', '2', '0871', '650500', '中国,云南省,昆明市', '102.712', '25.0406', 'Kunming');
INSERT INTO `ctshop_region` VALUES ('530102', '五华区', '530100', '五华', '3', '0871', '650021', '中国,云南省,昆明市,五华区', '102.708', '25.0352', 'Wuhua');
INSERT INTO `ctshop_region` VALUES ('530103', '盘龙区', '530100', '盘龙', '3', '0871', '650051', '中国,云南省,昆明市,盘龙区', '102.72', '25.0405', 'Panlong');
INSERT INTO `ctshop_region` VALUES ('530111', '官渡区', '530100', '官渡', '3', '0871', '650200', '中国,云南省,昆明市,官渡区', '102.744', '25.015', 'Guandu');
INSERT INTO `ctshop_region` VALUES ('530112', '西山区', '530100', '西山', '3', '0871', '650118', '中国,云南省,昆明市,西山区', '102.665', '25.038', 'Xishan');
INSERT INTO `ctshop_region` VALUES ('530113', '东川区', '530100', '东川', '3', '0871', '654100', '中国,云南省,昆明市,东川区', '103.188', '26.083', 'Dongchuan');
INSERT INTO `ctshop_region` VALUES ('530114', '呈贡区', '530100', '呈贡', '3', '0871', '650500', '中国,云南省,昆明市,呈贡区', '102.801', '24.8893', 'Chenggong');
INSERT INTO `ctshop_region` VALUES ('530122', '晋宁县', '530100', '晋宁', '3', '0871', '650600', '中国,云南省,昆明市,晋宁县', '102.594', '24.6665', 'Jinning');
INSERT INTO `ctshop_region` VALUES ('530124', '富民县', '530100', '富民', '3', '0871', '650400', '中国,云南省,昆明市,富民县', '102.498', '25.2212', 'Fumin');
INSERT INTO `ctshop_region` VALUES ('530125', '宜良县', '530100', '宜良', '3', '0871', '652100', '中国,云南省,昆明市,宜良县', '103.141', '24.917', 'Yiliang');
INSERT INTO `ctshop_region` VALUES ('530126', '石林彝族自治县', '530100', '石林', '3', '0871', '652200', '中国,云南省,昆明市,石林彝族自治县', '103.271', '24.759', 'Shilin');
INSERT INTO `ctshop_region` VALUES ('530127', '嵩明县', '530100', '嵩明', '3', '0871', '651700', '中国,云南省,昆明市,嵩明县', '103.037', '25.3399', 'Songming');
INSERT INTO `ctshop_region` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '禄劝', '3', '0871', '651500', '中国,云南省,昆明市,禄劝彝族苗族自治县', '102.467', '25.5539', 'Luquan');
INSERT INTO `ctshop_region` VALUES ('530129', '寻甸回族彝族自治县 ', '530100', '寻甸', '3', '0871', '655200', '中国,云南省,昆明市,寻甸回族彝族自治县 ', '103.256', '25.5596', 'Xundian');
INSERT INTO `ctshop_region` VALUES ('530181', '安宁市', '530100', '安宁', '3', '0871', '650300', '中国,云南省,昆明市,安宁市', '102.47', '24.9165', 'Anning');
INSERT INTO `ctshop_region` VALUES ('530300', '曲靖市', '530000', '曲靖', '2', '0874', '655000', '中国,云南省,曲靖市', '103.798', '25.5016', 'Qujing');
INSERT INTO `ctshop_region` VALUES ('530302', '麒麟区', '530300', '麒麟', '3', '0874', '655000', '中国,云南省,曲靖市,麒麟区', '103.805', '25.4951', 'Qilin');
INSERT INTO `ctshop_region` VALUES ('530321', '马龙县', '530300', '马龙', '3', '0874', '655100', '中国,云南省,曲靖市,马龙县', '103.579', '25.4252', 'Malong');
INSERT INTO `ctshop_region` VALUES ('530322', '陆良县', '530300', '陆良', '3', '0874', '655600', '中国,云南省,曲靖市,陆良县', '103.666', '25.0233', 'Luliang');
INSERT INTO `ctshop_region` VALUES ('530323', '师宗县', '530300', '师宗', '3', '0874', '655700', '中国,云南省,曲靖市,师宗县', '103.991', '24.8282', 'Shizong');
INSERT INTO `ctshop_region` VALUES ('530324', '罗平县', '530300', '罗平', '3', '0874', '655800', '中国,云南省,曲靖市,罗平县', '104.309', '24.8844', 'Luoping');
INSERT INTO `ctshop_region` VALUES ('530325', '富源县', '530300', '富源', '3', '0874', '655500', '中国,云南省,曲靖市,富源县', '104.254', '25.6659', 'Fuyuan');
INSERT INTO `ctshop_region` VALUES ('530326', '会泽县', '530300', '会泽', '3', '0874', '654200', '中国,云南省,曲靖市,会泽县', '103.3', '26.4108', 'Huize');
INSERT INTO `ctshop_region` VALUES ('530328', '沾益县', '530300', '沾益', '3', '0874', '655331', '中国,云南省,曲靖市,沾益县', '103.821', '25.6071', 'Zhanyi');
INSERT INTO `ctshop_region` VALUES ('530381', '宣威市', '530300', '宣威', '3', '0874', '655400', '中国,云南省,曲靖市,宣威市', '104.104', '26.2173', 'Xuanwei');
INSERT INTO `ctshop_region` VALUES ('530400', '玉溪市', '530000', '玉溪', '2', '0877', '653100', '中国,云南省,玉溪市', '102.544', '24.3505', 'Yuxi');
INSERT INTO `ctshop_region` VALUES ('530402', '红塔区', '530400', '红塔', '3', '0877', '653100', '中国,云南省,玉溪市,红塔区', '102.545', '24.3541', 'Hongta');
INSERT INTO `ctshop_region` VALUES ('530421', '江川县', '530400', '江川', '3', '0877', '652600', '中国,云南省,玉溪市,江川县', '102.754', '24.2886', 'Jiangchuan');
INSERT INTO `ctshop_region` VALUES ('530422', '澄江县', '530400', '澄江', '3', '0877', '652500', '中国,云南省,玉溪市,澄江县', '102.908', '24.6738', 'Chengjiang');
INSERT INTO `ctshop_region` VALUES ('530423', '通海县', '530400', '通海', '3', '0877', '652700', '中国,云南省,玉溪市,通海县', '102.766', '24.1136', 'Tonghai');
INSERT INTO `ctshop_region` VALUES ('530424', '华宁县', '530400', '华宁', '3', '0877', '652800', '中国,云南省,玉溪市,华宁县', '102.928', '24.1926', 'Huaning');
INSERT INTO `ctshop_region` VALUES ('530425', '易门县', '530400', '易门', '3', '0877', '651100', '中国,云南省,玉溪市,易门县', '102.164', '24.6712', 'Yimen');
INSERT INTO `ctshop_region` VALUES ('530426', '峨山彝族自治县', '530400', '峨山', '3', '0877', '653200', '中国,云南省,玉溪市,峨山彝族自治县', '102.406', '24.169', 'Eshan');
INSERT INTO `ctshop_region` VALUES ('530427', '新平彝族傣族自治县', '530400', '新平', '3', '0877', '653400', '中国,云南省,玉溪市,新平彝族傣族自治县', '101.989', '24.0689', 'Xinping');
INSERT INTO `ctshop_region` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '元江', '3', '0877', '653300', '中国,云南省,玉溪市,元江哈尼族彝族傣族自治县', '101.998', '23.5965', 'Yuanjiang');
INSERT INTO `ctshop_region` VALUES ('530500', '保山市', '530000', '保山', '2', '0875', '678000', '中国,云南省,保山市', '99.1671', '25.1118', 'Baoshan');
INSERT INTO `ctshop_region` VALUES ('530502', '隆阳区', '530500', '隆阳', '3', '0875', '678000', '中国,云南省,保山市,隆阳区', '99.1633', '25.1116', 'Longyang');
INSERT INTO `ctshop_region` VALUES ('530521', '施甸县', '530500', '施甸', '3', '0875', '678200', '中国,云南省,保山市,施甸县', '99.1877', '24.7242', 'Shidian');
INSERT INTO `ctshop_region` VALUES ('530522', '腾冲县', '530500', '腾冲', '3', '0875', '679100', '中国,云南省,保山市,腾冲县', '98.4941', '25.0254', 'Tengchong');
INSERT INTO `ctshop_region` VALUES ('530523', '龙陵县', '530500', '龙陵', '3', '0875', '678300', '中国,云南省,保山市,龙陵县', '98.6902', '24.5875', 'Longling');
INSERT INTO `ctshop_region` VALUES ('530524', '昌宁县', '530500', '昌宁', '3', '0875', '678100', '中国,云南省,保山市,昌宁县', '99.6036', '24.8276', 'Changning');
INSERT INTO `ctshop_region` VALUES ('530600', '昭通市', '530000', '昭通', '2', '0870', '657000', '中国,云南省,昭通市', '103.717', '27.337', 'Zhaotong');
INSERT INTO `ctshop_region` VALUES ('530602', '昭阳区', '530600', '昭阳', '3', '0870', '657000', '中国,云南省,昭通市,昭阳区', '103.707', '27.32', 'Zhaoyang');
INSERT INTO `ctshop_region` VALUES ('530621', '鲁甸县', '530600', '鲁甸', '3', '0870', '657100', '中国,云南省,昭通市,鲁甸县', '103.547', '27.1924', 'Ludian');
INSERT INTO `ctshop_region` VALUES ('530622', '巧家县', '530600', '巧家', '3', '0870', '654600', '中国,云南省,昭通市,巧家县', '102.924', '26.9124', 'Qiaojia');
INSERT INTO `ctshop_region` VALUES ('530623', '盐津县', '530600', '盐津', '3', '0870', '657500', '中国,云南省,昭通市,盐津县', '104.235', '28.1086', 'Yanjin');
INSERT INTO `ctshop_region` VALUES ('530624', '大关县', '530600', '大关', '3', '0870', '657400', '中国,云南省,昭通市,大关县', '103.893', '27.7488', 'Daguan');
INSERT INTO `ctshop_region` VALUES ('530625', '永善县', '530600', '永善', '3', '0870', '657300', '中国,云南省,昭通市,永善县', '103.635', '28.2279', 'Yongshan');
INSERT INTO `ctshop_region` VALUES ('530626', '绥江县', '530600', '绥江', '3', '0870', '657700', '中国,云南省,昭通市,绥江县', '103.949', '28.5966', 'Suijiang');
INSERT INTO `ctshop_region` VALUES ('530627', '镇雄县', '530600', '镇雄', '3', '0870', '657200', '中国,云南省,昭通市,镇雄县', '104.873', '27.4398', 'Zhenxiong');
INSERT INTO `ctshop_region` VALUES ('530628', '彝良县', '530600', '彝良', '3', '0870', '657600', '中国,云南省,昭通市,彝良县', '104.05', '27.6281', 'Yiliang');
INSERT INTO `ctshop_region` VALUES ('530629', '威信县', '530600', '威信', '3', '0870', '657900', '中国,云南省,昭通市,威信县', '105.048', '27.8407', 'Weixin');
INSERT INTO `ctshop_region` VALUES ('530630', '水富县', '530600', '水富', '3', '0870', '657800', '中国,云南省,昭通市,水富县', '104.416', '28.6299', 'Shuifu');
INSERT INTO `ctshop_region` VALUES ('530700', '丽江市', '530000', '丽江', '2', '0888', '674100', '中国,云南省,丽江市', '100.233', '26.8721', 'Lijiang');
INSERT INTO `ctshop_region` VALUES ('530702', '古城区', '530700', '古城', '3', '0888', '674100', '中国,云南省,丽江市,古城区', '100.226', '26.877', 'Gucheng');
INSERT INTO `ctshop_region` VALUES ('530721', '玉龙纳西族自治县', '530700', '玉龙', '3', '0888', '674100', '中国,云南省,丽江市,玉龙纳西族自治县', '100.237', '26.8215', 'Yulong');
INSERT INTO `ctshop_region` VALUES ('530722', '永胜县', '530700', '永胜', '3', '0888', '674200', '中国,云南省,丽江市,永胜县', '100.747', '26.6859', 'Yongsheng');
INSERT INTO `ctshop_region` VALUES ('530723', '华坪县', '530700', '华坪', '3', '0888', '674800', '中国,云南省,丽江市,华坪县', '101.266', '26.6297', 'Huaping');
INSERT INTO `ctshop_region` VALUES ('530724', '宁蒗彝族自治县', '530700', '宁蒗', '3', '0888', '674300', '中国,云南省,丽江市,宁蒗彝族自治县', '100.851', '27.2818', 'Ninglang');
INSERT INTO `ctshop_region` VALUES ('530800', '普洱市', '530000', '普洱', '2', '0879', '665000', '中国,云南省,普洱市', '100.972', '22.7773', 'Pu\'er');
INSERT INTO `ctshop_region` VALUES ('530802', '思茅区', '530800', '思茅', '3', '0879', '665000', '中国,云南省,普洱市,思茅区', '100.977', '22.7869', 'Simao');
INSERT INTO `ctshop_region` VALUES ('530821', '宁洱哈尼族彝族自治县', '530800', '宁洱', '3', '0879', '665100', '中国,云南省,普洱市,宁洱哈尼族彝族自治县', '101.047', '23.0634', 'Ninger');
INSERT INTO `ctshop_region` VALUES ('530822', '墨江哈尼族自治县', '530800', '墨江', '3', '0879', '654800', '中国,云南省,普洱市,墨江哈尼族自治县', '101.692', '23.4321', 'Mojiang');
INSERT INTO `ctshop_region` VALUES ('530823', '景东彝族自治县', '530800', '景东', '3', '0879', '676200', '中国,云南省,普洱市,景东彝族自治县', '100.836', '24.4479', 'Jingdong');
INSERT INTO `ctshop_region` VALUES ('530824', '景谷傣族彝族自治县', '530800', '景谷', '3', '0879', '666400', '中国,云南省,普洱市,景谷傣族彝族自治县', '100.703', '23.497', 'Jinggu');
INSERT INTO `ctshop_region` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '镇沅', '3', '0879', '666500', '中国,云南省,普洱市,镇沅彝族哈尼族拉祜族自治县', '101.107', '24.0056', 'Zhenyuan');
INSERT INTO `ctshop_region` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '江城', '3', '0879', '665900', '中国,云南省,普洱市,江城哈尼族彝族自治县', '101.858', '22.5842', 'Jiangcheng');
INSERT INTO `ctshop_region` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '孟连', '3', '0879', '665800', '中国,云南省,普洱市,孟连傣族拉祜族佤族自治县', '99.5842', '22.3292', 'Menglian');
INSERT INTO `ctshop_region` VALUES ('530828', '澜沧拉祜族自治县', '530800', '澜沧', '3', '0879', '665600', '中国,云南省,普洱市,澜沧拉祜族自治县', '99.9359', '22.5547', 'Lancang');
INSERT INTO `ctshop_region` VALUES ('530829', '西盟佤族自治县', '530800', '西盟', '3', '0879', '665700', '中国,云南省,普洱市,西盟佤族自治县', '99.5987', '22.6477', 'Ximeng');
INSERT INTO `ctshop_region` VALUES ('530900', '临沧市', '530000', '临沧', '2', '0883', '677000', '中国,云南省,临沧市', '100.087', '23.8866', 'Lincang');
INSERT INTO `ctshop_region` VALUES ('530902', '临翔区', '530900', '临翔', '3', '0883', '677000', '中国,云南省,临沧市,临翔区', '100.082', '23.895', 'Linxiang');
INSERT INTO `ctshop_region` VALUES ('530921', '凤庆县', '530900', '凤庆', '3', '0883', '675900', '中国,云南省,临沧市,凤庆县', '99.9284', '24.5803', 'Fengqing');
INSERT INTO `ctshop_region` VALUES ('530922', '云县', '530900', '云县', '3', '0883', '675800', '中国,云南省,临沧市,云县', '100.128', '24.4468', 'Yunxian');
INSERT INTO `ctshop_region` VALUES ('530923', '永德县', '530900', '永德', '3', '0883', '677600', '中国,云南省,临沧市,永德县', '99.2533', '24.0276', 'Yongde');
INSERT INTO `ctshop_region` VALUES ('530924', '镇康县', '530900', '镇康', '3', '0883', '677704', '中国,云南省,临沧市,镇康县', '98.8255', '23.7624', 'Zhenkang');
INSERT INTO `ctshop_region` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '双江', '3', '0883', '677300', '中国,云南省,临沧市,双江拉祜族佤族布朗族傣族自治县', '99.8277', '23.4735', 'Shuangjiang');
INSERT INTO `ctshop_region` VALUES ('530926', '耿马傣族佤族自治县', '530900', '耿马', '3', '0883', '677500', '中国,云南省,临沧市,耿马傣族佤族自治县', '99.3979', '23.5378', 'Gengma');
INSERT INTO `ctshop_region` VALUES ('530927', '沧源佤族自治县', '530900', '沧源', '3', '0883', '677400', '中国,云南省,临沧市,沧源佤族自治县', '99.2455', '23.1482', 'Cangyuan');
INSERT INTO `ctshop_region` VALUES ('532300', '楚雄彝族自治州', '530000', '楚雄', '2', '0878', '675000', '中国,云南省,楚雄彝族自治州', '101.546', '25.042', 'Chuxiong');
INSERT INTO `ctshop_region` VALUES ('532301', '楚雄市', '532300', '楚雄', '3', '0878', '675000', '中国,云南省,楚雄彝族自治州,楚雄市', '101.546', '25.0329', 'Chuxiong');
INSERT INTO `ctshop_region` VALUES ('532322', '双柏县', '532300', '双柏', '3', '0878', '675100', '中国,云南省,楚雄彝族自治州,双柏县', '101.642', '24.6888', 'Shuangbai');
INSERT INTO `ctshop_region` VALUES ('532323', '牟定县', '532300', '牟定', '3', '0878', '675500', '中国,云南省,楚雄彝族自治州,牟定县', '101.54', '25.3155', 'Mouding');
INSERT INTO `ctshop_region` VALUES ('532324', '南华县', '532300', '南华', '3', '0878', '675200', '中国,云南省,楚雄彝族自治州,南华县', '101.273', '25.1929', 'Nanhua');
INSERT INTO `ctshop_region` VALUES ('532325', '姚安县', '532300', '姚安', '3', '0878', '675300', '中国,云南省,楚雄彝族自治州,姚安县', '101.243', '25.5047', 'Yao\'an');
INSERT INTO `ctshop_region` VALUES ('532326', '大姚县', '532300', '大姚', '3', '0878', '675400', '中国,云南省,楚雄彝族自治州,大姚县', '101.324', '25.7222', 'Dayao');
INSERT INTO `ctshop_region` VALUES ('532327', '永仁县', '532300', '永仁', '3', '0878', '651400', '中国,云南省,楚雄彝族自治州,永仁县', '101.672', '26.0579', 'Yongren');
INSERT INTO `ctshop_region` VALUES ('532328', '元谋县', '532300', '元谋', '3', '0878', '651300', '中国,云南省,楚雄彝族自治州,元谋县', '101.877', '25.7044', 'Yuanmou');
INSERT INTO `ctshop_region` VALUES ('532329', '武定县', '532300', '武定', '3', '0878', '651600', '中国,云南省,楚雄彝族自治州,武定县', '102.404', '25.5295', 'Wuding');
INSERT INTO `ctshop_region` VALUES ('532331', '禄丰县', '532300', '禄丰', '3', '0878', '651200', '中国,云南省,楚雄彝族自治州,禄丰县', '102.078', '25.1481', 'Lufeng');
INSERT INTO `ctshop_region` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '红河', '2', '0873', '661400', '中国,云南省,红河哈尼族彝族自治州', '103.384', '23.3668', 'Honghe');
INSERT INTO `ctshop_region` VALUES ('532501', '个旧市', '532500', '个旧', '3', '0873', '661000', '中国,云南省,红河哈尼族彝族自治州,个旧市', '103.16', '23.3589', 'Gejiu');
INSERT INTO `ctshop_region` VALUES ('532502', '开远市', '532500', '开远', '3', '0873', '661600', '中国,云南省,红河哈尼族彝族自治州,开远市', '103.27', '23.7101', 'Kaiyuan');
INSERT INTO `ctshop_region` VALUES ('532503', '蒙自市', '532500', '蒙自', '3', '0873', '661101', '中国,云南省,红河哈尼族彝族自治州,蒙自市', '103.385', '23.3668', 'Mengzi');
INSERT INTO `ctshop_region` VALUES ('532504', '弥勒市', '532500', '弥勒', '3', '0873', '652300', '中国,云南省,红河哈尼族彝族自治州,弥勒市', '103.437', '24.4084', 'Mile ');
INSERT INTO `ctshop_region` VALUES ('532523', '屏边苗族自治县', '532500', '屏边', '3', '0873', '661200', '中国,云南省,红河哈尼族彝族自治州,屏边苗族自治县', '103.686', '22.9842', 'Pingbian');
INSERT INTO `ctshop_region` VALUES ('532524', '建水县', '532500', '建水', '3', '0873', '654300', '中国,云南省,红河哈尼族彝族自治州,建水县', '102.827', '23.6347', 'Jianshui');
INSERT INTO `ctshop_region` VALUES ('532525', '石屏县', '532500', '石屏', '3', '0873', '662200', '中国,云南省,红河哈尼族彝族自治州,石屏县', '102.494', '23.7144', 'Shiping');
INSERT INTO `ctshop_region` VALUES ('532527', '泸西县', '532500', '泸西', '3', '0873', '652400', '中国,云南省,红河哈尼族彝族自治州,泸西县', '103.764', '24.5285', 'Luxi');
INSERT INTO `ctshop_region` VALUES ('532528', '元阳县', '532500', '元阳', '3', '0873', '662400', '中国,云南省,红河哈尼族彝族自治州,元阳县', '102.833', '23.2228', 'Yuanyang');
INSERT INTO `ctshop_region` VALUES ('532529', '红河县', '532500', '红河县', '3', '0873', '654400', '中国,云南省,红河哈尼族彝族自治州,红河县', '102.421', '23.3677', 'Honghexian');
INSERT INTO `ctshop_region` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '金平', '3', '0873', '661500', '中国,云南省,红河哈尼族彝族自治州,金平苗族瑶族傣族自治县', '103.227', '22.7796', 'Jinping');
INSERT INTO `ctshop_region` VALUES ('532531', '绿春县', '532500', '绿春', '3', '0873', '662500', '中国,云南省,红河哈尼族彝族自治州,绿春县', '102.397', '22.9937', 'Lvchun');
INSERT INTO `ctshop_region` VALUES ('532532', '河口瑶族自治县', '532500', '河口', '3', '0873', '661300', '中国,云南省,红河哈尼族彝族自治州,河口瑶族自治县', '103.939', '22.5293', 'Hekou');
INSERT INTO `ctshop_region` VALUES ('532600', '文山壮族苗族自治州', '530000', '文山', '2', '0876', '663000', '中国,云南省,文山壮族苗族自治州', '104.244', '23.3695', 'Wenshan');
INSERT INTO `ctshop_region` VALUES ('532601', '文山市', '532600', '文山', '3', '0876', '663000', '中国,云南省,文山壮族苗族自治州,文山市', '104.244', '23.3692', 'Wenshan');
INSERT INTO `ctshop_region` VALUES ('532622', '砚山县', '532600', '砚山', '3', '0876', '663100', '中国,云南省,文山壮族苗族自治州,砚山县', '104.333', '23.6072', 'Yanshan');
INSERT INTO `ctshop_region` VALUES ('532623', '西畴县', '532600', '西畴', '3', '0876', '663500', '中国,云南省,文山壮族苗族自治州,西畴县', '104.674', '23.4394', 'Xichou');
INSERT INTO `ctshop_region` VALUES ('532624', '麻栗坡县', '532600', '麻栗坡', '3', '0876', '663600', '中国,云南省,文山壮族苗族自治州,麻栗坡县', '104.701', '23.1203', 'Malipo');
INSERT INTO `ctshop_region` VALUES ('532625', '马关县', '532600', '马关', '3', '0876', '663700', '中国,云南省,文山壮族苗族自治州,马关县', '104.395', '23.0129', 'Maguan');
INSERT INTO `ctshop_region` VALUES ('532626', '丘北县', '532600', '丘北', '3', '0876', '663200', '中国,云南省,文山壮族苗族自治州,丘北县', '104.193', '24.0396', 'Qiubei');
INSERT INTO `ctshop_region` VALUES ('532627', '广南县', '532600', '广南', '3', '0876', '663300', '中国,云南省,文山壮族苗族自治州,广南县', '105.055', '24.0464', 'Guangnan');
INSERT INTO `ctshop_region` VALUES ('532628', '富宁县', '532600', '富宁', '3', '0876', '663400', '中国,云南省,文山壮族苗族自治州,富宁县', '105.631', '23.6254', 'Funing');
INSERT INTO `ctshop_region` VALUES ('532800', '西双版纳傣族自治州', '530000', '西双版纳', '2', '0691', '666100', '中国,云南省,西双版纳傣族自治州', '100.798', '22.0017', 'Xishuangbanna');
INSERT INTO `ctshop_region` VALUES ('532801', '景洪市', '532800', '景洪', '3', '0691', '666100', '中国,云南省,西双版纳傣族自治州,景洪市', '100.8', '22.0107', 'Jinghong');
INSERT INTO `ctshop_region` VALUES ('532822', '勐海县', '532800', '勐海', '3', '0691', '666200', '中国,云南省,西双版纳傣族自治州,勐海县', '100.449', '21.9618', 'Menghai');
INSERT INTO `ctshop_region` VALUES ('532823', '勐腊县', '532800', '勐腊', '3', '0691', '666300', '中国,云南省,西双版纳傣族自治州,勐腊县', '101.565', '21.4816', 'Mengla');
INSERT INTO `ctshop_region` VALUES ('532900', '大理白族自治州', '530000', '大理', '2', '0872', '671000', '中国,云南省,大理白族自治州', '100.24', '25.5928', 'Dali');
INSERT INTO `ctshop_region` VALUES ('532901', '大理市', '532900', '大理', '3', '0872', '671000', '中国,云南省,大理白族自治州,大理市', '100.23', '25.5916', 'Dali');
INSERT INTO `ctshop_region` VALUES ('532922', '漾濞彝族自治县', '532900', '漾濞', '3', '0872', '672500', '中国,云南省,大理白族自治州,漾濞彝族自治县', '99.9547', '25.6652', 'Yangbi');
INSERT INTO `ctshop_region` VALUES ('532923', '祥云县', '532900', '祥云', '3', '0872', '672100', '中国,云南省,大理白族自治州,祥云县', '100.558', '25.4734', 'Xiangyun');
INSERT INTO `ctshop_region` VALUES ('532924', '宾川县', '532900', '宾川', '3', '0872', '671600', '中国,云南省,大理白族自治州,宾川县', '100.577', '25.8314', 'Binchuan');
INSERT INTO `ctshop_region` VALUES ('532925', '弥渡县', '532900', '弥渡', '3', '0872', '675600', '中国,云南省,大理白族自治州,弥渡县', '100.491', '25.3418', 'Midu');
INSERT INTO `ctshop_region` VALUES ('532926', '南涧彝族自治县', '532900', '南涧', '3', '0872', '675700', '中国,云南省,大理白族自治州,南涧彝族自治县', '100.51', '25.0435', 'Nanjian');
INSERT INTO `ctshop_region` VALUES ('532927', '巍山彝族回族自治县', '532900', '巍山', '3', '0872', '672400', '中国,云南省,大理白族自治州,巍山彝族回族自治县', '100.306', '25.232', 'Weishan');
INSERT INTO `ctshop_region` VALUES ('532928', '永平县', '532900', '永平', '3', '0872', '672600', '中国,云南省,大理白族自治州,永平县', '99.5409', '25.4645', 'Yongping');
INSERT INTO `ctshop_region` VALUES ('532929', '云龙县', '532900', '云龙', '3', '0872', '672700', '中国,云南省,大理白族自治州,云龙县', '99.3726', '25.885', 'Yunlong');
INSERT INTO `ctshop_region` VALUES ('532930', '洱源县', '532900', '洱源', '3', '0872', '671200', '中国,云南省,大理白族自治州,洱源县', '99.949', '26.1083', 'Eryuan');
INSERT INTO `ctshop_region` VALUES ('532931', '剑川县', '532900', '剑川', '3', '0872', '671300', '中国,云南省,大理白族自治州,剑川县', '99.9054', '26.5369', 'Jianchuan');
INSERT INTO `ctshop_region` VALUES ('532932', '鹤庆县', '532900', '鹤庆', '3', '0872', '671500', '中国,云南省,大理白族自治州,鹤庆县', '100.177', '26.558', 'Heqing');
INSERT INTO `ctshop_region` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '德宏', '2', '0692', '678400', '中国,云南省,德宏傣族景颇族自治州', '98.5784', '24.4367', 'Dehong');
INSERT INTO `ctshop_region` VALUES ('533102', '瑞丽市', '533100', '瑞丽', '3', '0692', '678600', '中国,云南省,德宏傣族景颇族自治州,瑞丽市', '97.8518', '24.0128', 'Ruili');
INSERT INTO `ctshop_region` VALUES ('533103', '芒市', '533100', '芒市', '3', '0692', '678400', '中国,云南省,德宏傣族景颇族自治州,芒市', '98.5886', '24.4337', 'Mangshi');
INSERT INTO `ctshop_region` VALUES ('533122', '梁河县', '533100', '梁河', '3', '0692', '679200', '中国,云南省,德宏傣族景颇族自治州,梁河县', '98.2971', '24.8066', 'Lianghe');
INSERT INTO `ctshop_region` VALUES ('533123', '盈江县', '533100', '盈江', '3', '0692', '679300', '中国,云南省,德宏傣族景颇族自治州,盈江县', '97.9318', '24.7058', 'Yingjiang');
INSERT INTO `ctshop_region` VALUES ('533124', '陇川县', '533100', '陇川', '3', '0692', '678700', '中国,云南省,德宏傣族景颇族自治州,陇川县', '97.792', '24.183', 'Longchuan');
INSERT INTO `ctshop_region` VALUES ('533300', '怒江傈僳族自治州', '530000', '怒江', '2', '0886', '673100', '中国,云南省,怒江傈僳族自治州', '98.8543', '25.8509', 'Nujiang');
INSERT INTO `ctshop_region` VALUES ('533321', '泸水县', '533300', '泸水', '3', '0886', '673100', '中国,云南省,怒江傈僳族自治州,泸水县', '98.8553', '25.8377', 'Lushui');
INSERT INTO `ctshop_region` VALUES ('533323', '福贡县', '533300', '福贡', '3', '0886', '673400', '中国,云南省,怒江傈僳族自治州,福贡县', '98.8697', '26.9037', 'Fugong');
INSERT INTO `ctshop_region` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '贡山', '3', '0886', '673500', '中国,云南省,怒江傈僳族自治州,贡山独龙族怒族自治县', '98.6658', '27.7409', 'Gongshan');
INSERT INTO `ctshop_region` VALUES ('533325', '兰坪白族普米族自治县', '533300', '兰坪', '3', '0886', '671400', '中国,云南省,怒江傈僳族自治州,兰坪白族普米族自治县', '99.4189', '26.4525', 'Lanping');
INSERT INTO `ctshop_region` VALUES ('533400', '迪庆藏族自治州', '530000', '迪庆', '2', '0887', '674400', '中国,云南省,迪庆藏族自治州', '99.7065', '27.8269', 'Deqen');
INSERT INTO `ctshop_region` VALUES ('533421', '香格里拉市', '533400', '香格里拉', '3', '0887', '674400', '中国,云南省,迪庆藏族自治州,香格里拉市', '99.706', '27.8231', 'Xianggelila');
INSERT INTO `ctshop_region` VALUES ('533422', '德钦县', '533400', '德钦', '3', '0887', '674500', '中国,云南省,迪庆藏族自治州,德钦县', '98.9108', '28.4863', 'Deqin');
INSERT INTO `ctshop_region` VALUES ('533423', '维西傈僳族自治县', '533400', '维西', '3', '0887', '674600', '中国,云南省,迪庆藏族自治州,维西傈僳族自治县', '99.284', '27.1793', 'Weixi');
INSERT INTO `ctshop_region` VALUES ('540000', '西藏自治区', '100000', '西藏', '1', '', '', '中国,西藏自治区', '91.1322', '29.6604', 'Tibet');
INSERT INTO `ctshop_region` VALUES ('540100', '拉萨市', '540000', '拉萨', '2', '0891', '850000', '中国,西藏自治区,拉萨市', '91.1322', '29.6604', 'Lhasa');
INSERT INTO `ctshop_region` VALUES ('540102', '城关区', '540100', '城关', '3', '0891', '850000', '中国,西藏自治区,拉萨市,城关区', '91.1386', '29.6531', 'Chengguan');
INSERT INTO `ctshop_region` VALUES ('540121', '林周县', '540100', '林周', '3', '0891', '851600', '中国,西藏自治区,拉萨市,林周县', '91.2586', '29.8944', 'Linzhou');
INSERT INTO `ctshop_region` VALUES ('540122', '当雄县', '540100', '当雄', '3', '0891', '851500', '中国,西藏自治区,拉萨市,当雄县', '91.1008', '30.4831', 'Dangxiong');
INSERT INTO `ctshop_region` VALUES ('540123', '尼木县', '540100', '尼木', '3', '0891', '851300', '中国,西藏自治区,拉萨市,尼木县', '90.1638', '29.4335', 'Nimu');
INSERT INTO `ctshop_region` VALUES ('540124', '曲水县', '540100', '曲水', '3', '0891', '850600', '中国,西藏自治区,拉萨市,曲水县', '90.7319', '29.3564', 'Qushui');
INSERT INTO `ctshop_region` VALUES ('540125', '堆龙德庆县', '540100', '堆龙德庆', '3', '0891', '851400', '中国,西藏自治区,拉萨市,堆龙德庆县', '91.0003', '29.65', 'Duilongdeqing');
INSERT INTO `ctshop_region` VALUES ('540126', '达孜县', '540100', '达孜', '3', '0891', '850100', '中国,西藏自治区,拉萨市,达孜县', '91.3576', '29.6722', 'Dazi');
INSERT INTO `ctshop_region` VALUES ('540127', '墨竹工卡县', '540100', '墨竹工卡', '3', '0891', '850200', '中国,西藏自治区,拉萨市,墨竹工卡县', '91.7281', '29.8361', 'Mozhugongka');
INSERT INTO `ctshop_region` VALUES ('540200', '日喀则市', '540000', '日喀则', '2', '0892', '857000', '中国,西藏自治区,日喀则市', '88.8849', '29.2638', 'Rikaze');
INSERT INTO `ctshop_region` VALUES ('540202', '桑珠孜区', '540200', '桑珠孜', '3', '0892', '857000', '中国,西藏自治区,日喀则市,桑珠孜区', '88.8804', '29.2696', 'Sangzhuzi');
INSERT INTO `ctshop_region` VALUES ('540221', '南木林县', '540200', '南木林', '3', '0892', '857100', '中国,西藏自治区,日喀则市,南木林县', '89.0969', '29.6821', 'Nanmulin');
INSERT INTO `ctshop_region` VALUES ('540222', '江孜县', '540200', '江孜', '3', '0892', '857400', '中国,西藏自治区,日喀则市,江孜县', '89.6026', '28.9174', 'Jiangzi');
INSERT INTO `ctshop_region` VALUES ('540223', '定日县', '540200', '定日', '3', '0892', '858200', '中国,西藏自治区,日喀则市,定日县', '87.1218', '28.6613', 'Dingri');
INSERT INTO `ctshop_region` VALUES ('540224', '萨迦县', '540200', '萨迦', '3', '0892', '857800', '中国,西藏自治区,日喀则市,萨迦县', '88.0219', '28.903', 'Sajia');
INSERT INTO `ctshop_region` VALUES ('540225', '拉孜县', '540200', '拉孜', '3', '0892', '858100', '中国,西藏自治区,日喀则市,拉孜县', '87.6341', '29.085', 'Lazi');
INSERT INTO `ctshop_region` VALUES ('540226', '昂仁县', '540200', '昂仁', '3', '0892', '858500', '中国,西藏自治区,日喀则市,昂仁县', '87.2386', '29.295', 'Angren');
INSERT INTO `ctshop_region` VALUES ('540227', '谢通门县', '540200', '谢通门', '3', '0892', '858900', '中国,西藏自治区,日喀则市,谢通门县', '88.2624', '29.4334', 'Xietongmen');
INSERT INTO `ctshop_region` VALUES ('540228', '白朗县', '540200', '白朗', '3', '0892', '857300', '中国,西藏自治区,日喀则市,白朗县', '89.262', '29.1055', 'Bailang');
INSERT INTO `ctshop_region` VALUES ('540229', '仁布县', '540200', '仁布', '3', '0892', '857200', '中国,西藏自治区,日喀则市,仁布县', '89.8423', '29.2301', 'Renbu');
INSERT INTO `ctshop_region` VALUES ('540230', '康马县', '540200', '康马', '3', '0892', '857500', '中国,西藏自治区,日喀则市,康马县', '89.6853', '28.5567', 'Kangma');
INSERT INTO `ctshop_region` VALUES ('540231', '定结县', '540200', '定结', '3', '0892', '857900', '中国,西藏自治区,日喀则市,定结县', '87.7726', '28.364', 'Dingjie');
INSERT INTO `ctshop_region` VALUES ('540232', '仲巴县', '540200', '仲巴', '3', '0892', '858800', '中国,西藏自治区,日喀则市,仲巴县', '84.0295', '29.7659', 'Zhongba');
INSERT INTO `ctshop_region` VALUES ('540233', '亚东县', '540200', '亚东', '3', '0892', '857600', '中国,西藏自治区,日喀则市,亚东县', '88.908', '27.4839', 'Yadong');
INSERT INTO `ctshop_region` VALUES ('540234', '吉隆县', '540200', '吉隆', '3', '0892', '858700', '中国,西藏自治区,日喀则市,吉隆县', '85.2985', '28.8538', 'Jilong');
INSERT INTO `ctshop_region` VALUES ('540235', '聂拉木县', '540200', '聂拉木', '3', '0892', '858300', '中国,西藏自治区,日喀则市,聂拉木县', '85.98', '28.1565', 'Nielamu');
INSERT INTO `ctshop_region` VALUES ('540236', '萨嘎县', '540200', '萨嘎', '3', '0892', '857800', '中国,西藏自治区,日喀则市,萨嘎县', '85.2341', '29.3294', 'Saga');
INSERT INTO `ctshop_region` VALUES ('540237', '岗巴县', '540200', '岗巴', '3', '0892', '857700', '中国,西藏自治区,日喀则市,岗巴县', '88.5207', '28.275', 'Gangba');
INSERT INTO `ctshop_region` VALUES ('540300', '昌都市', '540000', '昌都', '2', '0895', '854000', '中国,西藏自治区,昌都市', '97.1785', '31.1369', 'Qamdo');
INSERT INTO `ctshop_region` VALUES ('540302', '卡若区', '540300', '昌都', '3', '0895', '854000', '中国,西藏自治区,昌都市,卡若区', '97.1804', '31.1385', 'Karuo');
INSERT INTO `ctshop_region` VALUES ('540321', '江达县', '540300', '江达', '3', '0895', '854100', '中国,西藏自治区,昌都市,江达县', '98.2187', '31.5034', 'Jiangda');
INSERT INTO `ctshop_region` VALUES ('540322', '贡觉县', '540300', '贡觉', '3', '0895', '854200', '中国,西藏自治区,昌都市,贡觉县', '98.2716', '30.8594', 'Gongjue');
INSERT INTO `ctshop_region` VALUES ('540323', '类乌齐县', '540300', '类乌齐', '3', '0895', '855600', '中国,西藏自治区,昌都市,类乌齐县', '96.6002', '31.2121', 'Leiwuqi');
INSERT INTO `ctshop_region` VALUES ('540324', '丁青县', '540300', '丁青', '3', '0895', '855700', '中国,西藏自治区,昌都市,丁青县', '95.5936', '31.4162', 'Dingqing');
INSERT INTO `ctshop_region` VALUES ('540325', '察雅县', '540300', '察雅', '3', '0895', '854300', '中国,西藏自治区,昌都市,察雅县', '97.5652', '30.6534', 'Chaya');
INSERT INTO `ctshop_region` VALUES ('540326', '八宿县', '540300', '八宿', '3', '0895', '854600', '中国,西藏自治区,昌都市,八宿县', '96.9176', '30.0535', 'Basu');
INSERT INTO `ctshop_region` VALUES ('540327', '左贡县', '540300', '左贡', '3', '0895', '854400', '中国,西藏自治区,昌都市,左贡县', '97.8443', '29.6711', 'Zuogong');
INSERT INTO `ctshop_region` VALUES ('540328', '芒康县', '540300', '芒康', '3', '0895', '854500', '中国,西藏自治区,昌都市,芒康县', '98.5938', '29.6795', 'Mangkang');
INSERT INTO `ctshop_region` VALUES ('540329', '洛隆县', '540300', '洛隆', '3', '0895', '855400', '中国,西藏自治区,昌都市,洛隆县', '95.8264', '30.7405', 'Luolong');
INSERT INTO `ctshop_region` VALUES ('540330', '边坝县', '540300', '边坝', '3', '0895', '855500', '中国,西藏自治区,昌都市,边坝县', '94.7069', '30.9343', 'Bianba');
INSERT INTO `ctshop_region` VALUES ('542200', '山南地区', '540000', '山南', '2', '0893', '856000', '中国,西藏自治区,山南地区', '91.7665', '29.236', 'Shannan');
INSERT INTO `ctshop_region` VALUES ('542221', '乃东县', '542200', '乃东', '3', '0893', '856100', '中国,西藏自治区,山南地区,乃东县', '91.7615', '29.2249', 'Naidong');
INSERT INTO `ctshop_region` VALUES ('542222', '扎囊县', '542200', '扎囊', '3', '0893', '850800', '中国,西藏自治区,山南地区,扎囊县', '91.3329', '29.2399', 'Zhanang');
INSERT INTO `ctshop_region` VALUES ('542223', '贡嘎县', '542200', '贡嘎', '3', '0893', '850700', '中国,西藏自治区,山南地区,贡嘎县', '90.9887', '29.2941', 'Gongga');
INSERT INTO `ctshop_region` VALUES ('542224', '桑日县', '542200', '桑日', '3', '0893', '856200', '中国,西藏自治区,山南地区,桑日县', '92.0201', '29.2664', 'Sangri');
INSERT INTO `ctshop_region` VALUES ('542225', '琼结县', '542200', '琼结', '3', '0893', '856800', '中国,西藏自治区,山南地区,琼结县', '91.6809', '29.0263', 'Qiongjie');
INSERT INTO `ctshop_region` VALUES ('542226', '曲松县', '542200', '曲松', '3', '0893', '856300', '中国,西藏自治区,山南地区,曲松县', '92.2026', '29.0641', 'Qusong');
INSERT INTO `ctshop_region` VALUES ('542227', '措美县', '542200', '措美', '3', '0893', '856900', '中国,西藏自治区,山南地区,措美县', '91.4324', '28.4379', 'Cuomei');
INSERT INTO `ctshop_region` VALUES ('542228', '洛扎县', '542200', '洛扎', '3', '0893', '856600', '中国,西藏自治区,山南地区,洛扎县', '90.8604', '28.3872', 'Luozha');
INSERT INTO `ctshop_region` VALUES ('542229', '加查县', '542200', '加查', '3', '0893', '856400', '中国,西藏自治区,山南地区,加查县', '92.577', '29.1397', 'Jiacha');
INSERT INTO `ctshop_region` VALUES ('542231', '隆子县', '542200', '隆子', '3', '0893', '856600', '中国,西藏自治区,山南地区,隆子县', '92.4615', '28.408', 'Longzi');
INSERT INTO `ctshop_region` VALUES ('542232', '错那县', '542200', '错那', '3', '0893', '856700', '中国,西藏自治区,山南地区,错那县', '91.9575', '27.9922', 'Cuona');
INSERT INTO `ctshop_region` VALUES ('542233', '浪卡子县', '542200', '浪卡子', '3', '0893', '851100', '中国,西藏自治区,山南地区,浪卡子县', '90.4', '28.9695', 'Langkazi');
INSERT INTO `ctshop_region` VALUES ('542400', '那曲地区', '540000', '那曲', '2', '0896', '852000', '中国,西藏自治区,那曲地区', '92.0602', '31.476', 'Nagqu');
INSERT INTO `ctshop_region` VALUES ('542421', '那曲县', '542400', '那曲', '3', '0896', '852000', '中国,西藏自治区,那曲地区,那曲县', '92.0535', '31.4696', 'Naqu');
INSERT INTO `ctshop_region` VALUES ('542422', '嘉黎县', '542400', '嘉黎', '3', '0896', '852400', '中国,西藏自治区,那曲地区,嘉黎县', '93.2499', '30.6423', 'Jiali');
INSERT INTO `ctshop_region` VALUES ('542423', '比如县', '542400', '比如', '3', '0896', '852300', '中国,西藏自治区,那曲地区,比如县', '93.6869', '31.4779', 'Biru');
INSERT INTO `ctshop_region` VALUES ('542424', '聂荣县', '542400', '聂荣', '3', '0896', '853500', '中国,西藏自治区,那曲地区,聂荣县', '92.2957', '32.1119', 'Nierong');
INSERT INTO `ctshop_region` VALUES ('542425', '安多县', '542400', '安多', '3', '0896', '853400', '中国,西藏自治区,那曲地区,安多县', '91.6795', '32.2612', 'Anduo');
INSERT INTO `ctshop_region` VALUES ('542426', '申扎县', '542400', '申扎', '3', '0896', '853100', '中国,西藏自治区,那曲地区,申扎县', '88.7078', '30.93', 'Shenzha');
INSERT INTO `ctshop_region` VALUES ('542427', '索县', '542400', '索县', '3', '0896', '852200', '中国,西藏自治区,那曲地区,索县', '93.783', '31.8843', 'Suoxian');
INSERT INTO `ctshop_region` VALUES ('542428', '班戈县', '542400', '班戈', '3', '0896', '852500', '中国,西藏自治区,那曲地区,班戈县', '90.0191', '31.3615', 'Bange');
INSERT INTO `ctshop_region` VALUES ('542429', '巴青县', '542400', '巴青', '3', '0896', '852100', '中国,西藏自治区,那曲地区,巴青县', '94.0532', '31.9183', 'Baqing');
INSERT INTO `ctshop_region` VALUES ('542430', '尼玛县', '542400', '尼玛', '3', '0896', '852600', '中国,西藏自治区,那曲地区,尼玛县', '87.2526', '31.7965', 'Nima');
INSERT INTO `ctshop_region` VALUES ('542431', '双湖县', '542400', '双湖', '3', '0896', '852600', '中国,西藏自治区,那曲地区,双湖县', '88.8378', '33.189', 'Shuanghu');
INSERT INTO `ctshop_region` VALUES ('542500', '阿里地区', '540000', '阿里', '2', '0897', '859000', '中国,西藏自治区,阿里地区', '80.1055', '32.5032', 'Ngari');
INSERT INTO `ctshop_region` VALUES ('542521', '普兰县', '542500', '普兰', '3', '0897', '859500', '中国,西藏自治区,阿里地区,普兰县', '81.177', '30.3', 'Pulan');
INSERT INTO `ctshop_region` VALUES ('542522', '札达县', '542500', '札达', '3', '0897', '859600', '中国,西藏自治区,阿里地区,札达县', '79.8026', '31.4834', 'Zhada');
INSERT INTO `ctshop_region` VALUES ('542523', '噶尔县', '542500', '噶尔', '3', '0897', '859400', '中国,西藏自治区,阿里地区,噶尔县', '80.0958', '32.5002', 'Gaer');
INSERT INTO `ctshop_region` VALUES ('542524', '日土县', '542500', '日土', '3', '0897', '859700', '中国,西藏自治区,阿里地区,日土县', '79.7131', '33.3874', 'Ritu');
INSERT INTO `ctshop_region` VALUES ('542525', '革吉县', '542500', '革吉', '3', '0897', '859100', '中国,西藏自治区,阿里地区,革吉县', '81.151', '32.3964', 'Geji');
INSERT INTO `ctshop_region` VALUES ('542526', '改则县', '542500', '改则', '3', '0897', '859200', '中国,西藏自治区,阿里地区,改则县', '84.063', '32.3045', 'Gaize');
INSERT INTO `ctshop_region` VALUES ('542527', '措勤县', '542500', '措勤', '3', '0897', '859300', '中国,西藏自治区,阿里地区,措勤县', '85.1662', '31.021', 'Cuoqin');
INSERT INTO `ctshop_region` VALUES ('542600', '林芝地区', '540000', '林芝', '2', '0894', '850400', '中国,西藏自治区,林芝地区', '94.3624', '29.6547', 'Nyingchi');
INSERT INTO `ctshop_region` VALUES ('542621', '林芝县', '542600', '林芝', '3', '0894', '850400', '中国,西藏自治区,林芝地区,林芝县', '94.4839', '29.5756', 'Linzhi');
INSERT INTO `ctshop_region` VALUES ('542622', '工布江达县', '542600', '工布江达', '3', '0894', '850300', '中国,西藏自治区,林芝地区,工布江达县', '93.2452', '29.8858', 'Gongbujiangda');
INSERT INTO `ctshop_region` VALUES ('542623', '米林县', '542600', '米林', '3', '0894', '850500', '中国,西藏自治区,林芝地区,米林县', '94.2132', '29.2153', 'Milin');
INSERT INTO `ctshop_region` VALUES ('542624', '墨脱县', '542600', '墨脱', '3', '0894', '855300', '中国,西藏自治区,林芝地区,墨脱县', '95.3316', '29.327', 'Motuo');
INSERT INTO `ctshop_region` VALUES ('542625', '波密县', '542600', '波密', '3', '0894', '855200', '中国,西藏自治区,林芝地区,波密县', '95.771', '29.8591', 'Bomi');
INSERT INTO `ctshop_region` VALUES ('542626', '察隅县', '542600', '察隅', '3', '0894', '855100', '中国,西藏自治区,林芝地区,察隅县', '97.4668', '28.6618', 'Chayu');
INSERT INTO `ctshop_region` VALUES ('542627', '朗县', '542600', '朗县', '3', '0894', '856500', '中国,西藏自治区,林芝地区,朗县', '93.0754', '29.0455', 'Langxian');
INSERT INTO `ctshop_region` VALUES ('610000', '陕西省', '100000', '陕西', '1', '', '', '中国,陕西省', '108.948', '34.2632', 'Shaanxi');
INSERT INTO `ctshop_region` VALUES ('610100', '西安市', '610000', '西安', '2', '029', '710003', '中国,陕西省,西安市', '108.948', '34.2632', 'Xi\'an');
INSERT INTO `ctshop_region` VALUES ('610102', '新城区', '610100', '新城', '3', '029', '710004', '中国,陕西省,西安市,新城区', '108.961', '34.2664', 'Xincheng');
INSERT INTO `ctshop_region` VALUES ('610103', '碑林区', '610100', '碑林', '3', '029', '710001', '中国,陕西省,西安市,碑林区', '108.934', '34.2304', 'Beilin');
INSERT INTO `ctshop_region` VALUES ('610104', '莲湖区', '610100', '莲湖', '3', '029', '710003', '中国,陕西省,西安市,莲湖区', '108.94', '34.2671', 'Lianhu');
INSERT INTO `ctshop_region` VALUES ('610111', '灞桥区', '610100', '灞桥', '3', '029', '710038', '中国,陕西省,西安市,灞桥区', '109.065', '34.2726', 'Baqiao');
INSERT INTO `ctshop_region` VALUES ('610112', '未央区', '610100', '未央', '3', '029', '710014', '中国,陕西省,西安市,未央区', '108.947', '34.293', 'Weiyang');
INSERT INTO `ctshop_region` VALUES ('610113', '雁塔区', '610100', '雁塔', '3', '029', '710061', '中国,陕西省,西安市,雁塔区', '108.949', '34.2225', 'Yanta');
INSERT INTO `ctshop_region` VALUES ('610114', '阎良区', '610100', '阎良', '3', '029', '710087', '中国,陕西省,西安市,阎良区', '109.226', '34.6622', 'Yanliang');
INSERT INTO `ctshop_region` VALUES ('610115', '临潼区', '610100', '临潼', '3', '029', '710600', '中国,陕西省,西安市,临潼区', '109.214', '34.3666', 'Lintong');
INSERT INTO `ctshop_region` VALUES ('610116', '长安区', '610100', '长安', '3', '029', '710100', '中国,陕西省,西安市,长安区', '108.946', '34.1556', 'Chang\'an');
INSERT INTO `ctshop_region` VALUES ('610122', '蓝田县', '610100', '蓝田', '3', '029', '710500', '中国,陕西省,西安市,蓝田县', '109.323', '34.1513', 'Lantian');
INSERT INTO `ctshop_region` VALUES ('610124', '周至县', '610100', '周至', '3', '029', '710400', '中国,陕西省,西安市,周至县', '108.222', '34.1634', 'Zhouzhi');
INSERT INTO `ctshop_region` VALUES ('610125', '户县', '610100', '户县', '3', '029', '710300', '中国,陕西省,西安市,户县', '108.605', '34.1086', 'Huxian');
INSERT INTO `ctshop_region` VALUES ('610126', '高陵区', '610100', '高陵', '3', '029', '710200', '中国,陕西省,西安市,高陵区', '109.088', '34.5348', 'Gaoling');
INSERT INTO `ctshop_region` VALUES ('610200', '铜川市', '610000', '铜川', '2', '0919', '727100', '中国,陕西省,铜川市', '108.963', '34.9089', 'Tongchuan');
INSERT INTO `ctshop_region` VALUES ('610202', '王益区', '610200', '王益', '3', '0919', '727000', '中国,陕西省,铜川市,王益区', '109.076', '35.069', 'Wangyi');
INSERT INTO `ctshop_region` VALUES ('610203', '印台区', '610200', '印台', '3', '0919', '727007', '中国,陕西省,铜川市,印台区', '109.102', '35.1169', 'Yintai');
INSERT INTO `ctshop_region` VALUES ('610204', '耀州区', '610200', '耀州', '3', '0919', '727100', '中国,陕西省,铜川市,耀州区', '108.986', '34.9131', 'Yaozhou');
INSERT INTO `ctshop_region` VALUES ('610222', '宜君县', '610200', '宜君', '3', '0919', '727200', '中国,陕西省,铜川市,宜君县', '109.118', '35.4011', 'Yijun');
INSERT INTO `ctshop_region` VALUES ('610300', '宝鸡市', '610000', '宝鸡', '2', '0917', '721000', '中国,陕西省,宝鸡市', '107.145', '34.3693', 'Baoji');
INSERT INTO `ctshop_region` VALUES ('610302', '渭滨区', '610300', '渭滨', '3', '0917', '721000', '中国,陕西省,宝鸡市,渭滨区', '107.15', '34.3712', 'Weibin');
INSERT INTO `ctshop_region` VALUES ('610303', '金台区', '610300', '金台', '3', '0917', '721000', '中国,陕西省,宝鸡市,金台区', '107.147', '34.3761', 'Jintai');
INSERT INTO `ctshop_region` VALUES ('610304', '陈仓区', '610300', '陈仓', '3', '0917', '721300', '中国,陕西省,宝鸡市,陈仓区', '107.387', '34.3545', 'Chencang');
INSERT INTO `ctshop_region` VALUES ('610322', '凤翔县', '610300', '凤翔', '3', '0917', '721400', '中国,陕西省,宝鸡市,凤翔县', '107.396', '34.5232', 'Fengxiang');
INSERT INTO `ctshop_region` VALUES ('610323', '岐山县', '610300', '岐山', '3', '0917', '722400', '中国,陕西省,宝鸡市,岐山县', '107.622', '34.4438', 'Qishan');
INSERT INTO `ctshop_region` VALUES ('610324', '扶风县', '610300', '扶风', '3', '0917', '722200', '中国,陕西省,宝鸡市,扶风县', '107.9', '34.3752', 'Fufeng');
INSERT INTO `ctshop_region` VALUES ('610326', '眉县', '610300', '眉县', '3', '0917', '722300', '中国,陕西省,宝鸡市,眉县', '107.751', '34.2757', 'Meixian');
INSERT INTO `ctshop_region` VALUES ('610327', '陇县', '610300', '陇县', '3', '0917', '721200', '中国,陕西省,宝鸡市,陇县', '106.859', '34.894', 'Longxian');
INSERT INTO `ctshop_region` VALUES ('610328', '千阳县', '610300', '千阳', '3', '0917', '721100', '中国,陕西省,宝鸡市,千阳县', '107.13', '34.6422', 'Qianyang');
INSERT INTO `ctshop_region` VALUES ('610329', '麟游县', '610300', '麟游', '3', '0917', '721500', '中国,陕西省,宝鸡市,麟游县', '107.796', '34.6784', 'Linyou');
INSERT INTO `ctshop_region` VALUES ('610330', '凤县', '610300', '凤县', '3', '0917', '721700', '中国,陕西省,宝鸡市,凤县', '106.524', '33.9117', 'Fengxian');
INSERT INTO `ctshop_region` VALUES ('610331', '太白县', '610300', '太白', '3', '0917', '721600', '中国,陕西省,宝鸡市,太白县', '107.316', '34.0621', 'Taibai');
INSERT INTO `ctshop_region` VALUES ('610400', '咸阳市', '610000', '咸阳', '2', '029', '712000', '中国,陕西省,咸阳市', '108.705', '34.3334', 'Xianyang');
INSERT INTO `ctshop_region` VALUES ('610402', '秦都区', '610400', '秦都', '3', '029', '712000', '中国,陕西省,咸阳市,秦都区', '108.715', '34.338', 'Qindu');
INSERT INTO `ctshop_region` VALUES ('610403', '杨陵区', '610400', '杨陵', '3', '029', '712100', '中国,陕西省,咸阳市,杨陵区', '108.083', '34.2704', 'Yangling');
INSERT INTO `ctshop_region` VALUES ('610404', '渭城区', '610400', '渭城', '3', '029', '712000', '中国,陕西省,咸阳市,渭城区', '108.722', '34.332', 'Weicheng');
INSERT INTO `ctshop_region` VALUES ('610422', '三原县', '610400', '三原', '3', '029', '713800', '中国,陕西省,咸阳市,三原县', '108.932', '34.6156', 'Sanyuan');
INSERT INTO `ctshop_region` VALUES ('610423', '泾阳县', '610400', '泾阳', '3', '029', '713700', '中国,陕西省,咸阳市,泾阳县', '108.843', '34.5271', 'Jingyang');
INSERT INTO `ctshop_region` VALUES ('610424', '乾县', '610400', '乾县', '3', '029', '713300', '中国,陕西省,咸阳市,乾县', '108.242', '34.5295', 'Qianxian');
INSERT INTO `ctshop_region` VALUES ('610425', '礼泉县', '610400', '礼泉', '3', '029', '713200', '中国,陕西省,咸阳市,礼泉县', '108.426', '34.4846', 'Liquan');
INSERT INTO `ctshop_region` VALUES ('610426', '永寿县', '610400', '永寿', '3', '029', '713400', '中国,陕西省,咸阳市,永寿县', '108.145', '34.6908', 'Yongshou');
INSERT INTO `ctshop_region` VALUES ('610427', '彬县', '610400', '彬县', '3', '029', '713500', '中国,陕西省,咸阳市,彬县', '108.085', '35.0342', 'Binxian');
INSERT INTO `ctshop_region` VALUES ('610428', '长武县', '610400', '长武', '3', '029', '713600', '中国,陕西省,咸阳市,长武县', '107.795', '35.2067', 'Changwu');
INSERT INTO `ctshop_region` VALUES ('610429', '旬邑县', '610400', '旬邑', '3', '029', '711300', '中国,陕西省,咸阳市,旬邑县', '108.334', '35.1134', 'Xunyi');
INSERT INTO `ctshop_region` VALUES ('610430', '淳化县', '610400', '淳化', '3', '029', '711200', '中国,陕西省,咸阳市,淳化县', '108.58', '34.7989', 'Chunhua');
INSERT INTO `ctshop_region` VALUES ('610431', '武功县', '610400', '武功', '3', '029', '712200', '中国,陕西省,咸阳市,武功县', '108.204', '34.26', 'Wugong');
INSERT INTO `ctshop_region` VALUES ('610481', '兴平市', '610400', '兴平', '3', '029', '713100', '中国,陕西省,咸阳市,兴平市', '108.491', '34.2979', 'Xingping');
INSERT INTO `ctshop_region` VALUES ('610500', '渭南市', '610000', '渭南', '2', '0913', '714000', '中国,陕西省,渭南市', '109.503', '34.4994', 'Weinan');
INSERT INTO `ctshop_region` VALUES ('610502', '临渭区', '610500', '临渭', '3', '0913', '714000', '中国,陕西省,渭南市,临渭区', '109.493', '34.4982', 'Linwei');
INSERT INTO `ctshop_region` VALUES ('610521', '华县', '610500', '华县', '3', '0913', '714100', '中国,陕西省,渭南市,华县', '109.772', '34.5126', 'Huaxian');
INSERT INTO `ctshop_region` VALUES ('610522', '潼关县', '610500', '潼关', '3', '0913', '714300', '中国,陕西省,渭南市,潼关县', '110.244', '34.5428', 'Tongguan');
INSERT INTO `ctshop_region` VALUES ('610523', '大荔县', '610500', '大荔', '3', '0913', '715100', '中国,陕西省,渭南市,大荔县', '109.942', '34.7957', 'Dali');
INSERT INTO `ctshop_region` VALUES ('610524', '合阳县', '610500', '合阳', '3', '0913', '715300', '中国,陕西省,渭南市,合阳县', '110.149', '35.238', 'Heyang');
INSERT INTO `ctshop_region` VALUES ('610525', '澄城县', '610500', '澄城', '3', '0913', '715200', '中国,陕西省,渭南市,澄城县', '109.934', '35.184', 'Chengcheng');
INSERT INTO `ctshop_region` VALUES ('610526', '蒲城县', '610500', '蒲城', '3', '0913', '715500', '中国,陕西省,渭南市,蒲城县', '109.59', '34.9568', 'Pucheng');
INSERT INTO `ctshop_region` VALUES ('610527', '白水县', '610500', '白水', '3', '0913', '715600', '中国,陕西省,渭南市,白水县', '109.593', '35.1786', 'Baishui');
INSERT INTO `ctshop_region` VALUES ('610528', '富平县', '610500', '富平', '3', '0913', '711700', '中国,陕西省,渭南市,富平县', '109.18', '34.7511', 'Fuping');
INSERT INTO `ctshop_region` VALUES ('610581', '韩城市', '610500', '韩城', '3', '0913', '715400', '中国,陕西省,渭南市,韩城市', '110.442', '35.4793', 'Hancheng');
INSERT INTO `ctshop_region` VALUES ('610582', '华阴市', '610500', '华阴', '3', '0913', '714200', '中国,陕西省,渭南市,华阴市', '110.088', '34.5661', 'Huayin');
INSERT INTO `ctshop_region` VALUES ('610600', '延安市', '610000', '延安', '2', '0911', '716000', '中国,陕西省,延安市', '109.491', '36.5965', 'Yan\'an');
INSERT INTO `ctshop_region` VALUES ('610602', '宝塔区', '610600', '宝塔', '3', '0911', '716000', '中国,陕西省,延安市,宝塔区', '109.493', '36.5915', 'Baota');
INSERT INTO `ctshop_region` VALUES ('610621', '延长县', '610600', '延长', '3', '0911', '717100', '中国,陕西省,延安市,延长县', '110.011', '36.579', 'Yanchang');
INSERT INTO `ctshop_region` VALUES ('610622', '延川县', '610600', '延川', '3', '0911', '717200', '中国,陕西省,延安市,延川县', '110.194', '36.8782', 'Yanchuan');
INSERT INTO `ctshop_region` VALUES ('610623', '子长县', '610600', '子长', '3', '0911', '717300', '中国,陕西省,延安市,子长县', '109.675', '37.1425', 'Zichang');
INSERT INTO `ctshop_region` VALUES ('610624', '安塞县', '610600', '安塞', '3', '0911', '717400', '中国,陕西省,延安市,安塞县', '109.327', '36.8651', 'Ansai');
INSERT INTO `ctshop_region` VALUES ('610625', '志丹县', '610600', '志丹', '3', '0911', '717500', '中国,陕西省,延安市,志丹县', '108.768', '36.8218', 'Zhidan');
INSERT INTO `ctshop_region` VALUES ('610626', '吴起县', '610600', '吴起', '3', '0911', '717600', '中国,陕西省,延安市,吴起县', '108.176', '36.9278', 'Wuqi');
INSERT INTO `ctshop_region` VALUES ('610627', '甘泉县', '610600', '甘泉', '3', '0911', '716100', '中国,陕西省,延安市,甘泉县', '109.35', '36.2775', 'Ganquan');
INSERT INTO `ctshop_region` VALUES ('610628', '富县', '610600', '富县', '3', '0911', '727500', '中国,陕西省,延安市,富县', '109.379', '35.988', 'Fuxian');
INSERT INTO `ctshop_region` VALUES ('610629', '洛川县', '610600', '洛川', '3', '0911', '727400', '中国,陕西省,延安市,洛川县', '109.433', '35.7608', 'Luochuan');
INSERT INTO `ctshop_region` VALUES ('610630', '宜川县', '610600', '宜川', '3', '0911', '716200', '中国,陕西省,延安市,宜川县', '110.172', '36.0473', 'Yichuan');
INSERT INTO `ctshop_region` VALUES ('610631', '黄龙县', '610600', '黄龙', '3', '0911', '715700', '中国,陕西省,延安市,黄龙县', '109.843', '35.5835', 'Huanglong');
INSERT INTO `ctshop_region` VALUES ('610632', '黄陵县', '610600', '黄陵', '3', '0911', '727300', '中国,陕西省,延安市,黄陵县', '109.263', '35.5836', 'Huangling');
INSERT INTO `ctshop_region` VALUES ('610700', '汉中市', '610000', '汉中', '2', '0916', '723000', '中国,陕西省,汉中市', '107.029', '33.0777', 'Hanzhong');
INSERT INTO `ctshop_region` VALUES ('610702', '汉台区', '610700', '汉台', '3', '0916', '723000', '中国,陕西省,汉中市,汉台区', '107.032', '33.0677', 'Hantai');
INSERT INTO `ctshop_region` VALUES ('610721', '南郑县', '610700', '南郑', '3', '0916', '723100', '中国,陕西省,汉中市,南郑县', '106.94', '33.003', 'Nanzheng');
INSERT INTO `ctshop_region` VALUES ('610722', '城固县', '610700', '城固', '3', '0916', '723200', '中国,陕西省,汉中市,城固县', '107.334', '33.1566', 'Chenggu');
INSERT INTO `ctshop_region` VALUES ('610723', '洋县', '610700', '洋县', '3', '0916', '723300', '中国,陕西省,汉中市,洋县', '107.547', '33.221', 'Yangxian');
INSERT INTO `ctshop_region` VALUES ('610724', '西乡县', '610700', '西乡', '3', '0916', '723500', '中国,陕西省,汉中市,西乡县', '107.769', '32.9841', 'Xixiang');
INSERT INTO `ctshop_region` VALUES ('610725', '勉县', '610700', '勉县', '3', '0916', '724200', '中国,陕西省,汉中市,勉县', '106.676', '33.1527', 'Mianxian');
INSERT INTO `ctshop_region` VALUES ('610726', '宁强县', '610700', '宁强', '3', '0916', '724400', '中国,陕西省,汉中市,宁强县', '106.26', '32.8288', 'Ningqiang');
INSERT INTO `ctshop_region` VALUES ('610727', '略阳县', '610700', '略阳', '3', '0916', '724300', '中国,陕西省,汉中市,略阳县', '106.154', '33.3301', 'Lueyang');
INSERT INTO `ctshop_region` VALUES ('610728', '镇巴县', '610700', '镇巴', '3', '0916', '723600', '中国,陕西省,汉中市,镇巴县', '107.896', '32.5349', 'Zhenba');
INSERT INTO `ctshop_region` VALUES ('610729', '留坝县', '610700', '留坝', '3', '0916', '724100', '中国,陕西省,汉中市,留坝县', '106.922', '33.6161', 'Liuba');
INSERT INTO `ctshop_region` VALUES ('610730', '佛坪县', '610700', '佛坪', '3', '0916', '723400', '中国,陕西省,汉中市,佛坪县', '107.99', '33.525', 'Foping');
INSERT INTO `ctshop_region` VALUES ('610800', '榆林市', '610000', '榆林', '2', '0912', '719000', '中国,陕西省,榆林市', '109.741', '38.2902', 'Yulin');
INSERT INTO `ctshop_region` VALUES ('610802', '榆阳区', '610800', '榆阳', '3', '0912', '719000', '中国,陕西省,榆林市,榆阳区', '109.735', '38.2784', 'Yuyang');
INSERT INTO `ctshop_region` VALUES ('610821', '神木县', '610800', '神木', '3', '0912', '719300', '中国,陕西省,榆林市,神木县', '110.499', '38.8423', 'Shenmu');
INSERT INTO `ctshop_region` VALUES ('610822', '府谷县', '610800', '府谷', '3', '0912', '719400', '中国,陕西省,榆林市,府谷县', '111.067', '39.028', 'Fugu');
INSERT INTO `ctshop_region` VALUES ('610823', '横山县', '610800', '横山', '3', '0912', '719100', '中国,陕西省,榆林市,横山县', '109.296', '37.958', 'Hengshan');
INSERT INTO `ctshop_region` VALUES ('610824', '靖边县', '610800', '靖边', '3', '0912', '718500', '中国,陕西省,榆林市,靖边县', '108.794', '37.5994', 'Jingbian');
INSERT INTO `ctshop_region` VALUES ('610825', '定边县', '610800', '定边', '3', '0912', '718600', '中国,陕西省,榆林市,定边县', '107.598', '37.5904', 'Dingbian');
INSERT INTO `ctshop_region` VALUES ('610826', '绥德县', '610800', '绥德', '3', '0912', '718000', '中国,陕西省,榆林市,绥德县', '110.261', '37.4978', 'Suide');
INSERT INTO `ctshop_region` VALUES ('610827', '米脂县', '610800', '米脂', '3', '0912', '718100', '中国,陕西省,榆林市,米脂县', '110.184', '37.7553', 'Mizhi');
INSERT INTO `ctshop_region` VALUES ('610828', '佳县', '610800', '佳县', '3', '0912', '719200', '中国,陕西省,榆林市,佳县', '110.494', '38.0225', 'Jiaxian');
INSERT INTO `ctshop_region` VALUES ('610829', '吴堡县', '610800', '吴堡', '3', '0912', '718200', '中国,陕西省,榆林市,吴堡县', '110.745', '37.4571', 'Wubu');
INSERT INTO `ctshop_region` VALUES ('610830', '清涧县', '610800', '清涧', '3', '0912', '718300', '中国,陕西省,榆林市,清涧县', '110.122', '37.0885', 'Qingjian');
INSERT INTO `ctshop_region` VALUES ('610831', '子洲县', '610800', '子洲', '3', '0912', '718400', '中国,陕西省,榆林市,子洲县', '110.035', '37.6124', 'Zizhou');
INSERT INTO `ctshop_region` VALUES ('610900', '安康市', '610000', '安康', '2', '0915', '725000', '中国,陕西省,安康市', '109.029', '32.6903', 'Ankang');
INSERT INTO `ctshop_region` VALUES ('610902', '汉滨区', '610900', '汉滨', '3', '0915', '725000', '中国,陕西省,安康市,汉滨区', '109.027', '32.6952', 'Hanbin');
INSERT INTO `ctshop_region` VALUES ('610921', '汉阴县', '610900', '汉阴', '3', '0915', '725100', '中国,陕西省,安康市,汉阴县', '108.511', '32.8913', 'Hanyin');
INSERT INTO `ctshop_region` VALUES ('610922', '石泉县', '610900', '石泉', '3', '0915', '725200', '中国,陕西省,安康市,石泉县', '108.248', '33.0397', 'Shiquan');
INSERT INTO `ctshop_region` VALUES ('610923', '宁陕县', '610900', '宁陕', '3', '0915', '711600', '中国,陕西省,安康市,宁陕县', '108.315', '33.3173', 'Ningshan');
INSERT INTO `ctshop_region` VALUES ('610924', '紫阳县', '610900', '紫阳', '3', '0915', '725300', '中国,陕西省,安康市,紫阳县', '108.537', '32.5211', 'Ziyang');
INSERT INTO `ctshop_region` VALUES ('610925', '岚皋县', '610900', '岚皋', '3', '0915', '725400', '中国,陕西省,安康市,岚皋县', '108.903', '32.3079', 'Langao');
INSERT INTO `ctshop_region` VALUES ('610926', '平利县', '610900', '平利', '3', '0915', '725500', '中国,陕西省,安康市,平利县', '109.358', '32.3911', 'Pingli');
INSERT INTO `ctshop_region` VALUES ('610927', '镇坪县', '610900', '镇坪', '3', '0915', '725600', '中国,陕西省,安康市,镇坪县', '109.525', '31.8833', 'Zhenping');
INSERT INTO `ctshop_region` VALUES ('610928', '旬阳县', '610900', '旬阳', '3', '0915', '725700', '中国,陕西省,安康市,旬阳县', '109.362', '32.8321', 'Xunyang');
INSERT INTO `ctshop_region` VALUES ('610929', '白河县', '610900', '白河', '3', '0915', '725800', '中国,陕西省,安康市,白河县', '110.113', '32.8096', 'Baihe');
INSERT INTO `ctshop_region` VALUES ('611000', '商洛市', '610000', '商洛', '2', '0914', '726000', '中国,陕西省,商洛市', '109.94', '33.8683', 'Shangluo');
INSERT INTO `ctshop_region` VALUES ('611002', '商州区', '611000', '商州', '3', '0914', '726000', '中国,陕西省,商洛市,商州区', '109.941', '33.8627', 'Shangzhou');
INSERT INTO `ctshop_region` VALUES ('611021', '洛南县', '611000', '洛南', '3', '0914', '726100', '中国,陕西省,商洛市,洛南县', '110.146', '34.0899', 'Luonan');
INSERT INTO `ctshop_region` VALUES ('611022', '丹凤县', '611000', '丹凤', '3', '0914', '726200', '中国,陕西省,商洛市,丹凤县', '110.335', '33.6947', 'Danfeng');
INSERT INTO `ctshop_region` VALUES ('611023', '商南县', '611000', '商南', '3', '0914', '726300', '中国,陕西省,商洛市,商南县', '110.884', '33.5258', 'Shangnan');
INSERT INTO `ctshop_region` VALUES ('611024', '山阳县', '611000', '山阳', '3', '0914', '726400', '中国,陕西省,商洛市,山阳县', '109.888', '33.5293', 'Shanyang');
INSERT INTO `ctshop_region` VALUES ('611025', '镇安县', '611000', '镇安', '3', '0914', '711500', '中国,陕西省,商洛市,镇安县', '109.154', '33.4237', 'Zhen\'an');
INSERT INTO `ctshop_region` VALUES ('611026', '柞水县', '611000', '柞水', '3', '0914', '711400', '中国,陕西省,商洛市,柞水县', '109.111', '33.6831', 'Zhashui');
INSERT INTO `ctshop_region` VALUES ('611100', '西咸新区', '610000', '西咸', '2', '029', '712000', '中国,陕西省,西咸新区', '108.811', '34.3071', 'Xixian');
INSERT INTO `ctshop_region` VALUES ('611101', '空港新城', '611100', '空港', '3', '0374', '461000', '中国,陕西省,西咸新区,空港新城', '108.761', '34.4409', 'Konggang');
INSERT INTO `ctshop_region` VALUES ('611102', '沣东新城', '611100', '沣东', '3', '029', '710000', '中国,陕西省,西咸新区,沣东新城', '108.83', '34.2674', 'Fengdong');
INSERT INTO `ctshop_region` VALUES ('611103', '秦汉新城', '611100', '秦汉', '3', '029', '712000', '中国,陕西省,西咸新区,秦汉新城', '108.838', '34.3865', 'Qinhan');
INSERT INTO `ctshop_region` VALUES ('611104', '沣西新城', '611100', '沣西', '3', '029', '710000', '中国,陕西省,西咸新区,沣西新城', '108.712', '34.1905', 'Fengxi');
INSERT INTO `ctshop_region` VALUES ('611105', '泾河新城', '611100', '泾河', '3', '029', '713700', '中国,陕西省,西咸新区,泾河新城', '109.05', '34.4606', 'Jinghe');
INSERT INTO `ctshop_region` VALUES ('620000', '甘肃省', '100000', '甘肃', '1', '', '', '中国,甘肃省', '103.824', '36.058', 'Gansu');
INSERT INTO `ctshop_region` VALUES ('620100', '兰州市', '620000', '兰州', '2', '0931', '730030', '中国,甘肃省,兰州市', '103.824', '36.058', 'Lanzhou');
INSERT INTO `ctshop_region` VALUES ('620102', '城关区', '620100', '城关', '3', '0931', '730030', '中国,甘肃省,兰州市,城关区', '103.825', '36.0573', 'Chengguan');
INSERT INTO `ctshop_region` VALUES ('620103', '七里河区', '620100', '七里河', '3', '0931', '730050', '中国,甘肃省,兰州市,七里河区', '103.786', '36.0658', 'Qilihe');
INSERT INTO `ctshop_region` VALUES ('620104', '西固区', '620100', '西固', '3', '0931', '730060', '中国,甘肃省,兰州市,西固区', '103.628', '36.0886', 'Xigu');
INSERT INTO `ctshop_region` VALUES ('620105', '安宁区', '620100', '安宁', '3', '0931', '730070', '中国,甘肃省,兰州市,安宁区', '103.719', '36.1038', 'Anning');
INSERT INTO `ctshop_region` VALUES ('620111', '红古区', '620100', '红古', '3', '0931', '730084', '中国,甘肃省,兰州市,红古区', '102.86', '36.3454', 'Honggu');
INSERT INTO `ctshop_region` VALUES ('620121', '永登县', '620100', '永登', '3', '0931', '730300', '中国,甘肃省,兰州市,永登县', '103.261', '36.7352', 'Yongdeng');
INSERT INTO `ctshop_region` VALUES ('620122', '皋兰县', '620100', '皋兰', '3', '0931', '730200', '中国,甘肃省,兰州市,皋兰县', '103.945', '36.3321', 'Gaolan');
INSERT INTO `ctshop_region` VALUES ('620123', '榆中县', '620100', '榆中', '3', '0931', '730100', '中国,甘肃省,兰州市,榆中县', '104.115', '35.8442', 'Yuzhong');
INSERT INTO `ctshop_region` VALUES ('620200', '嘉峪关市', '620000', '嘉峪关', '2', '0937', '735100', '中国,甘肃省,嘉峪关市', '98.2773', '39.7865', 'Jiayuguan');
INSERT INTO `ctshop_region` VALUES ('620201', '雄关区', '620200', '雄关', '3', '0937', '735100', '中国,甘肃省,嘉峪关市,雄关区', '98.2774', '39.7793', 'Xiongguan');
INSERT INTO `ctshop_region` VALUES ('620202', '长城区', '620200', '长城', '3', '0937', '735106', '中国,甘肃省,嘉峪关市,长城区', '98.2735', '39.7874', 'Changcheng');
INSERT INTO `ctshop_region` VALUES ('620203', '镜铁区', '620200', '镜铁', '3', '0937', '735100', '中国,甘肃省,嘉峪关市,镜铁区', '98.2773', '39.7865', 'Jingtie');
INSERT INTO `ctshop_region` VALUES ('620300', '金昌市', '620000', '金昌', '2', '0935', '737100', '中国,甘肃省,金昌市', '102.188', '38.5142', 'Jinchang');
INSERT INTO `ctshop_region` VALUES ('620302', '金川区', '620300', '金川', '3', '0935', '737100', '中国,甘肃省,金昌市,金川区', '102.194', '38.521', 'Jinchuan');
INSERT INTO `ctshop_region` VALUES ('620321', '永昌县', '620300', '永昌', '3', '0935', '737200', '中国,甘肃省,金昌市,永昌县', '101.972', '38.2471', 'Yongchang');
INSERT INTO `ctshop_region` VALUES ('620400', '白银市', '620000', '白银', '2', '0943', '730900', '中国,甘肃省,白银市', '104.174', '36.5457', 'Baiyin');
INSERT INTO `ctshop_region` VALUES ('620402', '白银区', '620400', '白银', '3', '0943', '730900', '中国,甘肃省,白银市,白银区', '104.174', '36.5441', 'Baiyin');
INSERT INTO `ctshop_region` VALUES ('620403', '平川区', '620400', '平川', '3', '0943', '730913', '中国,甘肃省,白银市,平川区', '104.825', '36.7277', 'Pingchuan');
INSERT INTO `ctshop_region` VALUES ('620421', '靖远县', '620400', '靖远', '3', '0943', '730600', '中国,甘肃省,白银市,靖远县', '104.683', '36.566', 'Jingyuan');
INSERT INTO `ctshop_region` VALUES ('620422', '会宁县', '620400', '会宁', '3', '0943', '730700', '中国,甘肃省,白银市,会宁县', '105.053', '35.6963', 'Huining');
INSERT INTO `ctshop_region` VALUES ('620423', '景泰县', '620400', '景泰', '3', '0943', '730400', '中国,甘肃省,白银市,景泰县', '104.063', '37.1836', 'Jingtai');
INSERT INTO `ctshop_region` VALUES ('620500', '天水市', '620000', '天水', '2', '0938', '741000', '中国,甘肃省,天水市', '105.725', '34.5785', 'Tianshui');
INSERT INTO `ctshop_region` VALUES ('620502', '秦州区', '620500', '秦州', '3', '0938', '741000', '中国,甘肃省,天水市,秦州区', '105.724', '34.5809', 'Qinzhou');
INSERT INTO `ctshop_region` VALUES ('620503', '麦积区', '620500', '麦积', '3', '0938', '741020', '中国,甘肃省,天水市,麦积区', '105.89', '34.5707', 'Maiji');
INSERT INTO `ctshop_region` VALUES ('620521', '清水县', '620500', '清水', '3', '0938', '741400', '中国,甘肃省,天水市,清水县', '106.137', '34.7503', 'Qingshui');
INSERT INTO `ctshop_region` VALUES ('620522', '秦安县', '620500', '秦安', '3', '0938', '741600', '中国,甘肃省,天水市,秦安县', '105.67', '34.8589', 'Qin\'an');
INSERT INTO `ctshop_region` VALUES ('620523', '甘谷县', '620500', '甘谷', '3', '0938', '741200', '中国,甘肃省,天水市,甘谷县', '105.333', '34.7366', 'Gangu');
INSERT INTO `ctshop_region` VALUES ('620524', '武山县', '620500', '武山', '3', '0938', '741300', '中国,甘肃省,天水市,武山县', '104.884', '34.7212', 'Wushan');
INSERT INTO `ctshop_region` VALUES ('620525', '张家川回族自治县', '620500', '张家川', '3', '0938', '741500', '中国,甘肃省,天水市,张家川回族自治县', '106.216', '34.9958', 'Zhangjiachuan');
INSERT INTO `ctshop_region` VALUES ('620600', '武威市', '620000', '武威', '2', '0935', '733000', '中国,甘肃省,武威市', '102.635', '37.93', 'Wuwei');
INSERT INTO `ctshop_region` VALUES ('620602', '凉州区', '620600', '凉州', '3', '0935', '733000', '中国,甘肃省,武威市,凉州区', '102.642', '37.9283', 'Liangzhou');
INSERT INTO `ctshop_region` VALUES ('620621', '民勤县', '620600', '民勤', '3', '0935', '733300', '中国,甘肃省,武威市,民勤县', '103.09', '38.6249', 'Minqin');
INSERT INTO `ctshop_region` VALUES ('620622', '古浪县', '620600', '古浪', '3', '0935', '733100', '中国,甘肃省,武威市,古浪县', '102.892', '37.4651', 'Gulang');
INSERT INTO `ctshop_region` VALUES ('620623', '天祝藏族自治县', '620600', '天祝', '3', '0935', '733200', '中国,甘肃省,武威市,天祝藏族自治县', '103.136', '36.9771', 'Tianzhu');
INSERT INTO `ctshop_region` VALUES ('620700', '张掖市', '620000', '张掖', '2', '0936', '734000', '中国,甘肃省,张掖市', '100.455', '38.9329', 'Zhangye');
INSERT INTO `ctshop_region` VALUES ('620702', '甘州区', '620700', '甘州', '3', '0936', '734000', '中国,甘肃省,张掖市,甘州区', '100.453', '38.9295', 'Ganzhou');
INSERT INTO `ctshop_region` VALUES ('620721', '肃南裕固族自治县', '620700', '肃南', '3', '0936', '734400', '中国,甘肃省,张掖市,肃南裕固族自治县', '99.6141', '38.8378', 'Sunan');
INSERT INTO `ctshop_region` VALUES ('620722', '民乐县', '620700', '民乐', '3', '0936', '734500', '中国,甘肃省,张掖市,民乐县', '100.811', '38.4348', 'Minle');
INSERT INTO `ctshop_region` VALUES ('620723', '临泽县', '620700', '临泽', '3', '0936', '734200', '中国,甘肃省,张掖市,临泽县', '100.164', '39.1525', 'Linze');
INSERT INTO `ctshop_region` VALUES ('620724', '高台县', '620700', '高台', '3', '0936', '734300', '中国,甘肃省,张掖市,高台县', '99.8192', '39.3783', 'Gaotai');
INSERT INTO `ctshop_region` VALUES ('620725', '山丹县', '620700', '山丹', '3', '0936', '734100', '中国,甘肃省,张掖市,山丹县', '101.094', '38.7847', 'Shandan');
INSERT INTO `ctshop_region` VALUES ('620800', '平凉市', '620000', '平凉', '2', '0933', '744000', '中国,甘肃省,平凉市', '106.685', '35.5428', 'Pingliang');
INSERT INTO `ctshop_region` VALUES ('620802', '崆峒区', '620800', '崆峒', '3', '0933', '744000', '中国,甘肃省,平凉市,崆峒区', '106.675', '35.5426', 'Kongtong');
INSERT INTO `ctshop_region` VALUES ('620821', '泾川县', '620800', '泾川', '3', '0933', '744300', '中国,甘肃省,平凉市,泾川县', '107.366', '35.3322', 'Jingchuan');
INSERT INTO `ctshop_region` VALUES ('620822', '灵台县', '620800', '灵台', '3', '0933', '744400', '中国,甘肃省,平凉市,灵台县', '107.617', '35.0677', 'Lingtai');
INSERT INTO `ctshop_region` VALUES ('620823', '崇信县', '620800', '崇信', '3', '0933', '744200', '中国,甘肃省,平凉市,崇信县', '107.037', '35.3034', 'Chongxin');
INSERT INTO `ctshop_region` VALUES ('620824', '华亭县', '620800', '华亭', '3', '0933', '744100', '中国,甘肃省,平凉市,华亭县', '106.655', '35.2183', 'Huating');
INSERT INTO `ctshop_region` VALUES ('620825', '庄浪县', '620800', '庄浪', '3', '0933', '744600', '中国,甘肃省,平凉市,庄浪县', '106.037', '35.2024', 'Zhuanglang');
INSERT INTO `ctshop_region` VALUES ('620826', '静宁县', '620800', '静宁', '3', '0933', '743400', '中国,甘肃省,平凉市,静宁县', '105.727', '35.5199', 'Jingning');
INSERT INTO `ctshop_region` VALUES ('620900', '酒泉市', '620000', '酒泉', '2', '0937', '735000', '中国,甘肃省,酒泉市', '98.5108', '39.744', 'Jiuquan');
INSERT INTO `ctshop_region` VALUES ('620902', '肃州区', '620900', '肃州', '3', '0937', '735000', '中国,甘肃省,酒泉市,肃州区', '98.5078', '39.7451', 'Suzhou');
INSERT INTO `ctshop_region` VALUES ('620921', '金塔县', '620900', '金塔', '3', '0937', '735300', '中国,甘肃省,酒泉市,金塔县', '98.9', '39.9773', 'Jinta');
INSERT INTO `ctshop_region` VALUES ('620922', '瓜州县', '620900', '瓜州', '3', '0937', '736100', '中国,甘肃省,酒泉市,瓜州县', '95.7827', '40.5155', 'Guazhou');
INSERT INTO `ctshop_region` VALUES ('620923', '肃北蒙古族自治县', '620900', '肃北', '3', '0937', '736300', '中国,甘肃省,酒泉市,肃北蒙古族自治县', '94.8765', '39.5121', 'Subei');
INSERT INTO `ctshop_region` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '阿克塞', '3', '0937', '736400', '中国,甘肃省,酒泉市,阿克塞哈萨克族自治县', '94.341', '39.6343', 'Akesai');
INSERT INTO `ctshop_region` VALUES ('620981', '玉门市', '620900', '玉门', '3', '0937', '735200', '中国,甘肃省,酒泉市,玉门市', '97.0454', '40.2917', 'Yumen');
INSERT INTO `ctshop_region` VALUES ('620982', '敦煌市', '620900', '敦煌', '3', '0937', '736200', '中国,甘肃省,酒泉市,敦煌市', '94.6616', '40.1421', 'Dunhuang');
INSERT INTO `ctshop_region` VALUES ('621000', '庆阳市', '620000', '庆阳', '2', '0934', '745000', '中国,甘肃省,庆阳市', '107.638', '35.7342', 'Qingyang');
INSERT INTO `ctshop_region` VALUES ('621002', '西峰区', '621000', '西峰', '3', '0934', '745000', '中国,甘肃省,庆阳市,西峰区', '107.651', '35.7307', 'Xifeng');
INSERT INTO `ctshop_region` VALUES ('621021', '庆城县', '621000', '庆城', '3', '0934', '745100', '中国,甘肃省,庆阳市,庆城县', '107.883', '36.0151', 'Qingcheng');
INSERT INTO `ctshop_region` VALUES ('621022', '环县', '621000', '环县', '3', '0934', '745700', '中国,甘肃省,庆阳市,环县', '107.308', '36.5685', 'Huanxian');
INSERT INTO `ctshop_region` VALUES ('621023', '华池县', '621000', '华池', '3', '0934', '745600', '中国,甘肃省,庆阳市,华池县', '107.989', '36.4611', 'Huachi');
INSERT INTO `ctshop_region` VALUES ('621024', '合水县', '621000', '合水', '3', '0934', '745400', '中国,甘肃省,庆阳市,合水县', '108.02', '35.8191', 'Heshui');
INSERT INTO `ctshop_region` VALUES ('621025', '正宁县', '621000', '正宁', '3', '0934', '745300', '中国,甘肃省,庆阳市,正宁县', '108.36', '35.4917', 'Zhengning');
INSERT INTO `ctshop_region` VALUES ('621026', '宁县', '621000', '宁县', '3', '0934', '745200', '中国,甘肃省,庆阳市,宁县', '107.925', '35.5016', 'Ningxian');
INSERT INTO `ctshop_region` VALUES ('621027', '镇原县', '621000', '镇原', '3', '0934', '744500', '中国,甘肃省,庆阳市,镇原县', '107.199', '35.6771', 'Zhenyuan');
INSERT INTO `ctshop_region` VALUES ('621100', '定西市', '620000', '定西', '2', '0932', '743000', '中国,甘肃省,定西市', '104.626', '35.5796', 'Dingxi');
INSERT INTO `ctshop_region` VALUES ('621102', '安定区', '621100', '安定', '3', '0932', '743000', '中国,甘肃省,定西市,安定区', '104.611', '35.5807', 'Anding');
INSERT INTO `ctshop_region` VALUES ('621121', '通渭县', '621100', '通渭', '3', '0932', '743300', '中国,甘肃省,定西市,通渭县', '105.242', '35.211', 'Tongwei');
INSERT INTO `ctshop_region` VALUES ('621122', '陇西县', '621100', '陇西', '3', '0932', '748100', '中国,甘肃省,定西市,陇西县', '104.634', '35.0024', 'Longxi');
INSERT INTO `ctshop_region` VALUES ('621123', '渭源县', '621100', '渭源', '3', '0932', '748200', '中国,甘肃省,定西市,渭源县', '104.214', '35.1365', 'Weiyuan');
INSERT INTO `ctshop_region` VALUES ('621124', '临洮县', '621100', '临洮', '3', '0932', '730500', '中国,甘肃省,定西市,临洮县', '103.862', '35.3751', 'Lintao');
INSERT INTO `ctshop_region` VALUES ('621125', '漳县', '621100', '漳县', '3', '0932', '748300', '中国,甘肃省,定西市,漳县', '104.467', '34.8498', 'Zhangxian');
INSERT INTO `ctshop_region` VALUES ('621126', '岷县', '621100', '岷县', '3', '0932', '748400', '中国,甘肃省,定西市,岷县', '104.038', '34.4344', 'Minxian');
INSERT INTO `ctshop_region` VALUES ('621200', '陇南市', '620000', '陇南', '2', '0939', '746000', '中国,甘肃省,陇南市', '104.929', '33.3886', 'Longnan');
INSERT INTO `ctshop_region` VALUES ('621202', '武都区', '621200', '武都', '3', '0939', '746000', '中国,甘肃省,陇南市,武都区', '104.927', '33.3924', 'Wudu');
INSERT INTO `ctshop_region` VALUES ('621221', '成县', '621200', '成县', '3', '0939', '742500', '中国,甘肃省,陇南市,成县', '105.726', '33.7393', 'Chengxian');
INSERT INTO `ctshop_region` VALUES ('621222', '文县', '621200', '文县', '3', '0939', '746400', '中国,甘肃省,陇南市,文县', '104.684', '32.9434', 'Wenxian');
INSERT INTO `ctshop_region` VALUES ('621223', '宕昌县', '621200', '宕昌', '3', '0939', '748500', '中国,甘肃省,陇南市,宕昌县', '104.393', '34.0473', 'Dangchang');
INSERT INTO `ctshop_region` VALUES ('621224', '康县', '621200', '康县', '3', '0939', '746500', '中国,甘肃省,陇南市,康县', '105.607', '33.3291', 'Kangxian');
INSERT INTO `ctshop_region` VALUES ('621225', '西和县', '621200', '西和', '3', '0939', '742100', '中国,甘肃省,陇南市,西和县', '105.301', '34.0143', 'Xihe');
INSERT INTO `ctshop_region` VALUES ('621226', '礼县', '621200', '礼县', '3', '0939', '742200', '中国,甘肃省,陇南市,礼县', '105.178', '34.1894', 'Lixian');
INSERT INTO `ctshop_region` VALUES ('621227', '徽县', '621200', '徽县', '3', '0939', '742300', '中国,甘肃省,陇南市,徽县', '106.085', '33.769', 'Huixian');
INSERT INTO `ctshop_region` VALUES ('621228', '两当县', '621200', '两当', '3', '0939', '742400', '中国,甘肃省,陇南市,两当县', '106.305', '33.9096', 'Liangdang');
INSERT INTO `ctshop_region` VALUES ('622900', '临夏回族自治州', '620000', '临夏', '2', '0930', '731100', '中国,甘肃省,临夏回族自治州', '103.212', '35.5994', 'Linxia');
INSERT INTO `ctshop_region` VALUES ('622901', '临夏市', '622900', '临夏', '3', '0930', '731100', '中国,甘肃省,临夏回族自治州,临夏市', '103.21', '35.5992', 'Linxia');
INSERT INTO `ctshop_region` VALUES ('622921', '临夏县', '622900', '临夏', '3', '0930', '731800', '中国,甘肃省,临夏回族自治州,临夏县', '102.994', '35.4952', 'Linxia');
INSERT INTO `ctshop_region` VALUES ('622922', '康乐县', '622900', '康乐', '3', '0930', '731500', '中国,甘肃省,临夏回族自治州,康乐县', '103.711', '35.3722', 'Kangle');
INSERT INTO `ctshop_region` VALUES ('622923', '永靖县', '622900', '永靖', '3', '0930', '731600', '中国,甘肃省,临夏回族自治州,永靖县', '103.32', '35.9384', 'Yongjing');
INSERT INTO `ctshop_region` VALUES ('622924', '广河县', '622900', '广河', '3', '0930', '731300', '中国,甘肃省,临夏回族自治州,广河县', '103.569', '35.481', 'Guanghe');
INSERT INTO `ctshop_region` VALUES ('622925', '和政县', '622900', '和政', '3', '0930', '731200', '中国,甘肃省,临夏回族自治州,和政县', '103.349', '35.4259', 'Hezheng');
INSERT INTO `ctshop_region` VALUES ('622926', '东乡族自治县', '622900', '东乡族', '3', '0930', '731400', '中国,甘肃省,临夏回族自治州,东乡族自治县', '103.395', '35.6647', 'Dongxiangzu');
INSERT INTO `ctshop_region` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '积石山', '3', '0930', '731700', '中国,甘肃省,临夏回族自治州,积石山保安族东乡族撒拉族自治县', '102.874', '35.7182', 'Jishishan');
INSERT INTO `ctshop_region` VALUES ('623000', '甘南藏族自治州', '620000', '甘南', '2', '0941', '747000', '中国,甘肃省,甘南藏族自治州', '102.911', '34.9864', 'Gannan');
INSERT INTO `ctshop_region` VALUES ('623001', '合作市', '623000', '合作', '3', '0941', '747000', '中国,甘肃省,甘南藏族自治州,合作市', '102.911', '35.0002', 'Hezuo');
INSERT INTO `ctshop_region` VALUES ('623021', '临潭县', '623000', '临潭', '3', '0941', '747500', '中国,甘肃省,甘南藏族自治州,临潭县', '103.353', '34.6951', 'Lintan');
INSERT INTO `ctshop_region` VALUES ('623022', '卓尼县', '623000', '卓尼', '3', '0941', '747600', '中国,甘肃省,甘南藏族自治州,卓尼县', '103.508', '34.5892', 'Zhuoni');
INSERT INTO `ctshop_region` VALUES ('623023', '舟曲县', '623000', '舟曲', '3', '0941', '746300', '中国,甘肃省,甘南藏族自治州,舟曲县', '104.372', '33.7847', 'Zhouqu');
INSERT INTO `ctshop_region` VALUES ('623024', '迭部县', '623000', '迭部', '3', '0941', '747400', '中国,甘肃省,甘南藏族自治州,迭部县', '103.223', '34.0562', 'Diebu');
INSERT INTO `ctshop_region` VALUES ('623025', '玛曲县', '623000', '玛曲', '3', '0941', '747300', '中国,甘肃省,甘南藏族自治州,玛曲县', '102.075', '33.997', 'Maqu');
INSERT INTO `ctshop_region` VALUES ('623026', '碌曲县', '623000', '碌曲', '3', '0941', '747200', '中国,甘肃省,甘南藏族自治州,碌曲县', '102.492', '34.5887', 'Luqu');
INSERT INTO `ctshop_region` VALUES ('623027', '夏河县', '623000', '夏河', '3', '0941', '747100', '中国,甘肃省,甘南藏族自治州,夏河县', '102.522', '35.2049', 'Xiahe');
INSERT INTO `ctshop_region` VALUES ('630000', '青海省', '100000', '青海', '1', '', '', '中国,青海省', '101.779', '36.6232', 'Qinghai');
INSERT INTO `ctshop_region` VALUES ('630100', '西宁市', '630000', '西宁', '2', '0971', '810000', '中国,青海省,西宁市', '101.779', '36.6232', 'Xining');
INSERT INTO `ctshop_region` VALUES ('630102', '城东区', '630100', '城东', '3', '0971', '810007', '中国,青海省,西宁市,城东区', '101.804', '36.5997', 'Chengdong');
INSERT INTO `ctshop_region` VALUES ('630103', '城中区', '630100', '城中', '3', '0971', '810000', '中国,青海省,西宁市,城中区', '101.784', '36.6228', 'Chengzhong');
INSERT INTO `ctshop_region` VALUES ('630104', '城西区', '630100', '城西', '3', '0971', '810001', '中国,青海省,西宁市,城西区', '101.766', '36.6283', 'Chengxi');
INSERT INTO `ctshop_region` VALUES ('630105', '城北区', '630100', '城北', '3', '0971', '810003', '中国,青海省,西宁市,城北区', '101.766', '36.6501', 'Chengbei');
INSERT INTO `ctshop_region` VALUES ('630121', '大通回族土族自治县', '630100', '大通', '3', '0971', '810100', '中国,青海省,西宁市,大通回族土族自治县', '101.702', '36.9349', 'Datong');
INSERT INTO `ctshop_region` VALUES ('630122', '湟中县', '630100', '湟中', '3', '0971', '811600', '中国,青海省,西宁市,湟中县', '101.572', '36.5008', 'Huangzhong');
INSERT INTO `ctshop_region` VALUES ('630123', '湟源县', '630100', '湟源', '3', '0971', '812100', '中国,青海省,西宁市,湟源县', '101.256', '36.6824', 'Huangyuan');
INSERT INTO `ctshop_region` VALUES ('630200', '海东市', '630000', '海东', '2', '0972', '810700', '中国,青海省,海东市', '102.103', '36.5029', 'Haidong');
INSERT INTO `ctshop_region` VALUES ('630202', '乐都区', '630200', '乐都', '3', '0972', '810700', '中国,青海省,海东市,乐都区', '102.402', '36.4803', 'Ledu');
INSERT INTO `ctshop_region` VALUES ('630221', '平安县', '630200', '平安', '3', '0972', '810600', '中国,青海省,海东市,平安县', '102.104', '36.5027', 'Ping\'an');
INSERT INTO `ctshop_region` VALUES ('630222', '民和回族土族自治县', '630200', '民和', '3', '0972', '810800', '中国,青海省,海东市,民和回族土族自治县', '102.804', '36.3295', 'Minhe');
INSERT INTO `ctshop_region` VALUES ('630223', '互助土族自治县', '630200', '互助', '3', '0972', '810500', '中国,青海省,海东市,互助土族自治县', '101.957', '36.8399', 'Huzhu');
INSERT INTO `ctshop_region` VALUES ('630224', '化隆回族自治县', '630200', '化隆', '3', '0972', '810900', '中国,青海省,海东市,化隆回族自治县', '102.262', '36.0983', 'Hualong');
INSERT INTO `ctshop_region` VALUES ('630225', '循化撒拉族自治县', '630200', '循化', '3', '0972', '811100', '中国,青海省,海东市,循化撒拉族自治县', '102.487', '35.8472', 'Xunhua');
INSERT INTO `ctshop_region` VALUES ('632200', '海北藏族自治州', '630000', '海北', '2', '0970', '812200', '中国,青海省,海北藏族自治州', '100.901', '36.9594', 'Haibei');
INSERT INTO `ctshop_region` VALUES ('632221', '门源回族自治县', '632200', '门源', '3', '0970', '810300', '中国,青海省,海北藏族自治州,门源回族自治县', '101.622', '37.3761', 'Menyuan');
INSERT INTO `ctshop_region` VALUES ('632222', '祁连县', '632200', '祁连', '3', '0970', '810400', '中国,青海省,海北藏族自治州,祁连县', '100.246', '38.179', 'Qilian');
INSERT INTO `ctshop_region` VALUES ('632223', '海晏县', '632200', '海晏', '3', '0970', '812200', '中国,青海省,海北藏族自治州,海晏县', '100.993', '36.899', 'Haiyan');
INSERT INTO `ctshop_region` VALUES ('632224', '刚察县', '632200', '刚察', '3', '0970', '812300', '中国,青海省,海北藏族自治州,刚察县', '100.147', '37.3216', 'Gangcha');
INSERT INTO `ctshop_region` VALUES ('632300', '黄南藏族自治州', '630000', '黄南', '2', '0973', '811300', '中国,青海省,黄南藏族自治州', '102.02', '35.5177', 'Huangnan');
INSERT INTO `ctshop_region` VALUES ('632321', '同仁县', '632300', '同仁', '3', '0973', '811300', '中国,青海省,黄南藏族自治州,同仁县', '102.018', '35.516', 'Tongren');
INSERT INTO `ctshop_region` VALUES ('632322', '尖扎县', '632300', '尖扎', '3', '0973', '811200', '中国,青海省,黄南藏族自治州,尖扎县', '102.034', '35.9395', 'Jianzha');
INSERT INTO `ctshop_region` VALUES ('632323', '泽库县', '632300', '泽库', '3', '0973', '811400', '中国,青海省,黄南藏族自治州,泽库县', '101.464', '35.0352', 'Zeku');
INSERT INTO `ctshop_region` VALUES ('632324', '河南蒙古族自治县', '632300', '河南', '3', '0973', '811500', '中国,青海省,黄南藏族自治州,河南蒙古族自治县', '101.609', '34.7348', 'Henan');
INSERT INTO `ctshop_region` VALUES ('632500', '海南藏族自治州', '630000', '海南', '2', '0974', '813000', '中国,青海省,海南藏族自治州', '100.62', '36.2804', 'Hainan');
INSERT INTO `ctshop_region` VALUES ('632521', '共和县', '632500', '共和', '3', '0974', '813000', '中国,青海省,海南藏族自治州,共和县', '100.62', '36.2841', 'Gonghe');
INSERT INTO `ctshop_region` VALUES ('632522', '同德县', '632500', '同德', '3', '0974', '813200', '中国,青海省,海南藏族自治州,同德县', '100.572', '35.2549', 'Tongde');
INSERT INTO `ctshop_region` VALUES ('632523', '贵德县', '632500', '贵德', '3', '0974', '811700', '中国,青海省,海南藏族自治州,贵德县', '101.432', '36.044', 'Guide');
INSERT INTO `ctshop_region` VALUES ('632524', '兴海县', '632500', '兴海', '3', '0974', '813300', '中国,青海省,海南藏族自治州,兴海县', '99.9885', '35.5903', 'Xinghai');
INSERT INTO `ctshop_region` VALUES ('632525', '贵南县', '632500', '贵南', '3', '0974', '813100', '中国,青海省,海南藏族自治州,贵南县', '100.747', '35.5867', 'Guinan');
INSERT INTO `ctshop_region` VALUES ('632600', '果洛藏族自治州', '630000', '果洛', '2', '0975', '814000', '中国,青海省,果洛藏族自治州', '100.242', '34.4736', 'Golog');
INSERT INTO `ctshop_region` VALUES ('632621', '玛沁县', '632600', '玛沁', '3', '0975', '814000', '中国,青海省,果洛藏族自治州,玛沁县', '100.239', '34.4775', 'Maqin');
INSERT INTO `ctshop_region` VALUES ('632622', '班玛县', '632600', '班玛', '3', '0975', '814300', '中国,青海省,果洛藏族自治州,班玛县', '100.737', '32.9325', 'Banma');
INSERT INTO `ctshop_region` VALUES ('632623', '甘德县', '632600', '甘德', '3', '0975', '814100', '中国,青海省,果洛藏族自治州,甘德县', '99.9025', '33.9684', 'Gande');
INSERT INTO `ctshop_region` VALUES ('632624', '达日县', '632600', '达日', '3', '0975', '814200', '中国,青海省,果洛藏族自治州,达日县', '99.6518', '33.7519', 'Dari');
INSERT INTO `ctshop_region` VALUES ('632625', '久治县', '632600', '久治', '3', '0975', '624700', '中国,青海省,果洛藏族自治州,久治县', '101.483', '33.4299', 'Jiuzhi');
INSERT INTO `ctshop_region` VALUES ('632626', '玛多县', '632600', '玛多', '3', '0975', '813500', '中国,青海省,果洛藏族自治州,玛多县', '98.21', '34.9157', 'Maduo');
INSERT INTO `ctshop_region` VALUES ('632700', '玉树藏族自治州', '630000', '玉树', '2', '0976', '815000', '中国,青海省,玉树藏族自治州', '97.0085', '33.004', 'Yushu');
INSERT INTO `ctshop_region` VALUES ('632701', '玉树市', '632700', '玉树', '3', '0976', '815000', '中国,青海省,玉树藏族自治州,玉树市', '97.0088', '33.0039', 'Yushu');
INSERT INTO `ctshop_region` VALUES ('632722', '杂多县', '632700', '杂多', '3', '0976', '815300', '中国,青海省,玉树藏族自治州,杂多县', '95.2986', '32.8932', 'Zaduo');
INSERT INTO `ctshop_region` VALUES ('632723', '称多县', '632700', '称多', '3', '0976', '815100', '中国,青海省,玉树藏族自治州,称多县', '97.1079', '33.369', 'Chenduo');
INSERT INTO `ctshop_region` VALUES ('632724', '治多县', '632700', '治多', '3', '0976', '815400', '中国,青海省,玉树藏族自治州,治多县', '95.6157', '33.8528', 'Zhiduo');
INSERT INTO `ctshop_region` VALUES ('632725', '囊谦县', '632700', '囊谦', '3', '0976', '815200', '中国,青海省,玉树藏族自治州,囊谦县', '96.4775', '32.2036', 'Nangqian');
INSERT INTO `ctshop_region` VALUES ('632726', '曲麻莱县', '632700', '曲麻莱', '3', '0976', '815500', '中国,青海省,玉树藏族自治州,曲麻莱县', '95.7976', '34.1261', 'Qumalai');
INSERT INTO `ctshop_region` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '海西', '2', '0977', '817000', '中国,青海省,海西蒙古族藏族自治州', '97.3708', '37.3747', 'Haixi');
INSERT INTO `ctshop_region` VALUES ('632801', '格尔木市', '632800', '格尔木', '3', '0977', '816000', '中国,青海省,海西蒙古族藏族自治州,格尔木市', '94.9033', '36.4024', 'Geermu');
INSERT INTO `ctshop_region` VALUES ('632802', '德令哈市', '632800', '德令哈', '3', '0977', '817000', '中国,青海省,海西蒙古族藏族自治州,德令哈市', '97.3608', '37.3695', 'Delingha');
INSERT INTO `ctshop_region` VALUES ('632821', '乌兰县', '632800', '乌兰', '3', '0977', '817100', '中国,青海省,海西蒙古族藏族自治州,乌兰县', '98.482', '36.9347', 'Wulan');
INSERT INTO `ctshop_region` VALUES ('632822', '都兰县', '632800', '都兰', '3', '0977', '816100', '中国,青海省,海西蒙古族藏族自治州,都兰县', '98.0923', '36.3013', 'Dulan');
INSERT INTO `ctshop_region` VALUES ('632823', '天峻县', '632800', '天峻', '3', '0977', '817200', '中国,青海省,海西蒙古族藏族自治州,天峻县', '99.0245', '37.3033', 'Tianjun');
INSERT INTO `ctshop_region` VALUES ('640000', '宁夏回族自治区', '100000', '宁夏', '1', '', '', '中国,宁夏回族自治区', '106.278', '38.4664', 'Ningxia');
INSERT INTO `ctshop_region` VALUES ('640100', '银川市', '640000', '银川', '2', '0951', '750004', '中国,宁夏回族自治区,银川市', '106.278', '38.4664', 'Yinchuan');
INSERT INTO `ctshop_region` VALUES ('640104', '兴庆区', '640100', '兴庆', '3', '0951', '750001', '中国,宁夏回族自治区,银川市,兴庆区', '106.289', '38.4739', 'Xingqing');
INSERT INTO `ctshop_region` VALUES ('640105', '西夏区', '640100', '西夏', '3', '0951', '750021', '中国,宁夏回族自治区,银川市,西夏区', '106.15', '38.4914', 'Xixia');
INSERT INTO `ctshop_region` VALUES ('640106', '金凤区', '640100', '金凤', '3', '0951', '750011', '中国,宁夏回族自治区,银川市,金凤区', '106.243', '38.4729', 'Jinfeng');
INSERT INTO `ctshop_region` VALUES ('640121', '永宁县', '640100', '永宁', '3', '0951', '750100', '中国,宁夏回族自治区,银川市,永宁县', '106.252', '38.2756', 'Yongning');
INSERT INTO `ctshop_region` VALUES ('640122', '贺兰县', '640100', '贺兰', '3', '0951', '750200', '中国,宁夏回族自治区,银川市,贺兰县', '106.35', '38.5544', 'Helan');
INSERT INTO `ctshop_region` VALUES ('640181', '灵武市', '640100', '灵武', '3', '0951', '750004', '中国,宁夏回族自治区,银川市,灵武市', '106.34', '38.1027', 'Lingwu');
INSERT INTO `ctshop_region` VALUES ('640200', '石嘴山市', '640000', '石嘴山', '2', '0952', '753000', '中国,宁夏回族自治区,石嘴山市', '106.376', '39.0133', 'Shizuishan');
INSERT INTO `ctshop_region` VALUES ('640202', '大武口区', '640200', '大武口', '3', '0952', '753000', '中国,宁夏回族自治区,石嘴山市,大武口区', '106.377', '39.0123', 'Dawukou');
INSERT INTO `ctshop_region` VALUES ('640205', '惠农区', '640200', '惠农', '3', '0952', '753600', '中国,宁夏回族自治区,石嘴山市,惠农区', '106.711', '39.1319', 'Huinong');
INSERT INTO `ctshop_region` VALUES ('640221', '平罗县', '640200', '平罗', '3', '0952', '753400', '中国,宁夏回族自治区,石嘴山市,平罗县', '106.545', '38.9043', 'Pingluo');
INSERT INTO `ctshop_region` VALUES ('640300', '吴忠市', '640000', '吴忠', '2', '0953', '751100', '中国,宁夏回族自治区,吴忠市', '106.199', '37.9862', 'Wuzhong');
INSERT INTO `ctshop_region` VALUES ('640302', '利通区', '640300', '利通', '3', '0953', '751100', '中国,宁夏回族自治区,吴忠市,利通区', '106.203', '37.9851', 'Litong');
INSERT INTO `ctshop_region` VALUES ('640303', '红寺堡区', '640300', '红寺堡', '3', '0953', '751900', '中国,宁夏回族自治区,吴忠市,红寺堡区', '106.198', '37.9975', 'Hongsibao');
INSERT INTO `ctshop_region` VALUES ('640323', '盐池县', '640300', '盐池', '3', '0953', '751500', '中国,宁夏回族自治区,吴忠市,盐池县', '107.407', '37.7833', 'Yanchi');
INSERT INTO `ctshop_region` VALUES ('640324', '同心县', '640300', '同心', '3', '0953', '751300', '中国,宁夏回族自治区,吴忠市,同心县', '105.914', '36.9812', 'Tongxin');
INSERT INTO `ctshop_region` VALUES ('640381', '青铜峡市', '640300', '青铜峡', '3', '0953', '751600', '中国,宁夏回族自治区,吴忠市,青铜峡市', '106.075', '38.02', 'Qingtongxia');
INSERT INTO `ctshop_region` VALUES ('640400', '固原市', '640000', '固原', '2', '0954', '756000', '中国,宁夏回族自治区,固原市', '106.285', '36.0046', 'Guyuan');
INSERT INTO `ctshop_region` VALUES ('640402', '原州区', '640400', '原州', '3', '0954', '756000', '中国,宁夏回族自治区,固原市,原州区', '106.288', '36.0037', 'Yuanzhou');
INSERT INTO `ctshop_region` VALUES ('640422', '西吉县', '640400', '西吉', '3', '0954', '756200', '中国,宁夏回族自治区,固原市,西吉县', '105.731', '35.9662', 'Xiji');
INSERT INTO `ctshop_region` VALUES ('640423', '隆德县', '640400', '隆德', '3', '0954', '756300', '中国,宁夏回族自治区,固原市,隆德县', '106.124', '35.6172', 'Longde');
INSERT INTO `ctshop_region` VALUES ('640424', '泾源县', '640400', '泾源', '3', '0954', '756400', '中国,宁夏回族自治区,固原市,泾源县', '106.339', '35.4907', 'Jingyuan');
INSERT INTO `ctshop_region` VALUES ('640425', '彭阳县', '640400', '彭阳', '3', '0954', '756500', '中国,宁夏回族自治区,固原市,彭阳县', '106.645', '35.8508', 'Pengyang');
INSERT INTO `ctshop_region` VALUES ('640500', '中卫市', '640000', '中卫', '2', '0955', '751700', '中国,宁夏回族自治区,中卫市', '105.19', '37.5149', 'Zhongwei');
INSERT INTO `ctshop_region` VALUES ('640502', '沙坡头区', '640500', '沙坡头', '3', '0955', '755000', '中国,宁夏回族自治区,中卫市,沙坡头区', '105.19', '37.5104', 'Shapotou');
INSERT INTO `ctshop_region` VALUES ('640521', '中宁县', '640500', '中宁', '3', '0955', '751200', '中国,宁夏回族自治区,中卫市,中宁县', '105.685', '37.4915', 'Zhongning');
INSERT INTO `ctshop_region` VALUES ('640522', '海原县', '640500', '海原', '3', '0955', '751800', '中国,宁夏回族自治区,中卫市,海原县', '105.647', '36.565', 'Haiyuan');
INSERT INTO `ctshop_region` VALUES ('650000', '新疆维吾尔自治区', '100000', '新疆', '1', '', '', '中国,新疆维吾尔自治区', '87.6177', '43.7928', 'Xinjiang');
INSERT INTO `ctshop_region` VALUES ('650100', '乌鲁木齐市', '650000', '乌鲁木齐', '2', '0991', '830002', '中国,新疆维吾尔自治区,乌鲁木齐市', '87.6177', '43.7928', 'Urumqi');
INSERT INTO `ctshop_region` VALUES ('650102', '天山区', '650100', '天山', '3', '0991', '830002', '中国,新疆维吾尔自治区,乌鲁木齐市,天山区', '87.6317', '43.7944', 'Tianshan');
INSERT INTO `ctshop_region` VALUES ('650103', '沙依巴克区', '650100', '沙依巴克', '3', '0991', '830000', '中国,新疆维吾尔自治区,乌鲁木齐市,沙依巴克区', '87.5979', '43.8012', 'Shayibake');
INSERT INTO `ctshop_region` VALUES ('650104', '新市区', '650100', '新市', '3', '0991', '830011', '中国,新疆维吾尔自治区,乌鲁木齐市,新市区', '87.5741', '43.8435', 'Xinshi');
INSERT INTO `ctshop_region` VALUES ('650105', '水磨沟区', '650100', '水磨沟', '3', '0991', '830017', '中国,新疆维吾尔自治区,乌鲁木齐市,水磨沟区', '87.6425', '43.8325', 'Shuimogou');
INSERT INTO `ctshop_region` VALUES ('650106', '头屯河区', '650100', '头屯河', '3', '0991', '830022', '中国,新疆维吾尔自治区,乌鲁木齐市,头屯河区', '87.2914', '43.8549', 'Toutunhe');
INSERT INTO `ctshop_region` VALUES ('650107', '达坂城区', '650100', '达坂城', '3', '0991', '830039', '中国,新疆维吾尔自治区,乌鲁木齐市,达坂城区', '88.307', '43.358', 'Dabancheng');
INSERT INTO `ctshop_region` VALUES ('650109', '米东区', '650100', '米东', '3', '0991', '830019', '中国,新疆维吾尔自治区,乌鲁木齐市,米东区', '87.6858', '43.9474', 'Midong');
INSERT INTO `ctshop_region` VALUES ('650121', '乌鲁木齐县', '650100', '乌鲁木齐', '3', '0991', '830063', '中国,新疆维吾尔自治区,乌鲁木齐市,乌鲁木齐县', '87.4094', '43.4712', 'Wulumuqi');
INSERT INTO `ctshop_region` VALUES ('650200', '克拉玛依市', '650000', '克拉玛依', '2', '0990', '834000', '中国,新疆维吾尔自治区,克拉玛依市', '84.8739', '45.5959', 'Karamay');
INSERT INTO `ctshop_region` VALUES ('650202', '独山子区', '650200', '独山子', '3', '0992', '834021', '中国,新疆维吾尔自治区,克拉玛依市,独山子区', '84.8867', '44.3287', 'Dushanzi');
INSERT INTO `ctshop_region` VALUES ('650203', '克拉玛依区', '650200', '克拉玛依', '3', '0990', '834000', '中国,新疆维吾尔自治区,克拉玛依市,克拉玛依区', '84.8623', '45.5909', 'Kelamayi');
INSERT INTO `ctshop_region` VALUES ('650204', '白碱滩区', '650200', '白碱滩', '3', '0990', '834008', '中国,新疆维吾尔自治区,克拉玛依市,白碱滩区', '85.1324', '45.6877', 'Baijiantan');
INSERT INTO `ctshop_region` VALUES ('650205', '乌尔禾区', '650200', '乌尔禾', '3', '0990', '834012', '中国,新疆维吾尔自治区,克拉玛依市,乌尔禾区', '85.6914', '46.0901', 'Wuerhe');
INSERT INTO `ctshop_region` VALUES ('652100', '吐鲁番地区', '650000', '吐鲁番', '2', '0995', '838000', '中国,新疆维吾尔自治区,吐鲁番地区', '89.1841', '42.9476', 'Turpan');
INSERT INTO `ctshop_region` VALUES ('652101', '吐鲁番市', '652100', '吐鲁番', '3', '0995', '838000', '中国,新疆维吾尔自治区,吐鲁番地区,吐鲁番市', '89.1858', '42.9351', 'Tulufan');
INSERT INTO `ctshop_region` VALUES ('652122', '鄯善县', '652100', '鄯善', '3', '0995', '838200', '中国,新疆维吾尔自治区,吐鲁番地区,鄯善县', '90.214', '42.8635', 'Shanshan');
INSERT INTO `ctshop_region` VALUES ('652123', '托克逊县', '652100', '托克逊', '3', '0995', '838100', '中国,新疆维吾尔自治区,吐鲁番地区,托克逊县', '88.6582', '42.7923', 'Tuokexun');
INSERT INTO `ctshop_region` VALUES ('652200', '哈密地区', '650000', '哈密', '2', '0902', '839000', '中国,新疆维吾尔自治区,哈密地区', '93.5132', '42.8332', 'Hami');
INSERT INTO `ctshop_region` VALUES ('652201', '哈密市', '652200', '哈密', '3', '0902', '839000', '中国,新疆维吾尔自治区,哈密地区,哈密市', '93.5145', '42.827', 'Hami');
INSERT INTO `ctshop_region` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '巴里坤', '3', '0902', '839200', '中国,新疆维吾尔自治区,哈密地区,巴里坤哈萨克自治县', '93.0124', '43.5999', 'Balikun');
INSERT INTO `ctshop_region` VALUES ('652223', '伊吾县', '652200', '伊吾', '3', '0902', '839300', '中国,新疆维吾尔自治区,哈密地区,伊吾县', '94.694', '43.2537', 'Yiwu');
INSERT INTO `ctshop_region` VALUES ('652300', '昌吉回族自治州', '650000', '昌吉', '2', '0994', '831100', '中国,新疆维吾尔自治区,昌吉回族自治州', '87.304', '44.0146', 'Changji');
INSERT INTO `ctshop_region` VALUES ('652301', '昌吉市', '652300', '昌吉', '3', '0994', '831100', '中国,新疆维吾尔自治区,昌吉回族自治州,昌吉市', '87.3025', '44.0127', 'Changji');
INSERT INTO `ctshop_region` VALUES ('652302', '阜康市', '652300', '阜康', '3', '0994', '831500', '中国,新疆维吾尔自治区,昌吉回族自治州,阜康市', '87.9853', '44.1584', 'Fukang');
INSERT INTO `ctshop_region` VALUES ('652323', '呼图壁县', '652300', '呼图壁', '3', '0994', '831200', '中国,新疆维吾尔自治区,昌吉回族自治州,呼图壁县', '86.8989', '44.1898', 'Hutubi');
INSERT INTO `ctshop_region` VALUES ('652324', '玛纳斯县', '652300', '玛纳斯', '3', '0994', '832200', '中国,新疆维吾尔自治区,昌吉回族自治州,玛纳斯县', '86.2145', '44.3044', 'Manasi');
INSERT INTO `ctshop_region` VALUES ('652325', '奇台县', '652300', '奇台', '3', '0994', '831800', '中国,新疆维吾尔自治区,昌吉回族自治州,奇台县', '89.5932', '44.0222', 'Qitai');
INSERT INTO `ctshop_region` VALUES ('652327', '吉木萨尔县', '652300', '吉木萨尔', '3', '0994', '831700', '中国,新疆维吾尔自治区,昌吉回族自治州,吉木萨尔县', '89.1808', '44.0005', 'Jimusaer');
INSERT INTO `ctshop_region` VALUES ('652328', '木垒哈萨克自治县', '652300', '木垒', '3', '0994', '831900', '中国,新疆维吾尔自治区,昌吉回族自治州,木垒哈萨克自治县', '90.289', '43.8351', 'Mulei');
INSERT INTO `ctshop_region` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '博尔塔拉', '2', '0909', '833400', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州', '82.0748', '44.9033', 'Bortala');
INSERT INTO `ctshop_region` VALUES ('652701', '博乐市', '652700', '博乐', '3', '0909', '833400', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,博乐市', '82.0713', '44.9005', 'Bole');
INSERT INTO `ctshop_region` VALUES ('652702', '阿拉山口市', '652700', '阿拉山口', '3', '0909', '833400', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,阿拉山口市', '82.5677', '45.1706', 'Alashankou');
INSERT INTO `ctshop_region` VALUES ('652722', '精河县', '652700', '精河', '3', '0909', '833300', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,精河县', '82.8942', '44.6077', 'Jinghe');
INSERT INTO `ctshop_region` VALUES ('652723', '温泉县', '652700', '温泉', '3', '0909', '833500', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,温泉县', '81.0313', '44.9737', 'Wenquan');
INSERT INTO `ctshop_region` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '巴音郭楞', '2', '0996', '841000', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州', '86.151', '41.7686', 'Bayingol');
INSERT INTO `ctshop_region` VALUES ('652801', '库尔勒市', '652800', '库尔勒', '3', '0996', '841000', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,库尔勒市', '86.1553', '41.766', 'Kuerle');
INSERT INTO `ctshop_region` VALUES ('652822', '轮台县', '652800', '轮台', '3', '0996', '841600', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,轮台县', '84.261', '41.7764', 'Luntai');
INSERT INTO `ctshop_region` VALUES ('652823', '尉犁县', '652800', '尉犁', '3', '0996', '841500', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,尉犁县', '86.259', '41.3363', 'Yuli');
INSERT INTO `ctshop_region` VALUES ('652824', '若羌县', '652800', '若羌', '3', '0996', '841800', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,若羌县', '88.1681', '39.0179', 'Ruoqiang');
INSERT INTO `ctshop_region` VALUES ('652825', '且末县', '652800', '且末', '3', '0996', '841900', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,且末县', '85.5297', '38.1453', 'Qiemo');
INSERT INTO `ctshop_region` VALUES ('652826', '焉耆回族自治县', '652800', '焉耆', '3', '0996', '841100', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,焉耆回族自治县', '86.5744', '42.059', 'Yanqi');
INSERT INTO `ctshop_region` VALUES ('652827', '和静县', '652800', '和静', '3', '0996', '841300', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和静县', '86.3961', '42.3184', 'Hejing');
INSERT INTO `ctshop_region` VALUES ('652828', '和硕县', '652800', '和硕', '3', '0996', '841200', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和硕县', '86.8639', '42.2681', 'Heshuo');
INSERT INTO `ctshop_region` VALUES ('652829', '博湖县', '652800', '博湖', '3', '0996', '841400', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,博湖县', '86.6333', '41.9801', 'Bohu');
INSERT INTO `ctshop_region` VALUES ('652900', '阿克苏地区', '650000', '阿克苏', '2', '0997', '843000', '中国,新疆维吾尔自治区,阿克苏地区', '80.2651', '41.1707', 'Aksu');
INSERT INTO `ctshop_region` VALUES ('652901', '阿克苏市', '652900', '阿克苏', '3', '0997', '843000', '中国,新疆维吾尔自治区,阿克苏地区,阿克苏市', '80.2634', '41.1675', 'Akesu');
INSERT INTO `ctshop_region` VALUES ('652922', '温宿县', '652900', '温宿', '3', '0997', '843100', '中国,新疆维吾尔自治区,阿克苏地区,温宿县', '80.2417', '41.2768', 'Wensu');
INSERT INTO `ctshop_region` VALUES ('652923', '库车县', '652900', '库车', '3', '0997', '842000', '中国,新疆维吾尔自治区,阿克苏地区,库车县', '82.9621', '41.7179', 'Kuche');
INSERT INTO `ctshop_region` VALUES ('652924', '沙雅县', '652900', '沙雅', '3', '0997', '842200', '中国,新疆维吾尔自治区,阿克苏地区,沙雅县', '82.7813', '41.225', 'Shaya');
INSERT INTO `ctshop_region` VALUES ('652925', '新和县', '652900', '新和', '3', '0997', '842100', '中国,新疆维吾尔自治区,阿克苏地区,新和县', '82.6105', '41.5496', 'Xinhe');
INSERT INTO `ctshop_region` VALUES ('652926', '拜城县', '652900', '拜城', '3', '0997', '842300', '中国,新疆维吾尔自治区,阿克苏地区,拜城县', '81.8756', '41.798', 'Baicheng');
INSERT INTO `ctshop_region` VALUES ('652927', '乌什县', '652900', '乌什', '3', '0997', '843400', '中国,新疆维吾尔自治区,阿克苏地区,乌什县', '79.2294', '41.2157', 'Wushi');
INSERT INTO `ctshop_region` VALUES ('652928', '阿瓦提县', '652900', '阿瓦提', '3', '0997', '843200', '中国,新疆维吾尔自治区,阿克苏地区,阿瓦提县', '80.3834', '40.6393', 'Awati');
INSERT INTO `ctshop_region` VALUES ('652929', '柯坪县', '652900', '柯坪', '3', '0997', '843600', '中国,新疆维吾尔自治区,阿克苏地区,柯坪县', '79.0475', '40.5059', 'Keping');
INSERT INTO `ctshop_region` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '克孜勒苏', '2', '0908', '845350', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州', '76.1728', '39.7134', 'Kizilsu');
INSERT INTO `ctshop_region` VALUES ('653001', '阿图什市', '653000', '阿图什', '3', '0908', '845350', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿图什市', '76.1683', '39.7161', 'Atushi');
INSERT INTO `ctshop_region` VALUES ('653022', '阿克陶县', '653000', '阿克陶', '3', '0908', '845550', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿克陶县', '75.9469', '39.1489', 'Aketao');
INSERT INTO `ctshop_region` VALUES ('653023', '阿合奇县', '653000', '阿合奇', '3', '0997', '843500', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿合奇县', '78.4485', '40.9395', 'Aheqi');
INSERT INTO `ctshop_region` VALUES ('653024', '乌恰县', '653000', '乌恰', '3', '0908', '845450', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,乌恰县', '75.2584', '39.7198', 'Wuqia');
INSERT INTO `ctshop_region` VALUES ('653100', '喀什地区', '650000', '喀什', '2', '0998', '844000', '中国,新疆维吾尔自治区,喀什地区', '75.9891', '39.4677', 'Kashgar');
INSERT INTO `ctshop_region` VALUES ('653101', '喀什市', '653100', '喀什', '3', '0998', '844000', '中国,新疆维吾尔自治区,喀什地区,喀什市', '75.9938', '39.4677', 'Kashi');
INSERT INTO `ctshop_region` VALUES ('653121', '疏附县', '653100', '疏附', '3', '0998', '844100', '中国,新疆维吾尔自治区,喀什地区,疏附县', '75.8603', '39.3753', 'Shufu');
INSERT INTO `ctshop_region` VALUES ('653122', '疏勒县', '653100', '疏勒', '3', '0998', '844200', '中国,新疆维吾尔自治区,喀什地区,疏勒县', '76.054', '39.4062', 'Shule');
INSERT INTO `ctshop_region` VALUES ('653123', '英吉沙县', '653100', '英吉沙', '3', '0998', '844500', '中国,新疆维吾尔自治区,喀什地区,英吉沙县', '76.1757', '38.9297', 'Yingjisha');
INSERT INTO `ctshop_region` VALUES ('653124', '泽普县', '653100', '泽普', '3', '0998', '844800', '中国,新疆维吾尔自治区,喀什地区,泽普县', '77.2714', '38.1894', 'Zepu');
INSERT INTO `ctshop_region` VALUES ('653125', '莎车县', '653100', '莎车', '3', '0998', '844700', '中国,新疆维吾尔自治区,喀什地区,莎车县', '77.2432', '38.416', 'Shache');
INSERT INTO `ctshop_region` VALUES ('653126', '叶城县', '653100', '叶城', '3', '0998', '844900', '中国,新疆维吾尔自治区,喀什地区,叶城县', '77.4166', '37.8832', 'Yecheng');
INSERT INTO `ctshop_region` VALUES ('653127', '麦盖提县', '653100', '麦盖提', '3', '0998', '844600', '中国,新疆维吾尔自治区,喀什地区,麦盖提县', '77.6422', '38.8966', 'Maigaiti');
INSERT INTO `ctshop_region` VALUES ('653128', '岳普湖县', '653100', '岳普湖', '3', '0998', '844400', '中国,新疆维吾尔自治区,喀什地区,岳普湖县', '76.7723', '39.2356', 'Yuepuhu');
INSERT INTO `ctshop_region` VALUES ('653129', '伽师县', '653100', '伽师', '3', '0998', '844300', '中国,新疆维吾尔自治区,喀什地区,伽师县', '76.7237', '39.488', 'Jiashi');
INSERT INTO `ctshop_region` VALUES ('653130', '巴楚县', '653100', '巴楚', '3', '0998', '843800', '中国,新疆维吾尔自治区,喀什地区,巴楚县', '78.5489', '39.7855', 'Bachu');
INSERT INTO `ctshop_region` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '塔什库尔干塔吉克', '3', '0998', '845250', '中国,新疆维吾尔自治区,喀什地区,塔什库尔干塔吉克自治县', '75.232', '37.7789', 'Tashikuergantajike');
INSERT INTO `ctshop_region` VALUES ('653200', '和田地区', '650000', '和田', '2', '0903', '848000', '中国,新疆维吾尔自治区,和田地区', '79.9253', '37.1107', 'Hotan');
INSERT INTO `ctshop_region` VALUES ('653201', '和田市', '653200', '和田市', '3', '0903', '848000', '中国,新疆维吾尔自治区,和田地区,和田市', '79.9135', '37.1121', 'Hetianshi');
INSERT INTO `ctshop_region` VALUES ('653221', '和田县', '653200', '和田县', '3', '0903', '848000', '中国,新疆维吾尔自治区,和田地区,和田县', '79.8287', '37.0892', 'Hetianxian');
INSERT INTO `ctshop_region` VALUES ('653222', '墨玉县', '653200', '墨玉', '3', '0903', '848100', '中国,新疆维吾尔自治区,和田地区,墨玉县', '79.7403', '37.2725', 'Moyu');
INSERT INTO `ctshop_region` VALUES ('653223', '皮山县', '653200', '皮山', '3', '0903', '845150', '中国,新疆维吾尔自治区,和田地区,皮山县', '78.2812', '37.6201', 'Pishan');
INSERT INTO `ctshop_region` VALUES ('653224', '洛浦县', '653200', '洛浦', '3', '0903', '848200', '中国,新疆维吾尔自治区,和田地区,洛浦县', '80.1854', '37.0736', 'Luopu');
INSERT INTO `ctshop_region` VALUES ('653225', '策勒县', '653200', '策勒', '3', '0903', '848300', '中国,新疆维吾尔自治区,和田地区,策勒县', '80.81', '36.9984', 'Cele');
INSERT INTO `ctshop_region` VALUES ('653226', '于田县', '653200', '于田', '3', '0903', '848400', '中国,新疆维吾尔自治区,和田地区,于田县', '81.6672', '36.854', 'Yutian');
INSERT INTO `ctshop_region` VALUES ('653227', '民丰县', '653200', '民丰', '3', '0903', '848500', '中国,新疆维吾尔自治区,和田地区,民丰县', '82.6844', '37.0658', 'Minfeng');
INSERT INTO `ctshop_region` VALUES ('654000', '伊犁哈萨克自治州', '650000', '伊犁', '2', '0999', '835100', '中国,新疆维吾尔自治区,伊犁哈萨克自治州', '81.3179', '43.9219', 'Ili');
INSERT INTO `ctshop_region` VALUES ('654002', '伊宁市', '654000', '伊宁', '3', '0999', '835000', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁市', '81.3293', '43.9129', 'Yining');
INSERT INTO `ctshop_region` VALUES ('654003', '奎屯市', '654000', '奎屯', '3', '0992', '833200', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,奎屯市', '84.9023', '44.425', 'Kuitun');
INSERT INTO `ctshop_region` VALUES ('654004', '霍尔果斯市', '654000', '霍尔果斯', '3', '0999', '835221', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍尔果斯市', '80.4182', '44.2058', 'Huoerguosi');
INSERT INTO `ctshop_region` VALUES ('654021', '伊宁县', '654000', '伊宁', '3', '0999', '835100', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁县', '81.5276', '43.9786', 'Yining');
INSERT INTO `ctshop_region` VALUES ('654022', '察布查尔锡伯自治县', '654000', '察布查尔锡伯', '3', '0999', '835300', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,察布查尔锡伯自治县', '81.1496', '43.8402', 'Chabuchaerxibo');
INSERT INTO `ctshop_region` VALUES ('654023', '霍城县', '654000', '霍城', '3', '0999', '835200', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍城县', '80.8783', '44.0533', 'Huocheng');
INSERT INTO `ctshop_region` VALUES ('654024', '巩留县', '654000', '巩留', '3', '0999', '835400', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,巩留县', '82.2285', '43.4843', 'Gongliu');
INSERT INTO `ctshop_region` VALUES ('654025', '新源县', '654000', '新源', '3', '0999', '835800', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,新源县', '83.2609', '43.4284', 'Xinyuan');
INSERT INTO `ctshop_region` VALUES ('654026', '昭苏县', '654000', '昭苏', '3', '0999', '835600', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,昭苏县', '81.1307', '43.1583', 'Zhaosu');
INSERT INTO `ctshop_region` VALUES ('654027', '特克斯县', '654000', '特克斯', '3', '0999', '835500', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,特克斯县', '81.84', '43.2194', 'Tekesi');
INSERT INTO `ctshop_region` VALUES ('654028', '尼勒克县', '654000', '尼勒克', '3', '0999', '835700', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,尼勒克县', '82.5118', '43.799', 'Nileke');
INSERT INTO `ctshop_region` VALUES ('654200', '塔城地区', '650000', '塔城', '2', '0901', '834700', '中国,新疆维吾尔自治区,塔城地区', '82.9857', '46.7463', 'Qoqek');
INSERT INTO `ctshop_region` VALUES ('654201', '塔城市', '654200', '塔城', '3', '0901', '834700', '中国,新疆维吾尔自治区,塔城地区,塔城市', '82.9789', '46.7485', 'Tacheng');
INSERT INTO `ctshop_region` VALUES ('654202', '乌苏市', '654200', '乌苏', '3', '0992', '833000', '中国,新疆维吾尔自治区,塔城地区,乌苏市', '84.6826', '44.4373', 'Wusu');
INSERT INTO `ctshop_region` VALUES ('654221', '额敏县', '654200', '额敏', '3', '0901', '834600', '中国,新疆维吾尔自治区,塔城地区,额敏县', '83.6287', '46.5284', 'Emin');
INSERT INTO `ctshop_region` VALUES ('654223', '沙湾县', '654200', '沙湾', '3', '0993', '832100', '中国,新疆维吾尔自治区,塔城地区,沙湾县', '85.6193', '44.3314', 'Shawan');
INSERT INTO `ctshop_region` VALUES ('654224', '托里县', '654200', '托里', '3', '0901', '834500', '中国,新疆维吾尔自治区,塔城地区,托里县', '83.6059', '45.9362', 'Tuoli');
INSERT INTO `ctshop_region` VALUES ('654225', '裕民县', '654200', '裕民', '3', '0901', '834800', '中国,新疆维吾尔自治区,塔城地区,裕民县', '82.99', '46.2038', 'Yumin');
INSERT INTO `ctshop_region` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '和布克赛尔', '3', '0990', '834400', '中国,新疆维吾尔自治区,塔城地区,和布克赛尔蒙古自治县', '85.7266', '46.7936', 'Hebukesaier');
INSERT INTO `ctshop_region` VALUES ('654300', '阿勒泰地区', '650000', '阿勒泰', '2', '0906', '836500', '中国,新疆维吾尔自治区,阿勒泰地区', '88.1396', '47.8484', 'Altay');
INSERT INTO `ctshop_region` VALUES ('654301', '阿勒泰市', '654300', '阿勒泰', '3', '0906', '836500', '中国,新疆维吾尔自治区,阿勒泰地区,阿勒泰市', '88.1391', '47.8317', 'Aletai');
INSERT INTO `ctshop_region` VALUES ('654321', '布尔津县', '654300', '布尔津', '3', '0906', '836600', '中国,新疆维吾尔自治区,阿勒泰地区,布尔津县', '86.8575', '47.7006', 'Buerjin');
INSERT INTO `ctshop_region` VALUES ('654322', '富蕴县', '654300', '富蕴', '3', '0906', '836100', '中国,新疆维吾尔自治区,阿勒泰地区,富蕴县', '89.5268', '46.9944', 'Fuyun');
INSERT INTO `ctshop_region` VALUES ('654323', '福海县', '654300', '福海', '3', '0906', '836400', '中国,新疆维吾尔自治区,阿勒泰地区,福海县', '87.4951', '47.1106', 'Fuhai');
INSERT INTO `ctshop_region` VALUES ('654324', '哈巴河县', '654300', '哈巴河', '3', '0906', '836700', '中国,新疆维吾尔自治区,阿勒泰地区,哈巴河县', '86.4209', '48.0605', 'Habahe');
INSERT INTO `ctshop_region` VALUES ('654325', '青河县', '654300', '青河', '3', '0906', '836200', '中国,新疆维吾尔自治区,阿勒泰地区,青河县', '90.383', '46.6738', 'Qinghe');
INSERT INTO `ctshop_region` VALUES ('654326', '吉木乃县', '654300', '吉木乃', '3', '0906', '836800', '中国,新疆维吾尔自治区,阿勒泰地区,吉木乃县', '85.8781', '47.4336', 'Jimunai');
INSERT INTO `ctshop_region` VALUES ('659000', '直辖县级', '650000', ' ', '2', '', '', '中国,新疆维吾尔自治区,直辖县级', '91.1322', '29.6604', '');
INSERT INTO `ctshop_region` VALUES ('659001', '石河子市', '659000', '石河子', '3', '0993', '832000', '中国,新疆维吾尔自治区,直辖县级,石河子市', '86.0411', '44.3059', 'Shihezi');
INSERT INTO `ctshop_region` VALUES ('659002', '阿拉尔市', '659000', '阿拉尔', '3', '0997', '843300', '中国,新疆维吾尔自治区,直辖县级,阿拉尔市', '81.2859', '40.5419', 'Aral');
INSERT INTO `ctshop_region` VALUES ('659003', '图木舒克市', '659000', '图木舒克', '3', '0998', '843806', '中国,新疆维吾尔自治区,直辖县级,图木舒克市', '79.078', '39.8673', 'Tumxuk');
INSERT INTO `ctshop_region` VALUES ('659004', '五家渠市', '659000', '五家渠', '3', '0994', '831300', '中国,新疆维吾尔自治区,直辖县级,五家渠市', '87.5269', '44.1674', 'Wujiaqu');
INSERT INTO `ctshop_region` VALUES ('659005', '北屯市', '659000', '北屯', '3', '0906', '836000', '中国,新疆维吾尔自治区,直辖县级,北屯市', '87.8085', '47.3623', 'Beitun');
INSERT INTO `ctshop_region` VALUES ('659006', '铁门关市', '659000', '铁门关', '3', '0906', '836000', '中国,新疆维吾尔自治区,直辖县级,铁门关市', '86.1947', '41.811', 'Tiemenguan');
INSERT INTO `ctshop_region` VALUES ('659007', '双河市', '659000', '双河', '3', '0909', '833408', '中国,新疆维吾尔自治区,直辖县级,双河市', '91.1322', '29.6604', 'Shuanghe');
INSERT INTO `ctshop_region` VALUES ('710000', '台湾', '100000', '台湾', '1', '', '', '中国,台湾', '121.509', '25.0443', 'Taiwan');
INSERT INTO `ctshop_region` VALUES ('710100', '台北市', '710000', '台北', '2', '02', '1', '中国,台湾,台北市', '121.565', '25.0378', 'Taipei');
INSERT INTO `ctshop_region` VALUES ('710101', '松山区', '710100', '松山', '3', '02', '105', '中国,台湾,台北市,松山区', '121.577', '25.0497', 'Songshan');
INSERT INTO `ctshop_region` VALUES ('710102', '信义区', '710100', '信义', '3', '02', '110', '中国,台湾,台北市,信义区', '121.751', '25.1294', 'Xinyi');
INSERT INTO `ctshop_region` VALUES ('710103', '大安区', '710100', '大安', '3', '02', '106', '中国,台湾,台北市,大安区', '121.535', '25.0264', 'Da\'an');
INSERT INTO `ctshop_region` VALUES ('710104', '中山区', '710100', '中山', '3', '02', '104', '中国,台湾,台北市,中山区', '121.533', '25.0644', 'Zhongshan');
INSERT INTO `ctshop_region` VALUES ('710105', '中正区', '710100', '中正', '3', '02', '100', '中国,台湾,台北市,中正区', '121.518', '25.0324', 'Zhongzheng');
INSERT INTO `ctshop_region` VALUES ('710106', '大同区', '710100', '大同', '3', '02', '103', '中国,台湾,台北市,大同区', '121.516', '25.066', 'Datong');
INSERT INTO `ctshop_region` VALUES ('710107', '万华区', '710100', '万华', '3', '02', '108', '中国,台湾,台北市,万华区', '121.499', '25.0319', 'Wanhua');
INSERT INTO `ctshop_region` VALUES ('710108', '文山区', '710100', '文山', '3', '02', '116', '中国,台湾,台北市,文山区', '121.57', '24.9898', 'Wenshan');
INSERT INTO `ctshop_region` VALUES ('710109', '南港区', '710100', '南港', '3', '02', '115', '中国,台湾,台北市,南港区', '121.607', '25.0547', 'Nangang');
INSERT INTO `ctshop_region` VALUES ('710110', '内湖区', '710100', '内湖', '3', '02', '114', '中国,台湾,台北市,内湖区', '121.589', '25.0697', 'Nahu');
INSERT INTO `ctshop_region` VALUES ('710111', '士林区', '710100', '士林', '3', '02', '111', '中国,台湾,台北市,士林区', '121.52', '25.0928', 'Shilin');
INSERT INTO `ctshop_region` VALUES ('710112', '北投区', '710100', '北投', '3', '02', '112', '中国,台湾,台北市,北投区', '121.501', '25.1324', 'Beitou');
INSERT INTO `ctshop_region` VALUES ('710200', '高雄市', '710000', '高雄', '2', '07', '8', '中国,台湾,高雄市', '120.312', '22.6209', 'Kaohsiung');
INSERT INTO `ctshop_region` VALUES ('710201', '盐埕区', '710200', '盐埕', '3', '07', '803', '中国,台湾,高雄市,盐埕区', '120.287', '22.6247', 'Yancheng');
INSERT INTO `ctshop_region` VALUES ('710202', '鼓山区', '710200', '鼓山', '3', '07', '804', '中国,台湾,高雄市,鼓山区', '120.281', '22.6368', 'Gushan');
INSERT INTO `ctshop_region` VALUES ('710203', '左营区', '710200', '左营', '3', '07', '813', '中国,台湾,高雄市,左营区', '120.295', '22.6901', 'Zuoying');
INSERT INTO `ctshop_region` VALUES ('710204', '楠梓区', '710200', '楠梓', '3', '07', '811', '中国,台湾,高雄市,楠梓区', '120.326', '22.7284', 'Nanzi');
INSERT INTO `ctshop_region` VALUES ('710205', '三民区', '710200', '三民', '3', '07', '807', '中国,台湾,高雄市,三民区', '120.3', '22.6477', 'Sanmin');
INSERT INTO `ctshop_region` VALUES ('710206', '新兴区', '710200', '新兴', '3', '07', '800', '中国,台湾,高雄市,新兴区', '120.31', '22.6311', 'Xinxing');
INSERT INTO `ctshop_region` VALUES ('710207', '前金区', '710200', '前金', '3', '07', '801', '中国,台湾,高雄市,前金区', '120.294', '22.6274', 'Qianjin');
INSERT INTO `ctshop_region` VALUES ('710208', '苓雅区', '710200', '苓雅', '3', '07', '802', '中国,台湾,高雄市,苓雅区', '120.312', '22.6218', 'Lingya');
INSERT INTO `ctshop_region` VALUES ('710209', '前镇区', '710200', '前镇', '3', '07', '806', '中国,台湾,高雄市,前镇区', '120.319', '22.5864', 'Qianzhen');
INSERT INTO `ctshop_region` VALUES ('710210', '旗津区', '710200', '旗津', '3', '07', '805', '中国,台湾,高雄市,旗津区', '120.284', '22.5906', 'Qijin');
INSERT INTO `ctshop_region` VALUES ('710211', '小港区', '710200', '小港', '3', '07', '812', '中国,台湾,高雄市,小港区', '120.338', '22.5654', 'Xiaogang');
INSERT INTO `ctshop_region` VALUES ('710212', '凤山区', '710200', '凤山', '3', '07', '830', '中国,台湾,高雄市,凤山区', '120.357', '22.6269', 'Fengshan');
INSERT INTO `ctshop_region` VALUES ('710213', '林园区', '710200', '林园', '3', '07', '832', '中国,台湾,高雄市,林园区', '120.396', '22.5015', 'Linyuan');
INSERT INTO `ctshop_region` VALUES ('710214', '大寮区', '710200', '大寮', '3', '07', '831', '中国,台湾,高雄市,大寮区', '120.395', '22.6054', 'Daliao');
INSERT INTO `ctshop_region` VALUES ('710215', '大树区', '710200', '大树', '3', '07', '840', '中国,台湾,高雄市,大树区', '120.433', '22.6934', 'Dashu');
INSERT INTO `ctshop_region` VALUES ('710216', '大社区', '710200', '大社', '3', '07', '815', '中国,台湾,高雄市,大社区', '120.347', '22.73', 'Dashe');
INSERT INTO `ctshop_region` VALUES ('710217', '仁武区', '710200', '仁武', '3', '07', '814', '中国,台湾,高雄市,仁武区', '120.348', '22.7019', 'Renwu');
INSERT INTO `ctshop_region` VALUES ('710218', '鸟松区', '710200', '鸟松', '3', '07', '833', '中国,台湾,高雄市,鸟松区', '120.364', '22.6593', 'Niaosong');
INSERT INTO `ctshop_region` VALUES ('710219', '冈山区', '710200', '冈山', '3', '07', '820', '中国,台湾,高雄市,冈山区', '120.296', '22.7968', 'Gangshan');
INSERT INTO `ctshop_region` VALUES ('710220', '桥头区', '710200', '桥头', '3', '07', '825', '中国,台湾,高雄市,桥头区', '120.306', '22.7575', 'Qiaotou');
INSERT INTO `ctshop_region` VALUES ('710221', '燕巢区', '710200', '燕巢', '3', '07', '824', '中国,台湾,高雄市,燕巢区', '120.362', '22.7934', 'Yanchao');
INSERT INTO `ctshop_region` VALUES ('710222', '田寮区', '710200', '田寮', '3', '07', '823', '中国,台湾,高雄市,田寮区', '120.36', '22.8693', 'Tianliao');
INSERT INTO `ctshop_region` VALUES ('710223', '阿莲区', '710200', '阿莲', '3', '07', '822', '中国,台湾,高雄市,阿莲区', '120.327', '22.8837', 'Alian');
INSERT INTO `ctshop_region` VALUES ('710224', '路竹区', '710200', '路竹', '3', '07', '821', '中国,台湾,高雄市,路竹区', '120.262', '22.8569', 'Luzhu');
INSERT INTO `ctshop_region` VALUES ('710225', '湖内区', '710200', '湖内', '3', '07', '829', '中国,台湾,高雄市,湖内区', '120.212', '22.9082', 'Huna');
INSERT INTO `ctshop_region` VALUES ('710226', '茄萣区', '710200', '茄萣', '3', '07', '852', '中国,台湾,高雄市,茄萣区', '120.183', '22.9066', 'Qieding');
INSERT INTO `ctshop_region` VALUES ('710227', '永安区', '710200', '永安', '3', '07', '828', '中国,台湾,高雄市,永安区', '120.225', '22.8186', 'Yong\'an');
INSERT INTO `ctshop_region` VALUES ('710228', '弥陀区', '710200', '弥陀', '3', '07', '827', '中国,台湾,高雄市,弥陀区', '120.247', '22.7829', 'Mituo');
INSERT INTO `ctshop_region` VALUES ('710229', '梓官区', '710200', '梓官', '3', '07', '826', '中国,台湾,高雄市,梓官区', '120.267', '22.7605', 'Ziguan');
INSERT INTO `ctshop_region` VALUES ('710230', '旗山区', '710200', '旗山', '3', '07', '842', '中国,台湾,高雄市,旗山区', '120.484', '22.8885', 'Qishan');
INSERT INTO `ctshop_region` VALUES ('710231', '美浓区', '710200', '美浓', '3', '07', '843', '中国,台湾,高雄市,美浓区', '120.542', '22.8979', 'Meinong');
INSERT INTO `ctshop_region` VALUES ('710232', '六龟区', '710200', '六龟', '3', '07', '844', '中国,台湾,高雄市,六龟区', '120.633', '22.9979', 'Liugui');
INSERT INTO `ctshop_region` VALUES ('710233', '甲仙区', '710200', '甲仙', '3', '07', '847', '中国,台湾,高雄市,甲仙区', '120.591', '23.0847', 'Jiaxian');
INSERT INTO `ctshop_region` VALUES ('710234', '杉林区', '710200', '杉林', '3', '07', '846', '中国,台湾,高雄市,杉林区', '120.539', '22.9707', 'Shanlin');
INSERT INTO `ctshop_region` VALUES ('710235', '内门区', '710200', '内门', '3', '07', '845', '中国,台湾,高雄市,内门区', '120.462', '22.9434', 'Namen');
INSERT INTO `ctshop_region` VALUES ('710236', '茂林区', '710200', '茂林', '3', '07', '851', '中国,台湾,高雄市,茂林区', '120.663', '22.8862', 'Maolin');
INSERT INTO `ctshop_region` VALUES ('710237', '桃源区', '710200', '桃源', '3', '07', '848', '中国,台湾,高雄市,桃源区', '120.76', '23.1591', 'Taoyuan');
INSERT INTO `ctshop_region` VALUES ('710238', '那玛夏区', '710200', '那玛夏', '3', '07', '849', '中国,台湾,高雄市,那玛夏区', '120.693', '23.217', 'Namaxia');
INSERT INTO `ctshop_region` VALUES ('710300', '基隆市', '710000', '基隆', '2', '02', '2', '中国,台湾,基隆市', '121.746', '25.1307', 'Keelung');
INSERT INTO `ctshop_region` VALUES ('710301', '中正区', '710300', '中正', '3', '02', '202', '中国,台湾,基隆市,中正区', '121.518', '25.0324', 'Zhongzheng');
INSERT INTO `ctshop_region` VALUES ('710302', '七堵区', '710300', '七堵', '3', '02', '206', '中国,台湾,基隆市,七堵区', '121.713', '25.0957', 'Qidu');
INSERT INTO `ctshop_region` VALUES ('710303', '暖暖区', '710300', '暖暖', '3', '02', '205', '中国,台湾,基隆市,暖暖区', '121.736', '25.0998', 'Nuannuan');
INSERT INTO `ctshop_region` VALUES ('710304', '仁爱区', '710300', '仁爱', '3', '02', '200', '中国,台湾,基隆市,仁爱区', '121.741', '25.1275', 'Renai');
INSERT INTO `ctshop_region` VALUES ('710305', '中山区', '710300', '中山', '3', '02', '203', '中国,台湾,基隆市,中山区', '121.739', '25.134', 'Zhongshan');
INSERT INTO `ctshop_region` VALUES ('710306', '安乐区', '710300', '安乐', '3', '02', '204', '中国,台湾,基隆市,安乐区', '121.723', '25.1209', 'Anle');
INSERT INTO `ctshop_region` VALUES ('710307', '信义区', '710300', '信义', '3', '02', '201', '中国,台湾,基隆市,信义区', '121.751', '25.1294', 'Xinyi');
INSERT INTO `ctshop_region` VALUES ('710400', '台中市', '710000', '台中', '2', '04', '4', '中国,台湾,台中市', '120.679', '24.1386', 'Taichung');
INSERT INTO `ctshop_region` VALUES ('710401', '中区', '710400', '中区', '3', '04', '400', '中国,台湾,台中市,中区', '120.68', '24.1438', 'Zhongqu');
INSERT INTO `ctshop_region` VALUES ('710402', '东区', '710400', '东区', '3', '04', '401', '中国,台湾,台中市,东区', '120.704', '24.1366', 'Dongqu');
INSERT INTO `ctshop_region` VALUES ('710403', '南区', '710400', '南区', '3', '04', '402', '中国,台湾,台中市,南区', '120.189', '22.9609', 'Nanqu');
INSERT INTO `ctshop_region` VALUES ('710404', '西区', '710400', '西区', '3', '04', '403', '中国,台湾,台中市,西区', '120.671', '24.1414', 'Xiqu');
INSERT INTO `ctshop_region` VALUES ('710405', '北区', '710400', '北区', '3', '04', '404', '中国,台湾,台中市,北区', '120.682', '24.166', 'Beiqu');
INSERT INTO `ctshop_region` VALUES ('710406', '西屯区', '710400', '西屯', '3', '04', '407', '中国,台湾,台中市,西屯区', '120.64', '24.1813', 'Xitun');
INSERT INTO `ctshop_region` VALUES ('710407', '南屯区', '710400', '南屯', '3', '04', '408', '中国,台湾,台中市,南屯区', '120.643', '24.1383', 'Nantun');
INSERT INTO `ctshop_region` VALUES ('710408', '北屯区', '710400', '北屯', '3', '04', '406', '中国,台湾,台中市,北屯区', '120.686', '24.1822', 'Beitun');
INSERT INTO `ctshop_region` VALUES ('710409', '丰原区', '710400', '丰原', '3', '04', '420', '中国,台湾,台中市,丰原区', '120.718', '24.2422', 'Fengyuan');
INSERT INTO `ctshop_region` VALUES ('710410', '东势区', '710400', '东势', '3', '04', '423', '中国,台湾,台中市,东势区', '120.828', '24.2586', 'Dongshi');
INSERT INTO `ctshop_region` VALUES ('710411', '大甲区', '710400', '大甲', '3', '04', '437', '中国,台湾,台中市,大甲区', '120.622', '24.3489', 'Dajia');
INSERT INTO `ctshop_region` VALUES ('710412', '清水区', '710400', '清水', '3', '04', '436', '中国,台湾,台中市,清水区', '120.56', '24.2687', 'Qingshui');
INSERT INTO `ctshop_region` VALUES ('710413', '沙鹿区', '710400', '沙鹿', '3', '04', '433', '中国,台湾,台中市,沙鹿区', '120.566', '24.2335', 'Shalu');
INSERT INTO `ctshop_region` VALUES ('710414', '梧栖区', '710400', '梧栖', '3', '04', '435', '中国,台湾,台中市,梧栖区', '120.532', '24.255', 'Wuqi');
INSERT INTO `ctshop_region` VALUES ('710415', '后里区', '710400', '后里', '3', '04', '421', '中国,台湾,台中市,后里区', '120.711', '24.3049', 'Houli');
INSERT INTO `ctshop_region` VALUES ('710416', '神冈区', '710400', '神冈', '3', '04', '429', '中国,台湾,台中市,神冈区', '120.662', '24.2578', 'Shengang');
INSERT INTO `ctshop_region` VALUES ('710417', '潭子区', '710400', '潭子', '3', '04', '427', '中国,台湾,台中市,潭子区', '120.705', '24.2095', 'Tanzi');
INSERT INTO `ctshop_region` VALUES ('710418', '大雅区', '710400', '大雅', '3', '04', '428', '中国,台湾,台中市,大雅区', '120.648', '24.2292', 'Daya');
INSERT INTO `ctshop_region` VALUES ('710419', '新社区', '710400', '新社', '3', '04', '426', '中国,台湾,台中市,新社区', '120.81', '24.2341', 'Xinshe');
INSERT INTO `ctshop_region` VALUES ('710420', '石冈区', '710400', '石冈', '3', '04', '422', '中国,台湾,台中市,石冈区', '120.78', '24.275', 'Shigang');
INSERT INTO `ctshop_region` VALUES ('710421', '外埔区', '710400', '外埔', '3', '04', '438', '中国,台湾,台中市,外埔区', '120.654', '24.332', 'Waipu');
INSERT INTO `ctshop_region` VALUES ('710422', '大安区', '710400', '大安', '3', '04', '439', '中国,台湾,台中市,大安区', '120.587', '24.3461', 'Da\'an');
INSERT INTO `ctshop_region` VALUES ('710423', '乌日区', '710400', '乌日', '3', '04', '414', '中国,台湾,台中市,乌日区', '120.624', '24.1045', 'Wuri');
INSERT INTO `ctshop_region` VALUES ('710424', '大肚区', '710400', '大肚', '3', '04', '432', '中国,台湾,台中市,大肚区', '120.541', '24.1537', 'Dadu');
INSERT INTO `ctshop_region` VALUES ('710425', '龙井区', '710400', '龙井', '3', '04', '434', '中国,台湾,台中市,龙井区', '120.546', '24.1927', 'Longjing');
INSERT INTO `ctshop_region` VALUES ('710426', '雾峰区', '710400', '雾峰', '3', '04', '413', '中国,台湾,台中市,雾峰区', '120.7', '24.0615', 'Wufeng');
INSERT INTO `ctshop_region` VALUES ('710427', '太平区', '710400', '太平', '3', '04', '411', '中国,台湾,台中市,太平区', '120.719', '24.1265', 'Taiping');
INSERT INTO `ctshop_region` VALUES ('710428', '大里区', '710400', '大里', '3', '04', '412', '中国,台湾,台中市,大里区', '120.678', '24.0994', 'Dali');
INSERT INTO `ctshop_region` VALUES ('710429', '和平区', '710400', '和平', '3', '04', '424', '中国,台湾,台中市,和平区', '120.883', '24.1748', 'Heping');
INSERT INTO `ctshop_region` VALUES ('710500', '台南市', '710000', '台南', '2', '06', '7', '中国,台湾,台南市', '120.279', '23.1725', 'Tainan');
INSERT INTO `ctshop_region` VALUES ('710501', '东区', '710500', '东区', '3', '06', '701', '中国,台湾,台南市,东区', '120.224', '22.9801', 'Dongqu');
INSERT INTO `ctshop_region` VALUES ('710502', '南区', '710500', '南区', '3', '06', '702', '中国,台湾,台南市,南区', '120.189', '22.9609', 'Nanqu');
INSERT INTO `ctshop_region` VALUES ('710504', '北区', '710500', '北区', '3', '06', '704', '中国,台湾,台南市,北区', '120.682', '24.166', 'Beiqu');
INSERT INTO `ctshop_region` VALUES ('710506', '安南区', '710500', '安南', '3', '06', '709', '中国,台湾,台南市,安南区', '120.185', '23.0472', 'Annan');
INSERT INTO `ctshop_region` VALUES ('710507', '安平区', '710500', '安平', '3', '06', '708', '中国,台湾,台南市,安平区', '120.167', '23.0008', 'Anping');
INSERT INTO `ctshop_region` VALUES ('710508', '中西区', '710500', '中西', '3', '06', '700', '中国,台湾,台南市,中西区', '120.206', '22.9922', 'Zhongxi');
INSERT INTO `ctshop_region` VALUES ('710509', '新营区', '710500', '新营', '3', '06', '730', '中国,台湾,台南市,新营区', '120.317', '23.3103', 'Xinying');
INSERT INTO `ctshop_region` VALUES ('710510', '盐水区', '710500', '盐水', '3', '06', '737', '中国,台湾,台南市,盐水区', '120.266', '23.3198', 'Yanshui');
INSERT INTO `ctshop_region` VALUES ('710511', '白河区', '710500', '白河', '3', '06', '732', '中国,台湾,台南市,白河区', '120.416', '23.3512', 'Baihe');
INSERT INTO `ctshop_region` VALUES ('710512', '柳营区', '710500', '柳营', '3', '06', '736', '中国,台湾,台南市,柳营区', '120.311', '23.2781', 'Liuying');
INSERT INTO `ctshop_region` VALUES ('710513', '后壁区', '710500', '后壁', '3', '06', '731', '中国,台湾,台南市,后壁区', '120.363', '23.3667', 'Houbi');
INSERT INTO `ctshop_region` VALUES ('710514', '东山区', '710500', '东山', '3', '06', '733', '中国,台湾,台南市,东山区', '120.404', '23.3261', 'Dongshan');
INSERT INTO `ctshop_region` VALUES ('710515', '麻豆区', '710500', '麻豆', '3', '06', '721', '中国,台湾,台南市,麻豆区', '120.248', '23.1817', 'Madou');
INSERT INTO `ctshop_region` VALUES ('710516', '下营区', '710500', '下营', '3', '06', '735', '中国,台湾,台南市,下营区', '120.264', '23.2354', 'Xiaying');
INSERT INTO `ctshop_region` VALUES ('710517', '六甲区', '710500', '六甲', '3', '06', '734', '中国,台湾,台南市,六甲区', '120.348', '23.2319', 'Liujia');
INSERT INTO `ctshop_region` VALUES ('710518', '官田区', '710500', '官田', '3', '06', '720', '中国,台湾,台南市,官田区', '120.314', '23.1947', 'Guantian');
INSERT INTO `ctshop_region` VALUES ('710519', '大内区', '710500', '大内', '3', '06', '742', '中国,台湾,台南市,大内区', '120.349', '23.1195', 'Dana');
INSERT INTO `ctshop_region` VALUES ('710520', '佳里区', '710500', '佳里', '3', '06', '722', '中国,台湾,台南市,佳里区', '120.177', '23.1651', 'Jiali');
INSERT INTO `ctshop_region` VALUES ('710521', '学甲区', '710500', '学甲', '3', '06', '726', '中国,台湾,台南市,学甲区', '120.18', '23.2323', 'Xuejia');
INSERT INTO `ctshop_region` VALUES ('710522', '西港区', '710500', '西港', '3', '06', '723', '中国,台湾,台南市,西港区', '120.204', '23.1231', 'Xigang');
INSERT INTO `ctshop_region` VALUES ('710523', '七股区', '710500', '七股', '3', '06', '724', '中国,台湾,台南市,七股区', '120.14', '23.1405', 'Qigu');
INSERT INTO `ctshop_region` VALUES ('710524', '将军区', '710500', '将军', '3', '06', '725', '中国,台湾,台南市,将军区', '120.157', '23.1995', 'Jiangjun');
INSERT INTO `ctshop_region` VALUES ('710525', '北门区', '710500', '北门', '3', '06', '727', '中国,台湾,台南市,北门区', '120.126', '23.2671', 'Beimen');
INSERT INTO `ctshop_region` VALUES ('710526', '新化区', '710500', '新化', '3', '06', '712', '中国,台湾,台南市,新化区', '120.311', '23.0385', 'Xinhua');
INSERT INTO `ctshop_region` VALUES ('710527', '善化区', '710500', '善化', '3', '06', '741', '中国,台湾,台南市,善化区', '120.297', '23.1323', 'Shanhua');
INSERT INTO `ctshop_region` VALUES ('710528', '新市区', '710500', '新市', '3', '06', '744', '中国,台湾,台南市,新市区', '120.295', '23.079', 'Xinshi');
INSERT INTO `ctshop_region` VALUES ('710529', '安定区', '710500', '安定', '3', '06', '745', '中国,台湾,台南市,安定区', '120.237', '23.1215', 'Anding');
INSERT INTO `ctshop_region` VALUES ('710530', '山上区', '710500', '山上', '3', '06', '743', '中国,台湾,台南市,山上区', '120.353', '23.1032', 'Shanshang');
INSERT INTO `ctshop_region` VALUES ('710531', '玉井区', '710500', '玉井', '3', '06', '714', '中国,台湾,台南市,玉井区', '120.46', '23.1239', 'Yujing');
INSERT INTO `ctshop_region` VALUES ('710532', '楠西区', '710500', '楠西', '3', '06', '715', '中国,台湾,台南市,楠西区', '120.485', '23.1735', 'Nanxi');
INSERT INTO `ctshop_region` VALUES ('710533', '南化区', '710500', '南化', '3', '06', '716', '中国,台湾,台南市,南化区', '120.477', '23.0426', 'Nanhua');
INSERT INTO `ctshop_region` VALUES ('710534', '左镇区', '710500', '左镇', '3', '06', '713', '中国,台湾,台南市,左镇区', '120.407', '23.058', 'Zuozhen');
INSERT INTO `ctshop_region` VALUES ('710535', '仁德区', '710500', '仁德', '3', '06', '717', '中国,台湾,台南市,仁德区', '120.252', '22.9722', 'Rende');
INSERT INTO `ctshop_region` VALUES ('710536', '归仁区', '710500', '归仁', '3', '06', '711', '中国,台湾,台南市,归仁区', '120.294', '22.9671', 'Guiren');
INSERT INTO `ctshop_region` VALUES ('710537', '关庙区', '710500', '关庙', '3', '06', '718', '中国,台湾,台南市,关庙区', '120.328', '22.9629', 'Guanmiao');
INSERT INTO `ctshop_region` VALUES ('710538', '龙崎区', '710500', '龙崎', '3', '06', '719', '中国,台湾,台南市,龙崎区', '120.361', '22.9657', 'Longqi');
INSERT INTO `ctshop_region` VALUES ('710539', '永康区', '710500', '永康', '3', '06', '710', '中国,台湾,台南市,永康区', '120.257', '23.0261', 'Yongkang');
INSERT INTO `ctshop_region` VALUES ('710600', '新竹市', '710000', '新竹', '2', '03', '3', '中国,台湾,新竹市', '120.969', '24.8067', 'Hsinchu');
INSERT INTO `ctshop_region` VALUES ('710601', '东区', '710600', '东区', '3', '03', '300', '中国,台湾,新竹市,东区', '120.97', '24.8013', 'Dongqu');
INSERT INTO `ctshop_region` VALUES ('710602', '北区', '710600', '北区', '3', '03', '', '中国,台湾,新竹市,北区', '120.682', '24.166', 'Beiqu');
INSERT INTO `ctshop_region` VALUES ('710603', '香山区', '710600', '香山', '3', '03', '', '中国,台湾,新竹市,香山区', '120.957', '24.7689', 'Xiangshan');
INSERT INTO `ctshop_region` VALUES ('710700', '嘉义市', '710000', '嘉义', '2', '05', '6', '中国,台湾,嘉义市', '120.453', '23.4816', 'Chiayi');
INSERT INTO `ctshop_region` VALUES ('710701', '东区', '710700', '东区', '3', '05', '600', '中国,台湾,嘉义市,东区', '120.458', '23.4862', 'Dongqu');
INSERT INTO `ctshop_region` VALUES ('710702', '西区', '710700', '西区', '3', '05', '600', '中国,台湾,嘉义市,西区', '120.437', '23.473', 'Xiqu');
INSERT INTO `ctshop_region` VALUES ('710800', '新北市', '710000', '新北', '2', '02', '2', '中国,台湾,新北市', '121.466', '25.0124', 'New Taipei');
INSERT INTO `ctshop_region` VALUES ('710801', '板桥区', '710800', '板桥', '3', '02', '220', '中国,台湾,新北市,板桥区', '121.459', '25.0096', 'Banqiao');
INSERT INTO `ctshop_region` VALUES ('710802', '三重区', '710800', '三重', '3', '02', '241', '中国,台湾,新北市,三重区', '121.488', '25.0615', 'Sanzhong');
INSERT INTO `ctshop_region` VALUES ('710803', '中和区', '710800', '中和', '3', '02', '235', '中国,台湾,新北市,中和区', '121.499', '24.9994', 'Zhonghe');
INSERT INTO `ctshop_region` VALUES ('710804', '永和区', '710800', '永和', '3', '02', '234', '中国,台湾,新北市,永和区', '121.514', '25.0078', 'Yonghe');
INSERT INTO `ctshop_region` VALUES ('710805', '新庄区', '710800', '新庄', '3', '02', '242', '中国,台湾,新北市,新庄区', '121.45', '25.0359', 'Xinzhuang');
INSERT INTO `ctshop_region` VALUES ('710806', '新店区', '710800', '新店', '3', '02', '231', '中国,台湾,新北市,新店区', '121.542', '24.9676', 'Xindian');
INSERT INTO `ctshop_region` VALUES ('710807', '树林区', '710800', '树林', '3', '02', '238', '中国,台湾,新北市,树林区', '121.421', '24.9907', 'Shulin');
INSERT INTO `ctshop_region` VALUES ('710808', '莺歌区', '710800', '莺歌', '3', '02', '239', '中国,台湾,新北市,莺歌区', '121.355', '24.9554', 'Yingge');
INSERT INTO `ctshop_region` VALUES ('710809', '三峡区', '710800', '三峡', '3', '02', '237', '中国,台湾,新北市,三峡区', '121.369', '24.9343', 'Sanxia');
INSERT INTO `ctshop_region` VALUES ('710810', '淡水区', '710800', '淡水', '3', '02', '251', '中国,台湾,新北市,淡水区', '121.441', '25.1695', 'Danshui');
INSERT INTO `ctshop_region` VALUES ('710811', '汐止区', '710800', '汐止', '3', '02', '221', '中国,台湾,新北市,汐止区', '121.629', '25.063', 'Xizhi');
INSERT INTO `ctshop_region` VALUES ('710812', '瑞芳区', '710800', '瑞芳', '3', '02', '224', '中国,台湾,新北市,瑞芳区', '121.81', '25.1089', 'Ruifang');
INSERT INTO `ctshop_region` VALUES ('710813', '土城区', '710800', '土城', '3', '02', '236', '中国,台湾,新北市,土城区', '121.443', '24.9722', 'Tucheng');
INSERT INTO `ctshop_region` VALUES ('710814', '芦洲区', '710800', '芦洲', '3', '02', '247', '中国,台湾,新北市,芦洲区', '121.474', '25.0849', 'Luzhou');
INSERT INTO `ctshop_region` VALUES ('710815', '五股区', '710800', '五股', '3', '02', '248', '中国,台湾,新北市,五股区', '121.438', '25.0827', 'Wugu');
INSERT INTO `ctshop_region` VALUES ('710816', '泰山区', '710800', '泰山', '3', '02', '243', '中国,台湾,新北市,泰山区', '121.431', '25.0589', 'Taishan');
INSERT INTO `ctshop_region` VALUES ('710817', '林口区', '710800', '林口', '3', '02', '244', '中国,台湾,新北市,林口区', '121.392', '25.0775', 'Linkou');
INSERT INTO `ctshop_region` VALUES ('710818', '深坑区', '710800', '深坑', '3', '02', '222', '中国,台湾,新北市,深坑区', '121.616', '25.0023', 'Shenkeng');
INSERT INTO `ctshop_region` VALUES ('710819', '石碇区', '710800', '石碇', '3', '02', '223', '中国,台湾,新北市,石碇区', '121.659', '24.9917', 'Shiding');
INSERT INTO `ctshop_region` VALUES ('710820', '坪林区', '710800', '坪林', '3', '02', '232', '中国,台湾,新北市,坪林区', '121.711', '24.9374', 'Pinglin');
INSERT INTO `ctshop_region` VALUES ('710821', '三芝区', '710800', '三芝', '3', '02', '252', '中国,台湾,新北市,三芝区', '121.501', '25.258', 'Sanzhi');
INSERT INTO `ctshop_region` VALUES ('710822', '石门区', '710800', '石门', '3', '02', '253', '中国,台湾,新北市,石门区', '121.568', '25.2904', 'Shimen');
INSERT INTO `ctshop_region` VALUES ('710823', '八里区', '710800', '八里', '3', '02', '249', '中国,台湾,新北市,八里区', '121.398', '25.1467', 'Bali');
INSERT INTO `ctshop_region` VALUES ('710824', '平溪区', '710800', '平溪', '3', '02', '226', '中国,台湾,新北市,平溪区', '121.738', '25.0257', 'Pingxi');
INSERT INTO `ctshop_region` VALUES ('710825', '双溪区', '710800', '双溪', '3', '02', '227', '中国,台湾,新北市,双溪区', '121.866', '25.0334', 'Shuangxi');
INSERT INTO `ctshop_region` VALUES ('710826', '贡寮区', '710800', '贡寮', '3', '02', '228', '中国,台湾,新北市,贡寮区', '121.908', '25.0224', 'Gongliao');
INSERT INTO `ctshop_region` VALUES ('710827', '金山区', '710800', '金山', '3', '02', '208', '中国,台湾,新北市,金山区', '121.636', '25.2219', 'Jinshan');
INSERT INTO `ctshop_region` VALUES ('710828', '万里区', '710800', '万里', '3', '02', '207', '中国,台湾,新北市,万里区', '121.689', '25.1812', 'Wanli');
INSERT INTO `ctshop_region` VALUES ('710829', '乌来区', '710800', '乌来', '3', '02', '233', '中国,台湾,新北市,乌来区', '121.551', '24.8653', 'Wulai');
INSERT INTO `ctshop_region` VALUES ('712200', '宜兰县', '710000', '宜兰', '2', '03', '2', '中国,台湾,宜兰县', '121.5', '24.6', 'Yilan');
INSERT INTO `ctshop_region` VALUES ('712201', '宜兰市', '712200', '宜兰', '3', '03', '260', '中国,台湾,宜兰县,宜兰市', '121.753', '24.7517', 'Yilan');
INSERT INTO `ctshop_region` VALUES ('712221', '罗东镇', '712200', '罗东', '3', '03', '265', '中国,台湾,宜兰县,罗东镇', '121.767', '24.677', 'Luodong');
INSERT INTO `ctshop_region` VALUES ('712222', '苏澳镇', '712200', '苏澳', '3', '03', '270', '中国,台湾,宜兰县,苏澳镇', '121.843', '24.5946', 'Suao');
INSERT INTO `ctshop_region` VALUES ('712223', '头城镇', '712200', '头城', '3', '03', '261', '中国,台湾,宜兰县,头城镇', '121.823', '24.8592', 'Toucheng');
INSERT INTO `ctshop_region` VALUES ('712224', '礁溪乡', '712200', '礁溪', '3', '03', '262', '中国,台湾,宜兰县,礁溪乡', '121.767', '24.8223', 'Jiaoxi');
INSERT INTO `ctshop_region` VALUES ('712225', '壮围乡', '712200', '壮围', '3', '03', '263', '中国,台湾,宜兰县,壮围乡', '121.782', '24.7449', 'Zhuangwei');
INSERT INTO `ctshop_region` VALUES ('712226', '员山乡', '712200', '员山', '3', '03', '264', '中国,台湾,宜兰县,员山乡', '121.722', '24.7418', 'Yuanshan');
INSERT INTO `ctshop_region` VALUES ('712227', '冬山乡', '712200', '冬山', '3', '03', '269', '中国,台湾,宜兰县,冬山乡', '121.792', '24.6345', 'Dongshan');
INSERT INTO `ctshop_region` VALUES ('712228', '五结乡', '712200', '五结', '3', '03', '268', '中国,台湾,宜兰县,五结乡', '121.798', '24.6846', 'Wujie');
INSERT INTO `ctshop_region` VALUES ('712229', '三星乡', '712200', '三星', '3', '03', '266', '中国,台湾,宜兰县,三星乡', '121.003', '23.7753', 'Sanxing');
INSERT INTO `ctshop_region` VALUES ('712230', '大同乡', '712200', '大同', '3', '03', '267', '中国,台湾,宜兰县,大同乡', '121.606', '24.676', 'Datong');
INSERT INTO `ctshop_region` VALUES ('712231', '南澳乡', '712200', '南澳', '3', '03', '272', '中国,台湾,宜兰县,南澳乡', '121.8', '24.4654', 'Nanao');
INSERT INTO `ctshop_region` VALUES ('712300', '桃园县', '710000', '桃园', '2', '03', '3', '中国,台湾,桃园县', '121.083', '25', 'Taoyuan');
INSERT INTO `ctshop_region` VALUES ('712301', '桃园市', '712300', '桃园', '3', '03', '330', '中国,台湾,桃园县,桃园市', '121.301', '24.9938', 'Taoyuan');
INSERT INTO `ctshop_region` VALUES ('712302', '中坜市', '712300', '中坜', '3', '03', '320', '中国,台湾,桃园县,中坜市', '121.225', '24.9654', 'Zhongli');
INSERT INTO `ctshop_region` VALUES ('712303', '平镇市', '712300', '平镇', '3', '03', '324', '中国,台湾,桃园县,平镇市', '121.218', '24.9458', 'Pingzhen');
INSERT INTO `ctshop_region` VALUES ('712304', '八德市', '712300', '八德', '3', '03', '334', '中国,台湾,桃园县,八德市', '121.285', '24.9287', 'Bade');
INSERT INTO `ctshop_region` VALUES ('712305', '杨梅市', '712300', '杨梅', '3', '03', '326', '中国,台湾,桃园县,杨梅市', '121.146', '24.9076', 'Yangmei');
INSERT INTO `ctshop_region` VALUES ('712306', '芦竹市', '712300', '芦竹', '3', '03', '338', '中国,台湾,桃园县,芦竹市', '121.292', '25.0454', 'Luzhu');
INSERT INTO `ctshop_region` VALUES ('712321', '大溪镇', '712300', '大溪', '3', '03', '335', '中国,台湾,桃园县,大溪镇', '121.287', '24.8806', 'Daxi');
INSERT INTO `ctshop_region` VALUES ('712324', '大园乡', '712300', '大园', '3', '03', '337', '中国,台湾,桃园县,大园乡', '121.196', '25.0645', 'Dayuan');
INSERT INTO `ctshop_region` VALUES ('712325', '龟山乡', '712300', '龟山', '3', '03', '333', '中国,台湾,桃园县,龟山乡', '121.338', '24.9925', 'Guishan');
INSERT INTO `ctshop_region` VALUES ('712327', '龙潭乡', '712300', '龙潭', '3', '03', '325', '中国,台湾,桃园县,龙潭乡', '121.216', '24.8639', 'Longtan');
INSERT INTO `ctshop_region` VALUES ('712329', '新屋乡', '712300', '新屋', '3', '03', '327', '中国,台湾,桃园县,新屋乡', '121.106', '24.9722', 'Xinwu');
INSERT INTO `ctshop_region` VALUES ('712330', '观音乡', '712300', '观音', '3', '03', '328', '中国,台湾,桃园县,观音乡', '121.078', '25.0333', 'Guanyin');
INSERT INTO `ctshop_region` VALUES ('712331', '复兴乡', '712300', '复兴', '3', '03', '336', '中国,台湾,桃园县,复兴乡', '121.353', '24.8209', 'Fuxing');
INSERT INTO `ctshop_region` VALUES ('712400', '新竹县', '710000', '新竹', '2', '03', '3', '中国,台湾,新竹县', '121.16', '24.6', 'Hsinchu');
INSERT INTO `ctshop_region` VALUES ('712401', '竹北市', '712400', '竹北', '3', '03', '302', '中国,台湾,新竹县,竹北市', '121.004', '24.8397', 'Zhubei');
INSERT INTO `ctshop_region` VALUES ('712421', '竹东镇', '712400', '竹东', '3', '03', '310', '中国,台湾,新竹县,竹东镇', '121.086', '24.7336', 'Zhudong');
INSERT INTO `ctshop_region` VALUES ('712422', '新埔镇', '712400', '新埔', '3', '03', '305', '中国,台湾,新竹县,新埔镇', '121.073', '24.8248', 'Xinpu');
INSERT INTO `ctshop_region` VALUES ('712423', '关西镇', '712400', '关西', '3', '03', '306', '中国,台湾,新竹县,关西镇', '121.177', '24.7888', 'Guanxi');
INSERT INTO `ctshop_region` VALUES ('712424', '湖口乡', '712400', '湖口', '3', '03', '303', '中国,台湾,新竹县,湖口乡', '121.044', '24.9039', 'Hukou');
INSERT INTO `ctshop_region` VALUES ('712425', '新丰乡', '712400', '新丰', '3', '03', '304', '中国,台湾,新竹县,新丰乡', '120.983', '24.8996', 'Xinfeng');
INSERT INTO `ctshop_region` VALUES ('712426', '芎林乡', '712400', '芎林', '3', '03', '307', '中国,台湾,新竹县,芎林乡', '121.077', '24.7744', 'Xionglin');
INSERT INTO `ctshop_region` VALUES ('712427', '横山乡', '712400', '横山', '3', '03', '312', '中国,台湾,新竹县,横山乡', '121.116', '24.7208', 'Hengshan');
INSERT INTO `ctshop_region` VALUES ('712428', '北埔乡', '712400', '北埔', '3', '03', '314', '中国,台湾,新竹县,北埔乡', '121.053', '24.6971', 'Beipu');
INSERT INTO `ctshop_region` VALUES ('712429', '宝山乡', '712400', '宝山', '3', '03', '308', '中国,台湾,新竹县,宝山乡', '120.986', '24.761', 'Baoshan');
INSERT INTO `ctshop_region` VALUES ('712430', '峨眉乡', '712400', '峨眉', '3', '03', '315', '中国,台湾,新竹县,峨眉乡', '121.015', '24.6861', 'Emei');
INSERT INTO `ctshop_region` VALUES ('712431', '尖石乡', '712400', '尖石', '3', '03', '313', '中国,台湾,新竹县,尖石乡', '121.198', '24.7044', 'Jianshi');
INSERT INTO `ctshop_region` VALUES ('712432', '五峰乡', '712400', '五峰', '3', '03', '311', '中国,台湾,新竹县,五峰乡', '121.003', '23.7753', 'Wufeng');
INSERT INTO `ctshop_region` VALUES ('712500', '苗栗县', '710000', '苗栗', '2', '037', '3', '中国,台湾,苗栗县', '120.75', '24.5', 'Miaoli');
INSERT INTO `ctshop_region` VALUES ('712501', '苗栗市', '712500', '苗栗', '3', '037', '360', '中国,台湾,苗栗县,苗栗市', '120.819', '24.5615', 'Miaoli');
INSERT INTO `ctshop_region` VALUES ('712521', '苑里镇', '712500', '苑里', '3', '037', '358', '中国,台湾,苗栗县,苑里镇', '120.649', '24.4417', 'Yuanli');
INSERT INTO `ctshop_region` VALUES ('712522', '通霄镇', '712500', '通霄', '3', '037', '357', '中国,台湾,苗栗县,通霄镇', '120.677', '24.4891', 'Tongxiao');
INSERT INTO `ctshop_region` VALUES ('712523', '竹南镇', '712500', '竹南', '3', '037', '350', '中国,台湾,苗栗县,竹南镇', '120.873', '24.6855', 'Zhunan');
INSERT INTO `ctshop_region` VALUES ('712524', '头份镇', '712500', '头份', '3', '037', '351', '中国,台湾,苗栗县,头份镇', '120.895', '24.688', 'Toufen');
INSERT INTO `ctshop_region` VALUES ('712525', '后龙镇', '712500', '后龙', '3', '037', '356', '中国,台湾,苗栗县,后龙镇', '120.786', '24.6126', 'Houlong');
INSERT INTO `ctshop_region` VALUES ('712526', '卓兰镇', '712500', '卓兰', '3', '037', '369', '中国,台湾,苗栗县,卓兰镇', '120.823', '24.3095', 'Zhuolan');
INSERT INTO `ctshop_region` VALUES ('712527', '大湖乡', '712500', '大湖', '3', '037', '364', '中国,台湾,苗栗县,大湖乡', '120.864', '24.4225', 'Dahu');
INSERT INTO `ctshop_region` VALUES ('712528', '公馆乡', '712500', '公馆', '3', '037', '363', '中国,台湾,苗栗县,公馆乡', '120.823', '24.4991', 'Gongguan');
INSERT INTO `ctshop_region` VALUES ('712529', '铜锣乡', '712500', '铜锣', '3', '037', '366', '中国,台湾,苗栗县,铜锣乡', '121.003', '23.7753', 'Tongluo');
INSERT INTO `ctshop_region` VALUES ('712530', '南庄乡', '712500', '南庄', '3', '037', '353', '中国,台湾,苗栗县,南庄乡', '120.995', '24.5968', 'Nanzhuang');
INSERT INTO `ctshop_region` VALUES ('712531', '头屋乡', '712500', '头屋', '3', '037', '362', '中国,台湾,苗栗县,头屋乡', '120.847', '24.5742', 'Touwu');
INSERT INTO `ctshop_region` VALUES ('712532', '三义乡', '712500', '三义', '3', '037', '367', '中国,台湾,苗栗县,三义乡', '120.742', '24.3503', 'Sanyi');
INSERT INTO `ctshop_region` VALUES ('712533', '西湖乡', '712500', '西湖', '3', '037', '368', '中国,台湾,苗栗县,西湖乡', '121.003', '23.7753', 'Xihu');
INSERT INTO `ctshop_region` VALUES ('712534', '造桥乡', '712500', '造桥', '3', '037', '361', '中国,台湾,苗栗县,造桥乡', '120.862', '24.6375', 'Zaoqiao');
INSERT INTO `ctshop_region` VALUES ('712535', '三湾乡', '712500', '三湾', '3', '037', '352', '中国,台湾,苗栗县,三湾乡', '120.951', '24.6511', 'Sanwan');
INSERT INTO `ctshop_region` VALUES ('712536', '狮潭乡', '712500', '狮潭', '3', '037', '354', '中国,台湾,苗栗县,狮潭乡', '120.918', '24.54', 'Shitan');
INSERT INTO `ctshop_region` VALUES ('712537', '泰安乡', '712500', '泰安', '3', '037', '365', '中国,台湾,苗栗县,泰安乡', '120.904', '24.4426', 'Tai\'an');
INSERT INTO `ctshop_region` VALUES ('712700', '彰化县', '710000', '彰化', '2', '04', '5', '中国,台湾,彰化县', '120.416', '24', 'Changhua');
INSERT INTO `ctshop_region` VALUES ('712701', '彰化市', '712700', '彰化市', '3', '04', '500', '中国,台湾,彰化县,彰化市', '120.542', '24.0809', 'Zhanghuashi');
INSERT INTO `ctshop_region` VALUES ('712721', '鹿港镇', '712700', '鹿港', '3', '04', '505', '中国,台湾,彰化县,鹿港镇', '120.435', '24.0569', 'Lugang');
INSERT INTO `ctshop_region` VALUES ('712722', '和美镇', '712700', '和美', '3', '04', '508', '中国,台湾,彰化县,和美镇', '120.5', '24.1109', 'Hemei');
INSERT INTO `ctshop_region` VALUES ('712723', '线西乡', '712700', '线西', '3', '04', '507', '中国,台湾,彰化县,线西乡', '120.466', '24.1287', 'Xianxi');
INSERT INTO `ctshop_region` VALUES ('712724', '伸港乡', '712700', '伸港', '3', '04', '509', '中国,台湾,彰化县,伸港乡', '120.484', '24.1461', 'Shengang');
INSERT INTO `ctshop_region` VALUES ('712725', '福兴乡', '712700', '福兴', '3', '04', '506', '中国,台湾,彰化县,福兴乡', '120.444', '24.0479', 'Fuxing');
INSERT INTO `ctshop_region` VALUES ('712726', '秀水乡', '712700', '秀水', '3', '04', '504', '中国,台湾,彰化县,秀水乡', '120.503', '24.0353', 'Xiushui');
INSERT INTO `ctshop_region` VALUES ('712727', '花坛乡', '712700', '花坛', '3', '04', '503', '中国,台湾,彰化县,花坛乡', '120.538', '24.0294', 'Huatan');
INSERT INTO `ctshop_region` VALUES ('712728', '芬园乡', '712700', '芬园', '3', '04', '502', '中国,台湾,彰化县,芬园乡', '120.629', '24.0137', 'Fenyuan');
INSERT INTO `ctshop_region` VALUES ('712729', '员林镇', '712700', '员林', '3', '04', '510', '中国,台湾,彰化县,员林镇', '120.575', '23.959', 'Yuanlin');
INSERT INTO `ctshop_region` VALUES ('712730', '溪湖镇', '712700', '溪湖', '3', '04', '514', '中国,台湾,彰化县,溪湖镇', '120.479', '23.9623', 'Xihu');
INSERT INTO `ctshop_region` VALUES ('712731', '田中镇', '712700', '田中', '3', '04', '520', '中国,台湾,彰化县,田中镇', '120.581', '23.8617', 'Tianzhong');
INSERT INTO `ctshop_region` VALUES ('712732', '大村乡', '712700', '大村', '3', '04', '515', '中国,台湾,彰化县,大村乡', '120.541', '23.9937', 'Dacun');
INSERT INTO `ctshop_region` VALUES ('712733', '埔盐乡', '712700', '埔盐', '3', '04', '516', '中国,台湾,彰化县,埔盐乡', '120.464', '24.0003', 'Puyan');
INSERT INTO `ctshop_region` VALUES ('712734', '埔心乡', '712700', '埔心', '3', '04', '513', '中国,台湾,彰化县,埔心乡', '120.544', '23.953', 'Puxin');
INSERT INTO `ctshop_region` VALUES ('712735', '永靖乡', '712700', '永靖', '3', '04', '512', '中国,台湾,彰化县,永靖乡', '120.548', '23.9247', 'Yongjing');
INSERT INTO `ctshop_region` VALUES ('712736', '社头乡', '712700', '社头', '3', '04', '511', '中国,台湾,彰化县,社头乡', '120.583', '23.8967', 'Shetou');
INSERT INTO `ctshop_region` VALUES ('712737', '二水乡', '712700', '二水', '3', '04', '530', '中国,台湾,彰化县,二水乡', '120.619', '23.807', 'Ershui');
INSERT INTO `ctshop_region` VALUES ('712738', '北斗镇', '712700', '北斗', '3', '04', '521', '中国,台湾,彰化县,北斗镇', '120.52', '23.8709', 'Beidou');
INSERT INTO `ctshop_region` VALUES ('712739', '二林镇', '712700', '二林', '3', '04', '526', '中国,台湾,彰化县,二林镇', '120.374', '23.8998', 'Erlin');
INSERT INTO `ctshop_region` VALUES ('712740', '田尾乡', '712700', '田尾', '3', '04', '522', '中国,台湾,彰化县,田尾乡', '120.525', '23.8907', 'Tianwei');
INSERT INTO `ctshop_region` VALUES ('712741', '埤头乡', '712700', '埤头', '3', '04', '523', '中国,台湾,彰化县,埤头乡', '120.463', '23.8913', 'Pitou');
INSERT INTO `ctshop_region` VALUES ('712742', '芳苑乡', '712700', '芳苑', '3', '04', '528', '中国,台湾,彰化县,芳苑乡', '120.32', '23.9242', 'Fangyuan');
INSERT INTO `ctshop_region` VALUES ('712743', '大城乡', '712700', '大城', '3', '04', '527', '中国,台湾,彰化县,大城乡', '120.321', '23.8524', 'Dacheng');
INSERT INTO `ctshop_region` VALUES ('712744', '竹塘乡', '712700', '竹塘', '3', '04', '525', '中国,台湾,彰化县,竹塘乡', '120.427', '23.8601', 'Zhutang');
INSERT INTO `ctshop_region` VALUES ('712745', '溪州乡', '712700', '溪州', '3', '04', '524', '中国,台湾,彰化县,溪州乡', '120.499', '23.8512', 'Xizhou');
INSERT INTO `ctshop_region` VALUES ('712800', '南投县', '710000', '南投', '2', '049', '5', '中国,台湾,南投县', '120.83', '23.83', 'Nantou');
INSERT INTO `ctshop_region` VALUES ('712801', '南投市', '712800', '南投市', '3', '049', '540', '中国,台湾,南投县,南投市', '120.684', '23.91', 'Nantoushi');
INSERT INTO `ctshop_region` VALUES ('712821', '埔里镇', '712800', '埔里', '3', '049', '545', '中国,台湾,南投县,埔里镇', '120.965', '23.9648', 'Puli');
INSERT INTO `ctshop_region` VALUES ('712822', '草屯镇', '712800', '草屯', '3', '049', '542', '中国,台湾,南投县,草屯镇', '120.68', '23.9739', 'Caotun');
INSERT INTO `ctshop_region` VALUES ('712823', '竹山镇', '712800', '竹山', '3', '049', '557', '中国,台湾,南投县,竹山镇', '120.672', '23.7577', 'Zhushan');
INSERT INTO `ctshop_region` VALUES ('712824', '集集镇', '712800', '集集', '3', '049', '552', '中国,台湾,南投县,集集镇', '120.784', '23.829', 'Jiji');
INSERT INTO `ctshop_region` VALUES ('712825', '名间乡', '712800', '名间', '3', '049', '551', '中国,台湾,南投县,名间乡', '120.703', '23.8384', 'Mingjian');
INSERT INTO `ctshop_region` VALUES ('712826', '鹿谷乡', '712800', '鹿谷', '3', '049', '558', '中国,台湾,南投县,鹿谷乡', '120.753', '23.7445', 'Lugu');
INSERT INTO `ctshop_region` VALUES ('712827', '中寮乡', '712800', '中寮', '3', '049', '541', '中国,台湾,南投县,中寮乡', '120.767', '23.8789', 'Zhongliao');
INSERT INTO `ctshop_region` VALUES ('712828', '鱼池乡', '712800', '鱼池', '3', '049', '555', '中国,台湾,南投县,鱼池乡', '120.936', '23.8964', 'Yuchi');
INSERT INTO `ctshop_region` VALUES ('712829', '国姓乡', '712800', '国姓', '3', '049', '544', '中国,台湾,南投县,国姓乡', '120.859', '24.0423', 'Guoxing');
INSERT INTO `ctshop_region` VALUES ('712830', '水里乡', '712800', '水里', '3', '049', '553', '中国,台湾,南投县,水里乡', '120.856', '23.8121', 'Shuili');
INSERT INTO `ctshop_region` VALUES ('712831', '信义乡', '712800', '信义', '3', '049', '556', '中国,台湾,南投县,信义乡', '120.855', '23.6999', 'Xinyi');
INSERT INTO `ctshop_region` VALUES ('712832', '仁爱乡', '712800', '仁爱', '3', '049', '546', '中国,台湾,南投县,仁爱乡', '121.134', '24.0244', 'Renai');
INSERT INTO `ctshop_region` VALUES ('712900', '云林县', '710000', '云林', '2', '05', '6', '中国,台湾,云林县', '120.25', '23.75', 'Yunlin');
INSERT INTO `ctshop_region` VALUES ('712901', '斗六市', '712900', '斗六', '3', '05', '640', '中国,台湾,云林县,斗六市', '120.527', '23.6977', 'Douliu');
INSERT INTO `ctshop_region` VALUES ('712921', '斗南镇', '712900', '斗南', '3', '05', '630', '中国,台湾,云林县,斗南镇', '120.479', '23.6797', 'Dounan');
INSERT INTO `ctshop_region` VALUES ('712922', '虎尾镇', '712900', '虎尾', '3', '05', '632', '中国,台湾,云林县,虎尾镇', '120.445', '23.7082', 'Huwei');
INSERT INTO `ctshop_region` VALUES ('712923', '西螺镇', '712900', '西螺', '3', '05', '648', '中国,台湾,云林县,西螺镇', '120.466', '23.798', 'Xiluo');
INSERT INTO `ctshop_region` VALUES ('712924', '土库镇', '712900', '土库', '3', '05', '633', '中国,台湾,云林县,土库镇', '120.393', '23.6778', 'Tuku');
INSERT INTO `ctshop_region` VALUES ('712925', '北港镇', '712900', '北港', '3', '05', '651', '中国,台湾,云林县,北港镇', '120.302', '23.5755', 'Beigang');
INSERT INTO `ctshop_region` VALUES ('712926', '古坑乡', '712900', '古坑', '3', '05', '646', '中国,台湾,云林县,古坑乡', '120.562', '23.6426', 'Gukeng');
INSERT INTO `ctshop_region` VALUES ('712927', '大埤乡', '712900', '大埤', '3', '05', '631', '中国,台湾,云林县,大埤乡', '120.431', '23.6459', 'Dapi');
INSERT INTO `ctshop_region` VALUES ('712928', '莿桐乡', '712900', '莿桐', '3', '05', '647', '中国,台湾,云林县,莿桐乡', '120.502', '23.7608', 'Citong');
INSERT INTO `ctshop_region` VALUES ('712929', '林内乡', '712900', '林内', '3', '05', '643', '中国,台湾,云林县,林内乡', '120.611', '23.7587', 'Linna');
INSERT INTO `ctshop_region` VALUES ('712930', '二仑乡', '712900', '二仑', '3', '05', '649', '中国,台湾,云林县,二仑乡', '120.415', '23.7713', 'Erlun');
INSERT INTO `ctshop_region` VALUES ('712931', '仑背乡', '712900', '仑背', '3', '05', '637', '中国,台湾,云林县,仑背乡', '120.354', '23.7588', 'Lunbei');
INSERT INTO `ctshop_region` VALUES ('712932', '麦寮乡', '712900', '麦寮', '3', '05', '638', '中国,台湾,云林县,麦寮乡', '120.252', '23.7538', 'Mailiao');
INSERT INTO `ctshop_region` VALUES ('712933', '东势乡', '712900', '东势', '3', '05', '635', '中国,台湾,云林县,东势乡', '120.253', '23.6747', 'Dongshi');
INSERT INTO `ctshop_region` VALUES ('712934', '褒忠乡', '712900', '褒忠', '3', '05', '634', '中国,台湾,云林县,褒忠乡', '120.31', '23.6942', 'Baozhong');
INSERT INTO `ctshop_region` VALUES ('712935', '台西乡', '712900', '台西', '3', '05', '636', '中国,台湾,云林县,台西乡', '120.196', '23.7028', 'Taixi');
INSERT INTO `ctshop_region` VALUES ('712936', '元长乡', '712900', '元长', '3', '05', '655', '中国,台湾,云林县,元长乡', '120.315', '23.6495', 'Yuanchang');
INSERT INTO `ctshop_region` VALUES ('712937', '四湖乡', '712900', '四湖', '3', '05', '654', '中国,台湾,云林县,四湖乡', '120.226', '23.6377', 'Sihu');
INSERT INTO `ctshop_region` VALUES ('712938', '口湖乡', '712900', '口湖', '3', '05', '653', '中国,台湾,云林县,口湖乡', '120.185', '23.5824', 'Kouhu');
INSERT INTO `ctshop_region` VALUES ('712939', '水林乡', '712900', '水林', '3', '05', '652', '中国,台湾,云林县,水林乡', '120.246', '23.5726', 'Shuilin');
INSERT INTO `ctshop_region` VALUES ('713000', '嘉义县', '710000', '嘉义', '2', '05', '6', '中国,台湾,嘉义县', '120.3', '23.5', 'Chiayi');
INSERT INTO `ctshop_region` VALUES ('713001', '太保市', '713000', '太保', '3', '05', '612', '中国,台湾,嘉义县,太保市', '120.333', '23.4596', 'Taibao');
INSERT INTO `ctshop_region` VALUES ('713002', '朴子市', '713000', '朴子', '3', '05', '613', '中国,台湾,嘉义县,朴子市', '120.247', '23.465', 'Puzi');
INSERT INTO `ctshop_region` VALUES ('713023', '布袋镇', '713000', '布袋', '3', '05', '625', '中国,台湾,嘉义县,布袋镇', '120.167', '23.378', 'Budai');
INSERT INTO `ctshop_region` VALUES ('713024', '大林镇', '713000', '大林', '3', '05', '622', '中国,台湾,嘉义县,大林镇', '120.471', '23.6038', 'Dalin');
INSERT INTO `ctshop_region` VALUES ('713025', '民雄乡', '713000', '民雄', '3', '05', '621', '中国,台湾,嘉义县,民雄乡', '120.429', '23.5515', 'Minxiong');
INSERT INTO `ctshop_region` VALUES ('713026', '溪口乡', '713000', '溪口', '3', '05', '623', '中国,台湾,嘉义县,溪口乡', '120.394', '23.6022', 'Xikou');
INSERT INTO `ctshop_region` VALUES ('713027', '新港乡', '713000', '新港', '3', '05', '616', '中国,台湾,嘉义县,新港乡', '120.348', '23.5518', 'Xingang');
INSERT INTO `ctshop_region` VALUES ('713028', '六脚乡', '713000', '六脚', '3', '05', '615', '中国,台湾,嘉义县,六脚乡', '120.291', '23.4939', 'Liujiao');
INSERT INTO `ctshop_region` VALUES ('713029', '东石乡', '713000', '东石', '3', '05', '614', '中国,台湾,嘉义县,东石乡', '120.154', '23.4592', 'Dongshi');
INSERT INTO `ctshop_region` VALUES ('713030', '义竹乡', '713000', '义竹', '3', '05', '624', '中国,台湾,嘉义县,义竹乡', '120.243', '23.3363', 'Yizhu');
INSERT INTO `ctshop_region` VALUES ('713031', '鹿草乡', '713000', '鹿草', '3', '05', '611', '中国,台湾,嘉义县,鹿草乡', '120.308', '23.4108', 'Lucao');
INSERT INTO `ctshop_region` VALUES ('713032', '水上乡', '713000', '水上', '3', '05', '608', '中国,台湾,嘉义县,水上乡', '120.398', '23.4281', 'Shuishang');
INSERT INTO `ctshop_region` VALUES ('713033', '中埔乡', '713000', '中埔', '3', '05', '606', '中国,台湾,嘉义县,中埔乡', '120.523', '23.4251', 'Zhongpu');
INSERT INTO `ctshop_region` VALUES ('713034', '竹崎乡', '713000', '竹崎', '3', '05', '604', '中国,台湾,嘉义县,竹崎乡', '120.551', '23.5232', 'Zhuqi');
INSERT INTO `ctshop_region` VALUES ('713035', '梅山乡', '713000', '梅山', '3', '05', '603', '中国,台湾,嘉义县,梅山乡', '120.557', '23.5849', 'Meishan');
INSERT INTO `ctshop_region` VALUES ('713036', '番路乡', '713000', '番路', '3', '05', '602', '中国,台湾,嘉义县,番路乡', '120.555', '23.4652', 'Fanlu');
INSERT INTO `ctshop_region` VALUES ('713037', '大埔乡', '713000', '大埔', '3', '05', '607', '中国,台湾,嘉义县,大埔乡', '120.594', '23.2967', 'Dapu');
INSERT INTO `ctshop_region` VALUES ('713038', '阿里山乡', '713000', '阿里山', '3', '05', '605', '中国,台湾,嘉义县,阿里山乡', '120.733', '23.468', 'Alishan');
INSERT INTO `ctshop_region` VALUES ('713300', '屏东县', '710000', '屏东', '2', '08', '9', '中国,台湾,屏东县', '120.488', '22.6828', 'Pingtung');
INSERT INTO `ctshop_region` VALUES ('713301', '屏东市', '713300', '屏东', '3', '08', '900', '中国,台湾,屏东县,屏东市', '120.488', '22.6697', 'Pingdong');
INSERT INTO `ctshop_region` VALUES ('713321', '潮州镇', '713300', '潮州', '3', '08', '920', '中国,台湾,屏东县,潮州镇', '120.543', '22.5505', 'Chaozhou');
INSERT INTO `ctshop_region` VALUES ('713322', '东港镇', '713300', '东港', '3', '08', '928', '中国,台湾,屏东县,东港镇', '120.454', '22.4666', 'Donggang');
INSERT INTO `ctshop_region` VALUES ('713323', '恒春镇', '713300', '恒春', '3', '08', '946', '中国,台湾,屏东县,恒春镇', '120.745', '22.0024', 'Hengchun');
INSERT INTO `ctshop_region` VALUES ('713324', '万丹乡', '713300', '万丹', '3', '08', '913', '中国,台湾,屏东县,万丹乡', '120.485', '22.5898', 'Wandan');
INSERT INTO `ctshop_region` VALUES ('713325', '长治乡', '713300', '长治', '3', '08', '908', '中国,台湾,屏东县,长治乡', '120.528', '22.6771', 'Changzhi');
INSERT INTO `ctshop_region` VALUES ('713326', '麟洛乡', '713300', '麟洛', '3', '08', '909', '中国,台湾,屏东县,麟洛乡', '120.527', '22.6506', 'Linluo');
INSERT INTO `ctshop_region` VALUES ('713327', '九如乡', '713300', '九如', '3', '08', '904', '中国,台湾,屏东县,九如乡', '120.49', '22.7398', 'Jiuru');
INSERT INTO `ctshop_region` VALUES ('713328', '里港乡', '713300', '里港', '3', '08', '905', '中国,台湾,屏东县,里港乡', '120.494', '22.7792', 'Ligang');
INSERT INTO `ctshop_region` VALUES ('713329', '盐埔乡', '713300', '盐埔', '3', '08', '907', '中国,台湾,屏东县,盐埔乡', '120.573', '22.7548', 'Yanpu');
INSERT INTO `ctshop_region` VALUES ('713330', '高树乡', '713300', '高树', '3', '08', '906', '中国,台湾,屏东县,高树乡', '120.6', '22.8268', 'Gaoshu');
INSERT INTO `ctshop_region` VALUES ('713331', '万峦乡', '713300', '万峦', '3', '08', '923', '中国,台湾,屏东县,万峦乡', '120.566', '22.572', 'Wanluan');
INSERT INTO `ctshop_region` VALUES ('713332', '内埔乡', '713300', '内埔', '3', '08', '912', '中国,台湾,屏东县,内埔乡', '120.567', '22.612', 'Napu');
INSERT INTO `ctshop_region` VALUES ('713333', '竹田乡', '713300', '竹田', '3', '08', '911', '中国,台湾,屏东县,竹田乡', '120.544', '22.5847', 'Zhutian');
INSERT INTO `ctshop_region` VALUES ('713334', '新埤乡', '713300', '新埤', '3', '08', '925', '中国,台湾,屏东县,新埤乡', '120.55', '22.47', 'Xinpi');
INSERT INTO `ctshop_region` VALUES ('713335', '枋寮乡', '713300', '枋寮', '3', '08', '940', '中国,台湾,屏东县,枋寮乡', '120.593', '22.3656', 'Fangliao');
INSERT INTO `ctshop_region` VALUES ('713336', '新园乡', '713300', '新园', '3', '08', '932', '中国,台湾,屏东县,新园乡', '120.462', '22.544', 'Xinyuan');
INSERT INTO `ctshop_region` VALUES ('713337', '崁顶乡', '713300', '崁顶', '3', '08', '924', '中国,台湾,屏东县,崁顶乡', '120.515', '22.5148', 'Kanding');
INSERT INTO `ctshop_region` VALUES ('713338', '林边乡', '713300', '林边', '3', '08', '927', '中国,台湾,屏东县,林边乡', '120.515', '22.434', 'Linbian');
INSERT INTO `ctshop_region` VALUES ('713339', '南州乡', '713300', '南州', '3', '08', '926', '中国,台湾,屏东县,南州乡', '120.51', '22.4902', 'Nanzhou');
INSERT INTO `ctshop_region` VALUES ('713340', '佳冬乡', '713300', '佳冬', '3', '08', '931', '中国,台湾,屏东县,佳冬乡', '120.552', '22.4177', 'Jiadong');
INSERT INTO `ctshop_region` VALUES ('713341', '琉球乡', '713300', '琉球', '3', '08', '929', '中国,台湾,屏东县,琉球乡', '120.369', '22.3424', 'Liuqiu');
INSERT INTO `ctshop_region` VALUES ('713342', '车城乡', '713300', '车城', '3', '08', '944', '中国,台湾,屏东县,车城乡', '120.711', '22.0721', 'Checheng');
INSERT INTO `ctshop_region` VALUES ('713343', '满州乡', '713300', '满州', '3', '08', '947', '中国,台湾,屏东县,满州乡', '120.839', '22.0209', 'Manzhou');
INSERT INTO `ctshop_region` VALUES ('713344', '枋山乡', '713300', '枋山', '3', '08', '941', '中国,台湾,屏东县,枋山乡', '120.656', '22.2603', 'Fangshan');
INSERT INTO `ctshop_region` VALUES ('713345', '三地门乡', '713300', '三地门', '3', '08', '901', '中国,台湾,屏东县,三地门乡', '120.654', '22.7139', 'Sandimen');
INSERT INTO `ctshop_region` VALUES ('713346', '雾台乡', '713300', '雾台', '3', '08', '902', '中国,台湾,屏东县,雾台乡', '120.732', '22.7449', 'Wutai');
INSERT INTO `ctshop_region` VALUES ('713347', '玛家乡', '713300', '玛家', '3', '08', '903', '中国,台湾,屏东县,玛家乡', '120.644', '22.7067', 'Majia');
INSERT INTO `ctshop_region` VALUES ('713348', '泰武乡', '713300', '泰武', '3', '08', '921', '中国,台湾,屏东县,泰武乡', '120.633', '22.5918', 'Taiwu');
INSERT INTO `ctshop_region` VALUES ('713349', '来义乡', '713300', '来义', '3', '08', '922', '中国,台湾,屏东县,来义乡', '120.634', '22.5259', 'Laiyi');
INSERT INTO `ctshop_region` VALUES ('713350', '春日乡', '713300', '春日', '3', '08', '942', '中国,台湾,屏东县,春日乡', '120.629', '22.3707', 'Chunri');
INSERT INTO `ctshop_region` VALUES ('713351', '狮子乡', '713300', '狮子', '3', '08', '943', '中国,台湾,屏东县,狮子乡', '120.705', '22.2019', 'Shizi');
INSERT INTO `ctshop_region` VALUES ('713352', '牡丹乡', '713300', '牡丹', '3', '08', '945', '中国,台湾,屏东县,牡丹乡', '120.77', '22.1257', 'Mudan');
INSERT INTO `ctshop_region` VALUES ('713400', '台东县', '710000', '台东', '2', '089', '9', '中国,台湾,台东县', '120.916', '23', 'Taitung');
INSERT INTO `ctshop_region` VALUES ('713401', '台东市', '713400', '台东', '3', '089', '950', '中国,台湾,台东县,台东市', '121.146', '22.756', 'Taidong');
INSERT INTO `ctshop_region` VALUES ('713421', '成功镇', '713400', '成功', '3', '089', '961', '中国,台湾,台东县,成功镇', '121.38', '23.1002', 'Chenggong');
INSERT INTO `ctshop_region` VALUES ('713422', '关山镇', '713400', '关山', '3', '089', '956', '中国,台湾,台东县,关山镇', '121.163', '23.0474', 'Guanshan');
INSERT INTO `ctshop_region` VALUES ('713423', '卑南乡', '713400', '卑南', '3', '089', '954', '中国,台湾,台东县,卑南乡', '121.084', '22.786', 'Beinan');
INSERT INTO `ctshop_region` VALUES ('713424', '鹿野乡', '713400', '鹿野', '3', '089', '955', '中国,台湾,台东县,鹿野乡', '121.136', '22.914', 'Luye');
INSERT INTO `ctshop_region` VALUES ('713425', '池上乡', '713400', '池上', '3', '089', '958', '中国,台湾,台东县,池上乡', '121.215', '23.1224', 'Chishang');
INSERT INTO `ctshop_region` VALUES ('713426', '东河乡', '713400', '东河', '3', '089', '959', '中国,台湾,台东县,东河乡', '121.3', '22.9699', 'Donghe');
INSERT INTO `ctshop_region` VALUES ('713427', '长滨乡', '713400', '长滨', '3', '089', '962', '中国,台湾,台东县,长滨乡', '121.452', '23.315', 'Changbin');
INSERT INTO `ctshop_region` VALUES ('713428', '太麻里乡', '713400', '太麻里', '3', '089', '963', '中国,台湾,台东县,太麻里乡', '121.007', '22.6154', 'Taimali');
INSERT INTO `ctshop_region` VALUES ('713429', '大武乡', '713400', '大武', '3', '089', '965', '中国,台湾,台东县,大武乡', '120.89', '22.3399', 'Dawu');
INSERT INTO `ctshop_region` VALUES ('713430', '绿岛乡', '713400', '绿岛', '3', '089', '951', '中国,台湾,台东县,绿岛乡', '121.493', '22.6617', 'Lvdao');
INSERT INTO `ctshop_region` VALUES ('713431', '海端乡', '713400', '海端', '3', '089', '957', '中国,台湾,台东县,海端乡', '121.172', '23.1011', 'Haiduan');
INSERT INTO `ctshop_region` VALUES ('713432', '延平乡', '713400', '延平', '3', '089', '953', '中国,台湾,台东县,延平乡', '121.084', '22.9024', 'Yanping');
INSERT INTO `ctshop_region` VALUES ('713433', '金峰乡', '713400', '金峰', '3', '089', '964', '中国,台湾,台东县,金峰乡', '120.971', '22.5955', 'Jinfeng');
INSERT INTO `ctshop_region` VALUES ('713434', '达仁乡', '713400', '达仁', '3', '089', '966', '中国,台湾,台东县,达仁乡', '120.884', '22.2949', 'Daren');
INSERT INTO `ctshop_region` VALUES ('713435', '兰屿乡', '713400', '兰屿', '3', '089', '952', '中国,台湾,台东县,兰屿乡', '121.532', '22.0567', 'Lanyu');
INSERT INTO `ctshop_region` VALUES ('713500', '花莲县', '710000', '花莲', '2', '03', '9', '中国,台湾,花莲县', '121.3', '23.83', 'Hualien');
INSERT INTO `ctshop_region` VALUES ('713501', '花莲市', '713500', '花莲', '3', '03', '970', '中国,台湾,花莲县,花莲市', '121.607', '23.9821', 'Hualian');
INSERT INTO `ctshop_region` VALUES ('713521', '凤林镇', '713500', '凤林', '3', '03', '975', '中国,台湾,花莲县,凤林镇', '121.452', '23.7446', 'Fenglin');
INSERT INTO `ctshop_region` VALUES ('713522', '玉里镇', '713500', '玉里', '3', '03', '981', '中国,台湾,花莲县,玉里镇', '121.316', '23.3365', 'Yuli');
INSERT INTO `ctshop_region` VALUES ('713523', '新城乡', '713500', '新城', '3', '03', '971', '中国,台湾,花莲县,新城乡', '121.641', '24.1281', 'Xincheng');
INSERT INTO `ctshop_region` VALUES ('713524', '吉安乡', '713500', '吉安', '3', '03', '973', '中国,台湾,花莲县,吉安乡', '121.568', '23.9616', 'Ji\'an');
INSERT INTO `ctshop_region` VALUES ('713525', '寿丰乡', '713500', '寿丰', '3', '03', '974', '中国,台湾,花莲县,寿丰乡', '121.509', '23.8707', 'Shoufeng');
INSERT INTO `ctshop_region` VALUES ('713526', '光复乡', '713500', '光复', '3', '03', '976', '中国,台湾,花莲县,光复乡', '121.423', '23.6691', 'Guangfu');
INSERT INTO `ctshop_region` VALUES ('713527', '丰滨乡', '713500', '丰滨', '3', '03', '977', '中国,台湾,花莲县,丰滨乡', '121.519', '23.5971', 'Fengbin');
INSERT INTO `ctshop_region` VALUES ('713528', '瑞穗乡', '713500', '瑞穗', '3', '03', '978', '中国,台湾,花莲县,瑞穗乡', '121.376', '23.4968', 'Ruisui');
INSERT INTO `ctshop_region` VALUES ('713529', '富里乡', '713500', '富里', '3', '03', '983', '中国,台湾,花莲县,富里乡', '121.25', '23.18', 'Fuli');
INSERT INTO `ctshop_region` VALUES ('713530', '秀林乡', '713500', '秀林', '3', '03', '972', '中国,台湾,花莲县,秀林乡', '121.62', '24.1166', 'Xiulin');
INSERT INTO `ctshop_region` VALUES ('713531', '万荣乡', '713500', '万荣', '3', '03', '979', '中国,台湾,花莲县,万荣乡', '121.407', '23.7153', 'Wanrong');
INSERT INTO `ctshop_region` VALUES ('713532', '卓溪乡', '713500', '卓溪', '3', '03', '982', '中国,台湾,花莲县,卓溪乡', '121.303', '23.3464', 'Zhuoxi');
INSERT INTO `ctshop_region` VALUES ('713600', '澎湖县', '710000', '澎湖', '2', '06', '8', '中国,台湾,澎湖县', '119.566', '23.5697', 'Penghu');
INSERT INTO `ctshop_region` VALUES ('713601', '马公市', '713600', '马公', '3', '06', '880', '中国,台湾,澎湖县,马公市', '119.566', '23.5658', 'Magong');
INSERT INTO `ctshop_region` VALUES ('713621', '湖西乡', '713600', '湖西', '3', '06', '885', '中国,台湾,澎湖县,湖西乡', '119.66', '23.5834', 'Huxi');
INSERT INTO `ctshop_region` VALUES ('713622', '白沙乡', '713600', '白沙', '3', '06', '884', '中国,台湾,澎湖县,白沙乡', '119.598', '23.6661', 'Baisha');
INSERT INTO `ctshop_region` VALUES ('713623', '西屿乡', '713600', '西屿', '3', '06', '881', '中国,台湾,澎湖县,西屿乡', '119.507', '23.6008', 'Xiyu');
INSERT INTO `ctshop_region` VALUES ('713624', '望安乡', '713600', '望安', '3', '06', '882', '中国,台湾,澎湖县,望安乡', '119.501', '23.3575', 'Wang\'an');
INSERT INTO `ctshop_region` VALUES ('713625', '七美乡', '713600', '七美', '3', '06', '883', '中国,台湾,澎湖县,七美乡', '119.424', '23.206', 'Qimei');
INSERT INTO `ctshop_region` VALUES ('713700', '金门县', '710000', '金门', '2', '082', '8', '中国,台湾,金门县', '118.317', '24.4327', 'Jinmen');
INSERT INTO `ctshop_region` VALUES ('713701', '金城镇', '713700', '金城', '3', '082', '893', '中国,台湾,金门县,金城镇', '118.317', '24.4167', 'Jincheng');
INSERT INTO `ctshop_region` VALUES ('713702', '金湖镇', '713700', '金湖', '3', '082', '891', '中国,台湾,金门县,金湖镇', '118.42', '24.4386', 'Jinhu');
INSERT INTO `ctshop_region` VALUES ('713703', '金沙镇', '713700', '金沙', '3', '082', '890', '中国,台湾,金门县,金沙镇', '118.428', '24.4811', 'Jinsha');
INSERT INTO `ctshop_region` VALUES ('713704', '金宁乡', '713700', '金宁', '3', '082', '892', '中国,台湾,金门县,金宁乡', '118.335', '24.4567', 'Jinning');
INSERT INTO `ctshop_region` VALUES ('713705', '烈屿乡', '713700', '烈屿', '3', '082', '894', '中国,台湾,金门县,烈屿乡', '118.247', '24.4331', 'Lieyu');
INSERT INTO `ctshop_region` VALUES ('713706', '乌丘乡', '713700', '乌丘', '3', '082', '896', '中国,台湾,金门县,乌丘乡', '118.32', '24.435', 'Wuqiu');
INSERT INTO `ctshop_region` VALUES ('713800', '连江县', '710000', '连江', '2', '0836', '2', '中国,台湾,连江县', '119.54', '26.1974', 'Lienchiang');
INSERT INTO `ctshop_region` VALUES ('713801', '南竿乡', '713800', '南竿', '3', '0836', '209', '中国,台湾,连江县,南竿乡', '119.944', '26.144', 'Nangan');
INSERT INTO `ctshop_region` VALUES ('713802', '北竿乡', '713800', '北竿', '3', '0836', '210', '中国,台湾,连江县,北竿乡', '120.001', '26.222', 'Beigan');
INSERT INTO `ctshop_region` VALUES ('713803', '莒光乡', '713800', '莒光', '3', '0836', '211', '中国,台湾,连江县,莒光乡', '119.94', '25.9763', 'Juguang');
INSERT INTO `ctshop_region` VALUES ('713804', '东引乡', '713800', '东引', '3', '0836', '212', '中国,台湾,连江县,东引乡', '120.494', '26.3662', 'Dongyin');
INSERT INTO `ctshop_region` VALUES ('810000', '香港特别行政区', '100000', '香港', '1', '', '', '中国,香港特别行政区', '114.173', '22.32', 'Hong Kong');
INSERT INTO `ctshop_region` VALUES ('810100', '香港岛', '810000', '香港岛', '2', '00852', '999077', '中国,香港特别行政区,香港岛', '114.177', '22.2664', 'Hong Kong Island');
INSERT INTO `ctshop_region` VALUES ('810101', '中西区', '810100', '中西区', '3', '00852', '999077', '中国,香港特别行政区,香港岛,中西区', '114.154', '22.282', 'Central and Western District');
INSERT INTO `ctshop_region` VALUES ('810102', '湾仔区', '810100', '湾仔区', '3', '00852', '999077', '中国,香港特别行政区,香港岛,湾仔区', '114.183', '22.2764', 'Wan Chai District');
INSERT INTO `ctshop_region` VALUES ('810103', '东区', '810100', '东区', '3', '00852', '999077', '中国,香港特别行政区,香港岛,东区', '114.256', '22.2628', 'Eastern District');
INSERT INTO `ctshop_region` VALUES ('810104', '南区', '810100', '南区', '3', '00852', '999077', '中国,香港特别行政区,香港岛,南区', '114.174', '22.2468', 'Southern District');
INSERT INTO `ctshop_region` VALUES ('810200', '九龙', '810000', '九龙', '2', '00852', '999077', '中国,香港特别行政区,九龙', '114.175', '22.3271', 'Kowloon');
INSERT INTO `ctshop_region` VALUES ('810201', '油尖旺区', '810200', '油尖旺', '3', '00852', '999077', '中国,香港特别行政区,九龙,油尖旺区', '114.173', '22.3117', 'Yau Tsim Mong');
INSERT INTO `ctshop_region` VALUES ('810202', '深水埗区', '810200', '深水埗', '3', '00852', '999077', '中国,香港特别行政区,九龙,深水埗区', '114.167', '22.3282', 'Sham Shui Po');
INSERT INTO `ctshop_region` VALUES ('810203', '九龙城区', '810200', '九龙城', '3', '00852', '999077', '中国,香港特别行政区,九龙,九龙城区', '114.195', '22.3267', 'Jiulongcheng');
INSERT INTO `ctshop_region` VALUES ('810204', '黄大仙区', '810200', '黄大仙', '3', '00852', '999077', '中国,香港特别行政区,九龙,黄大仙区', '114.199', '22.3363', 'Wong Tai Sin');
INSERT INTO `ctshop_region` VALUES ('810205', '观塘区', '810200', '观塘', '3', '00852', '999077', '中国,香港特别行政区,九龙,观塘区', '114.231', '22.3094', 'Kwun Tong');
INSERT INTO `ctshop_region` VALUES ('810300', '新界', '810000', '新界', '2', '00852', '999077', '中国,香港特别行政区,新界', '114.202', '22.3418', 'New Territories');
INSERT INTO `ctshop_region` VALUES ('810301', '荃湾区', '810300', '荃湾', '3', '00852', '999077', '中国,香港特别行政区,新界,荃湾区', '114.123', '22.371', 'Tsuen Wan');
INSERT INTO `ctshop_region` VALUES ('810302', '屯门区', '810300', '屯门', '3', '00852', '999077', '中国,香港特别行政区,新界,屯门区', '113.977', '22.391', 'Tuen Mun');
INSERT INTO `ctshop_region` VALUES ('810303', '元朗区', '810300', '元朗', '3', '00852', '999077', '中国,香港特别行政区,新界,元朗区', '114.04', '22.4433', 'Yuen Long');
INSERT INTO `ctshop_region` VALUES ('810304', '北区', '810300', '北区', '3', '00852', '999077', '中国,香港特别行政区,新界,北区', '114.149', '22.4941', 'North District');
INSERT INTO `ctshop_region` VALUES ('810305', '大埔区', '810300', '大埔', '3', '00852', '999077', '中国,香港特别行政区,新界,大埔区', '114.172', '22.4457', 'Tai Po');
INSERT INTO `ctshop_region` VALUES ('810306', '西贡区', '810300', '西贡', '3', '00852', '999077', '中国,香港特别行政区,新界,西贡区', '114.279', '22.3794', 'Sai Kung');
INSERT INTO `ctshop_region` VALUES ('810307', '沙田区', '810300', '沙田', '3', '00852', '999077', '中国,香港特别行政区,新界,沙田区', '114.192', '22.3793', 'Sha Tin');
INSERT INTO `ctshop_region` VALUES ('810308', '葵青区', '810300', '葵青', '3', '00852', '999077', '中国,香港特别行政区,新界,葵青区', '114.139', '22.3639', 'Kwai Tsing');
INSERT INTO `ctshop_region` VALUES ('810309', '离岛区', '810300', '离岛', '3', '00852', '999077', '中国,香港特别行政区,新界,离岛区', '113.946', '22.2815', 'Outlying Islands');
INSERT INTO `ctshop_region` VALUES ('820000', '澳门特别行政区', '100000', '澳门', '1', '', '', '中国,澳门特别行政区', '113.549', '22.199', 'Macau');
INSERT INTO `ctshop_region` VALUES ('820100', '澳门半岛', '820000', '澳门半岛', '2', '00853', '999078', '中国,澳门特别行政区,澳门半岛', '113.549', '22.1988', 'MacauPeninsula');
INSERT INTO `ctshop_region` VALUES ('820101', '花地玛堂区', '820100', '花地玛堂区', '3', '00853', '999078', '中国,澳门特别行政区,澳门半岛,花地玛堂区', '113.552', '22.2081', 'Nossa Senhora de Fatima');
INSERT INTO `ctshop_region` VALUES ('820102', '圣安多尼堂区', '820100', '圣安多尼堂区', '3', '00853', '999078', '中国,澳门特别行政区,澳门半岛,圣安多尼堂区', '113.564', '22.1238', 'Santo Antonio');
INSERT INTO `ctshop_region` VALUES ('820103', '大堂区', '820100', '大堂', '3', '00853', '999078', '中国,澳门特别行政区,澳门半岛,大堂区', '113.553', '22.1884', 'Sé');
INSERT INTO `ctshop_region` VALUES ('820104', '望德堂区', '820100', '望德堂区', '3', '00853', '999078', '中国,澳门特别行政区,澳门半岛,望德堂区', '113.551', '22.1941', 'Sao Lazaro');
INSERT INTO `ctshop_region` VALUES ('820105', '风顺堂区', '820100', '风顺堂区', '3', '00853', '999078', '中国,澳门特别行政区,澳门半岛,风顺堂区', '113.542', '22.1874', 'Sao Lourenco');
INSERT INTO `ctshop_region` VALUES ('820200', '氹仔岛', '820000', '氹仔岛', '2', '00853', '999078', '中国,澳门特别行政区,氹仔岛', '113.578', '22.1568', 'Taipa');
INSERT INTO `ctshop_region` VALUES ('820201', '嘉模堂区', '820200', '嘉模堂区', '3', '00853', '999078', '中国,澳门特别行政区,氹仔岛,嘉模堂区', '113.565', '22.149', 'Our Lady Of Carmel\'s Parish');
INSERT INTO `ctshop_region` VALUES ('820300', '路环岛', '820000', '路环岛', '2', '00853', '999078', '中国,澳门特别行政区,路环岛', '113.565', '22.1162', 'Coloane');
INSERT INTO `ctshop_region` VALUES ('820301', '圣方济各堂区', '820300', '圣方济各堂区', '3', '00853', '999078', '中国,澳门特别行政区,路环岛,圣方济各堂区', '113.56', '22.1235', 'St Francis Xavier\'s Parish');
INSERT INTO `ctshop_region` VALUES ('900000', '钓鱼岛', '100000', '钓鱼岛', '1', '', '', '中国,钓鱼岛', '123.478', '25.7424', 'DiaoyuDao');

-- ----------------------------
-- Table structure for `ctshop_shop`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_shop`;
CREATE TABLE `ctshop_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL DEFAULT '0',
  `account` varchar(20) DEFAULT '',
  `password` varchar(50) DEFAULT '',
  `location_id` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `info` varchar(255) DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `username` varchar(20) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `thumb_top` varchar(255) DEFAULT '',
  `longitude` decimal(10,6) DEFAULT '0.000000',
  `latitude` decimal(10,6) DEFAULT '0.000000',
  `province` varchar(50) DEFAULT '',
  `city` varchar(50) DEFAULT '',
  `district` varchar(50) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `status` int(2) DEFAULT '0',
  `mark` varchar(255) DEFAULT '',
  `technical` varchar(10) NOT NULL DEFAULT '5',
  `send_type` tinyint(4) NOT NULL DEFAULT '-1',
  `buy_money` decimal(10,2) DEFAULT '0.00',
  `send_id` int(11) DEFAULT '0',
  `send_name` varchar(255) DEFAULT '',
  `send_mobile` varchar(255) DEFAULT '',
  `send_time` varchar(255) DEFAULT '',
  `send_money` decimal(10,2) unsigned DEFAULT '0.00',
  `encrypt` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ctshop_shop_bill`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_shop_bill`;
CREATE TABLE `ctshop_shop_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '收益人ID',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `sxf` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `src` varchar(255) NOT NULL,
  `ands` varchar(10) NOT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(5) NOT NULL DEFAULT '0',
  `status` tinyint(5) unsigned NOT NULL DEFAULT '1',
  `mark` varchar(255) DEFAULT '',
  `payout_type` tinyint(4) NOT NULL DEFAULT '0',
  `payout_data` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户收益明细表';


-- ----------------------------
-- Table structure for `ctshop_shop_group`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_shop_group`;
CREATE TABLE `ctshop_shop_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `sort` mediumint(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_base` (`status`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商品分类表';


-- ----------------------------
-- Table structure for `ctshop_shop_location`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_shop_location`;
CREATE TABLE `ctshop_shop_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `province` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `district` varchar(40) NOT NULL,
  `address` varchar(255) NOT NULL,
  `default` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件分类表';

-- ----------------------------
-- Table structure for `ctshop_system_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_system_admin`;
CREATE TABLE `ctshop_system_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台管理员表ID',
  `account` varchar(32) NOT NULL COMMENT '后台管理员账号',
  `pwd` char(32) NOT NULL COMMENT '后台管理员密码',
  `real_name` varchar(16) NOT NULL COMMENT '后台管理员姓名',
  `roles` varchar(128) NOT NULL COMMENT '后台管理员权限(menus_id)',
  `last_ip` varchar(16) DEFAULT NULL COMMENT '后台管理员最后一次登录ip',
  `last_time` int(10) unsigned DEFAULT NULL COMMENT '后台管理员最后一次登录时间',
  `add_time` int(10) unsigned NOT NULL COMMENT '后台管理员添加时间',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '后台管理员级别',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '后台管理员状态 1有效0无效',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `encrypt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Records of ctshop_system_admin
-- ----------------------------
INSERT INTO `ctshop_system_admin` VALUES ('1', 'admin', 'ad1aed4518b3883cf64cd4417daf7da0', 'admin', '1', '127.0.0.1', '1588812779', '1549629487', '0', '0', '1', '0', 'yvq2KT3');
INSERT INTO `ctshop_system_admin` VALUES ('2', 'test', 'e9392dd3257fd40a077b1c6bcf11d92d', '赵日天', '24', '127.0.0.1', '1588773161', '1551947581', '0', '1', '1', '0', '02VXhDT');

-- ----------------------------
-- Table structure for `ctshop_system_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_system_attachment`;
CREATE TABLE `ctshop_system_attachment` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '附件名称',
  `att_dir` varchar(200) NOT NULL COMMENT '附件路径',
  `satt_dir` varchar(200) DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) NOT NULL COMMENT '附件大小',
  `att_type` char(30) NOT NULL COMMENT '附件类型',
  `pid` int(10) NOT NULL COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `time` int(11) NOT NULL COMMENT '上传时间',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='附件管理表';



-- ----------------------------
-- Table structure for `ctshop_system_attachment_category`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_system_attachment_category`;
CREATE TABLE `ctshop_system_attachment_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `enname` varchar(50) DEFAULT NULL COMMENT '分类目录',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='附件分类表';

-- ----------------------------
-- Records of ctshop_system_attachment_category
-- ----------------------------
INSERT INTO `ctshop_system_attachment_category` VALUES ('1', '0', '产品图', '', '0');
INSERT INTO `ctshop_system_attachment_category` VALUES ('2', '0', '分类图', '', '0');
INSERT INTO `ctshop_system_attachment_category` VALUES ('3', '0', '广告图', '', '0');
INSERT INTO `ctshop_system_attachment_category` VALUES ('8', '0', '首页导航', null, '0');
INSERT INTO `ctshop_system_attachment_category` VALUES ('9', '0', '海报图', null, '0');
INSERT INTO `ctshop_system_attachment_category` VALUES ('11', '0', '首页设计', null, '0');
INSERT INTO `ctshop_system_attachment_category` VALUES ('12', '0', '番茄科技', null, '2');

-- ----------------------------
-- Table structure for `ctshop_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_system_config`;
CREATE TABLE `ctshop_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) NOT NULL COMMENT '字段名称',
  `type` varchar(255) NOT NULL COMMENT '类型(文本框,单选按钮...)',
  `config_tab_id` int(10) unsigned NOT NULL COMMENT '配置分类id',
  `parameter` varchar(255) DEFAULT NULL COMMENT '规则 单选框和多选框',
  `upload_type` tinyint(1) unsigned DEFAULT NULL COMMENT '上传文件格式1单图2多图3文件',
  `required` varchar(255) DEFAULT NULL COMMENT '规则',
  `width` int(10) unsigned DEFAULT NULL COMMENT '多行文本框的宽度',
  `high` int(10) unsigned DEFAULT NULL COMMENT '多行文框的高度',
  `value` varchar(5000) DEFAULT NULL COMMENT '默认值',
  `info` varchar(255) NOT NULL COMMENT '配置名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '配置简介',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_name` (`menu_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of ctshop_system_config
-- ----------------------------
INSERT INTO `ctshop_system_config` VALUES ('74', 'routine_name', 'text', '7', '', '0', '', '100', '0', '番茄电商系统', '小程序名称', '小程序名称', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('85', 'stor_reason', 'textarea', '5', '', '0', '', '100', '8', '收货地址填错了+与描述不符+信息填错了，重新拍+收到商品损坏了+未按预定时间发货+其它原因', '退货理由', '配置退货理由用加号增加', '100', '1');
INSERT INTO `ctshop_system_config` VALUES ('101', 's_title', 'text', '7', null, null, 'required', null, null, '番茄电商系统V1.0', '分享标题', 'fenxiang', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('102', 's_img', 'upload', '7', null, '1', 'required', null, null, 'https://mall.chaituans.com/res/upload/images/2019/08/05/15650140635d48382f38da8.jpg', '分享图片', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('114', 'xcxtowechat', 'radio', '7', '1|关闭+2|开启', null, 'required', null, null, '1', '引流模块', '通过小程序海报引流客户关注公众号', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('119', 'appui', 'radio', '7', '1|魅红+2|鎏金+3|翠柳+4|靛青+5|惑紫+6|霞彩', null, 'required', null, null, '1', '皮肤选择', '小程序皮肤', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('120', 'scope', 'text', '5', null, null, 'required', null, null, '1', '定位范围', '用户定位附近区域的最大范围，1代表1公里', '1', '1');
INSERT INTO `ctshop_system_config` VALUES ('122', 'web_name', 'text', '20', null, null, 'required', null, null, '番茄系统s', '网站名称', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('125', 'verify_newsid', 'text', '5', null, null, 'required', null, null, '2', '入住说明', '填写内容id，系统会自动读取其内容', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('126', 'apply', 'radio', '5', '0|审核+1|不审核', null, 'required', null, null, '0', '入住审核', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('127', 'qqmap_key', 'text', '5', null, null, 'required', null, null, 'XNXBZ-H443D-SXS4W-HXFSF-KQTLH-FKFAW', '腾讯地图', '腾讯地图key，申请地址：lbs.qq.com/', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('128', 'pverify_newsid', 'text', '21', null, null, 'required', null, null, '3', '入住说明', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('129', 'papply', 'radio', '21', '0|审核+1|不审核', null, 'required', null, null, '0', '入住审核', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('130', 'pmoney', 'text', '21', null, null, 'required', null, null, '5', '配送价格', '设置合伙人配送费用，每单多少钱', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('131', 'fapply', 'radio', '9', '1|无条件+2|手动申请+3|消费次数+4|消费金额+5|购买商品', null, 'required', null, null, '2', '分销条件', '成为分销商的方式，次数，金额，商品，选中后下面对应的设置才会生效', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('132', 'shop_num', 'text', '9', null, null, '', null, null, '1', '消费次数', '选择消费次数后，填写次项则生效', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('133', 'shop_money', 'text', '9', null, null, '', null, null, '1', '消费金额', '选择消费金额后，填写次项则生效', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('134', 'goods_id', 'text', '9', null, null, '', null, null, '1', '商品ID', '填写商品的ID，营销商品ID无效，选择购买商品则生效', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('135', 'check', 'radio', '9', '0|需要+1|不需要', null, 'required', null, null, '1', '是否审核', '分销商条件是否需要后台审核', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('136', 'say', 'text', '9', null, null, 'required', null, null, '佣金已经细化到产品中，请在产品添加或者编辑中设置', '佣金说明', '上级返佣', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('137', 'menu_name', 'text', '9', null, null, 'required', null, null, '我的团队', '菜单名称', '会员中心显示的菜单名字', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('138', 'p1_name', 'text', '9', null, null, 'required', null, null, '我的团员', '一级别名', '下一级的别名', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('139', 'p2_name', 'text', '9', null, null, 'required', null, null, '我的队员', '二级别名', '下二级的别名', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('140', 'fx_menu', 'text', '9', null, null, 'required', null, null, '我的团队', '分销菜单', '分销中心的菜单别名', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('141', 'is_qiniu', 'radio', '22', '0|关闭+1|开启', null, 'required', null, null, '0', '是否开启', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('142', 'bucket', 'text', '22', null, null, 'required', null, null, '1', '空间名字', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('143', 'accesskey', 'text', '22', null, null, 'required', null, null, '1', 'ACCESS_KEY', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('144', 'secretkey', 'text', '22', null, null, 'required', null, null, '1', 'SECRET_KEY', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('145', 'domain', 'text', '22', null, null, 'required', null, null, '', '绑定域名', '例如：http://www.chaituans.com', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('146', 'fverify_newsid', 'text', '9', null, null, 'required', null, null, '4', '加入说明', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('147', 'sxf', 'text', '5', null, null, 'required', null, null, '1元', '提现手续费', '商家提现手续费，每笔提现扣除，写1元代表扣除1元，写1%代表扣除提现金额的1%', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('148', 'fx_sxf', 'text', '9', null, null, 'required', null, null, '2%', '提现手续费', '分销员提现手续费，每笔提现扣除，写1元代表扣除1元，写1%代表扣除提现金额的1%', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('149', 'fx_lowest', 'text', '9', null, null, 'required', null, null, '100', '最低提现', '分销提现，最低的提现金额，单位元', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('150', 'lowest', 'text', '5', null, null, 'required', null, null, '10', '最低提现', '商家最低提现金额，单位元', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('151', 'p_sxf', 'text', '21', null, null, 'required', null, null, '1元', '手续费', '合伙人提现手续费，每笔提现扣除，写1元代表扣除1元，写1%代表扣除提现金额的1%', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('152', 'p_lowest', 'text', '21', null, null, 'required', null, null, '20', '最低提现', '合伙人最低提现金额，单位元', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('153', 'p_order_fc', 'text', '21', null, null, 'required', null, null, '1%', '订单分成', '合伙人邀请的商家每笔订单的分成，写1元代表扣除1元，写1%代表扣除提现金额的1%', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('154', 'qiandao', 'text', '20', null, null, 'required', null, null, '50', '签到积分', '每日签到，送的积分', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('155', 'about', 'text', '20', null, null, 'required', null, null, '5', '关于我们', '填写内容id，系统会自动读取其内容', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('156', 'payout_type', 'checkbox', '20', '1|微信零钱+2|支付宝+3|银行卡+4|微信私下转', null, 'required', null, null, '1,2,3,4', '提现方式', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('157', 'share_thumb', 'upload', '20', null, '1', 'required', null, null, 'http://shop.chaituans.com/res/upload/images/2020/04/17/15870934405e991fc01eae8.jpg', '分享图片', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('158', 'share_title', 'text', '20', null, null, 'required', null, null, '番茄多门店', '分享标题', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('159', 'share_desc', 'text', '20', null, null, 'required', null, null, '番茄多门店系统', '分享描述', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('160', 'qr_code', 'upload', '20', null, '1', 'required', null, null, 'http://shop.chaituans.com/res/upload/images/2020/03/06/15834752295e61ea1d75ff6.jpg', '二维码', '公众号的二维码', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('161', 'admin_id', 'text', '20', null, null, 'required', null, null, '3', '管理员ID', '用于接收用户申请等通知，ID在会员管理列表查看', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('162', 'hot_key', 'text', '20', null, null, 'required', null, null, '水果,蔬菜', '热搜词', '搜索下方显示，请用,割开', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('163', 'footer', 'text', '20', null, null, '', null, null, '', '底部版权', '', '0', '1');
INSERT INTO `ctshop_system_config` VALUES ('164', 'shop_is_open', 'radio', '5', '0|关闭+1|开启', null, 'required', null, null, '0', '是否开启', '是否开启前端商家申请入住', '0', '1');
-- ----------------------------
-- Table structure for `ctshop_system_config_tab`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_system_config_tab`;
CREATE TABLE `ctshop_system_config_tab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置分类id',
  `title` varchar(255) NOT NULL COMMENT '配置分类名称',
  `eng_title` varchar(255) NOT NULL COMMENT '配置分类英文名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '配置分类状态',
  `info` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配置分类是否显示',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `type` int(2) DEFAULT '0' COMMENT '配置类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='配置分类表';

-- ----------------------------
-- Records of ctshop_system_config_tab
-- ----------------------------
INSERT INTO `ctshop_system_config_tab` VALUES ('5', '商家配置', 'shop', '1', '0', 'shopping-cart', '0');
INSERT INTO `ctshop_system_config_tab` VALUES ('7', '小程序配置', 'routine', '1', '0', 'weixin', '2');
INSERT INTO `ctshop_system_config_tab` VALUES ('9', '分销配置', 'fenxiao', '1', '0', 'sitemap', '0');
INSERT INTO `ctshop_system_config_tab` VALUES ('20', '商城配置', 'set', '1', '0', null, '0');
INSERT INTO `ctshop_system_config_tab` VALUES ('21', '合伙人配置', 'partner', '1', '0', null, '0');
INSERT INTO `ctshop_system_config_tab` VALUES ('22', '七牛配置', 'qiniu', '1', '0', null, '0');

-- ----------------------------
-- Table structure for `ctshop_system_menus`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_system_menus`;
CREATE TABLE `ctshop_system_menus` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `icon` varchar(16) NOT NULL COMMENT '图标',
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT '按钮名',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '控制器',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方法名',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '[]' COMMENT '参数',
  `sort` tinyint(3) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '子管理员是否可用',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `access` (`access`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of ctshop_system_menus
-- ----------------------------
INSERT INTO `ctshop_system_menus` VALUES ('1', '289', '', '系统设置', 'adminct', 'setting/configtab', 'index', '', '90', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('2', '1', '', '后台菜单', 'adminct', 'setting/adminmenu', 'index', '', '7', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('4', '153', '', '管理员列表', 'adminct', 'setting/user', 'index', '', '9', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('7', '1', '', '配置管理', 'adminct', 'setting/configtab', 'index', '', '1', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('8', '153', '', '角色管理', 'adminct', 'setting/adminroles', 'index', '', '10', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('21', '0', 'magic', '维护', 'adminct', 'system', 'index', '', '1', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('23', '0', 'laptop', '商品', 'adminct', 'store', 'index', '', '111', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('24', '23', '', '商品管理', 'adminct', 'goods/goods', 'index', '', '100', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('25', '23', '', '商品分类', 'adminct', 'goods/group', 'index', '', '1', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('26', '285', '', '订单管理', 'adminct', 'goods/order', 'index', '', '1', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('80', '0', 'leanpub', '内容', 'adminct', 'article', 'index', '', '90', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('137', '135', '', '添加通知模板', 'adminct', 'system.systemNotice', 'create', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('138', '135', '', '编辑通知模板', 'adminct', 'system.systemNotice', 'edit', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('139', '135', '', '删除辑通知模板', 'adminct', 'system.systemNotice', 'delete', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('140', '135', '', '提交编辑辑通知模板', 'adminct', 'system.systemNotice', 'update', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('141', '135', '', '提交添加辑通知模板', 'adminct', 'system.systemNotice', 'save', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('151', '0', 'user', '会员', 'adminct', 'user', 'index', '', '107', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('153', '289', '', '管理权限', 'adminct', 'setting/adminroles', '', '', '100', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('155', '154', '', '商户产品展示页', 'adminct', 'store.storeMerchant', 'index', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('156', '154', '', '商户产品附加权限', 'adminct', 'store.storeMerchant', '', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('158', '157', '', '商户文章管理展示页', 'adminct', 'wechat.wechatNews', 'merchantIndex', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('159', '157', '', '商户文章管理附加权限', 'adminct', 'wechat.wechatNews', '', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('177', '151', '', '会员管理', 'adminct', 'user/user', 'index', '', '10', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('179', '307', '', '充值记录', 'adminct', 'finance/recharge', 'index', '', '1', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('220', '180', '', '预售卡管理批量修改预售卡金额', 'adminct', 'presell.presellCard', 'batch_price', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('221', '180', '', '预售卡管理批量修改预售卡金额提交', 'adminct', 'presell.presellCard', 'savebatch', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('237', '21', '', '清理缓存', 'adminct', 'system/clear', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('239', '306', '', '分销提现', 'adminct', 'finance/payout', 'index', 'type-1', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('252', '21', '', '在线更新', 'adminct', 'system/upsystem', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('283', '80', '', '文章管理', 'adminct', 'news/article', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('284', '80', '', '文章分类', 'adminct', 'news/category', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('285', '0', 'building-o', '订单', 'adminct', 'order', 'index', '', '109', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('287', '0', 'money', '财务', 'adminct', 'finance', 'index', '', '103', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('289', '0', 'gear', '设置', 'adminct', 'setting', 'index', '', '90', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('306', '287', '', '财务操作', 'adminct', '', '', '', '100', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('307', '287', '', '财务记录', 'adminct', '', '', '', '50', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('335', '329', '', '积分兑换', 'adminct', 'user', '', '', '0', '0', '1');
INSERT INTO `ctshop_system_menus` VALUES ('337', '0', 'users', '分销', 'adminct', 'agent', 'index', '', '106', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('371', '337', '', '分销员管理', 'adminct', 'user/fx', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('377', '21', '', '数据备份', 'adminct', 'system/back', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('457', '0', 'line-chart', '广告', 'adminct', 'ad/ad', 'index', '', '110', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('458', '457', '', '广告分类', 'adminct', 'ad/group', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('459', '457', '', '广告管理', 'adminct', 'ad/ad', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('468', '0', 'television', '配置', 'adminct', 'config', 'index', '', '91', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('469', '0', 'home', '商家', 'adminct', 'shop', 'index', '', '107', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('472', '469', '', '区域管理', 'adminct', 'shop/location', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('474', '468', '', '所有配置', 'adminct', 'setting/config', 'index', 'tab_id-5-type-0', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('475', '0', 'users', '合伙人', 'adminct', 'partner', 'index', '', '107', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('476', '475', '', '合伙人管理', 'adminct', 'partner/lists', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('477', '337', '', '分销海报', 'adminct', 'user/haibao', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('478', '468', '', '首页设计', 'adminct', 'setting/tpl', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('479', '0', 'shopping-bag', '积分商城', 'adminct', 'pointsmall', 'index', '', '108', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('480', '479', '', '商品列表', 'adminct', 'pointsmall/goods', 'index', '', '3', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('481', '479', '', '商品分类', 'adminct', 'pointsmall/group', 'index', '', '2', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('482', '479', '', '订单管理', 'adminct', 'pointsmall/order', 'index', '', '1', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('483', '479', '', '运费模版', 'adminct', 'pointsmall/delivery', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('484', '469', '', '商家管理', 'adminct', 'shop/shop', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('485', '306', '', '商家提现', 'adminct', 'finance/payout', 'index', 'type-2', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('486', '306', '', '合伙人提现', 'adminct', 'finance/payout', 'index', 'type-3', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('487', '468', '', '第三方配置', 'adminct', 'setting/third', 'index', '', '0', '1', '1');
INSERT INTO `ctshop_system_menus` VALUES ('488', '468', '', '模版消息', 'adminct', 'setting/template', 'index', '', '0', '1', '1');

-- ----------------------------
-- Table structure for `ctshop_system_role`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_system_role`;
CREATE TABLE `ctshop_system_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '身份管理id',
  `role_name` varchar(32) NOT NULL COMMENT '身份管理名称',
  `rules` text NOT NULL COMMENT '身份管理权限(menus_id)',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='身份管理表';

-- ----------------------------
-- Records of ctshop_system_role
-- ----------------------------
INSERT INTO `ctshop_system_role` VALUES ('1', '超级管理员', '23,24,147,266,265,264,263,262,261,146,25,142,143,369,370,285,26,191,394,208,207,206,205,204,203,202,201,200,199,198,197,196,195,194,193,192,190,329,334,335,290,170,225,228,227,226,224,151,177,399,402,403,405,406,407,401,400,398,176,408,413,412,411,409,410,449,337,353,371,415,450,286,148,149,230,234,233,232,231,229,235,150,352,271,254,366,367,368,272,238,333,273,241,349,351,350,287,306,239,307,179,216,217,218,219,312,308,313,288,293,340,341,296,318,317,316,315,314,294,302,244,301,300,295,303,304,305,246,374,297,321,320,319,269,372,270,373,375,376,422,423,424,425,426,427,451,11,360,267,17,127,128,126,174,416,417,418,419,420,421,452,361,355,359,358,356,357,354,12,97,98,99,30,93,89,92,91,90,124,123,31,95,96,94,37,175,210,215,214,213,212,211,223,222,209,19,73,42,116,115,45,44,43,82,133,134,395,396,397,84,236,129,132,289,378,153,8,67,63,105,104,66,65,64,4,68,59,103,102,62,61,60,2,78,74,77,76,75,101,100,247,250,248,249,1,6,118,117,119,145,144,7,46,108,107,106,50,49,48,47,51,69,9,70,52,112,111,110,109,58,57,56,55,54,53,255,80,283,72,38,41,40,39,284,71,33,114,113,36,35,34,21,173,252,237,278,130,131,377,447,439,445,446,444,443,440,441,442,276,362,364,363,365,390,393,392,389,388,386,387,453,379,448,380,381,382,0', '0', '1');
INSERT INTO `ctshop_system_role` VALUES ('24', '商品管理员', '23,24,146,147,261,262,263,264,265,266,25,142', '1', '1');

-- ----------------------------
-- Table structure for `ctshop_template`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_template`;
CREATE TABLE `ctshop_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `name` char(100) NOT NULL COMMENT '模板名',
  `content` varchar(1000) DEFAULT '' COMMENT '回复内容',
  `mark` char(50) NOT NULL COMMENT '模板编号',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `tmpid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tempkey` (`mark`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信模板';

-- ----------------------------
-- Records of ctshop_template
-- ----------------------------
INSERT INTO `ctshop_template` VALUES ('16', '待配送订单通知', '', 'OPENTM416687402', '1', '1', '');
INSERT INTO `ctshop_template` VALUES ('18', '新订单通知', '', 'OPENTM417450357', '1', '1', '');
INSERT INTO `ctshop_template` VALUES ('15', '拣货通知', '', 'OPENTM416542948', '1', '1', '');
INSERT INTO `ctshop_template` VALUES ('17', '审核结果通知', '', 'OPENTM415281152', '1', '1', '');

-- ----------------------------
-- Table structure for `ctshop_times`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_times`;
CREATE TABLE `ctshop_times` (
  `times_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `login_ip` char(15) DEFAULT NULL COMMENT 'ip',
  `login_time` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `failure_times` int(10) unsigned DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`times_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ctshop_times
-- ----------------------------
INSERT INTO `ctshop_times` VALUES ('1', null, '127.0.0.1', '1587179186', null, '1', '1');
INSERT INTO `ctshop_times` VALUES ('2', null, '127.0.0.1', '1587179228', null, '1', '1');
INSERT INTO `ctshop_times` VALUES ('3', '11', '127.0.0.1', '1587179256', null, '3', '0');

-- ----------------------------
-- Table structure for `ctshop_tpl`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_tpl`;
CREATE TABLE `ctshop_tpl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_type` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `page_data` longtext NOT NULL,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ctshop_tpl
-- ----------------------------
INSERT INTO `ctshop_tpl` VALUES ('1', '10', '{"items":{"n545409695015084":{"id":"n545409695015084","type":"banner","style":{"btnColor":"#ffffff","btnShape":"rectangle","type":"2"},"data":{"n870692012926463":{"dataId":"n870692012926463","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649617835d476bf753214.jpg","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649617835d476bf753214.jpg","linkUrl":"\\/pages\\/sort\\/lists?id=1"},"n560150805135003":{"dataId":"n560150805135003","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649616985d476ba293c4d.jpg","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649616985d476ba293c4d.jpg","linkUrl":"\\/pages\\/sort\\/lists?id=1"},"n20767645332002482":{"dataId":"n20767645332002482","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649615845d476b305656c.jpg","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649615845d476b305656c.jpg","linkUrl":"\\/pages\\/sort\\/lists?id=1"}}},"n265462611656722":{"id":"n265462611656722","type":"nav","data":{"n535552460853849":{"imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649629885d4770ac39452.png","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649629885d4770ac39452.png","linkUrl":"\\/pages\\/news\\/news","name":"\\u6700\\u65b0\\u8d44\\u8baf"},"n035537029664757":{"dataId":"n035537029664757","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649629535d477089e44b5.png","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649629535d477089e44b5.png","linkUrl":"\\/pages\\/tool\\/qiandao\\/index","name":"\\u6bcf\\u65e5\\u7b7e\\u5230"},"n927327441421784":{"dataId":"n927327441421784","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649628865d4770464732d.png","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649628865d4770464732d.png","linkUrl":"\\/pages\\/pointsmall\\/index","name":"\\u79ef\\u5206\\u5546\\u57ce"},"n252641805805073":{"dataId":"n252641805805073","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649627195d476f9fcbc3d.png","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2019\\/08\\/05\\/15649627195d476f9fcbc3d.png","linkUrl":"\\/pages\\/shop\\/shop","name":"\\u5546\\u5bb6\\u5165\\u4f4f"}}},"n1608472783140789":{"id":"n1608472783140789","type":"title"},"n6063874125980617":{"id":"n6063874125980617","type":"adimg","style":{"type":"3"},"data":{"n163689095165569":{"dataId":"n163689095165569","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/02\\/15858138885e859980445d8.png","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/02\\/15858138885e859980445d8.png","linkUrl":"\\/pages\\/sort\\/lists?id=1"},"n163308844691747":{"dataId":"n163308844691747","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/02\\/15858138915e859983e29e9.png","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/02\\/15858138915e859983e29e9.png","linkUrl":"\\/pages\\/sort\\/lists?id=1"},"n632529276559481":{"dataId":"n632529276559481","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/02\\/15858138955e859987bec8d.png","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/02\\/15858138955e859987bec8d.png","linkUrl":"\\/pages\\/sort\\/lists?id=1"}}},"n817849493587985":{"id":"n817849493587985","type":"adimg","style":{"type":"8"},"data":{"n795035452516871":{"imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/03\\/15858806235e869e2fbf447.jpg","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/03\\/15858806235e869e2fbf447.jpg","linkUrl":"\\/pages\\/sort\\/lists?id=1"},"n395077630406673":{"dataId":"n395077630406673","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/03\\/15858806235e869e2fb5bed.jpg","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/03\\/15858806235e869e2fb5bed.jpg","linkUrl":"\\/pages\\/sort\\/lists?id=1"},"n978407919515257":{"dataId":"n978407919515257","imgUrl":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/03\\/15858806235e869e2fa88fa.jpg","imgName":"http:\\/\\/shop.chaituans.com\\/res\\/upload\\/images\\/2020\\/04\\/03\\/15858806235e869e2fa88fa.jpg","linkUrl":"\\/pages\\/sort\\/lists?id=1"}}},"n168923246437802":{"id":"n168923246437802","type":"top_goods"},"n5122725941396253":{"id":"n5122725941396253","type":"hot_goods"},"n486959771673695":{"id":"n486959771673695","type":"new_goods"}}}', '1529926348');

-- ----------------------------
-- Table structure for `ctshop_user`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_user`;
CREATE TABLE `ctshop_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户账号',
  `password` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户密码',
  `nickname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '用户昵称',
  `avatar` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT '用户头像',
  `mobile` char(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号码',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `add_ip` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '添加ip',
  `last_time` int(11) unsigned NOT NULL COMMENT '最后一次登录时间',
  `last_ip` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '最后一次登录ip',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为正常，1为禁止',
  `user_type` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户类型',
  `is_fx` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为推广员',
  `pay_count` int(11) unsigned DEFAULT '0' COMMENT '用户购买次数',
  `unionid` varchar(30) CHARACTER SET utf8 NOT NULL,
  `openid` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sex` tinyint(1) DEFAULT '0',
  `city` varchar(64) CHARACTER SET utf8 DEFAULT '',
  `province` varchar(64) CHARACTER SET utf8 DEFAULT '',
  `country` varchar(64) CHARACTER SET utf8 DEFAULT '',
  `remark` varchar(256) CHARACTER SET utf8 DEFAULT '',
  `role` tinyint(1) DEFAULT '0',
  `subscribe` tinyint(1) DEFAULT '0',
  `subscribe_time` int(11) DEFAULT NULL,
  `p_1` int(11) DEFAULT '0',
  `p_2` int(11) DEFAULT '0',
  `system` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Table structure for `ctshop_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_user_address`;
CREATE TABLE `ctshop_user_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `username` varchar(32) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(16) NOT NULL COMMENT '收货人电话',
  `detail` varchar(500) NOT NULL COMMENT '收货人详细地址',
  `details` varchar(255) NOT NULL COMMENT '邮编',
  `longitude` varchar(16) NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户地址表';



-- ----------------------------
-- Table structure for `ctshop_user_bill`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_user_bill`;
CREATE TABLE `ctshop_user_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '收益人ID',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '收益来源id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `src` varchar(255) NOT NULL,
  `ands` varchar(10) NOT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(5) NOT NULL DEFAULT '0',
  `status` tinyint(5) unsigned NOT NULL DEFAULT '1',
  `order_no` varchar(50) DEFAULT '',
  `mark` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户收益明细表';


-- ----------------------------
-- Table structure for `ctshop_user_integral`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_user_integral`;
CREATE TABLE `ctshop_user_integral` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL DEFAULT '0',
  `src` varchar(255) NOT NULL,
  `ands` varchar(255) NOT NULL,
  `add_time` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ctshop_user_gz`
-- ----------------------------
DROP TABLE IF EXISTS `ctshop_user_gz`;
CREATE TABLE `ctshop_user_gz` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openid` varchar(30) CHARACTER SET utf8 NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
