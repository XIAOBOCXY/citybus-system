/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : citybus

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-12-19 00:34:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aname` varchar(10) NOT NULL,
  `amm` varchar(6) NOT NULL,
  PRIMARY KEY (`aname`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a001', '000001');
INSERT INTO `admin` VALUES ('a002', '000002');
INSERT INTO `admin` VALUES ('admin', 'admin');
INSERT INTO `admin` VALUES ('admin1', 'admin1');

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `cno` varchar(3) NOT NULL,
  `cprice` int(11) DEFAULT NULL,
  `yno` varchar(4) DEFAULT NULL,
  `cstime` time DEFAULT NULL,
  `cftime` time DEFAULT NULL,
  `cpos1` varchar(20) DEFAULT NULL,
  `cpos2` varchar(20) DEFAULT NULL,
  `cpos3` varchar(20) DEFAULT NULL,
  `cpos4` varchar(20) DEFAULT NULL,
  `cpos5` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('101', '2', 'y001', '08:00:00', '22:00:00', '鄞州区政府东', '鄞州公园东', '南部商务区', '宁南南路鄞州大道口', '鄞州客运总站');
INSERT INTO `car` VALUES ('105', '3', 'y003', '06:30:00', '19:00:00', '鄞州海关', '金湾华庭', '四明路创新路口', '沧海路四明路口', '宜家家居');
INSERT INTO `car` VALUES ('127', '4', 'y002', '07:50:00', '23:30:00', '华茂外国语学校', '四明中路天童路口', '宁波文化广场', '市行政中心西', '河清北路宁东路口');
INSERT INTO `car` VALUES ('141', '3', 'y005', '04:30:00', '16:30:00', '河清北路宁东路口', '宁南立交桥南', '浙江万里学院西', '天一家园', '鼓楼站');

-- ----------------------------
-- Table structure for `dis`
-- ----------------------------
DROP TABLE IF EXISTS `dis`;
CREATE TABLE `dis` (
  `dno` varchar(16) NOT NULL,
  `yno` varchar(4) DEFAULT NULL,
  `discuss` varchar(255) DEFAULT NULL,
  `dscore` int(11) DEFAULT NULL,
  `ddate` date DEFAULT NULL,
  `pno` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of dis
-- ----------------------------
INSERT INTO `dis` VALUES ('202112140001y002', 'y002', '不错', '90', '2021-12-14', '0001');
INSERT INTO `dis` VALUES ('202112140002y002', 'y002', '服务周到', '93', '2021-12-14', '0002');
INSERT INTO `dis` VALUES ('202112150001y001', 'y001', '服务非常到位', '98', '2021-12-15', '0001');

-- ----------------------------
-- Table structure for `passenger`
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger` (
  `pno` varchar(4) NOT NULL,
  `pmm` varchar(6) DEFAULT NULL,
  `pname` varchar(4) DEFAULT NULL,
  `psex` varchar(2) DEFAULT NULL,
  `pid` varchar(18) DEFAULT NULL,
  `pphone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES ('0001', '123456', '汪军', '男', '338006199708231741', '15247854785');
INSERT INTO `passenger` VALUES ('0002', '123456', '璩颖初', '女', '370783199305026783', '15172680110');
INSERT INTO `passenger` VALUES ('0003', '123456', '糜颖馨', '女', '530602198703189459', '13950802090');
INSERT INTO `passenger` VALUES ('0004', '123456', '沃雅韵', '女', '350524196810207704', '13969339180');
INSERT INTO `passenger` VALUES ('0005', '123456', '鄂弘和', '女', '610581197704010180', '13587068892');
INSERT INTO `passenger` VALUES ('0006', '123456', '哈雅宁', '女', '371329196904048957', '15122101617');
INSERT INTO `passenger` VALUES ('0007', '123456', '慕容正阳', '男', '360982197503180419', '15144056303');
INSERT INTO `passenger` VALUES ('0008', '123456', '陶娟妍', '女', '441781199508188930', '13594983622');
INSERT INTO `passenger` VALUES ('0009', '123456', '胥静安', '女', '410221197511095947', '13759321327');
INSERT INTO `passenger` VALUES ('0010', '123456', '乔静雅', '女', '530627196109199070', '13739459788');
INSERT INTO `passenger` VALUES ('0011', '123456', '糜和雅', '女', '371426197303129955', '13758583656');
INSERT INTO `passenger` VALUES ('0012', '123456', '闾丘芳润', '女', '13012919910204285X', '13975505248');
INSERT INTO `passenger` VALUES ('0013', '123456', '长孙子默', '男', '610701200504055932', '13578330548');
INSERT INTO `passenger` VALUES ('0014', '123456', '鲍如风', '女', '340124198401126861', '13526474565');
INSERT INTO `passenger` VALUES ('0015', '123456', '慎鸿羲', '男', '340826198611095662', '15160574367');
INSERT INTO `passenger` VALUES ('0016', '123456', '池幼安', '女', '341523199404067722', '13992318219');
INSERT INTO `passenger` VALUES ('0017', '123456', '焦星驰', '男', '540323198103108341', '13934461832');
INSERT INTO `passenger` VALUES ('0018', '123456', '南门子平', '男', '460101199708129191', '13523522513');
INSERT INTO `passenger` VALUES ('0019', '123456', '百彭勃', '男', '653225197508148908', '13923135359');
INSERT INTO `passenger` VALUES ('0020', '123456', '闵霞影', '女', '371622199005134400', '13553355537');
INSERT INTO `passenger` VALUES ('0021', '123456', '冯苑杰', '男', '411503197303164818', '15120468214');
INSERT INTO `passenger` VALUES ('0022', '123456', '劳阳荣', '男', '421127198505188813', '13565638558');
INSERT INTO `passenger` VALUES ('0023', '123456', '谷歌吹', '女', '610524199605151665', '13760044747');
INSERT INTO `passenger` VALUES ('0024', '123456', '乐向荣', '男', '450821196405278702', '15182332192');
INSERT INTO `passenger` VALUES ('0025', '123456', '郦勇锐', '男', '220723198509249950', '13797942398');
INSERT INTO `passenger` VALUES ('0026', '123456', '寇思美', '女', '530630197809135337', '13522752384');
INSERT INTO `passenger` VALUES ('0027', '123456', '戎欣嘉', '女', '370181198810222988', '13590178972');
INSERT INTO `passenger` VALUES ('0028', '123456', '广曼容', '女', '410404199203072210', '13990959473');
INSERT INTO `passenger` VALUES ('0029', '123456', '申曼蔓', '女', '610721199207015352', '13568139004');
INSERT INTO `passenger` VALUES ('0030', '123456', '蓟嘉怡', '女', '231221200409099273', '13574637694');
INSERT INTO `passenger` VALUES ('0031', '123456', '张晨', '男', '335458200102251478', '13434854711');
INSERT INTO `passenger` VALUES ('0032', '123456', '张五', '男', '321478412595632145', '15428741256');
INSERT INTO `passenger` VALUES ('0033', '123456', '王五', '男', '12545214587458451X', '15247854781');
INSERT INTO `passenger` VALUES ('0034', '123456', '李四', '女', '352458715214526325', '54125478562');

-- ----------------------------
-- Table structure for `pos`
-- ----------------------------
DROP TABLE IF EXISTS `pos`;
CREATE TABLE `pos` (
  `zno` int(11) NOT NULL,
  `zname` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`zno`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of pos
-- ----------------------------
INSERT INTO `pos` VALUES ('1', '鄞州区政府东');
INSERT INTO `pos` VALUES ('2', '鄞州公园东');
INSERT INTO `pos` VALUES ('3', '南部商务区');
INSERT INTO `pos` VALUES ('4', '宁南南路鄞州大道口');
INSERT INTO `pos` VALUES ('5', '鄞州客运总站');
INSERT INTO `pos` VALUES ('6', '鄞州海关');
INSERT INTO `pos` VALUES ('7', '金湾华庭');
INSERT INTO `pos` VALUES ('8', '四明路创新路口');
INSERT INTO `pos` VALUES ('9', '沧海路四明路口');
INSERT INTO `pos` VALUES ('10', '宜家家居');
INSERT INTO `pos` VALUES ('11', '华茂外国语学校');
INSERT INTO `pos` VALUES ('12', '四明中路天童路口');
INSERT INTO `pos` VALUES ('13', '宁波文化广场');
INSERT INTO `pos` VALUES ('14', '市行政中心西');
INSERT INTO `pos` VALUES ('15', '河清北路宁东路口');
INSERT INTO `pos` VALUES ('16', '梅景路');
INSERT INTO `pos` VALUES ('17', '李惠利东部医院');
INSERT INTO `pos` VALUES ('18', '百丈东路海晏南路');
INSERT INTO `pos` VALUES ('19', '万达广场东');
INSERT INTO `pos` VALUES ('20', '宁南立交桥南');
INSERT INTO `pos` VALUES ('21', '浙江万里学院西');
INSERT INTO `pos` VALUES ('22', '天一家园');
INSERT INTO `pos` VALUES ('23', '鼓楼站');
INSERT INTO `pos` VALUES ('24', '天一广场东');

-- ----------------------------
-- Table structure for `sell`
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `sno` varchar(15) NOT NULL,
  `pno` varchar(4) DEFAULT NULL,
  `cno` varchar(4) DEFAULT NULL,
  `ride` date DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sell
-- ----------------------------
INSERT INTO `sell` VALUES ('202111090010127', '0010', '127', '2021-11-09');
INSERT INTO `sell` VALUES ('202111130019127', '0019', '127', '2021-11-13');
INSERT INTO `sell` VALUES ('202111130022105', '0022', '105', '2021-11-13');
INSERT INTO `sell` VALUES ('202111140016101', '0016', '101', '2021-11-14');
INSERT INTO `sell` VALUES ('202111170015127', '0015', '127', '2021-11-17');
INSERT INTO `sell` VALUES ('202111180020127', '0020', '127', '2021-11-18');
INSERT INTO `sell` VALUES ('202111260025127', '0025', '127', '2021-11-26');
INSERT INTO `sell` VALUES ('202111270024105', '0024', '105', '2021-11-27');
INSERT INTO `sell` VALUES ('202111280017127', '0017', '127', '2021-11-28');
INSERT INTO `sell` VALUES ('202112020019101', '0019', '101', '2021-12-02');
INSERT INTO `sell` VALUES ('202112040012127', '0012', '127', '2021-12-04');
INSERT INTO `sell` VALUES ('202112040030127', '0030', '127', '2021-12-04');
INSERT INTO `sell` VALUES ('202112060028101', '0028', '101', '2021-12-06');
INSERT INTO `sell` VALUES ('202112080022101', '0022', '101', '2021-12-08');
INSERT INTO `sell` VALUES ('202112090023127', '0023', '127', '2021-12-09');
INSERT INTO `sell` VALUES ('202112130004127', '0004', '127', '2021-12-13');
INSERT INTO `sell` VALUES ('202112130007101', '0007', '101', '2021-12-13');
INSERT INTO `sell` VALUES ('202112130021101', '0021', '101', '2021-12-13');
INSERT INTO `sell` VALUES ('202112130027105', '0027', '105', '2021-12-13');
INSERT INTO `sell` VALUES ('202112160033141', '0033', '141', '2021-12-16');
INSERT INTO `sell` VALUES ('202112170001101', '0001', '101', '2021-12-17');
INSERT INTO `sell` VALUES ('202112190034127', '0034', '127', '2021-12-19');

-- ----------------------------
-- Table structure for `yuangong`
-- ----------------------------
DROP TABLE IF EXISTS `yuangong`;
CREATE TABLE `yuangong` (
  `yno` varchar(4) NOT NULL,
  `ymm` varchar(6) DEFAULT NULL,
  `yname` varchar(4) DEFAULT NULL,
  `yjob` varchar(10) DEFAULT NULL,
  `ymoney` int(5) DEFAULT NULL,
  `ysat` double(4,1) DEFAULT NULL,
  PRIMARY KEY (`yno`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of yuangong
-- ----------------------------
INSERT INTO `yuangong` VALUES ('y001', '123456', '太叔晓曼', '驾驶员', '4621', '86.0');
INSERT INTO `yuangong` VALUES ('y002', '123456', '浦嘉宝', '驾驶员', '4351', '91.0');
INSERT INTO `yuangong` VALUES ('y003', '123456', '邢乐欣', '驾驶员', '3512', '88.0');
INSERT INTO `yuangong` VALUES ('y004', '123456', '隆鸿晖', '驾驶员', '3070', '90.0');
INSERT INTO `yuangong` VALUES ('y005', '123456', '许鸿风', '车站清洁员', '4415', '88.0');
INSERT INTO `yuangong` VALUES ('y006', '123456', '连英卓', '驾驶员', '4495', '83.0');
INSERT INTO `yuangong` VALUES ('y007', '123456', '从英毅', '驾驶员', '3223', '85.0');
INSERT INTO `yuangong` VALUES ('y008', '123456', '怀莹华', '驾驶员', '3183', '90.0');
INSERT INTO `yuangong` VALUES ('y009', '123456', '芮学名', '车站清洁员', '4185', '88.0');
INSERT INTO `yuangong` VALUES ('y010', '123456', '麴致远', '驾驶员', '3772', '84.0');
INSERT INTO `yuangong` VALUES ('y011', '123456', '昌承望', '驾驶员', '4912', '83.0');
INSERT INTO `yuangong` VALUES ('y012', '123456', '向曼衍', '驾驶员', '4362', '88.0');
INSERT INTO `yuangong` VALUES ('y013', '123456', '奚熠彤', '驾驶员', '3427', '81.0');
INSERT INTO `yuangong` VALUES ('y014', '123456', '关飞双', '驾驶员', '4464', '84.0');
INSERT INTO `yuangong` VALUES ('y015', '123456', '巫马天泽', '驾驶员', '3061', '81.0');
INSERT INTO `yuangong` VALUES ('y016', '123456', '乜沛珊', '驾驶员', '4898', '87.0');
INSERT INTO `yuangong` VALUES ('y017', '123456', '姬云英', '调度员', '3669', '85.0');
INSERT INTO `yuangong` VALUES ('y018', '123456', '仲乐志', '驾驶员', '4282', '81.0');
INSERT INTO `yuangong` VALUES ('y019', '123456', '成芳馨', '驾驶员', '3428', '89.0');
INSERT INTO `yuangong` VALUES ('y020', '123456', '向清雅', '驾驶员', '4481', '81.0');
INSERT INTO `yuangong` VALUES ('y021', '123456', '柳俊捷', '驾驶员', '4171', '89.0');
INSERT INTO `yuangong` VALUES ('y022', '123456', '古雨星', '驾驶员', '4024', '88.0');
INSERT INTO `yuangong` VALUES ('y023', '123456', '厉丽芳', '驾驶员', '4938', '86.0');
INSERT INTO `yuangong` VALUES ('y024', '123456', '宣雨泽', '调度员', '3184', '83.0');
INSERT INTO `yuangong` VALUES ('y025', '123456', '淳于建木', '驾驶员', '3573', '80.0');
INSERT INTO `yuangong` VALUES ('y026', '123456', '蔚宇荫', '驾驶员', '4423', '85.0');
INSERT INTO `yuangong` VALUES ('y027', '123456', '璩乐容', '驾驶员', '3844', '84.0');
INSERT INTO `yuangong` VALUES ('y028', '123456', '牛清舒', '驾驶员', '4860', '81.0');
INSERT INTO `yuangong` VALUES ('y029', '123456', '桑阳云', '驾驶员', '3736', '85.0');
INSERT INTO `yuangong` VALUES ('y030', '123456', '戎雅柔', '驾驶员', '4233', '86.0');
INSERT INTO `yuangong` VALUES ('y031', '123456', '汲雅宁', '调度员', '3512', '88.0');
INSERT INTO `yuangong` VALUES ('y032', '123456', '谢飞翰', '驾驶员', '3035', '82.0');
INSERT INTO `yuangong` VALUES ('y033', '123456', '通清芬', '驾驶员', '4159', '85.0');
INSERT INTO `yuangong` VALUES ('y034', '123456', '景浩瀚', '驾驶员', '4777', '87.0');
INSERT INTO `yuangong` VALUES ('y035', '123456', '万浩歌', '驾驶员', '4221', '85.0');
INSERT INTO `yuangong` VALUES ('y036', '123456', '管静姝', '驾驶员', '3565', '88.0');
INSERT INTO `yuangong` VALUES ('y037', '123456', '山红叶', '驾驶员', '3232', '87.0');
INSERT INTO `yuangong` VALUES ('y038', '123456', '容永昌', '调度员', '3393', '83.0');
INSERT INTO `yuangong` VALUES ('y039', '123456', '卓永怡', '驾驶员', '3126', '88.0');
INSERT INTO `yuangong` VALUES ('y040', '123456', '慕容子墨', '驾驶员', '4712', '89.0');
INSERT INTO `yuangong` VALUES ('y041', '123456', '郑如云', '驾驶员', '4921', '83.0');
INSERT INTO `yuangong` VALUES ('y042', '123456', '戈梦菡', '驾驶员', '3672', '86.0');
INSERT INTO `yuangong` VALUES ('y043', '123456', '古米琪', '驾驶员', '3340', '84.0');
INSERT INTO `yuangong` VALUES ('y044', '123456', '屠鸿光', '调度员', '3613', '90.0');
INSERT INTO `yuangong` VALUES ('y045', '123456', '习慧秀', '驾驶员', '3206', '81.0');
INSERT INTO `yuangong` VALUES ('y046', '123456', '宁乐悦', '驾驶员', '3489', '83.0');
INSERT INTO `yuangong` VALUES ('y047', '123456', '卓勇捷', '驾驶员', '3617', '80.0');
INSERT INTO `yuangong` VALUES ('y048', '123456', '诸慧云', '驾驶员', '4092', '86.0');
INSERT INTO `yuangong` VALUES ('y049', '123456', '厉朋义', '驾驶员', '3706', '88.0');
INSERT INTO `yuangong` VALUES ('y050', '123456', '屈兴为', '驾驶员', '3763', '80.0');
INSERT INTO `yuangong` VALUES ('y051', '123456', '熊伟博', '调度员', '3976', '83.0');
INSERT INTO `yuangong` VALUES ('y052', '123456', '宋巍昂', '驾驶员', '3532', '81.0');
INSERT INTO `yuangong` VALUES ('y053', '123456', '严清秋', '车站清洁员', '4973', '89.0');
INSERT INTO `yuangong` VALUES ('y054', '123456', '张清雅', '驾驶员', '3269', '90.0');
INSERT INTO `yuangong` VALUES ('y055', '123456', '钭依云', '驾驶员', '4078', '86.0');
INSERT INTO `yuangong` VALUES ('y056', '123456', '舒正业', '驾驶员', '3447', '88.0');
INSERT INTO `yuangong` VALUES ('y057', '123456', '姜正信', '驾驶员', '3315', '82.0');
INSERT INTO `yuangong` VALUES ('y058', '123456', '浦灵秀', '驾驶员', '3662', '83.0');
INSERT INTO `yuangong` VALUES ('y059', '123456', '缑信鸥', '驾驶员', '4247', '81.0');
INSERT INTO `yuangong` VALUES ('y060', '123456', '有幼怡', '驾驶员', '3108', '88.0');
INSERT INTO `yuangong` VALUES ('y061', '123456', '刘语燕', '驾驶员', '3804', '89.0');
INSERT INTO `yuangong` VALUES ('y062', '123456', '祖和玉', '驾驶员', '5000', '87.0');
INSERT INTO `yuangong` VALUES ('y063', '123456', '焦和怡', '车站清洁员', '4165', '86.0');
INSERT INTO `yuangong` VALUES ('y064', '123456', '萧冰冰', '车站清洁员', '3950', '88.0');
INSERT INTO `yuangong` VALUES ('y065', '123456', '冷婉容', '车站清洁员', '4289', '90.0');
INSERT INTO `yuangong` VALUES ('y066', '123456', '浦梦露', '驾驶员', '3188', '82.0');
INSERT INTO `yuangong` VALUES ('y067', '123456', '裘雅韶', '驾驶员', '3222', '80.0');
INSERT INTO `yuangong` VALUES ('y068', '123456', '漆雕俊哲', '驾驶员', '3795', '90.0');
INSERT INTO `yuangong` VALUES ('y069', '123456', '奚清淑', '驾驶员', '4216', '88.0');
INSERT INTO `yuangong` VALUES ('y070', '123456', '白明志', '驾驶员', '3777', '83.0');
INSERT INTO `yuangong` VALUES ('y071', '123456', '晋馨兰', '驾驶员', '4516', '86.0');
INSERT INTO `yuangong` VALUES ('y072', '123456', '秋兰蕙', '驾驶员', '3078', '89.0');
INSERT INTO `yuangong` VALUES ('y073', '123456', '蒯新蕾', '调度员', '4073', '84.0');
INSERT INTO `yuangong` VALUES ('y074', '123456', '丰天韵', '驾驶员', '4124', '90.0');
INSERT INTO `yuangong` VALUES ('y075', '123456', '宦沛文', '驾驶员', '3363', '85.0');
INSERT INTO `yuangong` VALUES ('y076', '123456', '诸云岚', '驾驶员', '3628', '90.0');
INSERT INTO `yuangong` VALUES ('y077', '123456', '茅芳茵', '驾驶员', '3360', '87.0');
INSERT INTO `yuangong` VALUES ('y078', '123456', '查惜雪', '驾驶员', '3469', '86.0');
INSERT INTO `yuangong` VALUES ('y079', '123456', '乔丽珠', '驾驶员', '3793', '88.0');
INSERT INTO `yuangong` VALUES ('y080', '123456', '羊舌秀媚', '调度员', '3785', '89.0');
INSERT INTO `yuangong` VALUES ('y081', '123456', '薛子琪', '驾驶员', '4823', '81.0');
INSERT INTO `yuangong` VALUES ('y082', '123456', '莘安民', '驾驶员', '4511', '85.0');
INSERT INTO `yuangong` VALUES ('y083', '123456', '颜星津', '驾驶员', '3027', '81.0');
INSERT INTO `yuangong` VALUES ('y084', '123456', '许振国', '驾驶员', '4337', '88.0');
INSERT INTO `yuangong` VALUES ('y085', '123456', '仇乐容', '驾驶员', '4593', '87.0');
INSERT INTO `yuangong` VALUES ('y086', '123456', '钦高懿', '驾驶员', '4882', '81.0');
INSERT INTO `yuangong` VALUES ('y087', '123456', '晁婉仪', '车站清洁员', '4446', '89.0');
INSERT INTO `yuangong` VALUES ('y088', '123456', '扈芷文', '调度员', '4014', '84.0');
INSERT INTO `yuangong` VALUES ('y089', '123456', '黎恬静', '驾驶员', '4327', '82.0');
INSERT INTO `yuangong` VALUES ('y090', '123456', '於歌阑', '驾驶员', '3957', '88.0');
INSERT INTO `yuangong` VALUES ('y091', '123456', '殴承平', '驾驶员', '4100', '80.0');
INSERT INTO `yuangong` VALUES ('y092', '123456', '邰阳煦', '驾驶员', '3456', '90.0');
INSERT INTO `yuangong` VALUES ('y093', '123456', '南宫寻绿', '驾驶员', '4809', '82.0');
INSERT INTO `yuangong` VALUES ('y094', '123456', '康飞驰', '驾驶员', '3191', '84.0');
INSERT INTO `yuangong` VALUES ('y095', '123456', '喻兴怀', '驾驶员', '3833', '85.0');
INSERT INTO `yuangong` VALUES ('y096', '123456', '戚若兰', '驾驶员', '3376', '86.0');
INSERT INTO `yuangong` VALUES ('y097', '123456', '束明辉', '驾驶员', '4740', '90.0');
INSERT INTO `yuangong` VALUES ('y098', '123456', '柯红豆', '车站清洁员', '4276', '87.0');
INSERT INTO `yuangong` VALUES ('y099', '123456', '仉欣荣', '车站清洁员', '3486', '85.0');
INSERT INTO `yuangong` VALUES ('y100', '123456', '阎念文', '车站清洁员', '4706', '86.0');
INSERT INTO `yuangong` VALUES ('y101', '123456', '王晨', '驾驶员', '3500', '90.0');
INSERT INTO `yuangong` VALUES ('y102', '123456', '陈波波', '驾驶员', '3000', '90.0');
INSERT INTO `yuangong` VALUES ('y103', '123456', '张四', '驾驶员', '3500', '90.0');
