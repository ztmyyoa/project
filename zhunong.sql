/*
 Navicat Premium Data Transfer

 Source Server         : Javaweb
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : zhunong

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 16/05/2025 15:20:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `userid` int NOT NULL,
  `adminkey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `admin_pk`(`userid` ASC) USING BTREE,
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (100001, 'kkkk');
INSERT INTO `admin` VALUES (100002, 'aaa');

-- ----------------------------
-- Table structure for advertisements
-- ----------------------------
DROP TABLE IF EXISTS `advertisements`;
CREATE TABLE `advertisements`  (
  `advertid` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '广告标题',
  `adcontent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '广告位置',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '广告图片链接',
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '广告跳转链接',
  `start_time` datetime NULL DEFAULT NULL COMMENT '广告开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '广告结束时间',
  `status` int NOT NULL DEFAULT 1 COMMENT '广告状态 (0: 不显示, 1: 显示)',
  PRIMARY KEY (`advertid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '广告管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of advertisements
-- ----------------------------
INSERT INTO `advertisements` VALUES (1, '助农增收壮大产业', '消费帮扶助力乡村振兴', 'zhunong1.jpg', 'http://f.china.com.cn/2022-09/21/content_78430899.htm', '2025-05-01 00:00:00', '2025-05-10 23:59:59', 1);
INSERT INTO `advertisements` VALUES (2, '农产品如何“潮”起来', '农产品如何“潮”起来', 'zhunong/zhunong2.png', 'https://www.digitaling.com/articles/894599.html', '2025-06-01 00:00:00', '2025-06-15 23:59:59', 1);
INSERT INTO `advertisements` VALUES (3, '强农惠农富农政策', '强农惠农富农政策', 'zhunong/zhunong3.jpg', 'https://www.gov.cn/lianbo/bumen/202503/content_7014941.htm', '2025-09-01 00:00:00', '2025-09-30 23:59:59', 1);
INSERT INTO `advertisements` VALUES (4, '新农产品发布会', '大量新农产品发布', 'zhunong/zhunong4.jpg', 'http://www.aqsc.agri.cn/mtyx/tzgg/202404/t20240410_439881.htm', '2025-12-01 00:00:00', '2025-12-25 23:59:59', 1);
INSERT INTO `advertisements` VALUES (5, '农户培训课程上线', '提供大量课程培训农户', 'zhunong/zhunong5.png', 'https://caastc.caas.cn/', '2025-07-01 00:00:00', '2025-07-15 23:59:59', 1);
INSERT INTO `advertisements` VALUES (6, '春季广告', '全场五折', 'zhunong/zhaoshang.png', 'http://example.com', '2025-05-02 08:00:00', '2025-05-10 23:59:59', 1);

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `aid` int NOT NULL AUTO_INCREMENT,
  `atitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `acontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publishtime` datetime NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100006 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (100000, '全新补贴政策上线', '以农产品销售为基准，为农户提供大量补贴，保证农户收入。', '2025-01-02 21:53:37');
INSERT INTO `announcement` VALUES (100001, '平台维护', '在3月5日到3月7日展开平台维护升级', '2025-02-28 11:04:18');
INSERT INTO `announcement` VALUES (100002, '全新上线', '平台维护后全新上线，新增活动模块', '2006-03-09 07:17:58');
INSERT INTO `announcement` VALUES (100003, '库存问题全面解决', '新增多位农户和农产品原地，保证农产品库存充足', '2007-04-25 16:18:13');
INSERT INTO `announcement` VALUES (100004, '评论模块上线', '希望广大用户给出评价和建议以便于平台改进', '2016-12-24 16:22:27');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartid` int NOT NULL AUTO_INCREMENT,
  `consumerid` int NOT NULL,
  `productid` int NOT NULL,
  `quantity` int NOT NULL,
  `totalprice` double NULL DEFAULT NULL,
  PRIMARY KEY (`cartid`) USING BTREE,
  INDEX `consumerid`(`consumerid` ASC) USING BTREE,
  INDEX `productid`(`productid` ASC) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`consumerid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100017 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (100000, 100005, 100001, 2, 117.98);
INSERT INTO `cart` VALUES (100001, 100005, 100004, 5, 468.8);
INSERT INTO `cart` VALUES (100002, 100005, 100005, 6, 567.9000000000001);
INSERT INTO `cart` VALUES (100003, 100005, 100003, 2, 144.58);
INSERT INTO `cart` VALUES (100004, 100005, 100002, 5, 191.85);
INSERT INTO `cart` VALUES (100014, 100005, 100003, 1, 72.29);
INSERT INTO `cart` VALUES (100016, 100005, 100001, 1, 58.99);

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `userid` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `consumer_pk`(`userid` ASC) USING BTREE,
  CONSTRAINT `consumer_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (100005, '中国北京市東城区東直門內大街501号7号楼');
INSERT INTO `consumer` VALUES (100006, '中国东莞东泰五街479号3号楼');
INSERT INTO `consumer` VALUES (100008, '中国中山紫马岭商圈中山五路89号36楼');
INSERT INTO `consumer` VALUES (100010, '中国北京市海淀区清河中街68号233号38室');
INSERT INTO `consumer` VALUES (100011, '中国成都市成华区双庆路565号华润大厦11室');
INSERT INTO `consumer` VALUES (100012, '中国深圳龙岗区学园一巷817号37楼');
INSERT INTO `consumer` VALUES (100016, '中国北京市东城区东单王府井东街737号22号楼');
INSERT INTO `consumer` VALUES (100017, '中国深圳罗湖区蔡屋围深南东路260号华润大厦48室');
INSERT INTO `consumer` VALUES (100018, '中国广州市白云区机场路棠苑街五巷999号35号楼');
INSERT INTO `consumer` VALUES (100020, '中国成都市成华区双庆路696号26号楼');
INSERT INTO `consumer` VALUES (100021, '中国北京市延庆区028县道91号3栋');
INSERT INTO `consumer` VALUES (100022, '中国成都市锦江区红星路三段696号华润大厦46室');
INSERT INTO `consumer` VALUES (100025, '中国深圳罗湖区蔡屋围深南东路623号20号楼');
INSERT INTO `consumer` VALUES (100026, '中国深圳福田区深南大道378号华润大厦44室');
INSERT INTO `consumer` VALUES (100029, '中国广州市白云区小坪东路568号25号楼');
INSERT INTO `consumer` VALUES (100031, '中国中山紫马岭商圈中山五路927号33楼');
INSERT INTO `consumer` VALUES (100036, '中国中山乐丰六路716号40室');
INSERT INTO `consumer` VALUES (100040, '中国北京市东城区东单王府井东街591号华润大厦9室');
INSERT INTO `consumer` VALUES (100041, '中国东莞东泰五街871号25楼');
INSERT INTO `consumer` VALUES (100042, '中国深圳福田区景田东一街896号29号楼');
INSERT INTO `consumer` VALUES (100044, '中国上海市浦东新区健祥路828号25室');
INSERT INTO `consumer` VALUES (100045, '中国上海市徐汇区虹桥路421号26号楼');
INSERT INTO `consumer` VALUES (100047, '中国北京市西城区复兴门内大街297号39楼');
INSERT INTO `consumer` VALUES (100048, '中国中山紫马岭商圈中山五路57号9室');
INSERT INTO `consumer` VALUES (100051, '中国中山京华商圈华夏街484号25栋');
INSERT INTO `consumer` VALUES (100056, '中国中山天河区大信商圈大信南路929号华润大厦43室');
INSERT INTO `consumer` VALUES (100058, '中国北京市西城区西長安街592号17号楼');
INSERT INTO `consumer` VALUES (100062, '中国中山紫马岭商圈中山五路369号华润大厦42室');
INSERT INTO `consumer` VALUES (100063, '中国北京市東城区東直門內大街723号华润大厦8室');
INSERT INTO `consumer` VALUES (100064, '中国东莞珊瑚路425号31栋');
INSERT INTO `consumer` VALUES (100067, '中国东莞珊瑚路986号华润大厦36室');
INSERT INTO `consumer` VALUES (100068, '中国中山紫马岭商圈中山五路558号2楼');
INSERT INTO `consumer` VALUES (100069, '中国东莞坑美十五巷520号11室');
INSERT INTO `consumer` VALUES (100071, '中国上海市徐汇区虹桥路974号22楼');
INSERT INTO `consumer` VALUES (100072, '中国中山京华商圈华夏街233号29栋');
INSERT INTO `consumer` VALUES (100074, '中国深圳福田区景田东一街950号华润大厦46室');
INSERT INTO `consumer` VALUES (100075, '中国中山京华商圈华夏街161号37号楼');
INSERT INTO `consumer` VALUES (100076, '中国上海市浦东新区橄榄路701号31栋');
INSERT INTO `consumer` VALUES (100078, '中国上海市徐汇区虹桥路226号23号楼');
INSERT INTO `consumer` VALUES (100082, '中国上海市黄浦区淮海中路754号39号楼');
INSERT INTO `consumer` VALUES (100085, '中国北京市延庆区028县道972号27号楼');
INSERT INTO `consumer` VALUES (100088, '中国中山天河区大信商圈大信南路328号22栋');
INSERT INTO `consumer` VALUES (100089, '中国成都市成华区双庆路986号23号楼');
INSERT INTO `consumer` VALUES (100092, '中国东莞东泰五街112号32栋');
INSERT INTO `consumer` VALUES (100093, '中国成都市成华区二仙桥东三路210号46楼');
INSERT INTO `consumer` VALUES (100094, '中国北京市西城区西長安街434号39栋');
INSERT INTO `consumer` VALUES (100098, '中国深圳龙岗区布吉镇西环路672号22楼');
INSERT INTO `consumer` VALUES (100100, '中国北京市西城区西長安街230号华润大厦30室');
INSERT INTO `consumer` VALUES (100101, '中国上海市浦东新区健祥路842号32栋');
INSERT INTO `consumer` VALUES (100102, '中国北京市西城区复兴门内大街604号2室');
INSERT INTO `consumer` VALUES (100103, '中国北京市西城区复兴门内大街354号11栋');
INSERT INTO `consumer` VALUES (100105, '中国深圳福田区景田东一街193号44栋');
INSERT INTO `consumer` VALUES (100107, '中国北京市海淀区清河中街68号724号28室');
INSERT INTO `consumer` VALUES (100108, '中国北京市朝阳区三里屯路996号5室');
INSERT INTO `consumer` VALUES (100109, '中国上海市徐汇区虹桥路960号华润大厦14室');
INSERT INTO `consumer` VALUES (100110, '中国深圳罗湖区蔡屋围深南东路450号8号楼');
INSERT INTO `consumer` VALUES (100115, '中国深圳罗湖区清水河一路87号28室');
INSERT INTO `consumer` VALUES (100119, '中国深圳罗湖区清水河一路809号华润大厦13室');
INSERT INTO `consumer` VALUES (100120, '中国东莞环区南街二巷430号46楼');
INSERT INTO `consumer` VALUES (100121, '中国上海市黄浦区淮海中路210号10楼');
INSERT INTO `consumer` VALUES (100122, '中国成都市锦江区人民南路四段361号14号楼');
INSERT INTO `consumer` VALUES (100123, '中国上海市浦东新区健祥路831号华润大厦15室');
INSERT INTO `consumer` VALUES (100128, '中国北京市房山区岳琉路190号50室');
INSERT INTO `consumer` VALUES (100131, '中国广州市白云区小坪东路265号华润大厦6室');
INSERT INTO `consumer` VALUES (100132, '中国东莞东泰五街642号3栋');
INSERT INTO `consumer` VALUES (100135, '中国东莞珊瑚路929号22号楼');
INSERT INTO `consumer` VALUES (100137, '中国中山京华商圈华夏街354号20楼');
INSERT INTO `consumer` VALUES (100139, '中国北京市延庆区028县道263号42室');
INSERT INTO `consumer` VALUES (100143, '中国上海市浦东新区健祥路534号华润大厦22室');
INSERT INTO `consumer` VALUES (100144, '中国广州市越秀区中山二路825号10室');
INSERT INTO `consumer` VALUES (100146, '中国上海市闵行区宾川路29号35室');
INSERT INTO `consumer` VALUES (100147, '中国北京市西城区复兴门内大街962号6号楼');
INSERT INTO `consumer` VALUES (100148, '中国广州市白云区机场路棠苑街五巷325号7室');
INSERT INTO `consumer` VALUES (100151, '中国深圳罗湖区清水河一路521号14室');
INSERT INTO `consumer` VALUES (100153, '中国北京市朝阳区三里屯路187号33室');
INSERT INTO `consumer` VALUES (100155, '中国深圳罗湖区清水河一路17号24栋');
INSERT INTO `consumer` VALUES (100156, '中国成都市成华区二仙桥东三路504号29栋');
INSERT INTO `consumer` VALUES (100160, '中国北京市东城区东单王府井东街32号8栋');
INSERT INTO `consumer` VALUES (100163, '中国成都市成华区双庆路578号华润大厦37室');
INSERT INTO `consumer` VALUES (100164, '中国深圳福田区景田东一街39号30楼');
INSERT INTO `consumer` VALUES (100165, '中国广州市白云区小坪东路71号50号楼');
INSERT INTO `consumer` VALUES (100170, '中国北京市朝阳区三里屯路93号华润大厦46室');
INSERT INTO `consumer` VALUES (100171, '中国北京市房山区岳琉路982号华润大厦19室');
INSERT INTO `consumer` VALUES (100173, '中国上海市浦东新区橄榄路499号华润大厦35室');
INSERT INTO `consumer` VALUES (100175, '中国中山紫马岭商圈中山五路197号14号楼');
INSERT INTO `consumer` VALUES (100179, '中国北京市西城区西長安街186号41号楼');
INSERT INTO `consumer` VALUES (100180, '中国深圳福田区景田东一街284号3栋');
INSERT INTO `consumer` VALUES (100184, '中国东莞珊瑚路422号42号楼');
INSERT INTO `consumer` VALUES (100188, '中国成都市成华区二仙桥东三路667号40室');
INSERT INTO `consumer` VALUES (100189, '中国东莞珊瑚路594号32楼');
INSERT INTO `consumer` VALUES (100193, '中国上海市黄浦区淮海中路705号50号楼');
INSERT INTO `consumer` VALUES (100195, '中国深圳罗湖区清水河一路944号45室');
INSERT INTO `consumer` VALUES (100196, '中国中山紫马岭商圈中山五路305号华润大厦14室');
INSERT INTO `consumer` VALUES (100197, '中国广州市白云区机场路棠苑街五巷804号3栋');
INSERT INTO `consumer` VALUES (100199, '中国北京市西城区西長安街245号31室');
INSERT INTO `consumer` VALUES (100204, '中国深圳罗湖区田贝一路483号20栋');
INSERT INTO `consumer` VALUES (100206, '中国成都市锦江区人民南路四段291号42栋');
INSERT INTO `consumer` VALUES (100207, '中国深圳罗湖区清水河一路620号40楼');
INSERT INTO `consumer` VALUES (100208, '中国北京市东城区东单王府井东街410号华润大厦39室');
INSERT INTO `consumer` VALUES (100209, '中国广州市海珠区江南西路783号46楼');
INSERT INTO `consumer` VALUES (100210, '中国深圳罗湖区清水河一路12号华润大厦38室');
INSERT INTO `consumer` VALUES (100212, '中国上海市黄浦区淮海中路79号44楼');
INSERT INTO `consumer` VALUES (100213, '中国成都市成华区二仙桥东三路686号24栋');
INSERT INTO `consumer` VALUES (100214, '中国深圳福田区景田东一街553号34室');
INSERT INTO `consumer` VALUES (100215, '中国上海市浦东新区橄榄路24号华润大厦35室');
INSERT INTO `consumer` VALUES (100216, '中国北京市房山区岳琉路740号11栋');
INSERT INTO `consumer` VALUES (100218, '中国中山京华商圈华夏街274号华润大厦1室');
INSERT INTO `consumer` VALUES (100219, '中国广州市天河区天河路824号39楼');
INSERT INTO `consumer` VALUES (100223, '中国中山天河区大信商圈大信南路335号47室');
INSERT INTO `consumer` VALUES (100225, '中国北京市西城区复兴门内大街347号14室');
INSERT INTO `consumer` VALUES (100235, '中国上海市黄浦区淮海中路105号8号楼');
INSERT INTO `consumer` VALUES (100236, '中国东莞坑美十五巷581号5号楼');
INSERT INTO `consumer` VALUES (100238, '中国上海市闵行区宾川路496号37号楼');
INSERT INTO `consumer` VALUES (100240, '中国北京市东城区东单王府井东街895号31号楼');
INSERT INTO `consumer` VALUES (100241, '中国北京市海淀区清河中街68号786号1楼');
INSERT INTO `consumer` VALUES (100242, '中国上海市黄浦区淮海中路822号19号楼');
INSERT INTO `consumer` VALUES (100243, '中国成都市锦江区红星路三段138号18室');
INSERT INTO `consumer` VALUES (100244, '中国北京市朝阳区三里屯路850号16室');
INSERT INTO `consumer` VALUES (100246, '中国广州市海珠区江南西路124号华润大厦23室');
INSERT INTO `consumer` VALUES (100247, '中国北京市朝阳区三里屯路732号45楼');
INSERT INTO `consumer` VALUES (100248, '中国北京市西城区复兴门内大街226号23栋');
INSERT INTO `consumer` VALUES (100249, '中国深圳福田区深南大道536号9楼');
INSERT INTO `consumer` VALUES (100251, '中国北京市海淀区清河中街68号540号44栋');
INSERT INTO `consumer` VALUES (100252, '中国成都市锦江区人民南路四段668号8栋');
INSERT INTO `consumer` VALUES (100254, '中国中山京华商圈华夏街143号27室');
INSERT INTO `consumer` VALUES (100255, '中国北京市房山区岳琉路270号45号楼');
INSERT INTO `consumer` VALUES (100257, '中国上海市徐汇区虹桥路186号20楼');
INSERT INTO `consumer` VALUES (100258, '中国中山乐丰六路635号47室');
INSERT INTO `consumer` VALUES (100259, '中国北京市東城区東直門內大街596号33楼');
INSERT INTO `consumer` VALUES (100260, '中国深圳龙岗区布吉镇西环路835号5室');
INSERT INTO `consumer` VALUES (100261, '中国东莞珊瑚路914号46栋');
INSERT INTO `consumer` VALUES (100263, '中国上海市黄浦区淮海中路317号16楼');
INSERT INTO `consumer` VALUES (100264, '中国东莞珊瑚路161号华润大厦15室');
INSERT INTO `consumer` VALUES (100267, '中国深圳龙岗区学园一巷857号15室');
INSERT INTO `consumer` VALUES (100268, '中国成都市锦江区红星路三段947号8楼');
INSERT INTO `consumer` VALUES (100269, '中国深圳罗湖区田贝一路751号22楼');
INSERT INTO `consumer` VALUES (100270, '中国上海市黄浦区淮海中路638号24楼');
INSERT INTO `consumer` VALUES (100271, '中国深圳福田区深南大道922号华润大厦27室');
INSERT INTO `consumer` VALUES (100275, '中国成都市成华区二仙桥东三路733号37栋');
INSERT INTO `consumer` VALUES (100276, '中国成都市成华区二仙桥东三路271号34室');
INSERT INTO `consumer` VALUES (100279, '中国中山天河区大信商圈大信南路396号8室');
INSERT INTO `consumer` VALUES (100280, '中国深圳福田区深南大道536号华润大厦21室');
INSERT INTO `consumer` VALUES (100281, '中国东莞环区南街二巷560号39号楼');
INSERT INTO `consumer` VALUES (100282, '中国北京市東城区東直門內大街380号36楼');
INSERT INTO `consumer` VALUES (100285, '中国广州市白云区小坪东路517号49栋');
INSERT INTO `consumer` VALUES (100287, '中国中山紫马岭商圈中山五路836号华润大厦18室');
INSERT INTO `consumer` VALUES (100290, '中国东莞珊瑚路497号9楼');
INSERT INTO `consumer` VALUES (100291, '中国深圳龙岗区布吉镇西环路31号8栋');
INSERT INTO `consumer` VALUES (100293, '中国广州市天河区天河路428号4栋');
INSERT INTO `consumer` VALUES (100294, '中国深圳罗湖区清水河一路71号33室');
INSERT INTO `consumer` VALUES (100295, '中国北京市延庆区028县道879号7室');
INSERT INTO `consumer` VALUES (100296, '中国成都市成华区双庆路121号11室');
INSERT INTO `consumer` VALUES (100297, '中国广州市白云区小坪东路541号47楼');
INSERT INTO `consumer` VALUES (100298, '中国广州市越秀区中山二路461号华润大厦42室');
INSERT INTO `consumer` VALUES (100300, '中国东莞珊瑚路631号华润大厦13室');
INSERT INTO `consumer` VALUES (100306, '中国中山天河区大信商圈大信南路272号华润大厦41室');
INSERT INTO `consumer` VALUES (100308, '中国东莞东泰五街312号35室');
INSERT INTO `consumer` VALUES (100309, '中国上海市黄浦区淮海中路357号36楼');
INSERT INTO `consumer` VALUES (100310, '中国广州市白云区小坪东路983号15室');
INSERT INTO `consumer` VALUES (100314, '中国上海市徐汇区虹桥路943号华润大厦34室');
INSERT INTO `consumer` VALUES (100316, '中国北京市延庆区028县道565号36栋');
INSERT INTO `consumer` VALUES (100317, '中国广州市白云区机场路棠苑街五巷833号41楼');
INSERT INTO `consumer` VALUES (100318, '中国中山乐丰六路671号20号楼');
INSERT INTO `consumer` VALUES (100321, '中国深圳龙岗区布吉镇西环路148号33室');
INSERT INTO `consumer` VALUES (100323, '中国深圳福田区景田东一街672号36栋');
INSERT INTO `consumer` VALUES (100324, '中国东莞坑美十五巷592号44室');
INSERT INTO `consumer` VALUES (100325, '中国北京市东城区东单王府井东街459号17号楼');
INSERT INTO `consumer` VALUES (100330, '中国北京市東城区東直門內大街543号10号楼');
INSERT INTO `consumer` VALUES (100336, '中国东莞坑美十五巷994号39号楼');
INSERT INTO `consumer` VALUES (100338, '中国深圳龙岗区布吉镇西环路482号29楼');
INSERT INTO `consumer` VALUES (100339, '中国北京市延庆区028县道7号华润大厦11室');
INSERT INTO `consumer` VALUES (100340, '中国中山乐丰六路949号12楼');
INSERT INTO `consumer` VALUES (100342, '中国北京市西城区西長安街977号16室');
INSERT INTO `consumer` VALUES (100343, '中国北京市海淀区清河中街68号610号4室');
INSERT INTO `consumer` VALUES (100344, '中国深圳罗湖区蔡屋围深南东路369号26栋');
INSERT INTO `consumer` VALUES (100347, '中国中山乐丰六路238号36室');
INSERT INTO `consumer` VALUES (100348, '中国深圳福田区深南大道998号3室');
INSERT INTO `consumer` VALUES (100350, '中国广州市天河区天河路724号33号楼');
INSERT INTO `consumer` VALUES (100351, '中国成都市锦江区人民南路四段664号华润大厦32室');
INSERT INTO `consumer` VALUES (100355, '中国中山乐丰六路902号8室');
INSERT INTO `consumer` VALUES (100357, '中国北京市海淀区清河中街68号805号华润大厦22室');
INSERT INTO `consumer` VALUES (100360, '中国广州市白云区机场路棠苑街五巷794号23栋');
INSERT INTO `consumer` VALUES (100361, '中国北京市西城区复兴门内大街707号35楼');
INSERT INTO `consumer` VALUES (100368, '中国北京市東城区東直門內大街363号15栋');
INSERT INTO `consumer` VALUES (100371, '中国北京市东城区东单王府井东街672号3楼');
INSERT INTO `consumer` VALUES (100373, '中国广州市白云区小坪东路135号36栋');
INSERT INTO `consumer` VALUES (100375, '中国广州市白云区小坪东路507号华润大厦29室');
INSERT INTO `consumer` VALUES (100376, '中国成都市锦江区人民南路四段15号18号楼');
INSERT INTO `consumer` VALUES (100377, '中国上海市黄浦区淮海中路586号华润大厦15室');
INSERT INTO `consumer` VALUES (100378, '中国北京市西城区西長安街81号50号楼');
INSERT INTO `consumer` VALUES (100379, '中国北京市东城区东单王府井东街207号50栋');
INSERT INTO `consumer` VALUES (100380, '中国东莞环区南街二巷421号华润大厦33室');
INSERT INTO `consumer` VALUES (100381, '中国深圳龙岗区布吉镇西环路539号22栋');
INSERT INTO `consumer` VALUES (100382, '中国上海市徐汇区虹桥路123号41号楼');
INSERT INTO `consumer` VALUES (100383, '中国广州市白云区小坪东路63号华润大厦4室');
INSERT INTO `consumer` VALUES (100384, '中国中山紫马岭商圈中山五路963号41号楼');
INSERT INTO `consumer` VALUES (100385, '中国成都市成华区二仙桥东三路149号15室');
INSERT INTO `consumer` VALUES (100390, '中国深圳罗湖区清水河一路403号29室');
INSERT INTO `consumer` VALUES (100391, '中国深圳龙岗区学园一巷633号16栋');
INSERT INTO `consumer` VALUES (100392, '中国广州市白云区机场路棠苑街五巷58号27室');
INSERT INTO `consumer` VALUES (100396, '中国深圳龙岗区布吉镇西环路539号22栋');
INSERT INTO `consumer` VALUES (100401, '中国上海市徐汇区虹桥路123号41号楼');
INSERT INTO `consumer` VALUES (100403, '中国广州市白云区小坪东路63号华润大厦4室');
INSERT INTO `consumer` VALUES (100406, '中国中山紫马岭商圈中山五路963号41号楼');
INSERT INTO `consumer` VALUES (100407, '中国成都市成华区二仙桥东三路149号15室');
INSERT INTO `consumer` VALUES (100408, '中国深圳罗湖区清水河一路403号29室');
INSERT INTO `consumer` VALUES (100410, '中国深圳龙岗区学园一巷633号16栋');
INSERT INTO `consumer` VALUES (100411, '中国广州市白云区机场路棠苑街五巷58号27室');
INSERT INTO `consumer` VALUES (100413, '中国中山京华商圈华夏街357号2栋');
INSERT INTO `consumer` VALUES (100414, '中国成都市成华区二仙桥东三路924号5室');
INSERT INTO `consumer` VALUES (100415, '中国上海市徐汇区虹桥路354号33楼');
INSERT INTO `consumer` VALUES (100416, '中国深圳罗湖区蔡屋围深南东路664号27号楼');
INSERT INTO `consumer` VALUES (100417, '中国上海市闵行区宾川路123号华润大厦42室');
INSERT INTO `consumer` VALUES (100418, '中国北京市房山区岳琉路884号华润大厦5室');
INSERT INTO `consumer` VALUES (100419, '中国深圳罗湖区清水河一路602号43楼');
INSERT INTO `consumer` VALUES (100420, '中国东莞环区南街二巷582号华润大厦47室');
INSERT INTO `consumer` VALUES (100421, '中国成都市锦江区红星路三段539号14栋');
INSERT INTO `consumer` VALUES (100423, '中国深圳罗湖区田贝一路482号华润大厦25室');
INSERT INTO `consumer` VALUES (100426, '中国广州市越秀区中山二路793号32号楼');
INSERT INTO `consumer` VALUES (100427, '中国上海市黄浦区淮海中路901号华润大厦26室');
INSERT INTO `consumer` VALUES (100429, '中国上海市浦东新区健祥路953号50室');
INSERT INTO `consumer` VALUES (100430, '中国深圳罗湖区蔡屋围深南东路375号16栋');
INSERT INTO `consumer` VALUES (100433, '中国深圳龙岗区学园一巷263号37栋');
INSERT INTO `consumer` VALUES (100434, '中国深圳龙岗区学园一巷369号11室');
INSERT INTO `consumer` VALUES (100435, '中国东莞坑美十五巷302号华润大厦6室');
INSERT INTO `consumer` VALUES (100436, '中国中山京华商圈华夏街554号33楼');
INSERT INTO `consumer` VALUES (100439, '中国北京市東城区東直門內大街352号38室');
INSERT INTO `consumer` VALUES (100440, '中国北京市東城区東直門內大街948号华润大厦23室');
INSERT INTO `consumer` VALUES (100441, '中国中山天河区大信商圈大信南路687号22栋');
INSERT INTO `consumer` VALUES (100444, '中国中山紫马岭商圈中山五路595号45室');
INSERT INTO `consumer` VALUES (100445, '中国广州市越秀区中山二路614号10栋');
INSERT INTO `consumer` VALUES (100447, '中国广州市越秀区中山二路614号10栋');
INSERT INTO `consumer` VALUES (100448, '中国深圳罗湖区清水河一路12号华润大厦38室');
INSERT INTO `consumer` VALUES (100451, '中国上海市黄浦区淮海中路79号44楼');
INSERT INTO `consumer` VALUES (100452, '中国成都市成华区二仙桥东三路686号24栋');
INSERT INTO `consumer` VALUES (100454, '中国深圳福田区景田东一街553号34室');
INSERT INTO `consumer` VALUES (100455, '中国上海市浦东新区橄榄路24号华润大厦35室');
INSERT INTO `consumer` VALUES (100457, '中国北京市房山区岳琉路740号11栋');
INSERT INTO `consumer` VALUES (100460, '中国中山京华商圈华夏街274号华润大厦1室');
INSERT INTO `consumer` VALUES (100461, '中国广州市天河区天河路824号39楼');
INSERT INTO `consumer` VALUES (100463, '中国中山天河区大信商圈大信南路335号47室');
INSERT INTO `consumer` VALUES (100468, '中国北京市西城区复兴门内大街347号14室');
INSERT INTO `consumer` VALUES (100469, '中国上海市黄浦区淮海中路105号8号楼');
INSERT INTO `consumer` VALUES (100471, '中国东莞坑美十五巷581号5号楼');
INSERT INTO `consumer` VALUES (100474, '中国上海市闵行区宾川路496号37号楼');
INSERT INTO `consumer` VALUES (100477, '中国北京市东城区东单王府井东街895号31号楼');
INSERT INTO `consumer` VALUES (100480, '中国北京市海淀区清河中街68号786号1楼');
INSERT INTO `consumer` VALUES (100481, '中国上海市黄浦区淮海中路822号19号楼');
INSERT INTO `consumer` VALUES (100482, '中国成都市锦江区红星路三段138号18室');
INSERT INTO `consumer` VALUES (100483, '中国北京市朝阳区三里屯路850号16室');
INSERT INTO `consumer` VALUES (100485, '中国广州市海珠区江南西路124号华润大厦23室');
INSERT INTO `consumer` VALUES (100487, '中国北京市朝阳区三里屯路732号45楼');
INSERT INTO `consumer` VALUES (100488, '中国北京市西城区复兴门内大街226号23栋');
INSERT INTO `consumer` VALUES (100494, '中国深圳福田区深南大道536号9楼');
INSERT INTO `consumer` VALUES (100495, '中国北京市海淀区清河中街68号540号44栋');
INSERT INTO `consumer` VALUES (100496, '中国成都市锦江区人民南路四段668号8栋');
INSERT INTO `consumer` VALUES (100498, '中国中山京华商圈华夏街143号27室');
INSERT INTO `consumer` VALUES (100499, '中国北京市房山区岳琉路270号45号楼');
INSERT INTO `consumer` VALUES (100500, '中国上海市徐汇区虹桥路186号20楼');
INSERT INTO `consumer` VALUES (100501, '中国中山乐丰六路635号47室');
INSERT INTO `consumer` VALUES (100505, '中国北京市東城区東直門內大街596号33楼');
INSERT INTO `consumer` VALUES (100506, '中国深圳龙岗区布吉镇西环路835号5室');
INSERT INTO `consumer` VALUES (100507, '中国东莞珊瑚路914号46栋');
INSERT INTO `consumer` VALUES (100510, '中国上海市黄浦区淮海中路317号16楼');
INSERT INTO `consumer` VALUES (100512, '中国东莞珊瑚路161号华润大厦15室');
INSERT INTO `consumer` VALUES (100515, '中国深圳龙岗区学园一巷857号15室');
INSERT INTO `consumer` VALUES (100518, '中国成都市锦江区红星路三段947号8楼');
INSERT INTO `consumer` VALUES (100519, '中国深圳罗湖区田贝一路751号22楼');
INSERT INTO `consumer` VALUES (100521, '中国上海市黄浦区淮海中路638号24楼');
INSERT INTO `consumer` VALUES (100522, '中国深圳福田区深南大道922号华润大厦27室');
INSERT INTO `consumer` VALUES (100530, '中国成都市成华区二仙桥东三路733号37栋');
INSERT INTO `consumer` VALUES (100533, '中国成都市成华区二仙桥东三路271号34室');
INSERT INTO `consumer` VALUES (100537, '中国中山天河区大信商圈大信南路396号8室');
INSERT INTO `consumer` VALUES (100543, '中国深圳福田区深南大道536号华润大厦21室');
INSERT INTO `consumer` VALUES (100545, '中国东莞环区南街二巷560号39号楼');
INSERT INTO `consumer` VALUES (100546, '中国北京市東城区東直門內大街380号36楼');
INSERT INTO `consumer` VALUES (100547, '中国广州市白云区小坪东路517号49栋');
INSERT INTO `consumer` VALUES (100549, '中国中山紫马岭商圈中山五路836号华润大厦18室');
INSERT INTO `consumer` VALUES (100551, '中国东莞珊瑚路497号9楼');
INSERT INTO `consumer` VALUES (100553, '中国深圳龙岗区布吉镇西环路31号8栋');
INSERT INTO `consumer` VALUES (100554, '中国广州市天河区天河路428号4栋');
INSERT INTO `consumer` VALUES (100555, '中国深圳罗湖区清水河一路71号33室');
INSERT INTO `consumer` VALUES (100556, '中国北京市延庆区028县道879号7室');
INSERT INTO `consumer` VALUES (100559, '中国成都市成华区双庆路121号11室');
INSERT INTO `consumer` VALUES (100565, '中国广州市白云区小坪东路541号47楼');
INSERT INTO `consumer` VALUES (100568, '中国广州市越秀区中山二路461号华润大厦42室');
INSERT INTO `consumer` VALUES (100569, '中国东莞珊瑚路631号华润大厦13室');
INSERT INTO `consumer` VALUES (100575, '中国中山天河区大信商圈大信南路272号华润大厦41室');
INSERT INTO `consumer` VALUES (100576, '中国东莞东泰五街312号35室');
INSERT INTO `consumer` VALUES (100577, '中国上海市黄浦区淮海中路357号36楼');
INSERT INTO `consumer` VALUES (100581, '中国广州市白云区小坪东路983号15室');
INSERT INTO `consumer` VALUES (100583, '中国上海市徐汇区虹桥路943号华润大厦34室');
INSERT INTO `consumer` VALUES (100584, '中国北京市延庆区028县道565号36栋');
INSERT INTO `consumer` VALUES (100586, '中国广州市白云区机场路棠苑街五巷833号41楼');
INSERT INTO `consumer` VALUES (100590, '中国中山乐丰六路671号20号楼');
INSERT INTO `consumer` VALUES (100592, '中国深圳龙岗区布吉镇西环路148号33室');
INSERT INTO `consumer` VALUES (100593, '中国深圳福田区景田东一街672号36栋');
INSERT INTO `consumer` VALUES (100596, '中国东莞坑美十五巷592号44室');
INSERT INTO `consumer` VALUES (100597, '中国北京市东城区东单王府井东街459号17号楼');
INSERT INTO `consumer` VALUES (100600, '中国北京市東城区東直門內大街543号10号楼');
INSERT INTO `consumer` VALUES (100603, '中国东莞坑美十五巷994号39号楼');
INSERT INTO `consumer` VALUES (100604, '中国深圳龙岗区布吉镇西环路482号29楼');
INSERT INTO `consumer` VALUES (100605, '中国北京市延庆区028县道7号华润大厦11室');
INSERT INTO `consumer` VALUES (100607, '中国中山乐丰六路949号12楼');
INSERT INTO `consumer` VALUES (100608, '中国北京市西城区西長安街977号16室');
INSERT INTO `consumer` VALUES (100611, '中国北京市海淀区清河中街68号610号4室');
INSERT INTO `consumer` VALUES (100612, '中国深圳罗湖区蔡屋围深南东路369号26栋');
INSERT INTO `consumer` VALUES (100614, '中国中山乐丰六路238号36室');
INSERT INTO `consumer` VALUES (100615, '中国深圳福田区深南大道998号3室');
INSERT INTO `consumer` VALUES (100616, '中国广州市天河区天河路724号33号楼');
INSERT INTO `consumer` VALUES (100617, '中国成都市锦江区人民南路四段664号华润大厦32室');
INSERT INTO `consumer` VALUES (100618, '中国中山乐丰六路902号8室');
INSERT INTO `consumer` VALUES (100622, '中国北京市海淀区清河中街68号805号华润大厦22室');
INSERT INTO `consumer` VALUES (100623, '中国广州市白云区机场路棠苑街五巷794号23栋');
INSERT INTO `consumer` VALUES (100627, '中国北京市西城区复兴门内大街707号35楼');
INSERT INTO `consumer` VALUES (100628, '中国北京市東城区東直門內大街363号15栋');
INSERT INTO `consumer` VALUES (100632, '中国北京市东城区东单王府井东街672号3楼');
INSERT INTO `consumer` VALUES (100633, '中国广州市白云区小坪东路135号36栋');
INSERT INTO `consumer` VALUES (100634, '中国广州市白云区小坪东路507号华润大厦29室');
INSERT INTO `consumer` VALUES (100639, '中国成都市锦江区人民南路四段15号18号楼');
INSERT INTO `consumer` VALUES (100642, '中国上海市黄浦区淮海中路586号华润大厦15室');
INSERT INTO `consumer` VALUES (100643, '中国北京市西城区西長安街81号50号楼');
INSERT INTO `consumer` VALUES (100644, '中国北京市东城区东单王府井东街207号50栋');
INSERT INTO `consumer` VALUES (100646, '中国东莞环区南街二巷421号华润大厦33室');
INSERT INTO `consumer` VALUES (100648, '中国深圳龙岗区布吉镇西环路539号22栋');
INSERT INTO `consumer` VALUES (100651, '中国上海市徐汇区虹桥路123号41号楼');
INSERT INTO `consumer` VALUES (100652, '中国广州市白云区小坪东路63号华润大厦4室');
INSERT INTO `consumer` VALUES (100659, '中国深圳罗湖区清水河一路12号华润大厦38室');
INSERT INTO `consumer` VALUES (100661, '中国上海市黄浦区淮海中路79号44楼');
INSERT INTO `consumer` VALUES (100662, '中国成都市成华区二仙桥东三路686号24栋');
INSERT INTO `consumer` VALUES (100663, '中国深圳福田区景田东一街553号34室');
INSERT INTO `consumer` VALUES (100667, '中国上海市浦东新区橄榄路24号华润大厦35室');
INSERT INTO `consumer` VALUES (100670, '中国北京市房山区岳琉路740号11栋');
INSERT INTO `consumer` VALUES (100671, '中国中山京华商圈华夏街274号华润大厦1室');
INSERT INTO `consumer` VALUES (100673, '中国广州市天河区天河路824号39楼');
INSERT INTO `consumer` VALUES (100674, '中国中山天河区大信商圈大信南路335号47室');
INSERT INTO `consumer` VALUES (100675, '中国北京市西城区复兴门内大街347号14室');
INSERT INTO `consumer` VALUES (100676, '中国上海市黄浦区淮海中路105号8号楼');
INSERT INTO `consumer` VALUES (100677, '中国东莞坑美十五巷581号5号楼');
INSERT INTO `consumer` VALUES (100678, '中国上海市闵行区宾川路496号37号楼');
INSERT INTO `consumer` VALUES (100679, '中国北京市东城区东单王府井东街895号31号楼');
INSERT INTO `consumer` VALUES (100688, '中国北京市海淀区清河中街68号786号1楼');
INSERT INTO `consumer` VALUES (100689, '中国上海市黄浦区淮海中路822号19号楼');
INSERT INTO `consumer` VALUES (100693, '中国成都市锦江区红星路三段138号18室');
INSERT INTO `consumer` VALUES (100694, '中国北京市朝阳区三里屯路850号16室');
INSERT INTO `consumer` VALUES (100695, '中国广州市海珠区江南西路124号华润大厦23室');
INSERT INTO `consumer` VALUES (100696, '中国北京市朝阳区三里屯路732号45楼');
INSERT INTO `consumer` VALUES (100698, '中国北京市西城区复兴门内大街226号23栋');
INSERT INTO `consumer` VALUES (100699, '中国深圳福田区深南大道536号9楼');
INSERT INTO `consumer` VALUES (100702, '中国北京市海淀区清河中街68号540号44栋');
INSERT INTO `consumer` VALUES (100704, '中国成都市锦江区人民南路四段668号8栋');
INSERT INTO `consumer` VALUES (100706, '中国中山京华商圈华夏街143号27室');
INSERT INTO `consumer` VALUES (100707, '中国北京市房山区岳琉路270号45号楼');
INSERT INTO `consumer` VALUES (100709, '中国上海市徐汇区虹桥路186号20楼');
INSERT INTO `consumer` VALUES (100711, '中国中山乐丰六路635号47室');
INSERT INTO `consumer` VALUES (100712, '中国北京市東城区東直門內大街596号33楼');
INSERT INTO `consumer` VALUES (100713, '中国深圳龙岗区布吉镇西环路835号5室');
INSERT INTO `consumer` VALUES (100714, '中国东莞珊瑚路914号46栋');
INSERT INTO `consumer` VALUES (100717, '中国上海市黄浦区淮海中路317号16楼');
INSERT INTO `consumer` VALUES (100721, '中国东莞珊瑚路161号华润大厦15室');
INSERT INTO `consumer` VALUES (100723, '中国深圳龙岗区学园一巷857号15室');
INSERT INTO `consumer` VALUES (100728, '中国成都市锦江区红星路三段947号8楼');
INSERT INTO `consumer` VALUES (100734, '中国深圳罗湖区田贝一路751号22楼');
INSERT INTO `consumer` VALUES (100735, '中国上海市黄浦区淮海中路638号24楼');
INSERT INTO `consumer` VALUES (100741, '中国深圳福田区深南大道922号华润大厦27室');
INSERT INTO `consumer` VALUES (100748, '中国成都市成华区二仙桥东三路733号37栋');
INSERT INTO `consumer` VALUES (100749, '中国成都市成华区二仙桥东三路271号34室');
INSERT INTO `consumer` VALUES (100750, '中国中山天河区大信商圈大信南路396号8室');
INSERT INTO `consumer` VALUES (100752, '中国深圳福田区深南大道536号华润大厦21室');
INSERT INTO `consumer` VALUES (100754, '中国东莞环区南街二巷560号39号楼');
INSERT INTO `consumer` VALUES (100757, '中国北京市東城区東直門內大街380号36楼');
INSERT INTO `consumer` VALUES (100759, '中国广州市白云区小坪东路517号49栋');
INSERT INTO `consumer` VALUES (100760, '中国中山紫马岭商圈中山五路836号华润大厦18室');
INSERT INTO `consumer` VALUES (100761, '中国东莞珊瑚路497号9楼');
INSERT INTO `consumer` VALUES (100762, '中国深圳龙岗区布吉镇西环路31号8栋');
INSERT INTO `consumer` VALUES (100763, '中国广州市天河区天河路428号4栋');
INSERT INTO `consumer` VALUES (100764, '中国深圳罗湖区清水河一路71号33室');
INSERT INTO `consumer` VALUES (100765, '中国北京市延庆区028县道879号7室');
INSERT INTO `consumer` VALUES (100767, '中国成都市成华区双庆路121号11室');
INSERT INTO `consumer` VALUES (100768, '中国广州市白云区小坪东路541号47楼');
INSERT INTO `consumer` VALUES (100769, '中国广州市越秀区中山二路461号华润大厦42室');
INSERT INTO `consumer` VALUES (100770, '中国东莞珊瑚路631号华润大厦13室');
INSERT INTO `consumer` VALUES (100771, '中国中山天河区大信商圈大信南路272号华润大厦41室');
INSERT INTO `consumer` VALUES (100774, '中国东莞东泰五街312号35室');
INSERT INTO `consumer` VALUES (100775, '中国上海市黄浦区淮海中路357号36楼');
INSERT INTO `consumer` VALUES (100779, '中国广州市白云区小坪东路983号15室');
INSERT INTO `consumer` VALUES (100783, '中国上海市徐汇区虹桥路943号华润大厦34室');
INSERT INTO `consumer` VALUES (100784, '中国北京市延庆区028县道565号36栋');
INSERT INTO `consumer` VALUES (100787, '中国广州市白云区机场路棠苑街五巷833号41楼');
INSERT INTO `consumer` VALUES (100788, '中国中山乐丰六路671号20号楼');
INSERT INTO `consumer` VALUES (100792, '中国深圳龙岗区布吉镇西环路148号33室');
INSERT INTO `consumer` VALUES (100793, '中国深圳福田区景田东一街672号36栋');
INSERT INTO `consumer` VALUES (100795, '中国东莞坑美十五巷592号44室');
INSERT INTO `consumer` VALUES (100796, '中国北京市东城区东单王府井东街459号17号楼');
INSERT INTO `consumer` VALUES (100800, '中国北京市東城区東直門內大街543号10号楼');
INSERT INTO `consumer` VALUES (100801, '中国东莞坑美十五巷994号39号楼');
INSERT INTO `consumer` VALUES (100803, '中国深圳龙岗区布吉镇西环路482号29楼');
INSERT INTO `consumer` VALUES (100804, '中国北京市延庆区028县道7号华润大厦11室');
INSERT INTO `consumer` VALUES (100805, '中国中山乐丰六路949号12楼');
INSERT INTO `consumer` VALUES (100808, '中国北京市西城区西長安街977号16室');
INSERT INTO `consumer` VALUES (100811, '中国北京市海淀区清河中街68号610号4室');
INSERT INTO `consumer` VALUES (100816, '中国深圳罗湖区清水河一路837号3室');
INSERT INTO `consumer` VALUES (100817, '中国中山乐丰六路868号36室');
INSERT INTO `consumer` VALUES (100819, '中国中山京华商圈华夏街344号31号楼');
INSERT INTO `consumer` VALUES (100822, '中国成都市成华区双庆路11号19室');
INSERT INTO `consumer` VALUES (100833, '中国广州市白云区机场路棠苑街五巷439号19号楼');
INSERT INTO `consumer` VALUES (100834, '中国北京市房山区岳琉路13号华润大厦19室');
INSERT INTO `consumer` VALUES (100836, '中国深圳罗湖区清水河一路545号31号楼');
INSERT INTO `consumer` VALUES (100841, '中国北京市延庆区028县道107号华润大厦17室');
INSERT INTO `consumer` VALUES (100842, '中国广州市白云区机场路棠苑街五巷247号6室');
INSERT INTO `consumer` VALUES (100845, '中国深圳罗湖区蔡屋围深南东路777号50室');
INSERT INTO `consumer` VALUES (100846, '中国北京市海淀区清河中街68号550号22室');
INSERT INTO `consumer` VALUES (100847, '中国中山紫马岭商圈中山五路636号华润大厦36室');
INSERT INTO `consumer` VALUES (100853, '中国中山紫马岭商圈中山五路492号华润大厦27室');
INSERT INTO `consumer` VALUES (100854, '中国成都市成华区二仙桥东三路388号31栋');
INSERT INTO `consumer` VALUES (100863, '中国北京市海淀区清河中街68号751号1号楼');
INSERT INTO `consumer` VALUES (100865, '中国成都市成华区二仙桥东三路923号华润大厦17室');
INSERT INTO `consumer` VALUES (100868, '中国北京市朝阳区三里屯路14号1室');
INSERT INTO `consumer` VALUES (100870, '中国深圳福田区深南大道445号23楼');
INSERT INTO `consumer` VALUES (100871, '中国深圳龙岗区布吉镇西环路848号4楼');
INSERT INTO `consumer` VALUES (100874, '中国深圳龙岗区学园一巷793号26室');
INSERT INTO `consumer` VALUES (100878, '中国深圳龙岗区学园一巷384号华润大厦45室');
INSERT INTO `consumer` VALUES (100881, '中国深圳罗湖区清水河一路603号26室');
INSERT INTO `consumer` VALUES (100884, '中国中山京华商圈华夏街613号11号楼');
INSERT INTO `consumer` VALUES (100886, '中国北京市延庆区028县道284号43室');
INSERT INTO `consumer` VALUES (100887, '中国北京市房山区岳琉路59号3楼');
INSERT INTO `consumer` VALUES (100892, '中国深圳福田区景田东一街930号华润大厦30室');
INSERT INTO `consumer` VALUES (100894, '中国中山京华商圈华夏街179号1号楼');
INSERT INTO `consumer` VALUES (100896, '中国中山京华商圈华夏街708号35号楼');
INSERT INTO `consumer` VALUES (100897, '中国深圳罗湖区蔡屋围深南东路740号华润大厦34室');
INSERT INTO `consumer` VALUES (100898, '中国东莞东泰五街115号9号楼');
INSERT INTO `consumer` VALUES (100899, '中国广州市越秀区中山二路583号41室');
INSERT INTO `consumer` VALUES (100902, '中国东莞坑美十五巷713号46室');
INSERT INTO `consumer` VALUES (100903, '中国上海市黄浦区淮海中路614号22号楼');
INSERT INTO `consumer` VALUES (100904, '中国东莞东泰五街420号21栋');
INSERT INTO `consumer` VALUES (100905, '中国深圳福田区深南大道485号46室');
INSERT INTO `consumer` VALUES (100906, '中国北京市東城区東直門內大街291号41室');
INSERT INTO `consumer` VALUES (100907, '中国北京市東城区東直門內大街761号8楼');
INSERT INTO `consumer` VALUES (100908, '中国中山天河区大信商圈大信南路308号40栋');
INSERT INTO `consumer` VALUES (100909, '中国上海市徐汇区虹桥路70号35号楼');
INSERT INTO `consumer` VALUES (100910, '中国上海市黄浦区淮海中路921号11栋');
INSERT INTO `consumer` VALUES (100912, '中国广州市白云区机场路棠苑街五巷701号华润大厦39室');
INSERT INTO `consumer` VALUES (100915, '中国成都市成华区双庆路209号华润大厦13室');
INSERT INTO `consumer` VALUES (100916, '中国东莞环区南街二巷298号26室');
INSERT INTO `consumer` VALUES (100917, '中国中山京华商圈华夏街26号华润大厦39室');
INSERT INTO `consumer` VALUES (100919, '中国北京市延庆区028县道308号华润大厦10室');
INSERT INTO `consumer` VALUES (100921, '中国东莞东泰五街940号5楼');
INSERT INTO `consumer` VALUES (100923, '中国深圳福田区深南大道939号17楼');
INSERT INTO `consumer` VALUES (100928, '中国成都市成华区二仙桥东三路474号华润大厦34室');
INSERT INTO `consumer` VALUES (100929, '中国北京市西城区西長安街776号华润大厦32室');
INSERT INTO `consumer` VALUES (100931, '中国东莞坑美十五巷147号30楼');
INSERT INTO `consumer` VALUES (100932, '中国上海市浦东新区健祥路818号华润大厦48室');
INSERT INTO `consumer` VALUES (100939, '中国中山紫马岭商圈中山五路42号华润大厦5室');
INSERT INTO `consumer` VALUES (100941, '中国北京市房山区岳琉路325号12栋');
INSERT INTO `consumer` VALUES (100943, '中国北京市海淀区清河中街68号145号27号楼');
INSERT INTO `consumer` VALUES (100945, '中国广州市越秀区中山二路294号华润大厦19室');
INSERT INTO `consumer` VALUES (100949, '中国中山乐丰六路717号45号楼');
INSERT INTO `consumer` VALUES (100950, '中国东莞东泰五街278号华润大厦47室');
INSERT INTO `consumer` VALUES (100952, '中国北京市延庆区028县道206号49栋');
INSERT INTO `consumer` VALUES (100953, '中国成都市成华区玉双路6号725号13楼');
INSERT INTO `consumer` VALUES (100954, '中国北京市房山区岳琉路521号11号楼');
INSERT INTO `consumer` VALUES (100958, '中国北京市房山区岳琉路625号39号楼');
INSERT INTO `consumer` VALUES (100959, '中国上海市徐汇区虹桥路779号48栋');
INSERT INTO `consumer` VALUES (100961, '中国深圳福田区深南大道223号27栋');
INSERT INTO `consumer` VALUES (100963, '中国中山天河区大信商圈大信南路283号44楼');
INSERT INTO `consumer` VALUES (100964, '中国上海市徐汇区虹桥路694号华润大厦19室');
INSERT INTO `consumer` VALUES (100965, '中国成都市锦江区人民南路四段750号29室');
INSERT INTO `consumer` VALUES (100967, '中国北京市西城区西長安街581号46号楼');
INSERT INTO `consumer` VALUES (100968, '中国东莞坑美十五巷732号4号楼');
INSERT INTO `consumer` VALUES (100970, '中国上海市徐汇区虹桥路347号30栋');
INSERT INTO `consumer` VALUES (100972, '中国深圳福田区景田东一街705号41楼');
INSERT INTO `consumer` VALUES (100973, '中国中山京华商圈华夏街956号48号楼');
INSERT INTO `consumer` VALUES (100974, '中国中山紫马岭商圈中山五路811号21楼');
INSERT INTO `consumer` VALUES (100975, '中国广州市越秀区中山二路628号41室');
INSERT INTO `consumer` VALUES (100976, '中国上海市闵行区宾川路264号16室');
INSERT INTO `consumer` VALUES (100978, '中国广州市越秀区中山二路684号华润大厦14室');
INSERT INTO `consumer` VALUES (100982, '中国上海市浦东新区橄榄路511号5楼');
INSERT INTO `consumer` VALUES (100985, '中国中山乐丰六路780号7室');
INSERT INTO `consumer` VALUES (100988, '中国深圳罗湖区蔡屋围深南东路966号华润大厦44室');
INSERT INTO `consumer` VALUES (100989, '中国广州市白云区机场路棠苑街五巷861号华润大厦34室');
INSERT INTO `consumer` VALUES (100990, '中国北京市西城区西長安街936号33室');
INSERT INTO `consumer` VALUES (100991, '中国北京市西城区西長安街657号39室');
INSERT INTO `consumer` VALUES (100992, '中国东莞环区南街二巷45号10栋');
INSERT INTO `consumer` VALUES (100994, '中国东莞东泰五街850号1室');
INSERT INTO `consumer` VALUES (100996, '中国深圳罗湖区田贝一路581号40楼');
INSERT INTO `consumer` VALUES (100998, '中国北京市東城区東直門內大街810号华润大厦27室');
INSERT INTO `consumer` VALUES (100999, '中国深圳罗湖区蔡屋围深南东路690号38号楼');
INSERT INTO `consumer` VALUES (101000, '中国北京市延庆区028县道609号35号楼');

-- ----------------------------
-- Table structure for farmer
-- ----------------------------
DROP TABLE IF EXISTS `farmer`;
CREATE TABLE `farmer`  (
  `userid` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subsidys` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  CONSTRAINT `farmer_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of farmer
-- ----------------------------
INSERT INTO `farmer` VALUES (100003, '中国北京市東城区東直門內大街501号7号楼', 91124.00);
INSERT INTO `farmer` VALUES (100004, '中国东莞东泰五街479号3号楼', 654223.31);
INSERT INTO `farmer` VALUES (100007, '中国中山紫马岭商圈中山五路89号36楼', 939969.02);
INSERT INTO `farmer` VALUES (100009, '中国北京市海淀区清河中街68号233号38室', 920706.81);
INSERT INTO `farmer` VALUES (100013, '中国成都市成华区双庆路565号华润大厦11室', 724011.17);
INSERT INTO `farmer` VALUES (100014, '中国深圳龙岗区学园一巷817号37楼', 118347.77);
INSERT INTO `farmer` VALUES (100015, '中国北京市东城区东单王府井东街737号22号楼', 877596.19);
INSERT INTO `farmer` VALUES (100019, '中国深圳罗湖区蔡屋围深南东路260号华润大厦48室', 461784.14);
INSERT INTO `farmer` VALUES (100023, '中国广州市白云区机场路棠苑街五巷999号35号楼', 508194.81);
INSERT INTO `farmer` VALUES (100024, '中国成都市成华区双庆路696号26号楼', 576179.41);
INSERT INTO `farmer` VALUES (100027, '中国北京市延庆区028县道91号3栋', 507990.40);
INSERT INTO `farmer` VALUES (100028, '中国成都市锦江区红星路三段696号华润大厦46室', 226735.30);
INSERT INTO `farmer` VALUES (100030, '中国深圳罗湖区蔡屋围深南东路623号20号楼', 79926.29);
INSERT INTO `farmer` VALUES (100032, '中国深圳福田区深南大道378号华润大厦44室', 382210.74);
INSERT INTO `farmer` VALUES (100033, '中国广州市白云区小坪东路568号25号楼', 554392.99);
INSERT INTO `farmer` VALUES (100034, '中国中山紫马岭商圈中山五路927号33楼', 883847.03);
INSERT INTO `farmer` VALUES (100035, '中国中山乐丰六路716号40室', 694384.12);
INSERT INTO `farmer` VALUES (100037, '中国北京市东城区东单王府井东街591号华润大厦9室', 512048.90);
INSERT INTO `farmer` VALUES (100038, '中国东莞东泰五街871号25楼', 897905.74);
INSERT INTO `farmer` VALUES (100039, '中国深圳福田区景田东一街896号29号楼', 915802.47);
INSERT INTO `farmer` VALUES (100043, '中国上海市浦东新区健祥路828号25室', 161193.28);
INSERT INTO `farmer` VALUES (100046, '中国上海市徐汇区虹桥路421号26号楼', 606707.81);
INSERT INTO `farmer` VALUES (100049, '中国北京市西城区复兴门内大街297号39楼', 179210.40);
INSERT INTO `farmer` VALUES (100050, '中国中山紫马岭商圈中山五路57号9室', 796063.01);
INSERT INTO `farmer` VALUES (100052, '中国中山京华商圈华夏街484号25栋', 996358.61);
INSERT INTO `farmer` VALUES (100053, '中国中山天河区大信商圈大信南路929号华润大厦43室', 553214.89);
INSERT INTO `farmer` VALUES (100054, '中国北京市西城区西長安街592号17号楼', 611455.68);
INSERT INTO `farmer` VALUES (100055, '中国中山紫马岭商圈中山五路369号华润大厦42室', 63320.08);
INSERT INTO `farmer` VALUES (100057, '中国北京市東城区東直門內大街723号华润大厦8室', 138039.10);
INSERT INTO `farmer` VALUES (100059, '中国东莞珊瑚路425号31栋', 441439.25);
INSERT INTO `farmer` VALUES (100060, '中国东莞珊瑚路986号华润大厦36室', 181642.22);
INSERT INTO `farmer` VALUES (100061, '中国中山紫马岭商圈中山五路558号2楼', 59965.60);
INSERT INTO `farmer` VALUES (100065, '中国东莞坑美十五巷520号11室', 696917.02);
INSERT INTO `farmer` VALUES (100066, '中国上海市徐汇区虹桥路974号22楼', 43679.96);
INSERT INTO `farmer` VALUES (100070, '中国中山京华商圈华夏街233号29栋', 851522.64);
INSERT INTO `farmer` VALUES (100073, '中国深圳福田区景田东一街950号华润大厦46室', 511167.99);
INSERT INTO `farmer` VALUES (100077, '中国中山京华商圈华夏街161号37号楼', 768357.41);
INSERT INTO `farmer` VALUES (100079, '中国上海市浦东新区橄榄路701号31栋', 883113.01);
INSERT INTO `farmer` VALUES (100080, '中国上海市徐汇区虹桥路226号23号楼', 15254.14);
INSERT INTO `farmer` VALUES (100081, '中国上海市黄浦区淮海中路754号39号楼', 11843.08);
INSERT INTO `farmer` VALUES (100083, '中国北京市延庆区028县道972号27号楼', 515606.48);
INSERT INTO `farmer` VALUES (100084, '中国中山天河区大信商圈大信南路328号22栋', 186246.42);
INSERT INTO `farmer` VALUES (100086, '中国成都市成华区双庆路986号23号楼', 659076.73);
INSERT INTO `farmer` VALUES (100087, '中国东莞东泰五街112号32栋', 506512.08);
INSERT INTO `farmer` VALUES (100090, '中国成都市成华区二仙桥东三路210号46楼', 251290.92);
INSERT INTO `farmer` VALUES (100091, '中国北京市西城区西長安街434号39栋', 279029.10);
INSERT INTO `farmer` VALUES (100095, '中国深圳龙岗区布吉镇西环路672号22楼', 532878.31);
INSERT INTO `farmer` VALUES (100096, '中国北京市西城区西長安街230号华润大厦30室', 845119.06);
INSERT INTO `farmer` VALUES (100097, '中国上海市浦东新区健祥路842号32栋', 693381.31);
INSERT INTO `farmer` VALUES (100099, '中国北京市西城区复兴门内大街604号2室', 663498.38);
INSERT INTO `farmer` VALUES (100104, '中国北京市西城区复兴门内大街354号11栋', 911056.10);
INSERT INTO `farmer` VALUES (100106, '中国深圳福田区景田东一街193号44栋', 463178.02);
INSERT INTO `farmer` VALUES (100111, '中国北京市海淀区清河中街68号724号28室', 24443.33);
INSERT INTO `farmer` VALUES (100112, '中国北京市朝阳区三里屯路996号5室', 892923.77);
INSERT INTO `farmer` VALUES (100113, '中国上海市徐汇区虹桥路960号华润大厦14室', 905586.91);
INSERT INTO `farmer` VALUES (100114, '中国深圳罗湖区蔡屋围深南东路450号8号楼', 211719.48);
INSERT INTO `farmer` VALUES (100116, '中国深圳罗湖区清水河一路87号28室', 384793.99);
INSERT INTO `farmer` VALUES (100117, '中国深圳罗湖区清水河一路809号华润大厦13室', 444002.33);
INSERT INTO `farmer` VALUES (100118, '中国东莞环区南街二巷430号46楼', 461985.25);
INSERT INTO `farmer` VALUES (100124, '中国上海市黄浦区淮海中路210号10楼', 762121.33);
INSERT INTO `farmer` VALUES (100125, '中国成都市锦江区人民南路四段361号14号楼', 778205.20);
INSERT INTO `farmer` VALUES (100126, '中国上海市浦东新区健祥路831号华润大厦15室', 345145.91);
INSERT INTO `farmer` VALUES (100127, '中国北京市房山区岳琉路190号50室', 474415.98);
INSERT INTO `farmer` VALUES (100129, '中国广州市白云区小坪东路265号华润大厦6室', 269829.48);
INSERT INTO `farmer` VALUES (100130, '中国东莞东泰五街642号3栋', 664478.03);
INSERT INTO `farmer` VALUES (100133, '中国东莞珊瑚路929号22号楼', 268412.89);
INSERT INTO `farmer` VALUES (100134, '中国中山京华商圈华夏街354号20楼', 47161.65);
INSERT INTO `farmer` VALUES (100136, '中国北京市延庆区028县道263号42室', 651420.64);
INSERT INTO `farmer` VALUES (100138, '中国上海市浦东新区健祥路534号华润大厦22室', 446719.36);
INSERT INTO `farmer` VALUES (100140, '中国广州市越秀区中山二路825号10室', 456364.39);
INSERT INTO `farmer` VALUES (100141, '中国上海市闵行区宾川路29号35室', 309729.05);
INSERT INTO `farmer` VALUES (100142, '中国北京市西城区复兴门内大街962号6号楼', 442527.67);
INSERT INTO `farmer` VALUES (100145, '中国广州市白云区机场路棠苑街五巷325号7室', 300580.28);
INSERT INTO `farmer` VALUES (100149, '中国深圳罗湖区清水河一路521号14室', 737952.90);
INSERT INTO `farmer` VALUES (100150, '中国北京市朝阳区三里屯路187号33室', 939268.31);
INSERT INTO `farmer` VALUES (100152, '中国深圳罗湖区清水河一路17号24栋', 123282.41);
INSERT INTO `farmer` VALUES (100154, '中国成都市成华区二仙桥东三路504号29栋', 64382.66);
INSERT INTO `farmer` VALUES (100157, '中国北京市东城区东单王府井东街32号8栋', 131177.28);
INSERT INTO `farmer` VALUES (100158, '中国成都市成华区双庆路578号华润大厦37室', 739141.84);
INSERT INTO `farmer` VALUES (100159, '中国深圳福田区景田东一街39号30楼', 228251.40);
INSERT INTO `farmer` VALUES (100161, '中国广州市白云区小坪东路71号50号楼', 792411.17);
INSERT INTO `farmer` VALUES (100162, '中国北京市朝阳区三里屯路93号华润大厦46室', 196341.61);
INSERT INTO `farmer` VALUES (100166, '中国北京市房山区岳琉路982号华润大厦19室', 46806.47);
INSERT INTO `farmer` VALUES (100167, '中国上海市浦东新区橄榄路499号华润大厦35室', 469114.98);
INSERT INTO `farmer` VALUES (100168, '中国中山紫马岭商圈中山五路197号14号楼', 25160.80);
INSERT INTO `farmer` VALUES (100169, '中国北京市西城区西長安街186号41号楼', 940867.38);
INSERT INTO `farmer` VALUES (100172, '中国深圳福田区景田东一街284号3栋', 748611.71);
INSERT INTO `farmer` VALUES (100174, '中国东莞珊瑚路422号42号楼', 366411.25);
INSERT INTO `farmer` VALUES (100176, '中国成都市成华区二仙桥东三路667号40室', 875522.78);
INSERT INTO `farmer` VALUES (100177, '中国东莞珊瑚路594号32楼', 127449.24);
INSERT INTO `farmer` VALUES (100178, '中国上海市黄浦区淮海中路705号50号楼', 876215.04);
INSERT INTO `farmer` VALUES (100181, '中国深圳罗湖区清水河一路944号45室', 297933.70);
INSERT INTO `farmer` VALUES (100182, '中国中山紫马岭商圈中山五路305号华润大厦14室', 824706.99);
INSERT INTO `farmer` VALUES (100183, '中国广州市白云区机场路棠苑街五巷804号3栋', 512571.62);
INSERT INTO `farmer` VALUES (100185, '中国北京市西城区西長安街245号31室', 801802.44);
INSERT INTO `farmer` VALUES (100186, '中国深圳罗湖区田贝一路483号20栋', 206044.34);
INSERT INTO `farmer` VALUES (100187, '中国成都市锦江区人民南路四段291号42栋', 530065.78);
INSERT INTO `farmer` VALUES (100190, '中国深圳罗湖区清水河一路620号40楼', 555674.16);
INSERT INTO `farmer` VALUES (100191, '中国北京市东城区东单王府井东街410号华润大厦39室', 839939.50);
INSERT INTO `farmer` VALUES (100192, '中国广州市海珠区江南西路783号46楼', 176429.05);
INSERT INTO `farmer` VALUES (100194, '中国深圳罗湖区清水河一路12号华润大厦38室', 783993.61);
INSERT INTO `farmer` VALUES (100198, '中国上海市黄浦区淮海中路79号44楼', 42354.01);
INSERT INTO `farmer` VALUES (100200, '中国成都市成华区二仙桥东三路686号24栋', 570191.53);
INSERT INTO `farmer` VALUES (100201, '中国深圳福田区景田东一街553号34室', 544491.34);
INSERT INTO `farmer` VALUES (100202, '中国上海市浦东新区橄榄路24号华润大厦35室', 977183.22);
INSERT INTO `farmer` VALUES (100203, '中国北京市房山区岳琉路740号11栋', 909415.04);
INSERT INTO `farmer` VALUES (100205, '中国中山京华商圈华夏街274号华润大厦1室', 125261.30);
INSERT INTO `farmer` VALUES (100211, '中国广州市天河区天河路824号39楼', 91610.16);
INSERT INTO `farmer` VALUES (100217, '中国中山天河区大信商圈大信南路335号47室', 551147.00);
INSERT INTO `farmer` VALUES (100220, '中国北京市西城区复兴门内大街347号14室', 296515.01);
INSERT INTO `farmer` VALUES (100221, '中国上海市黄浦区淮海中路105号8号楼', 285720.70);
INSERT INTO `farmer` VALUES (100222, '中国东莞坑美十五巷581号5号楼', 298446.96);
INSERT INTO `farmer` VALUES (100224, '中国上海市闵行区宾川路496号37号楼', 981347.96);
INSERT INTO `farmer` VALUES (100226, '中国北京市东城区东单王府井东街895号31号楼', 651236.02);
INSERT INTO `farmer` VALUES (100227, '中国北京市海淀区清河中街68号786号1楼', 438.93);
INSERT INTO `farmer` VALUES (100228, '中国上海市黄浦区淮海中路822号19号楼', 447052.07);
INSERT INTO `farmer` VALUES (100229, '中国成都市锦江区红星路三段138号18室', 991204.63);
INSERT INTO `farmer` VALUES (100230, '中国北京市朝阳区三里屯路850号16室', 55259.47);
INSERT INTO `farmer` VALUES (100231, '中国广州市海珠区江南西路124号华润大厦23室', 66342.92);
INSERT INTO `farmer` VALUES (100232, '中国北京市朝阳区三里屯路732号45楼', 724619.02);
INSERT INTO `farmer` VALUES (100233, '中国北京市西城区复兴门内大街226号23栋', 606279.05);
INSERT INTO `farmer` VALUES (100234, '中国深圳福田区深南大道536号9楼', 193699.31);
INSERT INTO `farmer` VALUES (100237, '中国北京市海淀区清河中街68号540号44栋', 640736.61);
INSERT INTO `farmer` VALUES (100239, '中国成都市锦江区人民南路四段668号8栋', 619575.52);
INSERT INTO `farmer` VALUES (100245, '中国中山京华商圈华夏街143号27室', 735382.23);
INSERT INTO `farmer` VALUES (100250, '中国北京市房山区岳琉路270号45号楼', 197691.83);
INSERT INTO `farmer` VALUES (100253, '中国上海市徐汇区虹桥路186号20楼', 313874.76);
INSERT INTO `farmer` VALUES (100256, '中国中山乐丰六路635号47室', 792284.56);
INSERT INTO `farmer` VALUES (100262, '中国北京市東城区東直門內大街596号33楼', 199578.20);
INSERT INTO `farmer` VALUES (100265, '中国深圳龙岗区布吉镇西环路835号5室', 394151.29);
INSERT INTO `farmer` VALUES (100266, '中国东莞珊瑚路914号46栋', 648492.49);
INSERT INTO `farmer` VALUES (100272, '中国上海市黄浦区淮海中路317号16楼', 42054.81);
INSERT INTO `farmer` VALUES (100273, '中国东莞珊瑚路161号华润大厦15室', 12658.94);
INSERT INTO `farmer` VALUES (100274, '中国深圳龙岗区学园一巷857号15室', 800824.58);
INSERT INTO `farmer` VALUES (100277, '中国成都市锦江区红星路三段947号8楼', 435168.81);
INSERT INTO `farmer` VALUES (100278, '中国深圳罗湖区田贝一路751号22楼', 572144.33);
INSERT INTO `farmer` VALUES (100283, '中国上海市黄浦区淮海中路638号24楼', 56348.69);
INSERT INTO `farmer` VALUES (100284, '中国深圳福田区深南大道922号华润大厦27室', 289481.92);
INSERT INTO `farmer` VALUES (100286, '中国成都市成华区二仙桥东三路733号37栋', 475099.17);
INSERT INTO `farmer` VALUES (100288, '中国成都市成华区二仙桥东三路271号34室', 813087.83);
INSERT INTO `farmer` VALUES (100289, '中国中山天河区大信商圈大信南路396号8室', 813369.70);
INSERT INTO `farmer` VALUES (100292, '中国深圳福田区深南大道536号华润大厦21室', 17228.74);
INSERT INTO `farmer` VALUES (100299, '中国东莞环区南街二巷560号39号楼', 481932.33);
INSERT INTO `farmer` VALUES (100301, '中国北京市東城区東直門內大街380号36楼', 271885.51);
INSERT INTO `farmer` VALUES (100302, '中国广州市白云区小坪东路517号49栋', 248657.04);
INSERT INTO `farmer` VALUES (100303, '中国中山紫马岭商圈中山五路836号华润大厦18室', 38367.62);
INSERT INTO `farmer` VALUES (100304, '中国东莞珊瑚路497号9楼', 972232.99);
INSERT INTO `farmer` VALUES (100305, '中国深圳龙岗区布吉镇西环路31号8栋', 135195.31);
INSERT INTO `farmer` VALUES (100307, '中国广州市天河区天河路428号4栋', 764052.72);
INSERT INTO `farmer` VALUES (100311, '中国深圳罗湖区清水河一路71号33室', 644562.27);
INSERT INTO `farmer` VALUES (100312, '中国北京市延庆区028县道879号7室', 480252.65);
INSERT INTO `farmer` VALUES (100313, '中国成都市成华区双庆路121号11室', 282364.95);
INSERT INTO `farmer` VALUES (100315, '中国广州市白云区小坪东路541号47楼', 101240.84);
INSERT INTO `farmer` VALUES (100319, '中国广州市越秀区中山二路461号华润大厦42室', 689999.05);
INSERT INTO `farmer` VALUES (100320, '中国东莞珊瑚路631号华润大厦13室', 14856.92);
INSERT INTO `farmer` VALUES (100322, '中国中山天河区大信商圈大信南路272号华润大厦41室', 851980.70);
INSERT INTO `farmer` VALUES (100326, '中国东莞东泰五街312号35室', 216416.74);
INSERT INTO `farmer` VALUES (100327, '中国上海市黄浦区淮海中路357号36楼', 318647.06);
INSERT INTO `farmer` VALUES (100328, '中国广州市白云区小坪东路983号15室', 425476.56);
INSERT INTO `farmer` VALUES (100329, '中国上海市徐汇区虹桥路943号华润大厦34室', 945749.67);
INSERT INTO `farmer` VALUES (100331, '中国北京市延庆区028县道565号36栋', 293480.94);
INSERT INTO `farmer` VALUES (100332, '中国广州市白云区机场路棠苑街五巷833号41楼', 588201.07);
INSERT INTO `farmer` VALUES (100333, '中国中山乐丰六路671号20号楼', 848402.15);
INSERT INTO `farmer` VALUES (100334, '中国深圳龙岗区布吉镇西环路148号33室', 415682.81);
INSERT INTO `farmer` VALUES (100335, '中国深圳福田区景田东一街672号36栋', 852419.89);
INSERT INTO `farmer` VALUES (100337, '中国东莞坑美十五巷592号44室', 396219.42);
INSERT INTO `farmer` VALUES (100341, '中国北京市东城区东单王府井东街459号17号楼', 195753.72);
INSERT INTO `farmer` VALUES (100345, '中国北京市東城区東直門內大街543号10号楼', 342913.67);
INSERT INTO `farmer` VALUES (100346, '中国东莞坑美十五巷994号39号楼', 597294.00);
INSERT INTO `farmer` VALUES (100349, '中国深圳龙岗区布吉镇西环路482号29楼', 148508.13);
INSERT INTO `farmer` VALUES (100352, '中国北京市延庆区028县道7号华润大厦11室', 439912.19);
INSERT INTO `farmer` VALUES (100353, '中国中山乐丰六路949号12楼', 839144.37);
INSERT INTO `farmer` VALUES (100354, '中国北京市西城区西長安街977号16室', 923009.22);
INSERT INTO `farmer` VALUES (100356, '中国北京市海淀区清河中街68号610号4室', 356731.48);
INSERT INTO `farmer` VALUES (100358, '中国深圳罗湖区蔡屋围深南东路369号26栋', 17298.63);
INSERT INTO `farmer` VALUES (100359, '中国中山乐丰六路238号36室', 772536.44);
INSERT INTO `farmer` VALUES (100362, '中国深圳福田区深南大道998号3室', 937662.01);
INSERT INTO `farmer` VALUES (100363, '中国广州市天河区天河路724号33号楼', 8354.90);
INSERT INTO `farmer` VALUES (100364, '中国成都市锦江区人民南路四段664号华润大厦32室', 495459.03);
INSERT INTO `farmer` VALUES (100365, '中国中山乐丰六路902号8室', 964008.42);
INSERT INTO `farmer` VALUES (100366, '中国北京市海淀区清河中街68号805号华润大厦22室', 39824.38);
INSERT INTO `farmer` VALUES (100367, '中国广州市白云区机场路棠苑街五巷794号23栋', 188766.07);
INSERT INTO `farmer` VALUES (100369, '中国北京市西城区复兴门内大街707号35楼', 252402.38);
INSERT INTO `farmer` VALUES (100370, '中国北京市東城区東直門內大街363号15栋', 894902.94);
INSERT INTO `farmer` VALUES (100372, '中国北京市东城区东单王府井东街672号3楼', 305431.83);
INSERT INTO `farmer` VALUES (100374, '中国广州市白云区小坪东路135号36栋', 633377.16);
INSERT INTO `farmer` VALUES (100386, '中国广州市白云区小坪东路507号华润大厦29室', 716381.95);
INSERT INTO `farmer` VALUES (100387, '中国成都市锦江区人民南路四段15号18号楼', 208494.45);
INSERT INTO `farmer` VALUES (100388, '中国上海市黄浦区淮海中路586号华润大厦15室', 376477.46);
INSERT INTO `farmer` VALUES (100389, '中国北京市西城区西長安街81号50号楼', 395751.09);
INSERT INTO `farmer` VALUES (100393, '中国北京市东城区东单王府井东街207号50栋', 322931.10);
INSERT INTO `farmer` VALUES (100394, '中国东莞环区南街二巷421号华润大厦33室', 53040.66);
INSERT INTO `farmer` VALUES (100395, '中国深圳龙岗区布吉镇西环路539号22栋', 286803.80);
INSERT INTO `farmer` VALUES (100397, '中国上海市徐汇区虹桥路123号41号楼', 756538.37);
INSERT INTO `farmer` VALUES (100398, '中国广州市白云区小坪东路63号华润大厦4室', 324767.27);
INSERT INTO `farmer` VALUES (100399, '中国中山紫马岭商圈中山五路963号41号楼', 130620.23);
INSERT INTO `farmer` VALUES (100400, '中国成都市成华区二仙桥东三路149号15室', 957121.35);
INSERT INTO `farmer` VALUES (100402, '中国深圳罗湖区清水河一路403号29室', 377482.14);
INSERT INTO `farmer` VALUES (100404, '中国深圳龙岗区学园一巷633号16栋', 182009.03);
INSERT INTO `farmer` VALUES (100405, '中国广州市白云区机场路棠苑街五巷58号27室', 298828.31);
INSERT INTO `farmer` VALUES (100409, '中国深圳龙岗区布吉镇西环路539号22栋', 851547.31);
INSERT INTO `farmer` VALUES (100412, '中国上海市徐汇区虹桥路123号41号楼', 509062.37);
INSERT INTO `farmer` VALUES (100422, '中国广州市白云区小坪东路63号华润大厦4室', 908368.24);
INSERT INTO `farmer` VALUES (100424, '中国中山紫马岭商圈中山五路963号41号楼', 914102.52);
INSERT INTO `farmer` VALUES (100425, '中国成都市成华区二仙桥东三路149号15室', 686707.51);
INSERT INTO `farmer` VALUES (100428, '中国深圳罗湖区清水河一路403号29室', 614982.87);
INSERT INTO `farmer` VALUES (100431, '中国深圳龙岗区学园一巷633号16栋', 835054.74);
INSERT INTO `farmer` VALUES (100432, '中国广州市白云区机场路棠苑街五巷58号27室', 93381.40);
INSERT INTO `farmer` VALUES (100437, '中国中山京华商圈华夏街357号2栋', 686998.56);
INSERT INTO `farmer` VALUES (100438, '中国成都市成华区二仙桥东三路924号5室', 7245.88);
INSERT INTO `farmer` VALUES (100442, '中国上海市徐汇区虹桥路354号33楼', 259542.23);
INSERT INTO `farmer` VALUES (100443, '中国深圳罗湖区蔡屋围深南东路664号27号楼', 274069.29);
INSERT INTO `farmer` VALUES (100446, '中国上海市闵行区宾川路123号华润大厦42室', 294010.89);
INSERT INTO `farmer` VALUES (100449, '中国北京市房山区岳琉路884号华润大厦5室', 360789.08);
INSERT INTO `farmer` VALUES (100450, '中国深圳罗湖区清水河一路602号43楼', 590742.34);
INSERT INTO `farmer` VALUES (100453, '中国东莞环区南街二巷582号华润大厦47室', 876106.55);
INSERT INTO `farmer` VALUES (100456, '中国成都市锦江区红星路三段539号14栋', 135688.89);
INSERT INTO `farmer` VALUES (100458, '中国深圳罗湖区田贝一路482号华润大厦25室', 450352.08);
INSERT INTO `farmer` VALUES (100459, '中国广州市越秀区中山二路793号32号楼', 198994.74);
INSERT INTO `farmer` VALUES (100462, '中国上海市黄浦区淮海中路901号华润大厦26室', 283556.32);
INSERT INTO `farmer` VALUES (100464, '中国上海市浦东新区健祥路953号50室', 665251.20);
INSERT INTO `farmer` VALUES (100465, '中国深圳罗湖区蔡屋围深南东路375号16栋', 556185.69);
INSERT INTO `farmer` VALUES (100466, '中国深圳龙岗区学园一巷263号37栋', 651796.12);
INSERT INTO `farmer` VALUES (100467, '中国深圳龙岗区学园一巷369号11室', 670514.21);
INSERT INTO `farmer` VALUES (100470, '中国东莞坑美十五巷302号华润大厦6室', 569540.61);
INSERT INTO `farmer` VALUES (100472, '中国中山京华商圈华夏街554号33楼', 815227.00);
INSERT INTO `farmer` VALUES (100473, '中国北京市東城区東直門內大街352号38室', 310382.79);
INSERT INTO `farmer` VALUES (100475, '中国北京市東城区東直門內大街948号华润大厦23室', 638637.91);
INSERT INTO `farmer` VALUES (100476, '中国中山天河区大信商圈大信南路687号22栋', 569990.69);
INSERT INTO `farmer` VALUES (100478, '中国中山紫马岭商圈中山五路595号45室', 550986.74);
INSERT INTO `farmer` VALUES (100479, '中国广州市越秀区中山二路614号10栋', 559316.62);
INSERT INTO `farmer` VALUES (100484, '中国广州市越秀区中山二路614号10栋', 866411.57);
INSERT INTO `farmer` VALUES (100486, '中国深圳罗湖区清水河一路12号华润大厦38室', 480172.16);
INSERT INTO `farmer` VALUES (100489, '中国上海市黄浦区淮海中路79号44楼', 588752.84);
INSERT INTO `farmer` VALUES (100490, '中国成都市成华区二仙桥东三路686号24栋', 701798.59);
INSERT INTO `farmer` VALUES (100491, '中国深圳福田区景田东一街553号34室', 561096.28);
INSERT INTO `farmer` VALUES (100492, '中国上海市浦东新区橄榄路24号华润大厦35室', 537741.15);
INSERT INTO `farmer` VALUES (100493, '中国北京市房山区岳琉路740号11栋', 132190.94);
INSERT INTO `farmer` VALUES (100497, '中国中山京华商圈华夏街274号华润大厦1室', 132047.62);
INSERT INTO `farmer` VALUES (100502, '中国广州市天河区天河路824号39楼', 682505.85);
INSERT INTO `farmer` VALUES (100503, '中国中山天河区大信商圈大信南路335号47室', 528516.81);
INSERT INTO `farmer` VALUES (100504, '中国北京市西城区复兴门内大街347号14室', 100323.54);
INSERT INTO `farmer` VALUES (100508, '中国上海市黄浦区淮海中路105号8号楼', 918990.54);
INSERT INTO `farmer` VALUES (100509, '中国东莞坑美十五巷581号5号楼', 237385.10);
INSERT INTO `farmer` VALUES (100511, '中国上海市闵行区宾川路496号37号楼', 667193.27);
INSERT INTO `farmer` VALUES (100513, '中国北京市东城区东单王府井东街895号31号楼', 579438.43);
INSERT INTO `farmer` VALUES (100514, '中国北京市海淀区清河中街68号786号1楼', 747582.84);
INSERT INTO `farmer` VALUES (100516, '中国上海市黄浦区淮海中路822号19号楼', 412594.76);
INSERT INTO `farmer` VALUES (100517, '中国成都市锦江区红星路三段138号18室', 950885.25);
INSERT INTO `farmer` VALUES (100520, '中国北京市朝阳区三里屯路850号16室', 380621.87);
INSERT INTO `farmer` VALUES (100523, '中国广州市海珠区江南西路124号华润大厦23室', 68588.50);
INSERT INTO `farmer` VALUES (100524, '中国北京市朝阳区三里屯路732号45楼', 411944.88);
INSERT INTO `farmer` VALUES (100525, '中国北京市西城区复兴门内大街226号23栋', 406420.02);
INSERT INTO `farmer` VALUES (100526, '中国深圳福田区深南大道536号9楼', 734821.03);
INSERT INTO `farmer` VALUES (100527, '中国北京市海淀区清河中街68号540号44栋', 921722.43);
INSERT INTO `farmer` VALUES (100528, '中国成都市锦江区人民南路四段668号8栋', 973036.78);
INSERT INTO `farmer` VALUES (100529, '中国中山京华商圈华夏街143号27室', 986688.24);
INSERT INTO `farmer` VALUES (100531, '中国北京市房山区岳琉路270号45号楼', 325146.62);
INSERT INTO `farmer` VALUES (100532, '中国上海市徐汇区虹桥路186号20楼', 851951.98);
INSERT INTO `farmer` VALUES (100534, '中国中山乐丰六路635号47室', 992347.42);
INSERT INTO `farmer` VALUES (100535, '中国北京市東城区東直門內大街596号33楼', 629164.93);
INSERT INTO `farmer` VALUES (100536, '中国深圳龙岗区布吉镇西环路835号5室', 855143.30);
INSERT INTO `farmer` VALUES (100538, '中国东莞珊瑚路914号46栋', 926496.33);
INSERT INTO `farmer` VALUES (100539, '中国上海市黄浦区淮海中路317号16楼', 584346.73);
INSERT INTO `farmer` VALUES (100540, '中国东莞珊瑚路161号华润大厦15室', 783850.20);
INSERT INTO `farmer` VALUES (100541, '中国深圳龙岗区学园一巷857号15室', 331832.63);
INSERT INTO `farmer` VALUES (100542, '中国成都市锦江区红星路三段947号8楼', 554547.84);
INSERT INTO `farmer` VALUES (100544, '中国深圳罗湖区田贝一路751号22楼', 608419.85);
INSERT INTO `farmer` VALUES (100548, '中国上海市黄浦区淮海中路638号24楼', 643948.39);
INSERT INTO `farmer` VALUES (100550, '中国深圳福田区深南大道922号华润大厦27室', 584188.86);
INSERT INTO `farmer` VALUES (100552, '中国成都市成华区二仙桥东三路733号37栋', 915078.86);
INSERT INTO `farmer` VALUES (100557, '中国成都市成华区二仙桥东三路271号34室', 789874.68);
INSERT INTO `farmer` VALUES (100558, '中国中山天河区大信商圈大信南路396号8室', 369328.02);
INSERT INTO `farmer` VALUES (100560, '中国深圳福田区深南大道536号华润大厦21室', 413786.91);
INSERT INTO `farmer` VALUES (100561, '中国东莞环区南街二巷560号39号楼', 439592.64);
INSERT INTO `farmer` VALUES (100562, '中国北京市東城区東直門內大街380号36楼', 463908.15);
INSERT INTO `farmer` VALUES (100563, '中国广州市白云区小坪东路517号49栋', 317148.34);
INSERT INTO `farmer` VALUES (100564, '中国中山紫马岭商圈中山五路836号华润大厦18室', 985574.82);
INSERT INTO `farmer` VALUES (100566, '中国东莞珊瑚路497号9楼', 47803.17);
INSERT INTO `farmer` VALUES (100567, '中国深圳龙岗区布吉镇西环路31号8栋', 493574.45);
INSERT INTO `farmer` VALUES (100570, '中国广州市天河区天河路428号4栋', 928114.50);
INSERT INTO `farmer` VALUES (100571, '中国深圳罗湖区清水河一路71号33室', 310365.90);
INSERT INTO `farmer` VALUES (100572, '中国北京市延庆区028县道879号7室', 354836.93);
INSERT INTO `farmer` VALUES (100573, '中国成都市成华区双庆路121号11室', 54927.61);
INSERT INTO `farmer` VALUES (100574, '中国广州市白云区小坪东路541号47楼', 841477.55);
INSERT INTO `farmer` VALUES (100578, '中国广州市越秀区中山二路461号华润大厦42室', 739762.93);
INSERT INTO `farmer` VALUES (100579, '中国东莞珊瑚路631号华润大厦13室', 847715.44);
INSERT INTO `farmer` VALUES (100580, '中国中山天河区大信商圈大信南路272号华润大厦41室', 176453.02);
INSERT INTO `farmer` VALUES (100582, '中国东莞东泰五街312号35室', 893917.19);
INSERT INTO `farmer` VALUES (100585, '中国上海市黄浦区淮海中路357号36楼', 530864.41);
INSERT INTO `farmer` VALUES (100587, '中国广州市白云区小坪东路983号15室', 539136.45);
INSERT INTO `farmer` VALUES (100588, '中国上海市徐汇区虹桥路943号华润大厦34室', 388389.46);
INSERT INTO `farmer` VALUES (100589, '中国北京市延庆区028县道565号36栋', 457840.63);
INSERT INTO `farmer` VALUES (100591, '中国广州市白云区机场路棠苑街五巷833号41楼', 84476.78);
INSERT INTO `farmer` VALUES (100594, '中国中山乐丰六路671号20号楼', 115752.62);
INSERT INTO `farmer` VALUES (100595, '中国深圳龙岗区布吉镇西环路148号33室', 839054.94);
INSERT INTO `farmer` VALUES (100598, '中国深圳福田区景田东一街672号36栋', 310562.74);
INSERT INTO `farmer` VALUES (100599, '中国东莞坑美十五巷592号44室', 629421.07);
INSERT INTO `farmer` VALUES (100601, '中国北京市东城区东单王府井东街459号17号楼', 284624.76);
INSERT INTO `farmer` VALUES (100602, '中国北京市東城区東直門內大街543号10号楼', 475224.47);
INSERT INTO `farmer` VALUES (100606, '中国东莞坑美十五巷994号39号楼', 851547.31);
INSERT INTO `farmer` VALUES (100609, '中国深圳龙岗区布吉镇西环路482号29楼', 509062.37);
INSERT INTO `farmer` VALUES (100610, '中国北京市延庆区028县道7号华润大厦11室', 908368.24);
INSERT INTO `farmer` VALUES (100613, '中国中山乐丰六路949号12楼', 914102.52);
INSERT INTO `farmer` VALUES (100619, '中国北京市西城区西長安街977号16室', 686707.51);
INSERT INTO `farmer` VALUES (100620, '中国北京市海淀区清河中街68号610号4室', 614982.87);
INSERT INTO `farmer` VALUES (100621, '中国深圳罗湖区蔡屋围深南东路369号26栋', 835054.74);
INSERT INTO `farmer` VALUES (100624, '中国中山乐丰六路238号36室', 93381.40);
INSERT INTO `farmer` VALUES (100625, '中国深圳福田区深南大道998号3室', 686998.56);
INSERT INTO `farmer` VALUES (100626, '中国广州市天河区天河路724号33号楼', 7245.88);
INSERT INTO `farmer` VALUES (100629, '中国成都市锦江区人民南路四段664号华润大厦32室', 259542.23);
INSERT INTO `farmer` VALUES (100630, '中国中山乐丰六路902号8室', 274069.29);
INSERT INTO `farmer` VALUES (100631, '中国北京市海淀区清河中街68号805号华润大厦22室', 294010.89);
INSERT INTO `farmer` VALUES (100635, '中国广州市白云区机场路棠苑街五巷794号23栋', 360789.08);
INSERT INTO `farmer` VALUES (100636, '中国北京市西城区复兴门内大街707号35楼', 590742.34);
INSERT INTO `farmer` VALUES (100637, '中国北京市東城区東直門內大街363号15栋', 876106.55);
INSERT INTO `farmer` VALUES (100638, '中国北京市东城区东单王府井东街672号3楼', 135688.89);
INSERT INTO `farmer` VALUES (100640, '中国广州市白云区小坪东路135号36栋', 450352.08);
INSERT INTO `farmer` VALUES (100641, '中国广州市白云区小坪东路507号华润大厦29室', 198994.74);
INSERT INTO `farmer` VALUES (100645, '中国成都市锦江区人民南路四段15号18号楼', 283556.32);
INSERT INTO `farmer` VALUES (100647, '中国上海市黄浦区淮海中路586号华润大厦15室', 665251.20);
INSERT INTO `farmer` VALUES (100649, '中国北京市西城区西長安街81号50号楼', 556185.69);
INSERT INTO `farmer` VALUES (100650, '中国北京市东城区东单王府井东街207号50栋', 651796.12);
INSERT INTO `farmer` VALUES (100653, '中国东莞环区南街二巷421号华润大厦33室', 670514.21);
INSERT INTO `farmer` VALUES (100654, '中国深圳龙岗区布吉镇西环路539号22栋', 569540.61);
INSERT INTO `farmer` VALUES (100655, '中国上海市徐汇区虹桥路123号41号楼', 815227.00);
INSERT INTO `farmer` VALUES (100656, '中国广州市白云区小坪东路63号华润大厦4室', 310382.79);
INSERT INTO `farmer` VALUES (100657, '中国深圳罗湖区清水河一路12号华润大厦38室', 638637.91);
INSERT INTO `farmer` VALUES (100658, '中国上海市黄浦区淮海中路79号44楼', 569990.69);
INSERT INTO `farmer` VALUES (100660, '中国成都市成华区二仙桥东三路686号24栋', 550986.74);
INSERT INTO `farmer` VALUES (100664, '中国深圳福田区景田东一街553号34室', 559316.62);
INSERT INTO `farmer` VALUES (100665, '中国上海市浦东新区橄榄路24号华润大厦35室', 866411.57);
INSERT INTO `farmer` VALUES (100666, '中国北京市房山区岳琉路740号11栋', 480172.16);
INSERT INTO `farmer` VALUES (100668, '中国中山京华商圈华夏街274号华润大厦1室', 588752.84);
INSERT INTO `farmer` VALUES (100669, '中国广州市天河区天河路824号39楼', 701798.59);
INSERT INTO `farmer` VALUES (100672, '中国中山天河区大信商圈大信南路335号47室', 561096.28);
INSERT INTO `farmer` VALUES (100680, '中国北京市西城区复兴门内大街347号14室', 537741.15);
INSERT INTO `farmer` VALUES (100681, '中国上海市黄浦区淮海中路105号8号楼', 132190.94);
INSERT INTO `farmer` VALUES (100682, '中国东莞坑美十五巷581号5号楼', 132047.62);
INSERT INTO `farmer` VALUES (100683, '中国上海市闵行区宾川路496号37号楼', 682505.85);
INSERT INTO `farmer` VALUES (100684, '中国北京市东城区东单王府井东街895号31号楼', 528516.81);
INSERT INTO `farmer` VALUES (100685, '中国北京市海淀区清河中街68号786号1楼', 100323.54);
INSERT INTO `farmer` VALUES (100686, '中国上海市黄浦区淮海中路822号19号楼', 918990.54);
INSERT INTO `farmer` VALUES (100687, '中国成都市锦江区红星路三段138号18室', 237385.10);
INSERT INTO `farmer` VALUES (100690, '中国北京市朝阳区三里屯路850号16室', 667193.27);
INSERT INTO `farmer` VALUES (100691, '中国广州市海珠区江南西路124号华润大厦23室', 579438.43);
INSERT INTO `farmer` VALUES (100692, '中国北京市朝阳区三里屯路732号45楼', 747582.84);
INSERT INTO `farmer` VALUES (100697, '中国北京市西城区复兴门内大街226号23栋', 412594.76);
INSERT INTO `farmer` VALUES (100700, '中国深圳福田区深南大道536号9楼', 950885.25);
INSERT INTO `farmer` VALUES (100701, '中国北京市海淀区清河中街68号540号44栋', 380621.87);
INSERT INTO `farmer` VALUES (100703, '中国成都市锦江区人民南路四段668号8栋', 68588.50);
INSERT INTO `farmer` VALUES (100705, '中国中山京华商圈华夏街143号27室', 411944.88);
INSERT INTO `farmer` VALUES (100708, '中国北京市房山区岳琉路270号45号楼', 406420.02);
INSERT INTO `farmer` VALUES (100710, '中国上海市徐汇区虹桥路186号20楼', 734821.03);
INSERT INTO `farmer` VALUES (100715, '中国中山乐丰六路635号47室', 921722.43);
INSERT INTO `farmer` VALUES (100716, '中国北京市東城区東直門內大街596号33楼', 973036.78);
INSERT INTO `farmer` VALUES (100718, '中国深圳龙岗区布吉镇西环路835号5室', 986688.24);
INSERT INTO `farmer` VALUES (100719, '中国东莞珊瑚路914号46栋', 325146.62);
INSERT INTO `farmer` VALUES (100720, '中国上海市黄浦区淮海中路317号16楼', 851951.98);
INSERT INTO `farmer` VALUES (100722, '中国东莞珊瑚路161号华润大厦15室', 992347.42);
INSERT INTO `farmer` VALUES (100724, '中国深圳龙岗区学园一巷857号15室', 629164.93);
INSERT INTO `farmer` VALUES (100725, '中国成都市锦江区红星路三段947号8楼', 855143.30);
INSERT INTO `farmer` VALUES (100726, '中国深圳罗湖区田贝一路751号22楼', 926496.33);
INSERT INTO `farmer` VALUES (100727, '中国上海市黄浦区淮海中路638号24楼', 584346.73);
INSERT INTO `farmer` VALUES (100729, '中国深圳福田区深南大道922号华润大厦27室', 783850.20);
INSERT INTO `farmer` VALUES (100730, '中国成都市成华区二仙桥东三路733号37栋', 331832.63);
INSERT INTO `farmer` VALUES (100731, '中国成都市成华区二仙桥东三路271号34室', 554547.84);
INSERT INTO `farmer` VALUES (100732, '中国中山天河区大信商圈大信南路396号8室', 608419.85);
INSERT INTO `farmer` VALUES (100733, '中国深圳福田区深南大道536号华润大厦21室', 643948.39);
INSERT INTO `farmer` VALUES (100736, '中国东莞环区南街二巷560号39号楼', 584188.86);
INSERT INTO `farmer` VALUES (100737, '中国北京市東城区東直門內大街380号36楼', 915078.86);
INSERT INTO `farmer` VALUES (100738, '中国广州市白云区小坪东路517号49栋', 789874.68);
INSERT INTO `farmer` VALUES (100739, '中国中山紫马岭商圈中山五路836号华润大厦18室', 369328.02);
INSERT INTO `farmer` VALUES (100740, '中国东莞珊瑚路497号9楼', 413786.91);
INSERT INTO `farmer` VALUES (100742, '中国深圳龙岗区布吉镇西环路31号8栋', 439592.64);
INSERT INTO `farmer` VALUES (100743, '中国广州市天河区天河路428号4栋', 463908.15);
INSERT INTO `farmer` VALUES (100744, '中国深圳罗湖区清水河一路71号33室', 317148.34);
INSERT INTO `farmer` VALUES (100745, '中国北京市延庆区028县道879号7室', 985574.82);
INSERT INTO `farmer` VALUES (100746, '中国成都市成华区双庆路121号11室', 47803.17);
INSERT INTO `farmer` VALUES (100747, '中国广州市白云区小坪东路541号47楼', 493574.45);
INSERT INTO `farmer` VALUES (100751, '中国广州市越秀区中山二路461号华润大厦42室', 928114.50);
INSERT INTO `farmer` VALUES (100753, '中国东莞珊瑚路631号华润大厦13室', 310365.90);
INSERT INTO `farmer` VALUES (100755, '中国中山天河区大信商圈大信南路272号华润大厦41室', 354836.93);
INSERT INTO `farmer` VALUES (100756, '中国东莞东泰五街312号35室', 54927.61);
INSERT INTO `farmer` VALUES (100758, '中国上海市黄浦区淮海中路357号36楼', 841477.55);
INSERT INTO `farmer` VALUES (100766, '中国广州市白云区小坪东路983号15室', 739762.93);
INSERT INTO `farmer` VALUES (100772, '中国上海市徐汇区虹桥路943号华润大厦34室', 847715.44);
INSERT INTO `farmer` VALUES (100773, '中国北京市延庆区028县道565号36栋', 176453.02);
INSERT INTO `farmer` VALUES (100776, '中国广州市白云区机场路棠苑街五巷833号41楼', 893917.19);
INSERT INTO `farmer` VALUES (100777, '中国中山乐丰六路671号20号楼', 530864.41);
INSERT INTO `farmer` VALUES (100778, '中国深圳龙岗区布吉镇西环路148号33室', 539136.45);
INSERT INTO `farmer` VALUES (100780, '中国深圳福田区景田东一街672号36栋', 388389.46);
INSERT INTO `farmer` VALUES (100781, '中国东莞坑美十五巷592号44室', 457840.63);
INSERT INTO `farmer` VALUES (100782, '中国北京市东城区东单王府井东街459号17号楼', 84476.78);
INSERT INTO `farmer` VALUES (100785, '中国北京市東城区東直門內大街543号10号楼', 115752.62);
INSERT INTO `farmer` VALUES (100786, '中国东莞坑美十五巷994号39号楼', 839054.94);
INSERT INTO `farmer` VALUES (100789, '中国深圳龙岗区布吉镇西环路482号29楼', 310562.74);
INSERT INTO `farmer` VALUES (100790, '中国北京市延庆区028县道7号华润大厦11室', 629421.07);
INSERT INTO `farmer` VALUES (100791, '中国中山乐丰六路949号12楼', 284624.76);
INSERT INTO `farmer` VALUES (100794, '中国北京市西城区西長安街977号16室', 475224.47);
INSERT INTO `farmer` VALUES (100797, '中国北京市海淀区清河中街68号610号4室', 851547.31);
INSERT INTO `farmer` VALUES (100798, '中国深圳罗湖区清水河一路837号3室', 509062.37);
INSERT INTO `farmer` VALUES (100799, '中国中山乐丰六路868号36室', 908368.24);
INSERT INTO `farmer` VALUES (100802, '中国中山京华商圈华夏街344号31号楼', 914102.52);
INSERT INTO `farmer` VALUES (100806, '中国成都市成华区双庆路11号19室', 686707.51);
INSERT INTO `farmer` VALUES (100807, '中国广州市白云区机场路棠苑街五巷439号19号楼', 614982.87);
INSERT INTO `farmer` VALUES (100809, '中国北京市房山区岳琉路13号华润大厦19室', 835054.74);
INSERT INTO `farmer` VALUES (100810, '中国深圳罗湖区清水河一路545号31号楼', 93381.40);
INSERT INTO `farmer` VALUES (100812, '中国北京市延庆区028县道107号华润大厦17室', 686998.56);
INSERT INTO `farmer` VALUES (100813, '中国广州市白云区机场路棠苑街五巷247号6室', 7245.88);
INSERT INTO `farmer` VALUES (100814, '中国深圳罗湖区蔡屋围深南东路777号50室', 259542.23);
INSERT INTO `farmer` VALUES (100815, '中国北京市海淀区清河中街68号550号22室', 274069.29);
INSERT INTO `farmer` VALUES (100818, '中国中山紫马岭商圈中山五路636号华润大厦36室', 294010.89);
INSERT INTO `farmer` VALUES (100820, '中国中山紫马岭商圈中山五路492号华润大厦27室', 360789.08);
INSERT INTO `farmer` VALUES (100821, '中国成都市成华区二仙桥东三路388号31栋', 590742.34);
INSERT INTO `farmer` VALUES (100823, '中国北京市海淀区清河中街68号751号1号楼', 876106.55);
INSERT INTO `farmer` VALUES (100824, '中国成都市成华区二仙桥东三路923号华润大厦17室', 135688.89);
INSERT INTO `farmer` VALUES (100825, '中国北京市朝阳区三里屯路14号1室', 450352.08);
INSERT INTO `farmer` VALUES (100826, '中国深圳福田区深南大道445号23楼', 198994.74);
INSERT INTO `farmer` VALUES (100827, '中国深圳龙岗区布吉镇西环路848号4楼', 283556.32);
INSERT INTO `farmer` VALUES (100828, '中国深圳龙岗区学园一巷793号26室', 665251.20);
INSERT INTO `farmer` VALUES (100829, '中国深圳龙岗区学园一巷384号华润大厦45室', 556185.69);
INSERT INTO `farmer` VALUES (100830, '中国深圳罗湖区清水河一路603号26室', 651796.12);
INSERT INTO `farmer` VALUES (100831, '中国中山京华商圈华夏街613号11号楼', 670514.21);
INSERT INTO `farmer` VALUES (100832, '中国北京市延庆区028县道284号43室', 569540.61);
INSERT INTO `farmer` VALUES (100835, '中国北京市房山区岳琉路59号3楼', 815227.00);
INSERT INTO `farmer` VALUES (100837, '中国深圳福田区景田东一街930号华润大厦30室', 310382.79);
INSERT INTO `farmer` VALUES (100838, '中国中山京华商圈华夏街179号1号楼', 638637.91);
INSERT INTO `farmer` VALUES (100839, '中国中山京华商圈华夏街708号35号楼', 569990.69);
INSERT INTO `farmer` VALUES (100840, '中国深圳罗湖区蔡屋围深南东路740号华润大厦34室', 550986.74);
INSERT INTO `farmer` VALUES (100843, '中国东莞东泰五街115号9号楼', 559316.62);
INSERT INTO `farmer` VALUES (100844, '中国广州市越秀区中山二路583号41室', 866411.57);
INSERT INTO `farmer` VALUES (100848, '中国东莞坑美十五巷713号46室', 480172.16);
INSERT INTO `farmer` VALUES (100849, '中国上海市黄浦区淮海中路614号22号楼', 588752.84);
INSERT INTO `farmer` VALUES (100850, '中国东莞东泰五街420号21栋', 701798.59);
INSERT INTO `farmer` VALUES (100851, '中国深圳福田区深南大道485号46室', 561096.28);
INSERT INTO `farmer` VALUES (100852, '中国北京市東城区東直門內大街291号41室', 537741.15);
INSERT INTO `farmer` VALUES (100855, '中国北京市東城区東直門內大街761号8楼', 132190.94);
INSERT INTO `farmer` VALUES (100856, '中国中山天河区大信商圈大信南路308号40栋', 132047.62);
INSERT INTO `farmer` VALUES (100857, '中国上海市徐汇区虹桥路70号35号楼', 682505.85);
INSERT INTO `farmer` VALUES (100858, '中国上海市黄浦区淮海中路921号11栋', 528516.81);
INSERT INTO `farmer` VALUES (100859, '中国广州市白云区机场路棠苑街五巷701号华润大厦39室', 100323.54);
INSERT INTO `farmer` VALUES (100860, '中国成都市成华区双庆路209号华润大厦13室', 918990.54);
INSERT INTO `farmer` VALUES (100861, '中国东莞环区南街二巷298号26室', 237385.10);
INSERT INTO `farmer` VALUES (100862, '中国中山京华商圈华夏街26号华润大厦39室', 667193.27);
INSERT INTO `farmer` VALUES (100864, '中国北京市延庆区028县道308号华润大厦10室', 579438.43);
INSERT INTO `farmer` VALUES (100866, '中国东莞东泰五街940号5楼', 747582.84);
INSERT INTO `farmer` VALUES (100867, '中国深圳福田区深南大道939号17楼', 412594.76);
INSERT INTO `farmer` VALUES (100869, '中国成都市成华区二仙桥东三路474号华润大厦34室', 950885.25);
INSERT INTO `farmer` VALUES (100872, '中国北京市西城区西長安街776号华润大厦32室', 380621.87);
INSERT INTO `farmer` VALUES (100873, '中国东莞坑美十五巷147号30楼', 68588.50);
INSERT INTO `farmer` VALUES (100875, '中国上海市浦东新区健祥路818号华润大厦48室', 411944.88);
INSERT INTO `farmer` VALUES (100876, '中国中山紫马岭商圈中山五路42号华润大厦5室', 406420.02);
INSERT INTO `farmer` VALUES (100877, '中国北京市房山区岳琉路325号12栋', 734821.03);
INSERT INTO `farmer` VALUES (100879, '中国北京市海淀区清河中街68号145号27号楼', 921722.43);
INSERT INTO `farmer` VALUES (100880, '中国广州市越秀区中山二路294号华润大厦19室', 973036.78);
INSERT INTO `farmer` VALUES (100882, '中国中山乐丰六路717号45号楼', 986688.24);
INSERT INTO `farmer` VALUES (100883, '中国东莞东泰五街278号华润大厦47室', 325146.62);
INSERT INTO `farmer` VALUES (100885, '中国北京市延庆区028县道206号49栋', 851951.98);
INSERT INTO `farmer` VALUES (100888, '中国成都市成华区玉双路6号725号13楼', 992347.42);
INSERT INTO `farmer` VALUES (100889, '中国北京市房山区岳琉路521号11号楼', 629164.93);
INSERT INTO `farmer` VALUES (100890, '中国北京市房山区岳琉路625号39号楼', 855143.30);
INSERT INTO `farmer` VALUES (100891, '中国上海市徐汇区虹桥路779号48栋', 926496.33);
INSERT INTO `farmer` VALUES (100893, '中国深圳福田区深南大道223号27栋', 584346.73);
INSERT INTO `farmer` VALUES (100895, '中国中山天河区大信商圈大信南路283号44楼', 783850.20);
INSERT INTO `farmer` VALUES (100900, '中国上海市徐汇区虹桥路694号华润大厦19室', 331832.63);
INSERT INTO `farmer` VALUES (100901, '中国成都市锦江区人民南路四段750号29室', 554547.84);
INSERT INTO `farmer` VALUES (100911, '中国北京市西城区西長安街581号46号楼', 608419.85);
INSERT INTO `farmer` VALUES (100913, '中国东莞坑美十五巷732号4号楼', 643948.39);
INSERT INTO `farmer` VALUES (100914, '中国上海市徐汇区虹桥路347号30栋', 584188.86);
INSERT INTO `farmer` VALUES (100918, '中国深圳福田区景田东一街705号41楼', 915078.86);
INSERT INTO `farmer` VALUES (100920, '中国中山京华商圈华夏街956号48号楼', 789874.68);
INSERT INTO `farmer` VALUES (100922, '中国中山紫马岭商圈中山五路811号21楼', 369328.02);
INSERT INTO `farmer` VALUES (100924, '中国广州市越秀区中山二路628号41室', 413786.91);
INSERT INTO `farmer` VALUES (100925, '中国上海市闵行区宾川路264号16室', 439592.64);
INSERT INTO `farmer` VALUES (100926, '中国广州市越秀区中山二路684号华润大厦14室', 463908.15);
INSERT INTO `farmer` VALUES (100927, '中国上海市浦东新区橄榄路511号5楼', 317148.34);
INSERT INTO `farmer` VALUES (100930, '中国中山乐丰六路780号7室', 985574.82);
INSERT INTO `farmer` VALUES (100933, '中国深圳罗湖区蔡屋围深南东路966号华润大厦44室', 47803.17);
INSERT INTO `farmer` VALUES (100934, '中国广州市白云区机场路棠苑街五巷861号华润大厦34室', 493574.45);
INSERT INTO `farmer` VALUES (100935, '中国北京市西城区西長安街936号33室', 928114.50);
INSERT INTO `farmer` VALUES (100936, '中国北京市西城区西長安街657号39室', 310365.90);
INSERT INTO `farmer` VALUES (100937, '中国东莞环区南街二巷45号10栋', 354836.93);
INSERT INTO `farmer` VALUES (100938, '中国东莞东泰五街850号1室', 54927.61);
INSERT INTO `farmer` VALUES (100940, '中国深圳罗湖区田贝一路581号40楼', 841477.55);
INSERT INTO `farmer` VALUES (100942, '中国北京市東城区東直門內大街810号华润大厦27室', 739762.93);
INSERT INTO `farmer` VALUES (100944, '中国深圳罗湖区蔡屋围深南东路690号38号楼', 847715.44);
INSERT INTO `farmer` VALUES (100946, '中国北京市延庆区028县道609号35号楼', 176453.02);
INSERT INTO `farmer` VALUES (100947, '中国成都市成华区玉双路6号604号42楼', 893917.19);
INSERT INTO `farmer` VALUES (100948, '中国上海市徐汇区虹桥路146号4号楼', 530864.41);
INSERT INTO `farmer` VALUES (100951, '中国上海市黄浦区淮海中路149号11室', 539136.45);
INSERT INTO `farmer` VALUES (100955, '中国上海市闵行区宾川路756号18楼', 388389.46);
INSERT INTO `farmer` VALUES (100956, '中国广州市海珠区江南西路702号4室', 457840.63);
INSERT INTO `farmer` VALUES (100957, '中国东莞东泰五街280号华润大厦26室', 84476.78);
INSERT INTO `farmer` VALUES (100960, '中国广州市天河区天河路798号华润大厦13室', 115752.62);
INSERT INTO `farmer` VALUES (100962, '中国深圳龙岗区布吉镇西环路331号8室', 839054.94);
INSERT INTO `farmer` VALUES (100966, '中国北京市西城区西長安街778号11楼', 310562.74);
INSERT INTO `farmer` VALUES (100969, '中国深圳福田区深南大道710号48号楼', 629421.07);
INSERT INTO `farmer` VALUES (100971, '中国广州市天河区天河路269号13号楼', 284624.76);
INSERT INTO `farmer` VALUES (100977, '中国北京市西城区西長安街193号45栋', 475224.47);
INSERT INTO `farmer` VALUES (100979, '中国中山乐丰六路224号7室', 522926.53);
INSERT INTO `farmer` VALUES (100980, '中国深圳罗湖区清水河一路837号3室', 755612.92);
INSERT INTO `farmer` VALUES (100981, '中国中山乐丰六路868号36室', 265962.34);
INSERT INTO `farmer` VALUES (100983, '中国中山京华商圈华夏街344号31号楼', 798335.83);
INSERT INTO `farmer` VALUES (100984, '中国成都市成华区双庆路11号19室', 912294.04);
INSERT INTO `farmer` VALUES (100986, '中国广州市白云区机场路棠苑街五巷439号19号楼', 485251.71);
INSERT INTO `farmer` VALUES (100987, '中国北京市房山区岳琉路13号华润大厦19室', 657083.72);
INSERT INTO `farmer` VALUES (100993, '中国深圳罗湖区清水河一路545号31号楼', 362134.40);
INSERT INTO `farmer` VALUES (100995, '中国北京市延庆区028县道107号华润大厦17室', 359294.60);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `consumerId` int NOT NULL,
  `productId` int NOT NULL,
  `farmerid` int NULL DEFAULT NULL,
  `orderStatus` enum('待支付','待发货','待收货','已完成','已取消') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderAmount` decimal(10, 2) NOT NULL,
  `orderTime` datetime NOT NULL,
  `logisticsInfo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `quantity` double(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `consumerId`(`consumerId` ASC) USING BTREE,
  INDEX `orders_ibfk_2`(`productId` ASC) USING BTREE,
  INDEX `orders_ibfk_3`(`farmerid` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`consumerId`) REFERENCES `consumer` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`farmerid`) REFERENCES `farmer` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100017 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (100000, 100005, 100001, 100003, '待发货', 863.32, '2024-11-16 21:01:10', '物流信息91', 1500);
INSERT INTO `orders` VALUES (100001, 100005, 100002, 100003, '待收货', 652.42, '2024-03-26 17:25:30', '物流信息42', 2665);
INSERT INTO `orders` VALUES (100002, 100005, 100003, 100003, '已取消', 376.68, '2024-07-02 13:28:02', '物流信息82', 496);
INSERT INTO `orders` VALUES (100003, 100005, 100004, 100003, '待支付', 470.98, '2024-04-01 23:44:27', '物流信息62', 986);
INSERT INTO `orders` VALUES (100004, 100005, 100005, 100004, '已取消', 953.99, '2024-10-07 16:48:59', '物流信息02', 1750);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` int NOT NULL AUTO_INCREMENT,
  `productname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `stock` double NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `farmerId` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `farmerId`(`farmerId` ASC) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`farmerId`) REFERENCES `farmer` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (100001, '贵州都匀毛尖', 58.99, 825, '外形条索紧结纤细卷曲、披毫，色绿翠。香清高，味鲜浓，叶底嫩绿匀整明亮。味道好，还具有生津解渴、清心明目、提神醒脑、去腻消食、抑制动脉粥样硬化、降脂减肥以及防癌、防治坏血病和护御放射性元素等多种功效与作用。', 100003, 'zhunong/maojian.jpg', '茶叶');
INSERT INTO `product` VALUES (100002, '内蒙古燕麦', 38.37, 812, '叶细长而尖，花淡绿色，小穗有细长的芒，籽实可以食用。它所含蛋白质和脂肪量为五谷之首，还含有磷、铁、钙和维生素等多种营养成分。', 100003, 'zhunong/yanmai.jpg', '农作物');
INSERT INTO `product` VALUES (100003, '甘肃岷县当归', 72.29, 169, '头质坚硬，主根粗，外皮黄棕色或黄褐色，归尾上粗下细，多扭曲，，质多柔软、坚韧，断面黄白色，中层有浅棕色环纹，并有多数棕色油点，气清香、浓厚', 100003, 'zhunong/danggui.jpg', '药材');
INSERT INTO `product` VALUES (100004, '河南焦作山药', 93.76, 114, '因其色褐间红、质坚粉足、身细体长，外形酷似铁棍而得名', 100003, 'zhunong/shanyao.jpg', '农作物');
INSERT INTO `product` VALUES (100005, '湖北潜江小龙虾', 94.65, 700, '尾肥体壮，鳃丝洁白，无异味，腹部清洁透明', 100003, 'zhunong/longxia.jpg', '水产品');
INSERT INTO `product` VALUES (100006, '河北迁西板栗', 85.45, 634, '果型小，淀粉含量低，糖含量高，香味浓，糯性强', 100003, 'zhunong/banli.jpg', '农作物');
INSERT INTO `product` VALUES (100007, '广西百色芒果', 68.41, 728, '核小肉厚、香气浓郁、肉质嫩滑、纤维少、口感清甜爽口', 100003, 'zhunong/mangguo.jpg', '水果');
INSERT INTO `product` VALUES (100008, '河北绿豆', 61.08, 100, '株型直立，紧凑，自封顶，顶部结荚，叶色浓绿，花黄色，荚黑褐色，不炸荚', 100003, 'zhunong/lvdou.jpg', '农作物');
INSERT INTO `product` VALUES (100009, '福建安溪铁观音', 56.26, 907, '抗衰老、抗癌症、抗动脉硬化、防治糖尿病、减肥健美、防治龋齿、清热降火，敌烟醒酒', 100003, 'zhunong/tieguanyin.jpg', '茶叶');
INSERT INTO `product` VALUES (100010, '广东湛江对虾', 70.76, 958, '可补肾壮阳、开胃化痰、通络止痛，也可用于治疗筋骨疼痛', 100043, 'zhunong/xia.jpg', '水产品');
INSERT INTO `product` VALUES (100011, '广西百色芒果', 79.70, 393, '核小肉厚、香气浓郁、肉质嫩滑、纤维少、口感清甜爽口', 100303, 'zhunong/mangguo.jpg', '水果');
INSERT INTO `product` VALUES (100012, '河北赵县雪花梨', 53.62, 319, '果肉洁白如玉、似霜如雪，有冰糖味和特殊的怡人香气', 100503, 'zhunong/lizi.jpg', '水果');
INSERT INTO `product` VALUES (100013, '云南蒙自石榴', 18.93, 393, '描述72', 100665, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100014, '山东烟台苹果', 64.84, 861, '描述72', 100224, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100015, '甘肃兰州百合', 78.42, 836, '描述02', 100168, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100016, '新疆腰豆', 9.62, 359, '描述12', 100367, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100017, '江苏太湖银鱼', 78.16, 533, '描述82', 100315, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100018, '广东凤凰单枞', 7.51, 52, '描述82', 100987, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100019, '湖南君山银针', 31.51, 198, '描述32', 100756, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100020, '江西樟树中药材', 25.95, 998, '描述92', 100630, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100021, '浙江舟山带鱼', 74.81, 746, '描述42', 100993, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100022, '河北秦皇岛扇贝', 12.37, 648, '描述42', 100935, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100023, '湖北神农架中药材', 2.37, 824, '描述42', 100578, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100024, '江西赣南脐橙树', 57.28, 320, '描述02', 100393, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100025, '浙江桐乡杭白菊', 76.15, 52, '描述22', 100428, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100026, '江西庐山云雾茶', 80.37, 703, '描述92', 100920, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100027, '内蒙古赤峰土豆', 27.77, 424, '描述82', 100134, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100028, '贵州都匀毛尖', 27.96, 146, '外形条索紧结纤细卷曲、披毫，色绿翠。香清高，味鲜浓，叶底嫩绿匀整明亮。味道好，还具有生津解渴、清心明目、提神醒脑、去腻消食、抑制动脉粥样硬化、降脂减肥以及防癌、防治坏血病和护御放射性元素等多种功效与作用。', 100539, 'zhunong/maojian.jpg', '茶叶');
INSERT INTO `product` VALUES (100029, '广西钦州大蚝', 68.40, 502, '描述92', 100024, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100030, '甘肃兰州百合', 70.70, 362, '描述02', 100239, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100031, '江西庐山云雾茶', 46.14, 307, '描述72', 100660, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100032, '湖北籼米', 77.30, 185, '描述32', 100794, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100033, '四川花生', 63.00, 950, '描述82', 100922, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100034, '四川峨眉山中药材', 87.44, 302, '描述22', 100686, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100035, '四川峨眉山茶', 91.61, 728, '描述32', 100880, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100036, '江苏碧螺春', 27.07, 220, '描述72', 100265, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100037, '陕西荞麦', 62.59, 627, '描述32', 100059, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100038, '河南小麦', 96.32, 87, '描述52', 100778, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100039, '海南陵水芒果', 36.58, 434, '描述42', 100489, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100040, '四川峨眉山中药材', 55.83, 825, '描述72', 100815, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100041, '东北黑豆', 55.45, 965, '描述72', 100400, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100042, '云南普洱茶', 31.38, 304, '描述92', 100664, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100043, '河南糯玉米', 47.73, 345, '描述32', 100511, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100044, '湖北神农架中药材', 57.81, 398, '描述82', 100747, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100045, '湖北潜江小龙虾', 97.41, 986, '尾肥体壮，鳃丝洁白，无异味，腹部清洁透明', 100798, 'zhunong/longxia.jpg', '水产品');
INSERT INTO `product` VALUES (100046, '陕西洛川苹果树', 86.08, 779, '描述02', 100720, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100047, '江苏阳澄湖大闸蟹苗', 55.72, 685, '描述32', 100278, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100048, '浙江奉化水蜜桃', 37.60, 684, '描述42', 100230, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100049, '福建霞浦海参', 46.41, 378, '描述82', 100491, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100050, '云南普洱茶', 54.01, 553, '描述02', 100331, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100051, '江西樟树中药材', 18.60, 348, '描述42', 100656, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100052, '甘肃兰州百合', 65.38, 855, '描述02', 100182, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100053, '江西赣南脐橙', 39.91, 270, '描述22', 100682, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100054, '江苏碧螺春', 74.15, 67, '描述22', 100126, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100055, '福建霞浦海参', 87.81, 383, '描述52', 100913, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100056, '湖北神农架中药材', 29.30, 25, '描述92', 100284, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100057, '四川会理石榴', 81.40, 270, '描述32', 100691, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100058, '浙江桐乡杭白菊', 13.47, 329, '描述72', 100136, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100059, '河南焦作山药', 21.40, 743, '因其色褐间红、质坚粉足、身细体长，外形酷似铁棍而得名', 100341, 'zhunong/shanyao.jpg', '药物');
INSERT INTO `product` VALUES (100060, '四川攀枝花芒果树', 59.54, 412, '描述52', 100669, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100061, '东北黑豆', 31.66, 334, '描述42', 100690, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100062, '河北迁西板栗', 57.39, 654, '果型小，淀粉含量低，糖含量高，香味浓，糯性强', 100930, 'zhunong/banli.jpg', '农作物');
INSERT INTO `product` VALUES (100063, '四川安岳柠檬', 4.89, 359, '描述62', 100142, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100064, '新疆库尔勒香梨', 17.27, 500, '描述62', 100570, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100065, '江苏阳山水蜜桃', 71.03, 723, '描述82', 100037, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100066, '四川郫县豆瓣菜', 50.27, 350, '描述82', 100516, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100067, '甘肃芸豆', 25.41, 820, '描述22', 100655, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100068, '江西珍珠大麦', 36.67, 6, '描述12', 100944, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100069, '内蒙古锡林郭勒羊肉', 99.79, 496, '描述82', 100951, 'zhunong/yangli.png', '肉类');
INSERT INTO `product` VALUES (100070, '湖北洪湖莲藕', 33.07, 258, '描述02', 100459, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100071, '海南陵水芒果', 66.72, 505, '描述52', 100274, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100072, '辽宁盘锦河蟹', 81.91, 309, '描述32', 100966, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100073, '陕西眉县猕猴桃', 28.84, 672, '描述52', 100535, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100074, '河北安国中药材', 65.42, 173, '描述52', 100860, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100075, '福建安溪铁观音', 1.79, 655, '抗衰老、抗癌症、抗动脉硬化、防治糖尿病、减肥健美、防治龋齿、清热降火，敌烟醒酒', 100587, 'zhunong/tieguanyin.jpg', '茶叶');
INSERT INTO `product` VALUES (100076, '贵州都匀毛尖', 57.24, 565, '外形条索紧结纤细卷曲、披毫，色绿翠。香清高，味鲜浓，叶底嫩绿匀整明亮。味道好，还具有生津解渴、清心明目、提神醒脑、去腻消食、抑制动脉粥样硬化、降脂减肥以及防癌、防治坏血病和护御放射性元素等多种功效与作用。', 100086, 'zhunong/maojian.jpg', '茶叶');
INSERT INTO `product` VALUES (100077, '陕西荞麦', 45.89, 899, '描述22', 100557, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100078, '浙江龙井', 53.02, 264, '描述32', 100424, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100079, '安徽黄山毛峰', 14.22, 542, '描述82', 100509, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100080, '四川峨眉山茶', 50.09, 248, '描述82', 100802, 'zhunong/yangli.png', '茶叶');
INSERT INTO `product` VALUES (100081, '新疆长绒棉', 61.09, 118, '描述42', 100736, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100082, '山东寿光小麦', 32.48, 256, '描述52', 100462, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100083, '辽宁盘锦河蟹', 2.44, 332, '描述72', 100450, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100084, '云南元谋番茄', 4.96, 889, '描述32', 100914, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100085, '云南文山三七', 5.11, 967, '描述02', 100809, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100086, '陕西洛川苹果树', 44.44, 37, '描述02', 100888, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100087, '江苏阳澄湖大闸蟹苗', 80.22, 892, '描述62', 100028, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100088, '江苏阳澄湖大闸蟹苗', 38.13, 150, '描述92', 100503, 'zhunong/yangli.png', '水产品');
INSERT INTO `product` VALUES (100089, '云南薏仁', 0.23, 150, '描述32', 100872, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100090, '吉林玉米', 95.28, 751, '描述12', 100969, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100091, '江苏连云港中药材', 82.97, 764, '描述72', 100302, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100092, '河南小麦', 79.65, 465, '描述22', 100701, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100093, '河北迁西板栗', 7.43, 383, '果型小，淀粉含量低，糖含量高，香味浓，糯性强', 100814, 'zhunong/banli.jpg', '农作物');
INSERT INTO `product` VALUES (100094, '福建安溪铁观音', 1.01, 640, '抗衰老、抗癌症、抗动脉硬化、防治糖尿病、减肥健美、防治龋齿、清热降火，敌烟醒酒', 100820, 'zhunong/tieguanyin.jpg', '茶叶');
INSERT INTO `product` VALUES (100095, '江苏连云港中药材', 39.29, 735, '描述12', 100718, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100096, '浙江桐乡杭白菊', 5.64, 755, '描述82', 100934, 'zhunong/yangli.png', '农作物');
INSERT INTO `product` VALUES (100097, '海南陵水芒果', 62.99, 555, '描述92', 100843, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100098, '云南文山三七', 24.48, 210, '描述12', 100781, 'zhunong/yangli.png', '药材');
INSERT INTO `product` VALUES (100099, '广东湛江对虾', 91.26, 217, '可补肾壮阳、开胃化痰、通络止痛，也可用于治疗筋骨疼痛', 100883, 'zhunong/xia.jpg', '水产品');
INSERT INTO `product` VALUES (100100, '广东徐闻菠萝', 14.37, 842, '描述82', 100785, 'zhunong/yangli.png', '水果');
INSERT INTO `product` VALUES (100101, 'A', 10.00, 10, '好', 100003, '', NULL);

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion`  (
  `promotionid` int NOT NULL AUTO_INCREMENT,
  `promotionname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  PRIMARY KEY (`promotionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion
-- ----------------------------
INSERT INTO `promotion` VALUES (1, '农产品种植培训', '农产品种植技术培训', '2025-05-01 00:00:00', '2025-05-10 23:59:59');
INSERT INTO `promotion` VALUES (2, '农作物培养技术培训', '农作物培养技术培训', '2025-05-01 00:00:00', '2025-05-10 23:59:59');
INSERT INTO `promotion` VALUES (3, '运费全免', '平台维护完成，为期十天运费全面', '2025-05-01 00:00:00', '2025-05-10 23:59:59');
INSERT INTO `promotion` VALUES (4, '农产品销售直播培训', '为进一步提高销量，扶贫助农，开展农产品直播销售培训', '2025-05-01 00:00:00', '2025-05-10 23:59:59');
INSERT INTO `promotion` VALUES (5, '下单即送', '下单满50元赠送好礼一份', '2025-05-01 00:00:00', '2025-05-10 23:59:59');

-- ----------------------------
-- Table structure for promotionsign
-- ----------------------------
DROP TABLE IF EXISTS `promotionsign`;
CREATE TABLE `promotionsign`  (
  `promotionid` int NOT NULL AUTO_INCREMENT,
  `promotionname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `farmerid` int NOT NULL,
  PRIMARY KEY (`promotionid`) USING BTREE,
  INDEX `farmerid`(`farmerid` ASC) USING BTREE,
  CONSTRAINT `promotionsign_ibfk_1` FOREIGN KEY (`farmerid`) REFERENCES `farmer` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotionsign
-- ----------------------------
INSERT INTO `promotionsign` VALUES (1, '农产品种植培训', '农产品种植技术培训', '2025-05-01 00:00:00', '2025-05-10 23:59:59', 100003);
INSERT INTO `promotionsign` VALUES (2, '农作物培养技术培训', '农作物培养技术培训', '2025-05-01 00:00:00', '2025-05-10 23:59:59', 100176);
INSERT INTO `promotionsign` VALUES (3, '运费全免', '平台维护完成，为期十天运费全面', '2025-05-01 00:00:00', '2025-05-10 23:59:59', 100177);
INSERT INTO `promotionsign` VALUES (4, '农产品销售直播培训', '为进一步提高销量，扶贫助农，开展农产品直播销售培训', '2025-05-01 00:00:00', '2025-05-10 23:59:59', 100277);
INSERT INTO `promotionsign` VALUES (5, '农产品种植培训', '农产品种植培训', '2025-05-01 00:00:00', '2025-05-10 23:59:59', 100278);
INSERT INTO `promotionsign` VALUES (6, '农作物培养技术培训', '农作物培养技术培训', '2025-05-01 00:00:00', '2025-05-10 23:59:59', 100004);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `reviewid` int NOT NULL AUTO_INCREMENT,
  `consumerid` int NOT NULL,
  `productid` int NOT NULL,
  `farmerid` int NULL DEFAULT NULL,
  `reviewcontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reviewtime` datetime NULL DEFAULT NULL,
  `rating` int NULL DEFAULT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`reviewid`) USING BTREE,
  INDEX `productid`(`productid` ASC) USING BTREE,
  INDEX `review_ibfk_1`(`consumerid` ASC) USING BTREE,
  INDEX `review_ibfk_3`(`farmerid` ASC) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`consumerid`) REFERENCES `consumer` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`farmerid`) REFERENCES `farmer` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `review_chk_1` CHECK (`rating` between 1 and 5)
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (1, 100005, 100001, 100003, '中规中矩', '2025-05-06 15:07:10', 3, '收到');
INSERT INTO `review` VALUES (2, 100071, 100002, 100003, '中规中矩', '2022-11-17 05:09:40', 3, '');
INSERT INTO `review` VALUES (3, 100072, 100005, 100003, '中规中矩', '2025-04-06 00:35:55', 3, NULL);
INSERT INTO `review` VALUES (4, 100006, 100006, 100003, '好评继续加油', '2018-08-03 19:59:32', 4, NULL);
INSERT INTO `review` VALUES (5, 100581, 100003, 100003, '包装有损坏', '2017-08-29 20:18:03', 1, NULL);
INSERT INTO `review` VALUES (6, 100005, 100096, 100004, '中规中矩', '2012-09-28 11:36:07', 3, NULL);
INSERT INTO `review` VALUES (7, 100005, 100073, 100032, '好评继续加油', '2010-09-30 10:08:52', 4, NULL);
INSERT INTO `review` VALUES (8, 100006, 100050, 100046, '有待改进', '2004-07-11 01:00:40', 2, NULL);
INSERT INTO `review` VALUES (9, 100006, 100077, 100889, '中规中矩', '2012-04-01 20:54:38', 3, NULL);
INSERT INTO `review` VALUES (10, 100005, 100080, 100889, '中规中矩', '2006-07-19 08:47:00', 3, NULL);
INSERT INTO `review` VALUES (11, 100006, 100043, 100891, '运输太慢了', '2011-10-12 23:53:50', 1, NULL);
INSERT INTO `review` VALUES (12, 100008, 100002, 100003, '中规中矩', '2023-01-06 12:04:18', 3, NULL);
INSERT INTO `review` VALUES (13, 100008, 100023, 100004, '好评继续加油', '2014-04-19 18:46:04', 4, NULL);
INSERT INTO `review` VALUES (14, 100005, 100007, 100003, '中规中矩', '2002-07-11 01:49:03', 3, NULL);
INSERT INTO `review` VALUES (15, 100008, 100066, 100374, '有待改进', '2004-12-09 06:02:24', 2, NULL);
INSERT INTO `review` VALUES (16, 100581, 100038, 100374, '有待改进', '2016-12-02 09:22:22', 2, NULL);
INSERT INTO `review` VALUES (17, 100583, 100083, 100449, '好评继续加油', '2014-02-07 18:40:02', 4, NULL);
INSERT INTO `review` VALUES (18, 100071, 100051, 100449, '有待改进', '2003-09-14 03:40:10', 2, NULL);
INSERT INTO `review` VALUES (19, 100005, 100029, 100529, '有待改进', '2011-02-06 09:17:31', 2, NULL);
INSERT INTO `review` VALUES (20, 100072, 100049, 100529, '好评继续加油', '2017-12-15 17:03:12', 5, NULL);

-- ----------------------------
-- Table structure for salesreport
-- ----------------------------
DROP TABLE IF EXISTS `salesreport`;
CREATE TABLE `salesreport`  (
  `reportid` int NOT NULL AUTO_INCREMENT,
  `farmerid` int NOT NULL,
  `reportcontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reporttime` datetime NOT NULL,
  PRIMARY KEY (`reportid`) USING BTREE,
  INDEX `farmerid`(`farmerid` ASC) USING BTREE,
  CONSTRAINT `salesreport_ibfk_1` FOREIGN KEY (`farmerid`) REFERENCES `farmer` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salesreport
-- ----------------------------
INSERT INTO `salesreport` VALUES (100000, 100720, '统计内容55', '2013-04-28 10:13:08');
INSERT INTO `salesreport` VALUES (100001, 100320, '统计内容39', '2019-08-05 03:47:11');
INSERT INTO `salesreport` VALUES (100002, 100672, '统计内容40', '2013-12-08 18:21:07');
INSERT INTO `salesreport` VALUES (100003, 100813, '统计内容02', '2023-03-24 23:14:49');
INSERT INTO `salesreport` VALUES (100004, 100951, '统计内容64', '2022-06-20 22:05:21');
INSERT INTO `salesreport` VALUES (100005, 100937, '统计内容06', '2010-08-28 05:10:44');
INSERT INTO `salesreport` VALUES (100006, 100250, '统计内容97', '2001-09-18 11:58:52');
INSERT INTO `salesreport` VALUES (100007, 100167, '统计内容66', '2003-05-08 07:55:51');
INSERT INTO `salesreport` VALUES (100008, 100739, '统计内容70', '2006-05-15 13:08:50');
INSERT INTO `salesreport` VALUES (100009, 100893, '统计内容46', '2014-08-21 14:35:35');

-- ----------------------------
-- Table structure for subsidy
-- ----------------------------
DROP TABLE IF EXISTS `subsidy`;
CREATE TABLE `subsidy`  (
  `subid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `amount` double NULL DEFAULT NULL,
  PRIMARY KEY (`subid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100007 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subsidy
-- ----------------------------
INSERT INTO `subsidy` VALUES (100001, '农产品种植补贴', '农产品种植补贴', 5000);
INSERT INTO `subsidy` VALUES (100002, '有机农业认证补贴', '有机农业认证补贴', 1000);
INSERT INTO `subsidy` VALUES (100003, '农户收人补贴', '农户收入补贴', 1200);
INSERT INTO `subsidy` VALUES (100004, '贫困农户生活补贴', '贫困农户生活补贴', 10000);
INSERT INTO `subsidy` VALUES (100005, '国家贫困户补贴', '国家贫困户补贴', 20000);

-- ----------------------------
-- Table structure for subsidysign
-- ----------------------------
DROP TABLE IF EXISTS `subsidysign`;
CREATE TABLE `subsidysign`  (
  `subid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `amount` double NULL DEFAULT NULL,
  `farmerid` int NULL DEFAULT NULL,
  `substatus` enum('待审核','已通过','已拒绝') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '待审核',
  PRIMARY KEY (`subid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subsidysign
-- ----------------------------
INSERT INTO `subsidysign` VALUES (100001, '农产品种植补贴', '农产品种植补贴', 500, 100003, '已通过');
INSERT INTO `subsidysign` VALUES (100002, '有机农业认证补贴', '有机农业认证补贴', 1000, 100003, '已拒绝');
INSERT INTO `subsidysign` VALUES (100003, '农户收人补贴', '农户收入补贴', 1200, 100003, '待审核');
INSERT INTO `subsidysign` VALUES (100004, '国家贫困户补贴', '国家贫困户补贴', 1000, 100004, '已通过');
INSERT INTO `subsidysign` VALUES (100005, '国家贫困户补贴', '国家贫困户补贴', 1000, 100320, '待审核');
INSERT INTO `subsidysign` VALUES (100006, '国家贫困户补贴', '国家贫困户补贴', 1000, 100007, '已通过');
INSERT INTO `subsidysign` VALUES (100007, '国家贫困户补贴', '国家贫困户补贴', 1000, 100066, '待审核');
INSERT INTO `subsidysign` VALUES (100008, '国家贫困户补贴', '国家贫困户补贴', 1999, 100708, '待审核');
INSERT INTO `subsidysign` VALUES (100009, '国家贫困户补贴', '国家贫困户补贴', 1222, 100708, '已拒绝');
INSERT INTO `subsidysign` VALUES (100013, '贫困农户生活补贴', '贫困农户生活补贴', 10000, 100003, '待审核');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usertype` enum('消费者','农户','管理员') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `regtime` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `restatus` int NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `user_pk`(`userid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101047 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (100001, '猿神', 'user', '123', '管理员', 'qijiehong3@icloud.com', '150-0844-8228', '2024-12-24 01:01:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100002, '卜熙诚', '5370823711', '744239', '管理员', 'suxiaoming@hotmail.com', '139-3098-7251', '2020-09-10 19:18:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100003, '毛晓明', 'farmer', '123', '农户', 'mao6@gmail.com', '760-5731-7521', '2012-01-11 00:11:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100004, '邵睿', '4141547545', '491855', '农户', 'ruishao@outlook.com', '167-9824-5632', '2018-02-16 06:09:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100005, '武宇宁', 'cons', '123', '消费者', 'yunwu@icloud.com', '755-429-9978', '2024-09-27 15:25:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100006, '邱宇宁', '2778558903', '853868', '消费者', 'qiu309@hotmail.com', '28-034-9192', '2017-10-24 00:37:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100007, '尹宇宁', '6455766364', '353001', '农户', 'yuning8@yahoo.com', '20-811-1813', '2005-11-08 18:24:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100008, 'Eleanor Mendoza', '1607711829', '764922', '消费者', 'mel@mail.com', '769-7762-3406', '2000-04-11 04:55:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100009, '戴子异', '2654345802', '605899', '农户', 'ziydai@mail.com', '142-2422-8677', '2017-06-03 11:09:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100010, 'Barry Patel', '3944381467', '266563', '消费者', 'bpa3@icloud.com', '143-0135-8481', '2010-04-12 05:26:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100011, 'Sheila Tucker', '9806943267', '691358', '消费者', 'tuckeshe@gmail.com', '760-670-1477', '2002-11-07 05:52:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100012, 'Phillip Reyes', '9897945630', '399692', '消费者', 'reyesphillip2@hotmail.com', '196-6383-0406', '2008-05-04 04:06:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100013, 'Clarence Chen', '6502488193', '969488', '农户', 'clachen3@outlook.com', '20-566-8827', '2018-05-17 01:54:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100014, 'Carmen James', '9529140150', '833063', '农户', 'james4@hotmail.com', '10-7021-3494', '2003-02-02 13:35:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100015, 'Clarence Morris', '4220185654', '277939', '农户', 'clarencemorr@gmail.com', '131-3304-5387', '2010-01-31 13:24:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100016, 'Gladys Hall', '4164830354', '182276', '消费者', 'hallgladys@icloud.com', '769-2569-7719', '2008-08-21 17:09:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100017, 'Gladys Tucker', '3014974106', '485695', '消费者', 'tugl6@outlook.com', '195-7093-3972', '2003-04-11 08:31:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100018, 'Francis Alexander', '2689459036', '385525', '消费者', 'francisal310@gmail.com', '187-3377-8207', '2011-03-04 17:13:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100019, '孙云熙', '8781676127', '378834', '农户', 'sun2@icloud.com', '28-7561-3840', '2004-08-25 18:25:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100020, '林子异', '9128928451', '779424', '消费者', 'lziyi@gmail.com', '21-486-5514', '2004-01-06 02:09:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100021, 'Pamela Moore', '3796834548', '154607', '消费者', 'pamelmoore@icloud.com', '132-0363-8037', '2006-12-22 02:41:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100022, '林安琪', '1532748249', '304872', '消费者', 'lin416@outlook.com', '173-6344-0686', '2001-10-15 16:45:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100023, 'Dorothy Coleman', '1106960450', '906092', '农户', 'dorothycoleman08@hotmail.com', '28-043-0023', '2011-07-21 02:44:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100024, 'Jeff Murray', '9708962130', '565514', '农户', 'jefmurray8@gmail.com', '21-245-9561', '2014-06-04 20:37:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100025, '贾子异', '7633675968', '149662', '消费者', 'jiaziyi807@icloud.com', '191-3288-8165', '2009-05-04 11:27:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100026, 'Eddie Stephens', '4823955972', '460050', '消费者', 'eddiestephens1960@outlook.com', '145-6490-2226', '2020-02-18 07:32:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100027, '何秀英', '3735102345', '610059', '农户', 'xiuying429@icloud.com', '20-7888-9558', '2019-10-12 09:55:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100028, 'Mildred Parker', '7542837266', '830602', '农户', 'mildparke@outlook.com', '28-897-4454', '2018-03-21 14:15:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100029, 'Martha Wells', '7508327411', '656059', '消费者', 'marthawell@gmail.com', '171-6951-1020', '2006-08-19 03:13:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100030, 'Norman Stevens', '6249416875', '478416', '农户', 'normanste@hotmail.com', '20-288-6144', '2002-11-29 09:30:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100031, 'Danielle Richardson', '7518417357', '321494', '消费者', 'dr1970@gmail.com', '166-6031-7304', '2020-07-29 00:35:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100032, 'Carrie Cook', '9837489816', '677905', '农户', 'cocarri@yahoo.com', '20-677-5153', '2010-02-08 13:15:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100033, '于安琪', '6494032693', '324054', '农户', 'ayu@icloud.com', '177-8540-8630', '2013-09-12 08:39:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100034, '秦秀英', '9991716557', '110399', '农户', 'xiuying3@icloud.com', '187-6032-3119', '2017-10-15 07:53:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100035, 'Harry Fox', '5846646168', '876525', '农户', 'hfox@hotmail.com', '199-8548-0098', '2024-02-17 09:53:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100036, '范子异', '6891078913', '805806', '消费者', 'fziyi5@mail.com', '769-396-3403', '2010-05-23 14:09:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100037, 'Sarah Palmer', '1496919593', '127162', '农户', 'sarp@mail.com', '10-3301-8651', '2025-01-31 14:54:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100038, 'Jacqueline Mendez', '9336047328', '314283', '农户', 'mendezj3@gmail.com', '178-7245-4168', '2016-07-13 16:01:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100039, '尹晓明', '2433215832', '122738', '农户', 'yixiaoming@gmail.com', '185-6916-1408', '2000-10-27 22:02:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100040, '莫子异', '7014080947', '863326', '消费者', 'moz@icloud.com', '20-194-1113', '2008-06-03 23:15:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100041, '夏子韬', '8089902906', '885994', '消费者', 'xiazitao@gmail.com', '20-544-1783', '2002-11-04 05:14:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100042, '叶安琪', '8068680062', '720960', '消费者', 'ye9@yahoo.com', '21-695-4705', '2011-08-19 13:09:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100043, '余云熙', '7935670110', '596919', '农户', 'yuyunxi@hotmail.com', '28-3503-4640', '2020-11-26 02:16:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100044, 'Ruby Rodriguez', '2626002913', '652057', '消费者', 'rodriguez90@gmail.com', '136-3776-0712', '2013-10-11 18:55:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100045, '宋杰宏', '7686671581', '664375', '消费者', 'songjiehong922@mail.com', '20-0139-2449', '2007-06-27 23:34:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100046, '胡睿', '3995919872', '260033', '农户', 'ruihu@icloud.com', '760-3276-1467', '2021-02-24 21:04:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100047, '杨宇宁', '3578372089', '210685', '消费者', 'yuniy@outlook.com', '135-9070-9452', '2010-12-30 04:31:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100048, '袁云熙', '2691788458', '459130', '消费者', 'yunxi9@outlook.com', '28-7108-6907', '2000-09-30 13:58:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100049, 'Edna Morgan', '4609381548', '807684', '农户', 'moedna2@gmail.com', '20-6811-1703', '2002-05-14 13:58:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100050, '彭杰宏', '1473505620', '813543', '农户', 'pejiehong@outlook.com', '28-944-8951', '2019-08-09 07:37:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100051, '汪晓明', '2370887895', '574858', '消费者', 'xiaomingwang@icloud.com', '10-663-5513', '2009-10-28 22:34:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100052, 'Diana Griffin', '9468831270', '487904', '农户', 'dgriffin1962@gmail.com', '158-2574-2346', '2001-03-26 11:52:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100053, 'Sylvia Fernandez', '3049842653', '256083', '农户', 'sylviafer@icloud.com', '161-1779-2995', '2019-11-14 21:55:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100054, '严秀英', '3725481163', '393743', '农户', 'yx1101@yahoo.com', '769-9440-2408', '2003-11-25 18:41:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100055, 'Valerie Phillips', '6067892402', '348501', '农户', 'valeriep@outlook.com', '182-1089-8781', '2012-11-05 16:17:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100056, 'Kathleen Mason', '6795891630', '229672', '消费者', 'mason6@gmail.com', '137-1024-0976', '2023-05-12 09:41:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100057, '李嘉伦', '4337197197', '436096', '农户', 'jialunli@outlook.com', '755-969-5473', '2019-04-25 22:21:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100058, '叶云熙', '2848087653', '343613', '消费者', 'yeyunxi@icloud.com', '20-857-6784', '2001-05-18 16:05:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100059, '余杰宏', '2111365118', '897843', '农户', 'yujiehong@gmail.com', '152-8990-3847', '2020-02-27 00:55:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100060, 'Karen Freeman', '3188920374', '224634', '农户', 'karfre@outlook.com', '189-3747-2958', '2006-10-06 16:59:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100061, 'Jessica Taylor', '4987842861', '396875', '农户', 'taylorjessica@mail.com', '163-5091-5418', '2003-09-22 08:47:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100062, 'Russell Fisher', '2763307319', '992286', '消费者', 'fisher2@yahoo.com', '760-9344-0610', '2013-05-02 01:15:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100063, 'Chad Nguyen', '6189252173', '322274', '消费者', 'nguyenchad610@gmail.com', '184-7465-3658', '2018-02-15 21:32:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100064, '姜宇宁', '2790143566', '170045', '消费者', 'yuningjiang316@gmail.com', '184-3692-6729', '2003-01-09 11:02:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100065, 'Tina Rose', '7198168465', '437590', '农户', 'rotina@gmail.com', '21-6486-2525', '2006-09-26 12:37:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100066, '邹子韬', '9270473483', '592292', '农户', 'zouzitao@outlook.com', '160-1576-8054', '2011-09-28 08:14:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100067, 'Jonathan Hamilton', '7227938182', '325188', '消费者', 'jonathanha606@outlook.com', '10-1259-9216', '2005-12-31 07:29:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100068, 'Pamela Carter', '4892314381', '978379', '消费者', 'pamelacarter57@hotmail.com', '28-469-6304', '2023-06-15 15:43:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100069, '谭宇宁', '4007426551', '296387', '消费者', 'yuningt06@gmail.com', '181-6135-1305', '2016-03-08 14:39:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100070, 'Anna Wagner', '2828837216', '840369', '农户', 'awagner@icloud.com', '769-2190-0663', '2021-03-08 17:16:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100071, 'Gladys Ryan', '9347725838', '617967', '消费者', 'ryangladys2@outlook.com', '135-4867-4518', '2022-06-08 04:35:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100072, '邓璐', '8843775884', '804225', '消费者', 'lud401@outlook.com', '21-503-3394', '2010-07-26 02:26:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100073, 'Clara Nguyen', '1743426430', '308861', '农户', 'clan@mail.com', '157-0215-0364', '2014-08-23 17:23:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100074, '袁子韬', '8916495167', '234899', '消费者', 'yuan10@icloud.com', '28-2738-8821', '2010-05-08 08:35:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100075, 'Carrie Daniels', '9888409496', '323118', '消费者', 'carriedaniels@gmail.com', '760-2079-9068', '2016-08-04 20:59:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100076, 'Jonathan Torres', '6188747969', '265593', '消费者', 'jonathantorres617@gmail.com', '21-547-1041', '2005-03-10 17:40:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100077, '彭岚', '3111960724', '713044', '农户', 'pengl@gmail.com', '156-2184-1467', '2020-03-09 19:34:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100078, 'John Gibson', '7660332768', '389798', '消费者', 'gibsonj4@gmail.com', '147-4805-5974', '2020-07-31 22:59:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100079, '魏子韬', '5135012662', '118025', '农户', 'zitao2@gmail.com', '161-2478-7038', '2014-10-16 07:30:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100080, '邓岚', '1590786681', '454510', '农户', 'deng1113@gmail.com', '755-7746-7280', '2013-05-01 21:53:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100081, '高岚', '5893491700', '801881', '农户', 'laga@hotmail.com', '167-3879-1353', '2007-08-24 22:04:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100082, '向晓明', '4923396401', '271928', '消费者', 'xiangxiaoming@yahoo.com', '137-5659-6136', '2006-06-25 03:15:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100083, '莫岚', '1814439093', '425272', '农户', 'mo1@hotmail.com', '28-3136-8685', '2007-11-15 18:52:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100084, '侯震南', '6687914293', '306664', '农户', 'hzhennan3@gmail.com', '28-307-8362', '2019-12-10 07:07:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100085, 'Cindy Carter', '6344170239', '427015', '消费者', 'cartercin@mail.com', '138-4977-2493', '2002-03-23 23:54:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100086, '龙宇宁', '8730880803', '413092', '农户', 'yuninlo@gmail.com', '760-580-0659', '2013-05-18 03:55:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100087, 'Theresa Guzman', '5650296189', '318408', '农户', 'guztheresa@hotmail.com', '760-8187-4530', '2005-07-09 23:17:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100088, '贺云熙', '8767661375', '654639', '消费者', 'yunxhe@icloud.com', '199-0162-2725', '2018-09-25 00:55:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100089, 'Shannon Boyd', '7306161326', '263674', '消费者', 'shaboy@yahoo.com', '157-0934-1717', '2016-10-04 18:54:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100090, 'Joan Ferguson', '1842669787', '101329', '农户', 'ferguson618@gmail.com', '150-0437-6242', '2014-09-12 13:59:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100091, '顾安琪', '1383451558', '604819', '农户', 'ganqi@yahoo.com', '163-9850-7185', '2014-05-16 11:31:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100092, '余云熙', '9997053460', '427654', '消费者', 'yuyu@icloud.com', '160-1343-0221', '2009-06-22 19:16:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100093, '韩晓明', '7109049716', '492255', '消费者', 'xiaominghan18@gmail.com', '149-0240-4179', '2013-10-03 22:56:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100094, '马杰宏', '4471367133', '363666', '消费者', 'ma601@gmail.com', '28-8039-7708', '2004-08-27 19:52:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100095, '方璐', '7195103375', '447952', '农户', 'fanglu@gmail.com', '182-9103-8096', '2013-12-01 18:50:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100096, '孟詩涵', '8153540853', '393217', '农户', 'shihan3@hotmail.com', '148-7801-5679', '2015-01-13 04:22:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100097, '汪岚', '7461831533', '368529', '农户', 'walan2017@yahoo.com', '197-4908-4254', '2021-12-27 07:32:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100098, 'Lisa Murphy', '1121772712', '928061', '消费者', 'lmur@hotmail.com', '21-708-4100', '2024-06-14 08:16:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100099, '袁晓明', '2357790808', '181172', '农户', 'yuanxiaoming@icloud.com', '174-6632-2980', '2009-01-28 13:58:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100100, 'Josephine Chen', '8612843398', '869078', '消费者', 'cjose@yahoo.com', '180-2758-4116', '2019-08-10 09:16:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100101, 'Don Olson', '3387187280', '173207', '消费者', 'donolson1228@gmail.com', '161-1836-0223', '2008-11-30 18:11:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100102, '徐子韬', '9600781350', '504146', '消费者', 'zitxu@hotmail.com', '167-2149-8736', '2015-05-14 13:57:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100103, 'Doris Herrera', '5931414572', '449888', '消费者', 'dorisherrera502@yahoo.com', '177-6524-9044', '2000-03-13 14:50:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100104, 'Louise Nichols', '8847957586', '787055', '农户', 'louise96@gmail.com', '187-3842-8166', '2002-09-27 10:03:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100105, '武云熙', '1171066065', '227992', '消费者', 'yuwu@gmail.com', '161-0579-2980', '2018-10-24 06:58:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100106, 'Betty Mitchell', '1453148932', '489445', '农户', 'betty817@icloud.com', '192-7684-3033', '2020-11-13 12:53:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100107, 'Donald Long', '8237722017', '342559', '消费者', 'dol303@outlook.com', '21-556-7880', '2010-12-15 14:14:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100108, '蔡睿', '7133592446', '143350', '消费者', 'ruica@yahoo.com', '10-0326-8371', '2007-04-03 05:04:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100109, 'Jonathan Henderson', '3075147213', '950742', '消费者', 'hendersonjo9@gmail.com', '769-961-0374', '2002-08-31 01:06:27', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100110, '傅睿', '2322731506', '823333', '消费者', 'furu@gmail.com', '28-2684-6546', '2013-11-06 15:28:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100111, 'Susan Mcdonald', '5008393556', '372012', '农户', 'mcdonaldsusa2000@yahoo.com', '28-5713-2674', '2022-08-15 04:00:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100112, '高致远', '9823464612', '836773', '农户', 'gao41@gmail.com', '175-4098-2052', '2022-02-19 08:36:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100113, 'Jessica Chavez', '2584522564', '596673', '农户', 'chavezjessi@gmail.com', '193-9915-6743', '2024-09-26 23:14:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100114, 'William Anderson', '3312180986', '723585', '农户', 'andersonwilliam@gmail.com', '21-528-0625', '2018-07-13 09:32:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100115, '史致远', '8503282498', '571226', '消费者', 'zhiyuanshi2@gmail.com', '163-5253-0228', '2003-03-28 05:35:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100116, 'Deborah Taylor', '5615840363', '936218', '农户', 'deborahtaylo92@mail.com', '165-5228-4578', '2017-04-22 22:28:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100117, 'Jeremy Griffin', '3997086066', '368683', '农户', 'gjeremy@gmail.com', '755-4577-1286', '2004-07-18 06:22:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100118, 'Howard Soto', '8998888252', '345059', '农户', 'sotohoward@yahoo.com', '167-7077-4620', '2008-01-19 23:35:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100119, 'Daniel Mendez', '7932944022', '382441', '消费者', 'danielmen@hotmail.com', '157-0591-7828', '2018-12-03 20:22:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100120, 'Eva Marshall', '5665793897', '550120', '消费者', 'eva901@gmail.com', '144-6022-4636', '2002-08-13 02:49:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100121, 'Katherine Butler', '6934687910', '894524', '消费者', 'bkat@gmail.com', '199-3094-7562', '2021-05-02 00:14:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100122, '谢安琪', '7172848729', '251832', '消费者', 'xieanqi@gmail.com', '136-4530-7927', '2004-05-11 16:12:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100123, '龚岚', '7925776385', '201289', '消费者', 'langong@icloud.com', '141-9618-2564', '2006-06-02 18:35:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100124, '韩璐', '9781514162', '890449', '农户', 'luh@outlook.com', '760-9221-6654', '2000-05-19 11:16:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100125, '贾嘉伦', '2195430885', '562432', '农户', 'jiajialu@hotmail.com', '769-031-4834', '2014-09-26 03:05:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100126, '薛致远', '1394942660', '293804', '农户', 'xuezhiy@icloud.com', '755-126-3109', '2021-01-30 21:07:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100127, '朱子异', '9335689082', '736239', '农户', 'ziyizhu1995@outlook.com', '139-0441-7291', '2012-10-06 04:37:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100128, '向宇宁', '5552247033', '139350', '消费者', 'yuxia8@icloud.com', '28-0273-1941', '2001-12-05 06:30:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100129, 'Louise Jones', '1546321051', '523682', '农户', 'jones56@yahoo.com', '141-3138-5216', '2018-02-16 08:43:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100130, 'Debra Nichols', '9098166230', '333715', '农户', 'nicholsdebra81@icloud.com', '130-3867-7941', '2022-06-23 00:48:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100131, 'Helen Simmons', '9170530251', '879101', '消费者', 'hs701@mail.com', '769-051-8408', '2005-12-29 13:49:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100132, '唐子异', '1719824582', '697681', '消费者', 'zitang@gmail.com', '28-6593-3558', '2017-08-08 16:58:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100133, 'Maria Cruz', '1874353906', '542372', '农户', 'cruzmaria@hotmail.com', '28-6427-2444', '2017-03-24 03:48:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100134, 'William Weaver', '6705261758', '971155', '农户', 'wilweav@gmail.com', '10-9079-5888', '2015-01-13 08:42:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100135, '江晓明', '7376902700', '593222', '消费者', 'jiang9@gmail.com', '145-8923-7442', '2006-07-02 19:52:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100136, 'Irene Richardson', '5155707221', '623704', '农户', 'irenericha803@gmail.com', '148-3089-9405', '2000-09-09 18:15:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100137, '黎睿', '5362637526', '228354', '消费者', 'lrui@mail.com', '188-2995-5348', '2019-11-05 23:08:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100138, '熊安琪', '5213795689', '944894', '农户', 'anqixion8@yahoo.com', '175-7175-9675', '2000-12-21 14:53:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100139, '邱杰宏', '6072128348', '156297', '消费者', 'jiqiu408@gmail.com', '760-3659-3185', '2021-05-27 18:39:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100140, 'Sean Patterson', '7462513978', '384950', '农户', 'sean1976@yahoo.com', '28-487-9378', '2021-06-21 05:07:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100141, '雷云熙', '8800801285', '811930', '农户', 'yunlei602@icloud.com', '28-441-6173', '2013-02-12 12:36:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100142, '曹宇宁', '6576698571', '430635', '农户', 'cyu10@gmail.com', '150-9247-3373', '2006-07-25 17:06:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100143, '崔嘉伦', '4455878730', '258363', '消费者', 'jialucui217@outlook.com', '135-8734-7242', '2019-11-20 10:23:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100144, 'Norma Wood', '1399868796', '377321', '消费者', 'wnorm@yahoo.com', '179-3149-6107', '2024-04-18 19:06:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100145, 'Barbara Herrera', '9566984988', '383396', '农户', 'barbaraherrera@outlook.com', '755-2810-1589', '2014-06-14 05:52:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100146, '顾岚', '5428181770', '391023', '消费者', 'lagu1@gmail.com', '130-4474-8020', '2023-11-30 20:46:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100147, 'Mildred Shaw', '8407037067', '697579', '消费者', 'shawm@mail.com', '187-2283-5136', '2014-04-28 17:04:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100148, '傅安琪', '6944695240', '183688', '消费者', 'anqifu6@icloud.com', '20-3306-1912', '2001-02-13 19:02:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100149, '蒋璐', '8843291781', '649947', '农户', 'lujiang4@hotmail.com', '145-5913-9641', '2025-02-05 15:51:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100150, '孙嘉伦', '9413185240', '119205', '农户', 'jialun2004@outlook.com', '172-4151-0581', '2020-04-10 23:05:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100151, '马子异', '2693257299', '959220', '消费者', 'ma1@hotmail.com', '10-276-5250', '2007-04-03 17:57:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100152, '赵致远', '7754638589', '613937', '农户', 'zhaozhiyuan@mail.com', '165-6279-2584', '2016-03-21 05:42:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100153, '陆璐', '4302726175', '864363', '消费者', 'lul@outlook.com', '185-6294-1209', '2020-08-28 01:26:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100154, '胡宇宁', '8901902644', '369454', '农户', 'hyuni@gmail.com', '20-9246-6525', '2018-10-25 22:56:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100155, '汤岚', '6158059288', '999280', '消费者', 'lantang2007@yahoo.com', '20-9416-8305', '2020-08-27 23:34:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100156, '汤璐', '4107601230', '614182', '消费者', 'lutang@yahoo.com', '173-0567-2622', '2014-08-12 01:35:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100157, '叶云熙', '5286384516', '915736', '农户', 'yyunxi1001@icloud.com', '769-832-3921', '2003-12-02 06:07:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100158, '任子异', '2407663313', '768423', '农户', 'renziyi1111@gmail.com', '184-1220-3179', '2017-04-19 06:12:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100159, '陶震南', '2894867565', '497593', '农户', 'taozhen@gmail.com', '760-5211-3675', '2022-02-03 19:28:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100160, '莫睿', '1746377228', '807170', '消费者', 'mr4@gmail.com', '180-8544-8624', '2020-08-03 03:24:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100161, 'Terry Gordon', '1586063106', '781394', '农户', 'tegordon@icloud.com', '150-1655-2471', '2000-01-05 09:38:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100162, 'Helen Ramos', '9094849832', '541900', '农户', 'rhelen9@hotmail.com', '20-022-8624', '2008-10-11 06:56:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100163, 'Theodore King', '7905330515', '681974', '消费者', 'ktheodore@hotmail.com', '180-3957-4365', '2009-06-07 09:26:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100164, 'Josephine Long', '5687293741', '411839', '消费者', 'jol1991@gmail.com', '28-855-7117', '2018-12-21 02:18:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100165, '叶震南', '5180203830', '315934', '消费者', 'yezhennan@outlook.com', '151-6233-2433', '2007-10-14 16:10:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100166, '许子韬', '7483973984', '250958', '农户', 'zitaoxu97@gmail.com', '769-318-0428', '2004-06-30 06:53:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100167, 'Sharon Ramos', '2008170071', '981188', '农户', 'sharoramo4@icloud.com', '154-9291-5291', '2003-08-13 05:42:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100168, '陶安琪', '1976852666', '343235', '农户', 'atao6@outlook.com', '155-7370-6028', '2005-04-14 21:47:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100169, '常子韬', '9290265087', '919174', '农户', 'zitaoc@mail.com', '28-176-4771', '2000-12-18 01:38:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100170, 'Bobby Price', '1431102190', '617762', '消费者', 'bobby2@gmail.com', '20-6318-4852', '2001-06-14 15:30:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100171, 'Catherine Jackson', '9470671443', '741133', '消费者', 'jackson1@gmail.com', '177-9706-3427', '2006-10-02 03:29:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100172, 'Martha Allen', '8038708904', '842667', '农户', 'am5@icloud.com', '159-5730-4568', '2023-02-06 00:23:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100173, 'Joseph Johnson', '8794449523', '876851', '消费者', 'johnsonjoseph@outlook.com', '180-3038-1828', '2018-01-06 05:25:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100174, '郭睿', '8857116046', '627864', '农户', 'gurui302@outlook.com', '193-1280-9350', '2014-01-30 13:50:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100175, '金子异', '4641043350', '380167', '消费者', 'ziyiji@mail.com', '190-0749-0785', '2010-02-24 21:34:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100176, '崔秀英', '4564496635', '753166', '农户', 'xiuyingc121@hotmail.com', '20-154-4281', '2018-11-14 02:41:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100177, '周睿', '5505438299', '260983', '农户', 'zhour@hotmail.com', '28-495-7699', '2015-08-21 05:20:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100178, 'Ruth Campbell', '3335782126', '318732', '农户', 'campbell8@outlook.com', '160-3511-9430', '2012-07-07 22:01:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100179, '侯云熙', '5349351458', '548210', '消费者', 'hoyunx@outlook.com', '176-1039-4375', '2021-01-07 16:32:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100180, '郑岚', '4096795696', '655361', '消费者', 'lazhen@mail.com', '755-634-5627', '2021-07-25 22:09:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100181, 'Janet Thompson', '4806888984', '647964', '农户', 'thompsonjanet1@gmail.com', '21-2743-5215', '2007-12-11 12:17:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100182, 'Melissa Rodriguez', '6748559464', '777425', '农户', 'melissar@yahoo.com', '769-8196-5760', '2011-10-26 15:02:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100183, '彭致远', '3148711091', '830042', '农户', 'pengzhiyuan@gmail.com', '138-7695-5302', '2012-12-06 13:46:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100184, '向子异', '9587542029', '143319', '消费者', 'ziyi61@gmail.com', '190-6086-4770', '2008-02-04 16:32:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100185, 'Wendy Stewart', '2710426215', '939537', '农户', 'wendystewart@mail.com', '20-795-6617', '2005-09-10 13:15:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100186, '邱璐', '4091435423', '678954', '农户', 'lu1202@outlook.com', '760-1942-3427', '2003-11-20 23:08:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100187, '阎嘉伦', '2652412627', '190191', '农户', 'jialun2@hotmail.com', '150-5161-5247', '2015-08-08 06:42:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100188, 'Ricky King', '4138995991', '194393', '消费者', 'kingricky@hotmail.com', '172-7209-9364', '2009-02-01 15:17:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100189, 'Alice Aguilar', '3443534081', '695407', '消费者', 'alice10@gmail.com', '21-1908-7363', '2016-04-27 09:06:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100190, '沈嘉伦', '8955714503', '564675', '农户', 'shenjial04@hotmail.com', '21-679-4913', '2009-04-29 10:56:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100191, 'Jose Snyder', '3127179014', '183289', '农户', 'josnyder@yahoo.com', '21-5782-0144', '2018-08-29 09:08:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100192, '胡睿', '6245524760', '242380', '农户', 'ruihu@icloud.com', '28-008-5080', '2017-06-23 13:36:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100193, 'Henry Thompson', '6096482230', '136357', '消费者', 'henryt@icloud.com', '21-1011-3548', '2003-11-04 02:28:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100194, 'Kenneth White', '5073852377', '252645', '农户', 'white64@gmail.com', '20-3894-2189', '2003-06-13 11:02:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100195, 'Jonathan Ward', '8029595419', '490207', '消费者', 'ward5@icloud.com', '146-6271-0166', '2020-04-23 22:48:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100196, '傅安琪', '3858130184', '890483', '消费者', 'anf@gmail.com', '157-7701-6794', '2001-02-14 18:35:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100197, 'Irene Nichols', '4109028887', '393012', '消费者', 'nicirene59@mail.com', '10-2560-6450', '2003-10-03 06:14:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100198, '阎岚', '4642096316', '540725', '农户', 'yl304@gmail.com', '28-2987-3598', '2017-10-08 05:37:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100199, 'Paula Alvarez', '7353685641', '314816', '消费者', 'paulaalvar2003@hotmail.com', '176-5639-6981', '2023-03-16 18:35:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100200, 'Connie Phillips', '2667323871', '314106', '农户', 'connie2@gmail.com', '28-5050-3645', '2007-02-25 23:47:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100201, 'Stephen Castillo', '5419038872', '507319', '农户', 'cstephen@icloud.com', '148-3609-7775', '2019-03-29 02:50:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100202, '邹杰宏', '3990205781', '993623', '农户', 'jiehz5@yahoo.com', '195-6941-8457', '2000-05-14 07:56:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100203, '孔嘉伦', '8066608985', '695255', '农户', 'jk61@gmail.com', '10-0651-8991', '2002-01-01 12:17:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100204, '李子异', '1568839024', '766704', '消费者', 'ziyi1002@gmail.com', '135-9660-2193', '2022-09-15 09:20:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100205, 'Bruce Hernandez', '3165894343', '354004', '农户', 'bruce5@gmail.com', '10-7437-3480', '2023-08-19 04:21:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100206, '卢震南', '6901489136', '477808', '消费者', 'zhennan1111@icloud.com', '21-0356-5266', '2000-06-21 07:10:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100207, '曹致远', '5131761883', '868352', '消费者', 'zhiyuancao@yahoo.com', '10-235-7933', '2015-01-23 21:05:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100208, '邹嘉伦', '5295532248', '422643', '消费者', 'jialuz@gmail.com', '144-0086-9923', '2002-01-10 13:39:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100209, '卢宇宁', '7156379403', '792712', '消费者', 'luyunin@gmail.com', '20-183-4437', '2012-02-24 21:04:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100210, 'Stanley West', '7468314856', '899995', '消费者', 'weststa@gmail.com', '760-250-5182', '2001-06-22 21:48:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100211, '韩子异', '6251489133', '550569', '农户', 'hanz409@outlook.com', '197-7921-3099', '2000-09-20 21:41:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100212, 'Nicole Henry', '9634122710', '570094', '消费者', 'hnicole324@gmail.com', '20-9771-0669', '2016-08-12 17:11:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100213, 'Lawrence Medina', '8308600668', '530826', '消费者', 'lawrencemedin2@icloud.com', '158-2624-4519', '2016-11-22 17:37:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100214, 'Eleanor Mendoza', '5575876773', '585543', '消费者', 'mendozaelean8@gmail.com', '769-6905-7188', '2022-07-15 06:44:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100215, 'Francisco Taylor', '4707173709', '513819', '消费者', 'tfrancisco@gmail.com', '156-4588-8742', '2001-11-16 06:06:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100216, '蒋安琪', '6231470541', '702214', '消费者', 'anqj@outlook.com', '755-9674-8203', '2005-11-14 20:52:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100217, '廖子韬', '9142987687', '394786', '农户', 'lzitao@outlook.com', '136-6753-7423', '2017-11-22 01:59:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100218, 'Theresa Meyer', '4904388119', '150135', '消费者', 'mt103@outlook.com', '153-2844-2196', '2011-01-09 23:23:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100219, 'Shawn Cook', '9952915800', '670779', '消费者', 'cook1941@mail.com', '142-9546-3023', '2009-01-29 10:55:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100220, '萧秀英', '4359345922', '651612', '农户', 'xiuyingxiao@yahoo.com', '186-0721-7402', '2009-12-05 17:09:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100221, 'Jeff Ferguson', '5117975550', '528602', '农户', 'jefffe3@outlook.com', '769-2372-3784', '2016-02-02 09:44:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100222, '史致远', '9130082089', '703353', '农户', 'shizhiy@outlook.com', '21-200-2649', '2020-03-22 09:53:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100223, '顾子韬', '3818519754', '478039', '消费者', 'zitao1@mail.com', '28-884-5047', '2012-08-06 23:44:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100224, '姜震南', '7838735228', '317080', '农户', 'jiangz56@icloud.com', '159-6076-1730', '2006-11-08 12:26:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100225, '阎致远', '6082341697', '730437', '消费者', 'zyan@icloud.com', '760-0895-4900', '2023-02-02 15:19:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100226, '王晓明', '9843860475', '809601', '农户', 'xiaomingwa@icloud.com', '132-6607-9214', '2009-07-14 23:13:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100227, 'Juanita Hall', '3579115939', '932411', '农户', 'hall57@gmail.com', '755-7501-3272', '2024-06-30 14:42:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100228, 'Francisco Simmons', '4133585145', '480250', '农户', 'simmons9@icloud.com', '194-5756-4403', '2022-04-21 20:55:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100229, '朱宇宁', '7111854054', '880569', '农户', 'zhuyunin1970@gmail.com', '769-959-8118', '2001-09-04 14:59:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100230, 'Joyce Graham', '2524647734', '889022', '农户', 'grahj@mail.com', '143-7615-2102', '2002-10-29 10:26:27', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100231, 'Louis Herrera', '2667105298', '385875', '农户', 'hlou@outlook.com', '140-3351-3011', '2007-07-19 04:11:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100232, '向安琪', '3009831790', '889885', '农户', 'axian4@outlook.com', '140-5493-1424', '2000-03-15 06:05:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100233, 'Joseph Cooper', '1340151517', '375441', '农户', 'coopej@gmail.com', '160-0284-0897', '2006-12-28 22:57:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100234, '邹云熙', '5834690609', '689844', '农户', 'yunxizou@icloud.com', '20-4111-3490', '2022-10-14 10:46:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100235, '薛致远', '2958210176', '574722', '消费者', 'xue89@gmail.com', '755-5474-9911', '2008-02-09 13:54:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100236, '阎子异', '7653873229', '422058', '消费者', 'yanziyi55@outlook.com', '189-0939-7903', '2005-01-03 05:48:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100237, 'Denise Webb', '4055754642', '600347', '农户', 'webb1017@mail.com', '135-9835-1636', '2021-09-13 10:37:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100238, '林子异', '7476592502', '227516', '消费者', 'ziyi03@gmail.com', '196-3784-0133', '2016-03-18 01:05:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100239, '顾秀英', '9234831328', '250074', '农户', 'guxi@gmail.com', '188-0224-9854', '2018-02-12 01:39:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100240, 'Diana Rivera', '5402598957', '187734', '消费者', 'dir@mail.com', '185-3275-2950', '2013-04-26 17:42:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100241, '向子异', '9047073720', '602406', '消费者', 'ziyixi@outlook.com', '170-6019-8523', '2019-03-06 10:15:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100242, 'James West', '5371940290', '139527', '消费者', 'westja@hotmail.com', '760-3999-6526', '2005-04-06 06:50:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100243, 'Alexander White', '7341402223', '961295', '消费者', 'alexander204@yahoo.com', '181-0260-8214', '2022-07-04 20:45:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100244, '赵安琪', '9975372765', '362190', '消费者', 'azha5@yahoo.com', '769-426-8531', '2005-08-05 13:41:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100245, 'Danny Myers', '7453329637', '286164', '农户', 'myersda8@mail.com', '10-427-7990', '2019-11-24 04:28:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100246, 'Adam Thompson', '3859207825', '663285', '消费者', 'adam1@outlook.com', '769-9291-3566', '2023-04-27 16:55:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100247, 'Paula Harris', '8318075976', '480095', '消费者', 'harrpa@icloud.com', '152-9560-0950', '2006-05-05 12:15:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100248, 'Esther Ryan', '7729862976', '157596', '消费者', 'ryaesth@outlook.com', '137-4653-7000', '2024-12-13 07:06:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100249, 'Steve Palmer', '2208752759', '720978', '消费者', 'palmers@mail.com', '20-806-6413', '2003-04-29 22:47:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100250, 'Arthur Gomez', '8571708271', '235667', '农户', 'gomezarth923@hotmail.com', '755-070-0580', '2019-05-18 01:03:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100251, '徐子韬', '3706838646', '446430', '消费者', 'zitao2000@hotmail.com', '170-9751-5456', '2020-11-17 07:16:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100252, 'Annie Wallace', '1723410977', '254497', '消费者', 'annie4@icloud.com', '21-9444-9295', '2008-11-30 08:57:27', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100253, '吕致远', '9751346839', '935878', '农户', 'luz@gmail.com', '189-3248-6700', '2011-01-31 11:37:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100254, 'Bernard Wood', '7489313568', '483567', '消费者', 'bernardwood@mail.com', '21-385-2223', '2013-11-04 04:57:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100255, '孔宇宁', '8300698375', '359389', '消费者', 'koyun@outlook.com', '184-9230-7951', '2000-06-06 01:01:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100256, 'Evelyn Gordon', '5219894981', '165111', '农户', 'evelyn90@mail.com', '760-7043-2848', '2024-10-01 17:01:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100257, 'Harry Collins', '6358544373', '645123', '消费者', 'hacollins@hotmail.com', '152-2167-1921', '2021-06-18 01:19:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100258, 'Nicole Campbell', '4845958539', '802919', '消费者', 'canic824@mail.com', '769-6523-9105', '2024-11-04 12:45:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100259, 'Frederick Turner', '9767553588', '768015', '消费者', 'turnerfrederick605@gmail.com', '21-4855-1981', '2000-06-27 11:18:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100260, '丁睿', '8802013291', '530579', '消费者', 'dingrui@gmail.com', '21-669-4170', '2012-02-02 02:11:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100261, 'Gregory Torres', '3332318091', '515189', '消费者', 'gregorytor@hotmail.com', '176-2356-8321', '2002-11-05 09:55:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100262, 'Bonnie Webb', '7748925374', '222722', '农户', 'bonniewebb@outlook.com', '20-704-8030', '2023-09-07 13:49:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100263, '罗宇宁', '3123208201', '566716', '消费者', 'yuningluo@gmail.com', '20-424-0254', '2002-07-11 18:00:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100264, '钱岚', '6141777299', '102748', '消费者', 'qianl80@mail.com', '176-7645-9976', '2003-10-31 12:21:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100265, '莫晓明', '1677845148', '744992', '农户', 'mo8@mail.com', '769-513-7271', '2010-08-06 07:36:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100266, '邱秀英', '4692911537', '629901', '农户', 'xiuyingqi7@gmail.com', '10-726-0241', '2021-01-19 04:32:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100267, '侯杰宏', '6855190972', '640150', '消费者', 'hou1970@yahoo.com', '28-8352-5056', '2024-07-29 04:15:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100268, '谭晓明', '9553998990', '350247', '消费者', 'tan10@gmail.com', '172-8163-2587', '2024-03-30 03:33:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100269, 'Edith Moreno', '1289771593', '581055', '消费者', 'moreno85@icloud.com', '197-5169-8375', '2023-08-28 15:37:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100270, '石震南', '9294774273', '329016', '消费者', 'shzhenn@icloud.com', '20-746-2841', '2016-07-11 03:03:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100271, '金云熙', '2302520465', '635503', '消费者', 'jiyunxi@icloud.com', '158-4674-9612', '2004-06-20 04:19:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100272, 'Alexander Richardson', '1109000479', '444898', '农户', 'richardsonal@gmail.com', '174-4895-4582', '2014-03-17 15:21:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100273, '郑云熙', '5692380213', '182147', '农户', 'yunxi1@gmail.com', '143-8974-7624', '2021-12-17 06:51:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100274, '王致远', '6804213647', '159962', '农户', 'zhiyuwang@icloud.com', '760-589-3084', '2008-02-22 22:35:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100275, 'Stephen Rodriguez', '5257605536', '495293', '消费者', 'stephenrodriguez2@yahoo.com', '137-3072-4713', '2021-12-05 14:44:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100276, '常詩涵', '6414238606', '144754', '消费者', 'chang81@gmail.com', '28-0219-6508', '2017-10-06 04:29:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100277, 'Eva Ellis', '5495203991', '202817', '农户', 'ellise5@icloud.com', '137-8020-9238', '2003-07-06 19:00:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100278, '郝致远', '6882838258', '164256', '农户', 'hao902@gmail.com', '20-357-2334', '2000-07-28 01:27:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100279, '周云熙', '3546487512', '958997', '消费者', 'yzhou2@gmail.com', '167-0881-7989', '2000-03-01 13:44:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100280, '汪嘉伦', '1444133195', '503692', '消费者', 'jiawan@icloud.com', '142-7098-3468', '2021-06-16 10:33:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100281, '谭晓明', '1778126559', '476796', '消费者', 'tanxiaom7@gmail.com', '755-5255-4083', '2013-03-05 09:23:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100282, '邓宇宁', '6940284755', '132998', '消费者', 'dyunin@gmail.com', '165-9955-9801', '2003-09-25 01:24:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100283, 'Edna Gonzales', '1802863660', '942080', '农户', 'gonzales101@icloud.com', '167-4047-0133', '2022-05-30 12:13:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100284, 'Annie Black', '7935445930', '991399', '农户', 'annieblack@gmail.com', '21-170-4546', '2015-07-16 09:11:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100285, '熊璐', '1433248381', '380885', '消费者', 'luxiong@outlook.com', '10-475-5106', '2005-06-05 08:40:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100286, '侯安琪', '9994730793', '181946', '农户', 'hoan@outlook.com', '769-027-8284', '2009-07-27 22:02:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100287, 'Theresa Aguilar', '5940569961', '128214', '消费者', 'atheresa4@outlook.com', '192-7451-8818', '2003-06-14 05:35:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100288, 'Francisco Webb', '9037787977', '583810', '农户', 'wfrancisco@icloud.com', '132-9793-4979', '2000-01-31 20:42:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100289, 'Jonathan Perez', '3038936220', '865566', '农户', 'perezjonathan@gmail.com', '755-142-0397', '2002-06-26 10:34:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100290, 'Mario Thomas', '5376911100', '101730', '消费者', 'thomas8@gmail.com', '169-6095-3247', '2019-12-03 05:24:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100291, '崔杰宏', '3631344100', '903934', '消费者', 'jiehc@icloud.com', '136-3791-6700', '2013-01-18 04:44:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100292, '叶致远', '5626374207', '967274', '农户', 'zhiyuan75@gmail.com', '164-6814-5984', '2024-07-02 06:07:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100293, 'Joseph Rose', '4480890471', '517916', '消费者', 'joseph61@gmail.com', '167-7906-0155', '2019-08-05 13:15:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100294, '丁子异', '7437240798', '775467', '消费者', 'dinz1@mail.com', '152-6537-8381', '2011-10-03 17:28:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100295, '龙睿', '8968363509', '858708', '消费者', 'lorui@hotmail.com', '136-6156-9762', '2008-12-28 04:53:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100296, '陈璐', '5666869343', '636512', '消费者', 'luc3@gmail.com', '151-6385-2516', '2018-12-14 23:59:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100297, 'Walter Lopez', '9177697296', '657765', '消费者', 'lopezwalter06@hotmail.com', '179-8472-4797', '2015-06-11 22:47:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100298, 'Gregory Reed', '8894156946', '373276', '消费者', 'gregory1012@icloud.com', '769-430-4611', '2019-07-19 07:04:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100299, 'Joan Alvarez', '5981980054', '668412', '农户', 'alvarjoan@outlook.com', '184-3197-2306', '2017-04-10 20:34:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100300, 'Mary Powell', '6420106052', '102137', '消费者', 'powell84@yahoo.com', '159-4982-9908', '2005-02-07 19:57:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100301, 'Russell Hunter', '2883722925', '219106', '农户', 'russell77@gmail.com', '20-333-9335', '2012-03-21 00:35:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100302, 'Lori Nguyen', '4538678886', '319381', '农户', 'lnguyen5@gmail.com', '185-7288-4707', '2021-06-01 07:16:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100303, 'Joanne Simmons', '9030895451', '373522', '农户', 'jsimmons8@hotmail.com', '186-9654-8056', '2023-05-14 11:37:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100304, 'Douglas Romero', '8702926735', '533280', '农户', 'douglas2@gmail.com', '10-4700-1922', '2023-12-17 04:05:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100305, 'Susan Black', '8413547906', '510705', '农户', 'blacsusa@outlook.com', '760-3856-5770', '2008-02-11 11:38:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100306, 'Alice Rodriguez', '7463745836', '968344', '消费者', 'alice129@gmail.com', '10-9718-0169', '2001-02-24 00:53:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100307, '石子异', '7637613235', '597272', '农户', 'ziyishi10@icloud.com', '193-5883-7944', '2024-07-21 00:02:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100308, '陶璐', '6848371503', '650837', '消费者', 'talu8@mail.com', '185-8627-9370', '2000-10-16 02:02:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100309, 'Ann Hicks', '7000568214', '454507', '消费者', 'annhicks@hotmail.com', '760-703-2800', '2023-07-27 03:24:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100310, '龚子韬', '1100873768', '530141', '消费者', 'zitaogong@gmail.com', '755-5978-7550', '2024-02-02 00:14:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100311, 'Beverly Stone', '8612905549', '798893', '农户', 'beston@gmail.com', '165-7601-6271', '2005-08-24 21:10:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100312, '陶嘉伦', '1074344210', '390331', '农户', 'jialun1220@gmail.com', '755-8751-1634', '2007-03-02 23:43:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100313, 'Lori Vargas', '7778133417', '821052', '农户', 'vargaslori@mail.com', '10-4483-3177', '2018-11-19 03:07:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100314, 'Emma Chavez', '3098142087', '349659', '消费者', 'chae@gmail.com', '760-3401-8959', '2021-03-30 18:00:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100315, '董詩涵', '1314262767', '659027', '农户', 'dongshiha94@outlook.com', '21-2478-6763', '2013-03-18 21:46:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100316, 'Roy Moore', '3091043168', '257745', '消费者', 'roymo@yahoo.com', '769-448-4037', '2012-08-03 04:32:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100317, 'Carolyn Moreno', '6119584140', '800848', '消费者', 'cam312@mail.com', '20-569-7121', '2005-11-05 12:39:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100318, '贾安琪', '9432980147', '115518', '消费者', 'jia20@outlook.com', '195-7671-5323', '2001-01-27 17:37:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100319, '江子异', '5453493375', '662186', '农户', 'zjiang@outlook.com', '199-2972-1598', '2021-12-26 17:46:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100320, 'Theresa Mcdonald', '2859966395', '139529', '农户', 'mcdonald10@icloud.com', '148-2275-3052', '2023-01-02 12:10:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100321, 'Carolyn Coleman', '1004373850', '332920', '消费者', 'cacoleman3@yahoo.com', '760-989-6184', '2006-02-25 20:39:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100322, '于嘉伦', '4459144483', '751486', '农户', 'jiy@mail.com', '157-4126-4127', '2001-09-20 22:46:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100323, '邵晓明', '9670885138', '774461', '消费者', 'shaox@outlook.com', '755-430-0076', '2013-02-06 23:31:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100324, '雷詩涵', '3867397440', '813649', '消费者', 'shlei8@outlook.com', '160-2562-7503', '2007-03-15 12:55:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100325, '程杰宏', '5603231953', '491155', '消费者', 'chenjiehong1@icloud.com', '760-246-3175', '2004-05-07 05:08:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100326, 'Louis Tran', '4009825839', '208904', '农户', 'louitran@icloud.com', '760-820-5850', '2016-07-15 23:02:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100327, '武杰宏', '5672521267', '303182', '农户', 'jiehongw307@mail.com', '760-131-7460', '2009-09-03 12:45:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100328, 'Phyllis Reed', '4369307477', '912864', '农户', 'phreed6@mail.com', '769-0953-8726', '2013-03-16 18:56:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100329, '林子韬', '6580526846', '607822', '农户', 'zitaolin@mail.com', '131-3088-3734', '2007-02-03 00:51:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100330, '毛致远', '8877850170', '206151', '消费者', 'zhiyuan7@gmail.com', '10-9743-6846', '2012-09-14 16:33:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100331, 'Todd Martin', '2102962177', '805787', '农户', 'mtod@outlook.com', '189-7256-5542', '2006-05-28 14:12:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100332, 'Marilyn Patterson', '2927010754', '915245', '农户', 'pattersonmaril@gmail.com', '20-338-3663', '2016-12-09 04:00:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100333, 'Elizabeth King', '9643714586', '389859', '农户', 'eki@hotmail.com', '176-3212-2847', '2021-02-14 17:15:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100334, '石晓明', '9126514237', '794554', '农户', 'shixiaoming@icloud.com', '10-8416-3493', '2000-02-25 05:44:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100335, '金岚', '2408723336', '870030', '农户', 'lanj4@gmail.com', '174-0757-7856', '2001-02-04 22:27:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100336, 'Wendy Gonzalez', '9659523146', '739048', '消费者', 'gonzalez59@hotmail.com', '755-9416-9152', '2005-12-24 11:57:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100337, 'Sandra Campbell', '8607028410', '736499', '农户', 'sandracampb8@gmail.com', '149-4105-3631', '2014-11-20 14:49:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100338, '钱岚', '5624662776', '222861', '消费者', 'qianlan3@gmail.com', '10-988-0945', '2013-01-03 08:21:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100339, 'Ashley Tran', '9592525412', '743712', '消费者', 'atran@mail.com', '174-4994-8115', '2019-09-06 06:06:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100340, '雷安琪', '3172540855', '122791', '消费者', 'anlei@outlook.com', '755-530-4839', '2014-03-01 13:17:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100341, 'Esther Cooper', '2640710371', '767488', '农户', 'cooperesth@hotmail.com', '769-139-1947', '2008-12-17 23:29:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100342, 'Emma Morales', '2089518182', '145530', '消费者', 'emma82@gmail.com', '173-0398-1412', '2005-09-06 20:57:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100343, '秦詩涵', '3970272468', '492452', '消费者', 'qinsh1993@outlook.com', '151-4417-9029', '2011-05-23 02:27:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100344, 'Roger Flores', '2957162570', '712928', '消费者', 'floresroger1995@yahoo.com', '175-3094-2649', '2018-12-08 12:42:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100345, '于安琪', '5463000262', '959355', '农户', 'yanqi@yahoo.com', '161-0467-9143', '2017-08-11 17:50:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100346, 'Curtis Jackson', '7335043340', '501810', '农户', 'jacu41@icloud.com', '198-5157-3566', '2004-12-20 06:26:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100347, 'Benjamin Hall', '7637055746', '324657', '消费者', 'hbenj@mail.com', '161-3617-3794', '2022-12-09 12:33:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100348, 'Rose Hawkins', '3850760053', '134756', '消费者', 'hawrose12@icloud.com', '176-5204-2199', '2011-07-28 23:40:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100349, '金安琪', '6275817081', '702057', '农户', 'jin627@mail.com', '21-656-9129', '2001-05-26 11:01:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100350, 'Jessica Wells', '6003157191', '471690', '消费者', 'wells2@hotmail.com', '162-1458-3885', '2012-08-31 17:11:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100351, '薛杰宏', '3620003210', '924407', '消费者', 'jxu@gmail.com', '156-0189-7337', '2018-09-11 04:02:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100352, 'George Gutierrez', '3935482517', '281340', '农户', 'gutge@gmail.com', '161-0750-9909', '2005-03-21 04:25:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100353, '龚嘉伦', '2383661235', '706127', '农户', 'gjia@outlook.com', '150-7561-6118', '2019-05-14 08:05:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100354, 'Matthew Foster', '8891747002', '351205', '农户', 'fostematthew@gmail.com', '172-0195-3777', '2023-01-31 09:52:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100355, 'Jack Roberts', '1398664778', '405002', '消费者', 'jackroberts120@hotmail.com', '162-4191-8143', '2001-12-20 17:28:27', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100356, '林杰宏', '8323799005', '251947', '农户', 'linj@gmail.com', '136-1331-5158', '2017-03-17 04:51:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100357, 'Julie Patel', '6954961577', '718452', '消费者', 'juliep2013@gmail.com', '21-705-9925', '2001-10-31 05:39:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100358, '林子韬', '5428796396', '313129', '农户', 'zitli4@outlook.com', '21-198-6593', '2020-05-30 07:25:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100359, 'Jeremy Stone', '2155998235', '338790', '农户', 'jstone2016@gmail.com', '158-6553-2491', '2015-11-09 09:26:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100360, 'Lee Rivera', '6857314720', '642562', '消费者', 'riverle911@outlook.com', '760-5172-1830', '2010-03-14 17:52:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100361, 'Charlotte Nelson', '8277187627', '880247', '消费者', 'cn4@hotmail.com', '168-5605-1311', '2002-08-09 16:11:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100362, '彭子韬', '6006361919', '576009', '农户', 'zitaop@mail.com', '193-5819-9543', '2008-04-18 10:05:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100363, 'Terry Ross', '7792135668', '885633', '农户', 'rossterry@outlook.com', '188-2945-0502', '2022-07-29 21:40:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100364, 'Rebecca Mendez', '7983060419', '123094', '农户', 'rebeccamend@gmail.com', '10-6573-5105', '2004-08-31 14:45:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100365, 'Judith Gutierrez', '8884210486', '222352', '农户', 'judgutierrez2@outlook.com', '28-894-9286', '2011-05-13 13:21:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100366, '史云熙', '9749877621', '407737', '农户', 'shiyunxi711@gmail.com', '176-0404-5395', '2007-12-21 05:12:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100367, 'Micheal Mendez', '3499768211', '145216', '农户', 'michme@icloud.com', '145-1327-3727', '2010-12-25 06:53:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100368, 'Stanley Spencer', '4448014727', '418269', '消费者', 'sspenc@gmail.com', '148-3255-7647', '2010-11-28 14:01:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100369, 'Angela Thompson', '4724994656', '728989', '农户', 'thompsonangel@mail.com', '177-0623-0420', '2007-04-07 23:55:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100370, 'Theodore Gutierrez', '3873001524', '728730', '农户', 'guttheo10@outlook.com', '28-392-1662', '2020-10-24 11:17:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100371, '段璐', '1147967847', '673265', '消费者', 'duanlu@outlook.com', '161-7534-1353', '2020-09-20 08:29:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100372, 'Benjamin Mitchell', '7533709920', '197501', '农户', 'mbe@yahoo.com', '755-842-0502', '2016-05-07 10:31:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100373, 'Barry Morgan', '3683132058', '277654', '消费者', 'barrymorgan@mail.com', '147-3326-3021', '2003-07-14 18:48:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100374, '秦震南', '3913361884', '942430', '农户', 'qzhennan4@gmail.com', '179-5627-9692', '2018-10-03 09:00:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100375, 'Joan Morales', '9340950271', '142767', '消费者', 'joamo10@gmail.com', '20-451-1754', '2015-09-10 18:50:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100376, '郝子异', '6607795914', '597296', '消费者', 'haziyi1@icloud.com', '183-1673-6154', '2013-05-09 16:30:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100377, '胡秀英', '8106812474', '421617', '消费者', 'xiuyihu1015@hotmail.com', '163-1241-9168', '2016-08-16 01:39:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100378, 'Anna Torres', '1886327590', '974157', '消费者', 'anntorres@icloud.com', '155-0771-2672', '2021-01-09 11:57:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100379, '邱宇宁', '9814753064', '195569', '消费者', 'yunq@outlook.com', '21-7521-9747', '2020-12-09 11:31:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100380, 'Martin Perry', '7397004625', '496020', '消费者', 'perrymartin1977@outlook.com', '192-9051-6262', '2006-03-23 07:38:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100381, 'Valerie Bennett', '3386688722', '480414', '消费者', 'valeriebennett1225@gmail.com', '150-8153-1718', '2004-10-26 07:46:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100382, '戴宇宁', '7006444415', '555375', '消费者', 'dyuning71@hotmail.com', '189-3910-0038', '2013-10-17 13:26:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100383, '蒋杰宏', '1040203032', '364324', '消费者', 'jiajie1@icloud.com', '151-3874-6716', '2010-07-30 02:44:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100384, 'Mildred Gutierrez', '8671592930', '292132', '消费者', 'mildred83@mail.com', '755-885-1741', '2007-08-26 18:58:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100385, 'Crystal Medina', '5113337740', '408434', '消费者', 'mcrystal86@gmail.com', '159-4833-5775', '2011-04-08 05:43:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100386, 'Micheal Ramirez', '1856474079', '726191', '农户', 'ramirez57@outlook.com', '130-2157-2060', '2020-02-03 17:09:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100387, 'William Brown', '3350520787', '111040', '农户', 'brownwill@outlook.com', '769-4307-3759', '2022-11-21 22:00:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100388, 'Johnny Clark', '3864354874', '471834', '农户', 'clarkj10@icloud.com', '760-687-0399', '2020-12-22 18:00:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100389, 'Diane Mendez', '5858242318', '960871', '农户', 'diamend@mail.com', '10-1538-4873', '2004-11-22 09:33:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100390, '杜晓明', '6102642447', '900010', '消费者', 'duxiaoming4@outlook.com', '137-6892-1450', '2010-11-09 19:48:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100391, '黎震南', '9624085810', '851136', '消费者', 'zhennanli811@gmail.com', '769-9376-3623', '2010-10-14 17:42:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100392, 'Lois Mills', '8241786959', '107918', '消费者', 'millslois70@yahoo.com', '28-1432-6362', '2003-01-14 21:12:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100393, 'Grace Gray', '6488253086', '796368', '农户', 'gracegray1948@outlook.com', '755-857-7365', '2017-03-18 00:03:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100394, '赵詩涵', '7895425839', '233449', '农户', 'shihanzhao8@gmail.com', '134-4643-1797', '2007-02-13 16:10:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100395, '董晓明', '8523227065', '712343', '农户', 'dong00@yahoo.com', '769-3024-3561', '2018-03-05 18:39:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100396, 'Elizabeth Lopez', '5856700657', '591984', '消费者', 'lopeelizabeth79@gmail.com', '769-857-1011', '2016-03-19 15:23:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100397, '徐子韬', '4557999770', '729176', '农户', 'zitxu@icloud.com', '182-6534-2998', '2003-11-28 13:26:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100398, 'Rachel Schmidt', '9524338694', '340645', '农户', 'schmidt6@gmail.com', '139-0870-8063', '2016-05-19 23:17:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100399, 'Raymond Chavez', '6010839247', '869389', '农户', 'chavezr@icloud.com', '760-629-3790', '2001-01-25 12:34:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100400, 'Karen Jimenez', '5628370232', '959195', '农户', 'jimenez87@hotmail.com', '192-0757-7669', '2021-06-30 00:25:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100401, '严子异', '6808021925', '532736', '消费者', 'ziyyan@outlook.com', '161-4600-5673', '2013-03-15 09:41:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100402, '田子韬', '1559574262', '233729', '农户', 'zitaotian@mail.com', '28-9866-9101', '2014-07-10 19:55:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100403, 'Mario Walker', '8203672485', '724253', '消费者', 'walker52@gmail.com', '186-4549-5864', '2007-06-05 02:56:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100404, '傅致远', '4835933792', '338447', '农户', 'fuzhiy5@gmail.com', '146-9373-1391', '2014-08-12 08:14:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100405, 'Walter Tran', '9726703404', '508549', '农户', 'tran1012@mail.com', '28-548-1935', '2011-08-21 07:51:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100406, '龚震南', '3907802222', '347693', '消费者', 'gozhennan10@gmail.com', '175-1212-5179', '2009-03-21 05:03:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100407, '戴致远', '7628623625', '244871', '消费者', 'zhiyd@gmail.com', '760-872-1315', '2015-06-30 08:26:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100408, '苏子异', '1391709135', '128268', '消费者', 'zsu@gmail.com', '144-5224-8329', '2013-05-25 21:33:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100409, '苏子异', '8876785599', '811323', '农户', 'zisu@hotmail.com', '165-1582-5703', '2012-06-09 01:57:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100410, '孔嘉伦', '4863535187', '745396', '消费者', 'jialukong@gmail.com', '10-139-9974', '2017-08-21 01:59:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100411, '谭詩涵', '1553497485', '188014', '消费者', 'tan821@icloud.com', '21-447-8797', '2022-10-16 19:27:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100412, '汪子韬', '8082229226', '823799', '农户', 'zitaowang@hotmail.com', '167-3548-9471', '2019-06-08 19:57:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100413, '郑晓明', '9367802925', '827479', '消费者', 'xiaomingzhe428@outlook.com', '144-7173-9613', '2002-01-24 08:44:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100414, 'Philip Bryant', '3118718846', '619179', '消费者', 'philipbryant@outlook.com', '145-0308-7301', '2003-10-02 09:05:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100415, '方宇宁', '9804214520', '752628', '消费者', 'yuning03@gmail.com', '146-8220-2367', '2003-09-27 00:28:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100416, 'Joanne Taylor', '6600428739', '385434', '消费者', 'taylojoann@mail.com', '20-164-4782', '2016-04-14 20:30:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100417, 'Ann Brown', '5173031370', '545621', '消费者', 'anbrown@gmail.com', '769-2276-6730', '2023-08-17 15:33:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100418, 'Florence Grant', '2266587075', '688418', '消费者', 'grflorence130@icloud.com', '134-9342-4355', '2009-08-01 14:30:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100419, '梁安琪', '3326402891', '341376', '消费者', 'liang3@gmail.com', '10-769-4881', '2021-06-30 18:41:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100420, 'Keith Adams', '9711426539', '665502', '消费者', 'keith10@gmail.com', '28-681-8106', '2004-08-03 07:59:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100421, '王秀英', '6530186157', '582114', '消费者', 'xiuywang@yahoo.com', '172-5470-2637', '2018-03-17 03:08:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100422, '王詩涵', '4709552114', '991638', '农户', 'swang@mail.com', '21-115-8656', '2008-11-22 19:58:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100423, 'Matthew Hawkins', '7579504884', '925143', '消费者', 'matthewha404@hotmail.com', '140-6475-5276', '2003-02-17 04:14:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100424, '金云熙', '9462770565', '522899', '农户', 'jinyu@gmail.com', '28-132-8818', '2022-10-05 18:18:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100425, '常詩涵', '4293335106', '359610', '农户', 'changshihan@outlook.com', '760-731-7919', '2012-01-26 13:44:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100426, '向安琪', '4736601317', '449418', '消费者', 'xianganqi319@mail.com', '188-0549-6749', '2010-10-05 10:19:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100427, 'Cindy Lewis', '5408352892', '954976', '消费者', 'cindy3@outlook.com', '139-1475-1066', '2022-09-25 07:01:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100428, 'Sherry Ford', '6633227343', '573882', '农户', 'sherry85@icloud.com', '769-1679-4916', '2006-07-16 13:33:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100429, '江震南', '3030150285', '404465', '消费者', 'jiazh@icloud.com', '769-1777-3119', '2021-10-08 10:38:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100430, 'Theresa Black', '5268926987', '959693', '消费者', 'tbl707@gmail.com', '165-6139-7634', '2012-07-29 08:04:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100431, '叶睿', '3442908240', '889934', '农户', 'ruiye1956@gmail.com', '28-669-4565', '2007-02-18 18:23:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100432, '江子韬', '3221011866', '291182', '农户', 'jiangzitao@hotmail.com', '755-638-3271', '2004-09-16 21:07:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100433, '胡嘉伦', '4409446828', '361025', '消费者', 'huj1128@icloud.com', '769-1797-9584', '2011-11-12 15:14:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100434, 'Cynthia Munoz', '8492330184', '823099', '消费者', 'cyntmunoz@gmail.com', '138-7882-0241', '2002-11-10 01:20:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100435, '段子韬', '9583947595', '844558', '消费者', 'zitad@yahoo.com', '28-6895-9007', '2007-06-11 19:08:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100436, '贺安琪', '4304851736', '332540', '消费者', 'anqi43@hotmail.com', '155-3876-7267', '2019-05-23 18:51:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100437, 'Mildred Dunn', '5532307716', '915140', '农户', 'mildreddun@outlook.com', '139-8513-7706', '2007-08-15 22:34:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100438, '钟子异', '6419730095', '932546', '农户', 'ziyi206@gmail.com', '156-5847-8060', '2000-05-15 18:38:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100439, 'Alfred Perry', '6202755792', '527246', '消费者', 'perryalfre@hotmail.com', '28-977-0253', '2009-02-13 16:10:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100440, 'Sheila Simmons', '2687516434', '541287', '消费者', 'sheilasi10@icloud.com', '21-3986-2498', '2014-11-03 09:36:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100441, 'Emily Green', '2411751178', '383801', '消费者', 'greemil@outlook.com', '150-4943-0585', '2022-11-19 05:41:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100442, 'Ethel Stevens', '9789750365', '350094', '农户', 'stevens1979@yahoo.com', '134-6204-5567', '2018-06-19 16:17:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100443, '郭岚', '5609704976', '104759', '农户', 'guo318@outlook.com', '192-1479-8531', '2010-07-16 22:11:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100444, 'George Flores', '5346811863', '609153', '消费者', 'floresge5@mail.com', '148-5762-6703', '2024-01-12 17:09:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100445, 'Eva Mills', '5590293894', '358409', '消费者', 'evmills72@outlook.com', '175-3642-4731', '2021-08-23 12:02:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100446, '罗云熙', '5276576140', '973180', '农户', 'yunxi43@gmail.com', '155-6041-1751', '2011-07-30 19:22:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100447, '董杰宏', '9219832102', '517882', '消费者', 'dong8@icloud.com', '760-854-3257', '2012-03-14 03:07:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100448, '张嘉伦', '7643946905', '369230', '消费者', 'zhang3@icloud.com', '175-5428-0268', '2010-08-14 14:53:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100449, '金致远', '8775151375', '699448', '农户', 'jinzh110@gmail.com', '131-2442-4342', '2013-12-15 14:47:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100450, 'Miguel Reed', '5886458148', '817395', '农户', 'reed2@gmail.com', '183-2671-0758', '2010-07-27 03:53:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100451, 'James Dixon', '6133057795', '721650', '消费者', 'djames@gmail.com', '755-452-9885', '2008-04-20 11:41:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100452, 'Nicholas Carter', '7708894515', '505515', '消费者', 'carnich@icloud.com', '20-6068-4015', '2011-03-20 23:37:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100453, '宋安琪', '2425109057', '827257', '农户', 'anqisong@gmail.com', '183-0938-7751', '2004-06-24 04:46:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100454, '龚杰宏', '1173291053', '780172', '消费者', 'jiehongg6@gmail.com', '28-9211-7615', '2019-10-27 08:15:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100455, 'Florence Hunter', '4743311579', '373631', '消费者', 'hunterflo5@yahoo.com', '755-848-7597', '2012-02-27 13:37:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100456, '郝睿', '5182995493', '673707', '农户', 'harui325@gmail.com', '20-5535-7621', '2013-05-01 22:44:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100457, 'Bonnie Cox', '7679368048', '425700', '消费者', 'cob@yahoo.com', '158-3038-2804', '2009-02-05 08:46:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100458, 'April Owens', '8364155912', '735830', '农户', 'aprilow319@gmail.com', '21-899-4577', '2002-06-20 18:01:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100459, 'Jack Hill', '2053442044', '124371', '农户', 'jah6@gmail.com', '20-6698-5968', '2018-02-24 04:29:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100460, '黄安琪', '1872850190', '226334', '消费者', 'huanganq1111@outlook.com', '153-8413-2151', '2003-11-24 18:24:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100461, 'Christina Martin', '3086832637', '350526', '消费者', 'chrisma108@gmail.com', '10-8095-4459', '2002-05-16 02:26:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100462, 'Alfred Gray', '5731741339', '313922', '农户', 'alfgray@yahoo.com', '159-8976-7875', '2009-08-09 19:41:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100463, '邓杰宏', '6280214719', '283814', '消费者', 'denjiehong2018@gmail.com', '769-6381-5560', '2004-01-05 11:06:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100464, 'Betty Snyder', '1337346655', '445583', '农户', 'bettysnyder51@outlook.com', '20-2114-1852', '2013-07-20 03:32:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100465, '贺宇宁', '9922593862', '100991', '农户', 'yuhe@gmail.com', '755-994-7931', '2001-03-29 13:39:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100466, 'Theodore Hunter', '8962153427', '741698', '农户', 'thunte@outlook.com', '147-4944-0539', '2003-10-11 12:15:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100467, '武岚', '9856883910', '882238', '农户', 'lanwu@yahoo.com', '174-7363-3579', '2011-11-01 14:38:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100468, '莫宇宁', '2221920930', '190638', '消费者', 'yuning3@yahoo.com', '10-8393-3949', '2000-02-22 18:04:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100469, 'Kelly Adams', '7441084350', '345893', '消费者', 'adakel1996@gmail.com', '176-7145-9444', '2008-01-26 03:38:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100470, '常致远', '9559373726', '179367', '农户', 'zhiyuanchan@hotmail.com', '28-138-7425', '2016-06-01 00:47:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100471, '马杰宏', '7584779218', '606704', '消费者', 'majiehong@mail.com', '153-4737-3708', '2010-08-18 20:16:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100472, '姚子异', '7483920835', '868720', '农户', 'yaozi63@icloud.com', '136-5614-5810', '2020-08-04 22:02:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100473, 'Tony Woods', '3569607144', '853733', '农户', 'tony1111@icloud.com', '153-2063-8066', '2008-02-20 11:42:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100474, 'Fred Chen', '2844680972', '404431', '消费者', 'chfred71@mail.com', '21-984-3837', '2002-04-26 20:41:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100475, '谭杰宏', '7791975617', '100805', '农户', 'tajieho1228@gmail.com', '153-1696-9318', '2019-11-12 17:50:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100476, 'Donna Spencer', '1585383783', '564286', '农户', 'sdonna2@gmail.com', '162-0258-0003', '2022-07-20 20:31:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100477, '于璐', '3383395998', '490043', '消费者', 'luyu@outlook.com', '21-115-9972', '2006-01-18 20:33:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100478, '潘杰宏', '5808785404', '821116', '农户', 'panjie10@yahoo.com', '769-263-4350', '2023-05-14 08:54:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100479, 'Carolyn Collins', '1629942955', '739688', '农户', 'collins9@yahoo.com', '769-308-3814', '2007-12-15 21:37:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100480, '毛致远', '3401136602', '620496', '消费者', 'mazhiyuan3@outlook.com', '755-430-1433', '2006-02-17 07:34:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100481, 'Karen Simpson', '1643809051', '135193', '消费者', 'karen60@icloud.com', '21-516-9001', '2001-08-22 07:26:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100482, '侯杰宏', '2259885374', '315719', '消费者', 'jiehong113@gmail.com', '148-0200-1052', '2020-04-23 08:03:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100483, 'Virginia Stephens', '6977680887', '293472', '消费者', 'svirgi@icloud.com', '196-2167-7259', '2012-01-05 05:27:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100484, '韦致远', '3957443911', '868749', '农户', 'wei6@gmail.com', '157-2471-0482', '2019-09-14 04:41:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100485, 'Cheryl Hayes', '7015766056', '353916', '消费者', 'hacheryl@gmail.com', '769-604-1540', '2015-11-17 18:10:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100486, 'Kimberly Kelly', '5245103688', '131700', '农户', 'kk1955@yahoo.com', '194-8939-8245', '2001-08-01 04:44:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100487, '程云熙', '4482492836', '858432', '消费者', 'yuncheng@yahoo.com', '162-8755-6317', '2021-03-25 08:31:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100488, '钱杰宏', '9813751893', '334586', '消费者', 'jiehqian@mail.com', '155-0658-2645', '2006-06-07 20:11:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100489, 'Steve Olson', '4821077213', '670065', '农户', 'steveolson9@outlook.com', '160-7408-3956', '2008-11-06 09:40:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100490, 'Jesse Meyer', '5969472588', '365245', '农户', 'jmey@gmail.com', '136-7580-8816', '2010-05-17 01:32:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100491, '周秀英', '6743458733', '211773', '农户', 'xiuyzhou@gmail.com', '769-334-3791', '2023-02-14 07:43:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100492, 'Teresa Thompson', '2822998560', '140839', '农户', 'thompsonteresa1@gmail.com', '152-8482-5680', '2022-08-09 21:16:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100493, '陶子韬', '7590924673', '140826', '农户', 'tao07@mail.com', '28-543-2259', '2020-12-02 21:21:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100494, 'Mark Long', '7955685188', '140760', '消费者', 'lmark@hotmail.com', '187-6951-0915', '2015-03-08 12:01:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100495, '戴震南', '2895222181', '520172', '消费者', 'zd1@gmail.com', '135-9733-7932', '2023-07-30 10:19:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100496, '董云熙', '9842663094', '580774', '消费者', 'dongyu1960@mail.com', '135-3513-8223', '2022-08-29 00:09:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100497, '李致远', '1448400901', '722622', '农户', 'lizhiyuan@mail.com', '21-902-3528', '2011-04-15 02:51:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100498, 'Anne Daniels', '6680312581', '111453', '消费者', 'daniels2014@outlook.com', '156-8623-9284', '2008-03-19 14:40:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100499, 'Wendy Torres', '2169748287', '664190', '消费者', 'wendytorres828@mail.com', '145-7882-5221', '2015-01-03 15:51:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100500, '袁詩涵', '4578590455', '119298', '消费者', 'syuan6@gmail.com', '138-0670-0596', '2024-07-31 12:05:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100501, '宋岚', '3365395131', '499238', '消费者', 'songlan@icloud.com', '152-9208-6479', '2011-04-05 23:47:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100502, 'Eva Robertson', '6683392789', '352964', '农户', 'robertsoneva617@gmail.com', '769-275-1781', '2014-11-08 17:18:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100503, 'Cynthia Jimenez', '9935133855', '827027', '农户', 'cynthiajime6@yahoo.com', '769-656-5430', '2012-07-16 03:30:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100504, '唐云熙', '5403494890', '746123', '农户', 'yuntang207@hotmail.com', '769-554-6810', '2002-12-30 12:10:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100505, '潘致远', '8514268616', '918004', '消费者', 'pazhiyuan78@yahoo.com', '164-9965-3654', '2004-11-14 10:55:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100506, 'Scott Bailey', '6998364466', '632522', '消费者', 'baileyscott@outlook.com', '28-3621-0772', '2008-06-15 03:49:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100507, 'Howard Dunn', '7282047788', '145116', '消费者', 'howard4@yahoo.com', '20-803-8424', '2000-05-11 08:47:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100508, 'Philip Jordan', '6192627379', '983697', '农户', 'jordanphil@gmail.com', '167-3774-4939', '2000-03-29 01:28:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100509, '余璐', '6892717570', '547530', '农户', 'luyu2019@icloud.com', '21-344-8712', '2003-06-09 15:08:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100510, 'Jerry Gutierrez', '4621235097', '689225', '消费者', 'gjerry@outlook.com', '158-4634-6127', '2014-08-18 08:02:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100511, '孙云熙', '9967901165', '336789', '农户', 'yunxisun1@mail.com', '135-6078-3026', '2003-09-21 15:25:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100512, '程詩涵', '7351354659', '407301', '消费者', 'cheng2@mail.com', '163-8682-1167', '2017-07-11 12:50:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100513, '贺詩涵', '3022442605', '195569', '农户', 'heshi5@outlook.com', '21-8354-1918', '2009-12-27 10:18:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100514, 'Glenn Sanchez', '7565800873', '408728', '农户', 'sanchezg215@gmail.com', '152-4625-9749', '2010-05-12 22:32:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100515, '叶晓明', '2855415790', '953373', '消费者', 'xye@yahoo.com', '187-5130-6510', '2012-12-20 03:02:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100516, '顾震南', '4820896782', '402036', '农户', 'gz420@outlook.com', '137-5564-7440', '2023-12-19 15:32:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100517, 'Andrew Guzman', '7288293423', '282748', '农户', 'andrewguzma@gmail.com', '21-0901-6563', '2005-05-15 19:14:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100518, '莫詩涵', '7762582049', '421488', '消费者', 'mos1113@mail.com', '152-9932-5221', '2001-01-12 10:37:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100519, 'Hazel Wood', '1897697985', '739613', '消费者', 'woodhazel@gmail.com', '20-674-6239', '2001-05-13 02:27:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100520, '谭岚', '5310293375', '350727', '农户', 'tanla9@gmail.com', '760-215-6375', '2005-11-05 01:38:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100521, '韦子异', '1785928901', '397037', '消费者', 'weiziyi@hotmail.com', '137-7673-7762', '2002-05-15 23:19:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100522, 'Leonard Jordan', '8144552020', '868663', '消费者', 'ljordan1965@gmail.com', '167-3832-4925', '2018-01-23 21:09:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100523, 'Diane Kelley', '7135766013', '136324', '农户', 'diakel@hotmail.com', '136-6150-3708', '2022-06-23 05:21:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100524, 'Nancy Stephens', '7531694041', '908950', '农户', 'stephens2@gmail.com', '760-627-2984', '2024-08-13 16:24:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100525, '梁杰宏', '6412803397', '104402', '农户', 'jiehong3@outlook.com', '28-6666-9872', '2019-01-08 06:23:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100526, '周致远', '8135632122', '629161', '农户', 'zhouz@gmail.com', '10-6075-7343', '2008-11-10 20:44:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100527, 'Eddie Mitchell', '3000759984', '202252', '农户', 'meddie4@outlook.com', '10-5089-4457', '2008-09-19 23:32:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100528, 'Karen Brown', '9950950961', '283356', '农户', 'karenbrown@gmail.com', '10-525-9141', '2024-03-06 16:56:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100529, '傅嘉伦', '5865045094', '994343', '农户', 'jialunf@mail.com', '769-0114-1411', '2018-04-24 07:05:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100530, 'Jack Alexander', '2803564990', '573250', '消费者', 'jackalexa@gmail.com', '143-9410-5943', '2000-12-23 09:32:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100531, '王秀英', '4145571893', '497801', '农户', 'xw1@outlook.com', '755-0420-7763', '2011-05-23 09:03:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100532, 'Jennifer Crawford', '9119060474', '653483', '农户', 'jenniferc@icloud.com', '135-9362-6675', '2023-08-28 15:17:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100533, 'Russell Nelson', '4733909088', '462806', '消费者', 'nelsonrussell@gmail.com', '769-565-8178', '2002-06-22 05:55:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100534, '杨致远', '2230982499', '304310', '农户', 'zhiyuany@gmail.com', '156-8240-5900', '2001-01-27 00:51:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100535, '唐杰宏', '9551713762', '367785', '农户', 'jiehotan525@outlook.com', '174-7633-2751', '2012-07-24 18:21:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100536, 'Juan Tran', '5819354803', '104244', '农户', 'juantr724@icloud.com', '156-0678-3322', '2015-07-31 00:26:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100537, 'Kelly Gordon', '5369532331', '994046', '消费者', 'gordon53@outlook.com', '139-7691-3916', '2001-09-26 21:23:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100538, 'Juan Torres', '4716595981', '565175', '农户', 'tj426@gmail.com', '160-7733-2490', '2015-01-17 09:38:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100539, '雷安琪', '7792753112', '352465', '农户', 'leianq7@mail.com', '769-4477-9906', '2016-10-20 23:35:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100540, 'Rita Mcdonald', '2309974331', '556696', '农户', 'mcdonaldrita812@hotmail.com', '197-7456-0826', '2009-06-14 16:45:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100541, '姜宇宁', '2299681206', '984282', '农户', 'jiangy@gmail.com', '139-0792-4182', '2016-12-19 15:42:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100542, '袁秀英', '3642437141', '393548', '农户', 'yuaxiu1014@mail.com', '760-889-1961', '2013-01-22 12:02:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100543, 'Sean Parker', '3959624116', '245990', '消费者', 'parker311@outlook.com', '135-4951-8912', '2001-04-03 15:50:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100544, '吴嘉伦', '2522656711', '422501', '农户', 'wu8@gmail.com', '769-9480-9344', '2003-11-02 03:42:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100545, '任睿', '1252896250', '562497', '消费者', 'ren9@outlook.com', '760-853-2168', '2013-03-13 23:34:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100546, 'Helen Stone', '8985149947', '548369', '消费者', 'stohelen1963@gmail.com', '137-8305-3089', '2005-07-25 11:46:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100547, '夏子异', '1831203203', '599398', '消费者', 'ziyixia4@icloud.com', '135-1175-2366', '2012-12-18 23:55:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100548, 'Mark Myers', '2054066620', '942555', '农户', 'myemark55@outlook.com', '20-818-8675', '2011-01-17 07:32:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100549, 'Denise Harrison', '8222467256', '578365', '消费者', 'harrison1985@outlook.com', '755-7264-0849', '2015-04-02 07:43:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100550, 'Robert Gray', '7193445906', '777293', '农户', 'robertgray@outlook.com', '141-2214-8006', '2005-09-22 19:32:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100551, '叶岚', '4774028236', '216776', '消费者', 'lanye@yahoo.com', '769-3994-3600', '2013-10-08 23:29:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100552, '许嘉伦', '4600510321', '103410', '农户', 'jialunx@outlook.com', '145-4117-9256', '2014-03-16 18:12:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100553, '常秀英', '8482748396', '352694', '消费者', 'chanxiu221@gmail.com', '760-271-2801', '2019-04-28 13:45:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100554, 'Rachel Ramirez', '2696568288', '581645', '消费者', 'ramirez44@yahoo.com', '755-904-0377', '2003-04-21 15:07:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100555, '孙嘉伦', '9575251080', '487069', '消费者', 'sun02@outlook.com', '21-705-7719', '2019-02-14 21:30:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100556, '钱嘉伦', '2290890272', '943844', '消费者', 'qian9@outlook.com', '169-2885-5053', '2024-05-01 21:44:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100557, '许震南', '1561699592', '990645', '农户', 'zhennanxu1225@mail.com', '21-0893-4148', '2013-02-14 16:29:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100558, '陆嘉伦', '6902842792', '668576', '农户', 'jial@outlook.com', '28-213-5503', '2007-12-22 02:41:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100559, '曾致远', '9675354668', '769529', '消费者', 'zhiyuanzeng1946@icloud.com', '180-4268-6706', '2008-02-06 18:16:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100560, '严杰宏', '5660210682', '490661', '农户', 'yan5@gmail.com', '760-369-9030', '2020-01-07 05:31:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100561, '张安琪', '5975688635', '505143', '农户', 'zhaan79@icloud.com', '28-811-1580', '2011-08-18 08:41:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100562, 'Jack Bailey', '9554906266', '767649', '农户', 'jb17@gmail.com', '755-9481-6420', '2024-10-25 16:03:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100563, 'Julie Dunn', '5774732189', '539791', '农户', 'jdunn@outlook.com', '197-6543-8033', '2019-10-23 21:00:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100564, '谢詩涵', '2786878071', '262608', '农户', 'shihan1024@mail.com', '193-8208-3900', '2016-07-04 19:22:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100565, '邵子韬', '5824743628', '992316', '消费者', 'shaoz2@icloud.com', '195-2717-7098', '2002-01-12 14:32:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100566, 'Helen Lopez', '8721841124', '566772', '农户', 'lopez426@gmail.com', '20-847-8876', '2009-10-15 15:48:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100567, '毛子异', '9113032328', '558459', '农户', 'maoziyi@outlook.com', '131-3716-0311', '2022-09-25 12:27:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100568, '方岚', '1965342127', '802546', '消费者', 'fanglan@icloud.com', '143-7017-2415', '2016-07-21 00:19:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100569, '蔡子韬', '8152270584', '452099', '消费者', 'zitao726@gmail.com', '155-0712-8251', '2018-11-12 13:47:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100570, 'Ann Thompson', '3630537879', '115435', '农户', 'ann71@outlook.com', '142-4501-6423', '2012-09-29 20:25:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100571, 'Herbert Barnes', '8356401758', '849819', '农户', 'barherbe@gmail.com', '155-8087-9173', '2023-01-25 21:48:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100572, 'Cynthia Gibson', '9176160104', '481218', '农户', 'cyg7@icloud.com', '174-3249-0991', '2024-06-03 02:14:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100573, '段子韬', '7407421325', '982325', '农户', 'duanzitao1129@gmail.com', '755-6165-5548', '2020-07-09 00:39:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100574, '董晓明', '1782936559', '176804', '农户', 'xiaoming49@icloud.com', '769-085-0815', '2013-05-18 05:26:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100575, 'Cindy Reynolds', '8722786508', '655459', '消费者', 'reynoldscindy@gmail.com', '20-150-3158', '2003-09-24 17:07:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100576, 'Michelle Sanders', '4889625550', '369338', '消费者', 'smichelle97@yahoo.com', '178-6815-0875', '2008-01-26 03:22:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100577, '李璐', '2845887056', '411099', '消费者', 'li60@outlook.com', '191-6163-7250', '2002-04-30 13:32:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100578, '汤震南', '6364317846', '267490', '农户', 'zhetang@outlook.com', '769-7522-8152', '2009-10-27 02:07:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100579, '戴璐', '5808316400', '338907', '农户', 'lu711@hotmail.com', '193-6042-2839', '2022-06-05 00:14:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100580, 'Frances Ruiz', '1069898409', '296938', '农户', 'francesr@gmail.com', '155-4891-7283', '2021-10-21 16:50:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100581, 'Jane Reynolds', '1860544613', '156081', '消费者', 'janrey@yahoo.com', '177-9587-5408', '2008-11-01 18:39:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100582, 'Nancy Garza', '4865283394', '404329', '农户', 'nancy2@mail.com', '755-1956-1591', '2004-06-15 20:19:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100583, '蒋安琪', '2657498758', '899742', '消费者', 'anqijiang1212@icloud.com', '157-5495-9182', '2012-03-04 18:28:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100584, '黄安琪', '8450587715', '689378', '消费者', 'anqhuan@gmail.com', '21-8851-6766', '2016-01-12 08:03:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100585, '尹宇宁', '5870398448', '944585', '农户', 'yuningy@mail.com', '28-495-3551', '2025-02-27 13:01:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100586, 'Scott Snyder', '3492688981', '100650', '消费者', 'snydersc@gmail.com', '20-7969-4090', '2014-09-04 00:20:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100587, 'Bryan Cole', '3764179843', '707969', '农户', 'cole3@outlook.com', '184-5708-7818', '2008-09-07 15:50:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100588, 'Micheal Jimenez', '8760750259', '839650', '农户', 'mj10@outlook.com', '188-8521-9896', '2003-09-01 17:29:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100589, 'Ashley White', '7868324756', '808919', '农户', 'ashlewhite@outlook.com', '10-701-5707', '2000-11-17 18:50:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100590, 'Ellen Washington', '1060920067', '857117', '消费者', 'ellewashington@icloud.com', '132-2232-1432', '2002-03-12 19:29:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100591, '邵岚', '9096219085', '519890', '农户', 'lshao9@gmail.com', '162-2434-9740', '2007-02-05 18:03:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100592, 'Julie Payne', '7613100891', '535760', '消费者', 'juliepayne@yahoo.com', '760-3426-2282', '2009-08-22 08:27:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100593, '董詩涵', '7552647861', '619217', '消费者', 'dongshiha10@hotmail.com', '162-2453-6833', '2011-08-20 23:41:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100594, 'Fred Torres', '1090974269', '447766', '农户', 'fredt@icloud.com', '755-1744-2657', '2009-05-12 22:38:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100595, 'Johnny Chen', '1714157501', '699062', '农户', 'chen3@yahoo.com', '755-864-2012', '2024-03-23 04:25:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100596, 'Jeff Guzman', '7760918184', '503585', '消费者', 'jeffguzman@gmail.com', '20-775-2259', '2004-01-27 00:40:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100597, 'Monica Murphy', '3958004521', '948173', '消费者', 'murphymonic1116@outlook.com', '197-8209-4934', '2013-01-12 21:00:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100598, 'Luis Marshall', '8316132332', '660655', '农户', 'luismars2@gmail.com', '769-452-0282', '2007-06-01 14:51:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100599, 'Gregory Fox', '6579756884', '260652', '农户', 'foxgregory10@yahoo.com', '28-763-4079', '2001-07-03 17:38:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100600, 'Christopher Torres', '8004257565', '323489', '消费者', 'chrtorre@outlook.com', '197-2762-5779', '2009-11-10 04:43:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100601, '秦致远', '5475004258', '923272', '农户', 'zqin1111@outlook.com', '130-0035-3903', '2000-06-17 21:08:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100602, 'Joyce Castillo', '1105221411', '789703', '农户', 'jcasti1944@icloud.com', '132-0767-7333', '2000-10-03 01:42:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100603, 'Terry Nichols', '3586848452', '299225', '消费者', 'nichoterry@gmail.com', '20-119-2030', '2011-05-24 16:34:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100604, '田致远', '8801750749', '992417', '消费者', 'tianzhiyuan@gmail.com', '159-3389-5935', '2001-06-21 11:08:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100605, 'Fred Richardson', '8247659181', '640886', '消费者', 'rf2@mail.com', '10-5072-1899', '2021-06-04 17:56:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100606, '江岚', '8210629758', '231019', '农户', 'lajia@gmail.com', '769-4454-5690', '2014-02-09 01:42:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100607, 'Joe Simmons', '6548267521', '938295', '消费者', 'joesi@hotmail.com', '188-7591-0411', '2022-02-01 14:18:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100608, 'Walter Jones', '1248573303', '172071', '消费者', 'walter405@mail.com', '167-8872-7532', '2007-06-19 15:15:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100609, 'Gloria West', '9774496697', '961549', '农户', 'gloriaw@gmail.com', '760-758-6274', '2014-01-06 11:06:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100610, '傅睿', '5515066025', '653472', '农户', 'rui8@hotmail.com', '20-370-5668', '2012-03-05 14:56:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100611, 'Jose Woods', '9576866861', '888321', '消费者', 'josewoods@yahoo.com', '760-3286-2477', '2017-04-15 19:15:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100612, '王宇宁', '9207817750', '813058', '消费者', 'yuninwang9@outlook.com', '172-4614-6649', '2020-05-31 20:41:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100613, '沈杰宏', '4180500528', '501102', '农户', 'shen80@icloud.com', '28-1921-5162', '2011-06-27 15:33:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100614, '金安琪', '9634466526', '958830', '消费者', 'jinanqi@icloud.com', '755-447-9714', '2021-11-19 08:54:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100615, '龙晓明', '1974251139', '909412', '消费者', 'xial8@outlook.com', '172-5789-1995', '2023-10-26 12:21:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100616, 'Melvin Wright', '5009796689', '775497', '消费者', 'wrigm@gmail.com', '21-9400-8245', '2005-07-14 22:14:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100617, '黄秀英', '7085404315', '278762', '消费者', 'xhuang218@outlook.com', '10-336-3819', '2014-04-30 19:59:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100618, 'Tina Hughes', '5323354219', '245459', '消费者', 'hughest707@outlook.com', '755-5625-2768', '2002-04-02 07:33:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100619, 'Carmen James', '6383599751', '116144', '农户', 'jamescarmen5@gmail.com', '769-565-0208', '2011-02-06 04:39:27', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100620, '邹嘉伦', '2132119470', '778728', '农户', 'jialun314@yahoo.com', '161-5247-9125', '2009-10-04 22:42:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100621, '郭致远', '2654439736', '452810', '农户', 'zhigu@yahoo.com', '21-699-8710', '2017-06-02 15:56:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100622, '汪安琪', '3394426541', '720931', '消费者', 'wang16@hotmail.com', '28-8276-5586', '2023-03-14 11:10:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100623, '曾子韬', '4381747780', '696056', '消费者', 'zzeng@mail.com', '140-3489-0890', '2015-01-29 23:01:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100624, '方子韬', '3320147869', '534511', '农户', 'zitao9@mail.com', '21-499-3346', '2018-02-14 06:06:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100625, 'Kenneth Flores', '2268677394', '778884', '农户', 'kennethflores@outlook.com', '28-907-4622', '2000-06-25 14:20:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100626, 'Tony Gardner', '7879369896', '575583', '农户', 'tgardner@outlook.com', '10-2983-5323', '2017-03-16 18:08:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100627, '韩晓明', '7756322832', '410157', '消费者', 'xiaomingh@gmail.com', '21-251-0442', '2003-09-05 03:36:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100628, 'Eva Garza', '6683945177', '356045', '消费者', 'evagarza@gmail.com', '760-459-0943', '2000-10-20 13:05:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100629, '邓秀英', '1288691960', '918698', '农户', 'xiuyingdeng@gmail.com', '760-9222-3549', '2013-07-08 23:16:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100630, '王杰宏', '7863017110', '854908', '农户', 'jiehong86@icloud.com', '188-9154-9763', '2012-01-09 00:00:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100631, '段宇宁', '8124237619', '497904', '农户', 'duanyuning@outlook.com', '192-9024-9777', '2024-07-08 05:38:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100632, 'Lawrence Diaz', '5425906368', '928270', '消费者', 'dilawrence@outlook.com', '21-9935-8844', '2005-01-28 14:01:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100633, 'Annie Price', '4270438055', '115378', '消费者', 'aprice@mail.com', '149-5984-1277', '2014-03-10 04:57:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100634, 'Catherine Tran', '6351374570', '824232', '消费者', 'tcat@mail.com', '760-389-5865', '2003-06-08 04:51:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100635, '汤致远', '4874932727', '177187', '农户', 'zhitang@icloud.com', '195-9609-2054', '2011-01-22 23:12:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100636, '秦晓明', '1438014906', '565993', '农户', 'qinxiao@gmail.com', '131-9408-0646', '2023-01-25 19:11:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100637, 'Jesse Ford', '8023080241', '572925', '农户', 'fordj51@gmail.com', '164-1260-1588', '2021-08-31 22:47:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100638, '侯晓明', '9798903091', '409973', '农户', 'hou1222@hotmail.com', '135-9422-5740', '2017-05-21 07:14:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100639, '林震南', '9310282651', '806890', '消费者', 'linz@outlook.com', '137-3066-2978', '2016-10-09 19:23:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100640, 'Arthur Walker', '3237032421', '541465', '农户', 'arthurwalker@gmail.com', '153-1774-5929', '2019-08-31 03:04:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100641, 'Norma Gray', '4961105668', '504518', '农户', 'grnorma5@icloud.com', '21-440-4422', '2004-03-26 03:05:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100642, 'Ruby Edwards', '7649391505', '214426', '消费者', 'edwards707@outlook.com', '760-604-5681', '2017-03-27 06:35:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100643, '贾子异', '8770296504', '763999', '消费者', 'jiaziy06@hotmail.com', '755-6592-1010', '2008-05-31 22:07:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100644, 'Monica Nguyen', '8588436947', '395478', '消费者', 'monica75@yahoo.com', '20-1488-0063', '2016-06-04 06:05:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100645, 'Pauline Rivera', '4073366154', '123211', '农户', 'pauline1972@hotmail.com', '21-075-3692', '2005-10-10 18:49:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100646, '范嘉伦', '3326255304', '783565', '消费者', 'jfan5@gmail.com', '21-7183-2847', '2011-02-24 09:09:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100647, 'Melvin Webb', '6715722129', '491249', '农户', 'melvwe@icloud.com', '769-515-5147', '2021-08-08 19:46:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100648, 'April Payne', '9852946249', '175241', '消费者', 'aprilp5@yahoo.com', '10-554-5739', '2010-11-14 18:34:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100649, '冯子异', '8167276495', '319337', '农户', 'fengziyi@gmail.com', '755-9101-8633', '2005-09-12 21:24:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100650, 'Brian Morgan', '3040885740', '838873', '农户', 'brianmorg@gmail.com', '177-1642-8170', '2006-11-17 21:15:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100651, '金子异', '4778142622', '214396', '消费者', 'ziyiji1943@outlook.com', '769-811-4351', '2010-10-28 05:31:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100652, '刘子异', '9732188043', '866840', '消费者', 'liuz1209@outlook.com', '769-0107-5877', '2007-06-02 01:15:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100653, '龚璐', '3575085342', '213082', '农户', 'gonglu@outlook.com', '138-5650-5134', '2017-06-22 06:39:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100654, 'Kathy Nelson', '4162518984', '361163', '农户', 'katn@icloud.com', '155-9488-0866', '2016-10-08 17:10:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100655, 'Phyllis Diaz', '7454021241', '367404', '农户', 'diazphy86@outlook.com', '755-4966-4955', '2022-05-18 18:47:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100656, '夏岚', '7738488822', '224291', '农户', 'lxi@icloud.com', '760-821-3541', '2023-05-08 08:23:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100657, 'Donald Cole', '9858970360', '882890', '农户', 'coledo921@gmail.com', '180-8003-7626', '2007-12-08 21:32:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100658, '毛宇宁', '7669962299', '561206', '农户', 'yumao@hotmail.com', '178-1334-4274', '2023-07-04 12:00:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100659, 'Jeffery Young', '7811130748', '862478', '消费者', 'yj8@yahoo.com', '10-753-1514', '2006-01-24 21:11:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100660, '张嘉伦', '3065717022', '268725', '农户', 'zhang3@icloud.com', '21-3269-6001', '2008-12-25 14:18:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100661, 'Wendy Vargas', '2424625879', '317389', '消费者', 'vw93@hotmail.com', '769-6000-7952', '2001-01-06 03:28:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100662, '邵子异', '7465833073', '367184', '消费者', 'shaoziyi@gmail.com', '10-6740-9183', '2006-09-18 08:27:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100663, '任岚', '2954200833', '558747', '消费者', 'rl904@icloud.com', '755-544-1922', '2021-12-17 20:18:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100664, '赵詩涵', '3134254725', '414094', '农户', 'szhao@gmail.com', '172-0367-6235', '2015-04-01 06:23:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100665, 'Joe Wright', '6877569040', '313539', '农户', 'joewri70@mail.com', '193-6345-0597', '2017-12-19 03:12:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100666, 'Michael Patterson', '8080385439', '686164', '农户', 'patterson821@gmail.com', '760-844-8713', '2012-09-09 10:23:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100667, 'Eva Vasquez', '5280903440', '838838', '消费者', 'evasquez@outlook.com', '20-8819-4912', '2013-04-18 05:36:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100668, 'Henry Guzman', '7810898707', '797736', '农户', 'guzman2@mail.com', '189-6062-8721', '2003-08-18 07:28:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100669, '郭岚', '9878467833', '209010', '农户', 'gulan51@gmail.com', '189-0411-7498', '2022-04-14 13:08:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100670, '石致远', '8116568327', '551945', '消费者', 'shizhiyuan@yahoo.com', '21-393-5072', '2001-04-22 14:02:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100671, 'Manuel Hayes', '4273666508', '816901', '消费者', 'hayemanu4@icloud.com', '769-9138-1267', '2017-03-12 13:08:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100672, '周安琪', '7716016451', '350290', '农户', 'anqi5@icloud.com', '183-1089-8889', '2009-12-26 12:14:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100673, '钱晓明', '6105743457', '991994', '消费者', 'qixi@gmail.com', '193-8738-9621', '2022-08-19 06:45:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100674, '姜子异', '1282398217', '870099', '消费者', 'zijiang@icloud.com', '184-8877-1409', '2004-12-10 08:45:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100675, '顾璐', '9844937942', '544779', '消费者', 'lu87@gmail.com', '169-9582-1191', '2022-08-14 22:22:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100676, '史詩涵', '9702874294', '815998', '消费者', 'shi6@mail.com', '20-572-6882', '2006-07-26 22:47:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100677, 'Lori Scott', '7103270043', '941750', '消费者', 'scott1206@yahoo.com', '186-0258-0964', '2018-12-11 02:02:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100678, 'Nicole Walker', '4376777343', '505656', '消费者', 'wanic@icloud.com', '184-0596-4306', '2014-07-10 22:57:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100679, '唐秀英', '3694801542', '402006', '消费者', 'tangxiuying@gmail.com', '10-7437-8620', '2001-09-26 18:09:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100680, '金詩涵', '8632189341', '558951', '农户', 'shihanj916@mail.com', '769-998-4409', '2019-10-14 00:08:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100681, 'Benjamin Rose', '5046158443', '704182', '农户', 'rose10@gmail.com', '21-5237-5994', '2006-02-06 22:18:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100682, 'Theodore Chavez', '8248009902', '212464', '农户', 'cht1022@outlook.com', '20-205-8206', '2014-12-29 20:54:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100683, 'Norman Hernandez', '8703867595', '112244', '农户', 'normanhernandez@gmail.com', '769-4102-2690', '2021-06-26 11:29:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100684, '崔睿', '9860288985', '434413', '农户', 'rui5@icloud.com', '10-7943-0543', '2008-09-28 16:17:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100685, '姚秀英', '3338545556', '237832', '农户', 'xiuyingyao@hotmail.com', '177-0738-9637', '2017-01-27 02:29:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100686, 'Joanne Lopez', '4302696873', '868547', '农户', 'jlopez9@gmail.com', '20-7770-1784', '2004-06-22 07:47:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100687, '田岚', '5846835247', '224028', '农户', 'tian05@gmail.com', '10-1497-3499', '2017-02-08 12:51:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100688, '田云熙', '6270261849', '779395', '消费者', 'yunxitia517@icloud.com', '142-0004-3323', '2021-11-14 23:20:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100689, '杜杰宏', '6195714302', '508870', '消费者', 'dujie629@gmail.com', '20-1222-4615', '2018-12-17 16:14:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100690, 'Sarah Hill', '9848020582', '935520', '农户', 'shill@outlook.com', '185-2333-9822', '2003-04-14 18:27:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100691, '夏杰宏', '7398486343', '199704', '农户', 'xiaji@outlook.com', '21-9793-7485', '2010-10-29 14:45:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100692, 'Kim Campbell', '7694379532', '375702', '农户', 'campbellkim@gmail.com', '769-1081-9274', '2000-11-27 07:35:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100693, '姜晓明', '8724928851', '198619', '消费者', 'jiangxia@gmail.com', '186-7036-3138', '2016-09-28 02:10:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100694, 'Barbara Chavez', '9788634357', '986539', '消费者', 'barch@icloud.com', '20-2923-9785', '2017-10-17 06:37:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100695, '罗安琪', '1898151019', '904196', '消费者', 'anluo63@gmail.com', '10-651-7657', '2002-05-15 08:20:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100696, '梁宇宁', '4923892904', '886995', '消费者', 'yuning11@yahoo.com', '142-4649-1539', '2000-02-19 20:24:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100697, '邵詩涵', '6814417101', '607350', '农户', 'shihan1213@icloud.com', '139-4984-1926', '2009-11-30 19:51:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100698, '叶秀英', '6675484907', '587640', '消费者', 'xiuyingy922@gmail.com', '130-5571-4316', '2005-12-08 20:47:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100699, '赵震南', '8699526405', '311910', '消费者', 'zhennanz@gmail.com', '175-1410-0380', '2013-01-30 10:53:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100700, 'Teresa Hamilton', '4643268693', '300713', '农户', 'hater@icloud.com', '760-2619-2503', '2012-11-06 23:31:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100701, 'Frederick Jenkins', '1557865743', '282386', '农户', 'jenkif@yahoo.com', '172-6343-2722', '2021-02-21 04:27:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100702, 'Jack Anderson', '5980518158', '824681', '消费者', 'jackanderson@icloud.com', '191-1319-6575', '2013-12-29 23:27:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100703, 'Gloria Gordon', '2473288489', '126795', '农户', 'gordonglor69@gmail.com', '769-632-7461', '2019-06-09 15:56:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100704, 'William Cox', '1107648665', '924658', '消费者', 'wcox1977@outlook.com', '188-2910-7657', '2011-06-10 11:45:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100705, '廖睿', '2682127085', '727589', '农户', 'liao8@gmail.com', '10-113-4239', '2005-10-28 06:42:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100706, 'Troy Kelly', '1164715399', '247107', '消费者', 'kelly07@yahoo.com', '755-261-1558', '2002-05-02 15:45:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100707, '汤子异', '8146575919', '797104', '消费者', 'ziyit@icloud.com', '173-7081-7576', '2015-12-06 02:16:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100708, 'Todd Chen', '5604930619', '270797', '农户', 'todd1979@gmail.com', '769-307-8523', '2011-06-14 03:55:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100709, '蔡睿', '9754346164', '919945', '消费者', 'ruica8@gmail.com', '10-614-4671', '2012-09-03 07:43:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100710, 'Kim Silva', '7577773352', '939771', '农户', 'silvak@gmail.com', '28-7423-9573', '2005-04-16 14:27:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100711, '武子韬', '1632197026', '529700', '消费者', 'ziwu@icloud.com', '133-9795-6983', '2019-07-12 10:44:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100712, 'Ashley Gray', '6438136980', '345405', '消费者', 'agray@outlook.com', '10-931-4456', '2005-07-08 21:49:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100713, 'Paul Mcdonald', '4913790159', '977629', '消费者', 'mcdpa@gmail.com', '21-353-9064', '2001-02-21 18:37:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100714, 'Kim Brown', '6126275886', '815127', '消费者', 'kibr@gmail.com', '10-478-8902', '2010-06-01 10:59:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100715, 'Justin Gomez', '1302894413', '836706', '农户', 'jgome@outlook.com', '196-3417-2877', '2018-02-06 16:32:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100716, 'Antonio Olson', '7812996403', '977118', '农户', 'olson7@icloud.com', '175-1509-0443', '2013-11-15 18:39:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100717, 'Kenneth Mason', '3398791835', '150991', '消费者', 'kennmason2@gmail.com', '760-841-8127', '2009-11-22 13:53:18', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100718, '陶睿', '1275506635', '663210', '农户', 'ruitao@hotmail.com', '760-2248-0126', '2016-11-10 16:57:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100719, 'Jeremy Reynolds', '1659694191', '483591', '农户', 'jereynolds5@icloud.com', '760-223-5947', '2010-10-23 03:24:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100720, 'Russell Stone', '6267703663', '172597', '农户', 'russstone@gmail.com', '160-2243-3837', '2003-01-04 07:45:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100721, '段晓明', '3248130410', '120328', '消费者', 'xiaomingdua9@yahoo.com', '196-6907-0777', '2009-12-10 22:12:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100722, '蒋嘉伦', '5793096619', '952910', '农户', 'jialun1@yahoo.com', '10-7275-4220', '2005-10-28 11:20:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100723, 'Kathleen Anderson', '2205849791', '541513', '消费者', 'anderson16@icloud.com', '20-866-0485', '2018-03-13 17:40:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100724, 'Frances Lopez', '5251764466', '360095', '农户', 'frances50@hotmail.com', '20-8040-1714', '2022-02-15 08:45:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100725, 'Kathy Thompson', '7098177828', '364941', '农户', 'thompson731@gmail.com', '10-3938-6456', '2022-06-12 08:49:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100726, 'Joan Medina', '6521536069', '500138', '农户', 'joan326@mail.com', '163-7680-1137', '2024-04-29 21:41:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100727, '夏杰宏', '1060681949', '531841', '农户', 'xia59@gmail.com', '28-2851-1431', '2020-05-31 06:54:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100728, '尹岚', '3274062937', '751786', '消费者', 'lanyi@outlook.com', '10-4521-8682', '2023-10-19 18:35:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100729, 'Matthew Diaz', '3750731901', '380736', '农户', 'dmatthew6@hotmail.com', '21-698-2744', '2016-06-09 06:39:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100730, 'Clara Marshall', '3792445329', '360398', '农户', 'macl@icloud.com', '28-866-7270', '2011-07-18 15:56:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100731, '许云熙', '3757854152', '647323', '农户', 'xyu1016@hotmail.com', '755-4733-7481', '2008-02-10 13:12:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100732, '冯璐', '5963732657', '899681', '农户', 'fenglu@outlook.com', '20-264-1377', '2004-07-07 02:04:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100733, 'Sylvia Reyes', '8346616610', '403084', '农户', 'syreyes2002@outlook.com', '156-6783-6714', '2018-08-19 00:27:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100734, 'Maria Dunn', '7184893913', '334987', '消费者', 'marid726@icloud.com', '170-3655-3415', '2000-03-18 22:51:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100735, 'Sara Washington', '2957855840', '697509', '消费者', 'saraw@icloud.com', '193-7199-5495', '2009-11-17 22:17:40', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100736, '魏詩涵', '6531421723', '869553', '农户', 'shihanwei@gmail.com', '760-219-8298', '2012-09-19 11:52:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100737, 'Ruby Green', '8839923707', '226693', '农户', 'greenruby3@icloud.com', '769-699-3918', '2020-01-29 17:18:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100738, 'Clifford West', '7613259974', '392933', '农户', 'westcliff@icloud.com', '769-7648-6029', '2006-10-30 03:07:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100739, '阎震南', '1424374689', '144534', '农户', 'yz4@hotmail.com', '760-5226-5944', '2003-05-26 19:48:25', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100740, '戴晓明', '8387190576', '448120', '农户', 'xidai11@outlook.com', '21-468-4347', '2021-11-06 12:46:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100741, '姚子异', '6633190351', '704923', '消费者', 'yaoz6@hotmail.com', '147-0077-0060', '2017-09-07 09:59:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100742, '孙子韬', '1080617712', '433255', '农户', 'sunzitao3@gmail.com', '155-0052-1077', '2017-02-01 10:50:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100743, 'Craig Torres', '6777058805', '307630', '农户', 'ctorres43@outlook.com', '755-2254-4493', '2009-06-10 20:46:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100744, '蒋璐', '2392627114', '589646', '农户', 'jiang7@mail.com', '154-3103-0099', '2003-06-16 13:49:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100745, '范子韬', '2277636876', '916540', '农户', 'zfan@outlook.com', '755-081-1475', '2023-06-18 07:33:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100746, '罗秀英', '8610746627', '912480', '农户', 'luo917@gmail.com', '181-9550-4955', '2013-12-20 23:42:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100747, 'Kelly Reynolds', '2183147593', '583116', '农户', 'reynoldsk@gmail.com', '20-682-9496', '2014-10-16 00:22:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100748, '廖詩涵', '4423262174', '827633', '消费者', 'liao1@outlook.com', '760-391-0554', '2014-02-20 02:16:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100749, '高致远', '8832156198', '966918', '消费者', 'gz05@yahoo.com', '10-198-3785', '2006-09-09 01:52:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100750, 'Theodore Cox', '1768595925', '157633', '消费者', 'thecox@outlook.com', '769-8405-3050', '2000-08-21 12:27:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100751, 'Jeremy Perry', '4715883715', '373187', '农户', 'pjeremy@mail.com', '755-2748-9378', '2012-03-17 14:08:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100752, '周詩涵', '7402376622', '166445', '消费者', 'shihanz@gmail.com', '10-968-6247', '2017-05-19 13:33:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100753, 'Jeremy Foster', '8564370013', '791962', '农户', 'jeremfoster@icloud.com', '169-7612-2746', '2012-03-20 17:32:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100754, 'Kelly Smith', '6229559056', '546452', '消费者', 'smitkelly@outlook.com', '180-5300-3466', '2013-06-08 19:09:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100755, 'Thelma Owens', '5952274280', '699063', '农户', 'thelma923@gmail.com', '769-089-4848', '2012-04-05 23:43:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100756, '杨致远', '1504784105', '693160', '农户', 'zhiyuanyan@gmail.com', '21-7993-7168', '2012-08-18 09:41:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100757, 'Raymond Alvarez', '2752190782', '185523', '消费者', 'rayma327@icloud.com', '162-5382-6583', '2000-06-23 22:35:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100758, 'Carrie Kennedy', '2748037278', '772135', '农户', 'kennedy07@gmail.com', '755-881-3226', '2017-01-10 17:59:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100759, '韩子韬', '4272372360', '727217', '消费者', 'han1122@gmail.com', '21-8205-5352', '2004-08-10 07:13:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100760, '王杰宏', '2584493762', '635388', '消费者', 'wangjieh@hotmail.com', '130-5119-8767', '2011-04-30 22:11:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100761, '余晓明', '3743672603', '198569', '消费者', 'yuxiaoming@mail.com', '769-4237-1074', '2003-05-18 21:03:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100762, '贺宇宁', '3968921957', '793379', '消费者', 'yuninghe@gmail.com', '28-640-8436', '2001-09-17 01:53:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100763, 'Peggy Ellis', '9984039631', '281803', '消费者', 'pegge@gmail.com', '191-8313-8495', '2013-12-04 12:25:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100764, '傅璐', '2873871520', '791737', '消费者', 'lu5@gmail.com', '760-150-4729', '2024-08-24 01:43:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100765, '孙睿', '2587845538', '387374', '消费者', 'sun89@gmail.com', '28-3109-9003', '2020-03-12 12:15:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100766, 'Jeffery Phillips', '8883238521', '136757', '农户', 'jefferyphi@icloud.com', '20-2581-0239', '2016-09-23 04:04:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100767, 'Patricia Black', '5499595211', '988476', '消费者', 'patriciabl7@icloud.com', '755-0357-6521', '2011-12-11 22:15:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100768, 'Amber Hall', '1933879052', '706771', '消费者', 'haamber@icloud.com', '28-292-2824', '2010-10-09 01:38:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100769, 'Craig Patterson', '1049124359', '694065', '消费者', 'crapa914@gmail.com', '170-5881-8463', '2007-04-10 18:06:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100770, 'Terry Reynolds', '5449286273', '393814', '消费者', 'reynoldst@mail.com', '159-8078-3705', '2023-11-09 11:18:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100771, '向詩涵', '9515155681', '846710', '消费者', 'shihanxi2@gmail.com', '769-8436-4219', '2009-02-05 03:11:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100772, 'Lois Hughes', '7827545276', '585097', '农户', 'hugheslo718@hotmail.com', '159-7530-5698', '2001-05-24 18:40:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100773, 'Kimberly Daniels', '3591408436', '609694', '农户', 'kimberlydaniels@gmail.com', '151-0566-0958', '2011-06-30 04:33:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100774, '顾睿', '2986398134', '193295', '消费者', 'rui2003@gmail.com', '136-2733-0397', '2016-06-27 01:54:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100775, '何詩涵', '3249351385', '667866', '消费者', 'hshiha@yahoo.com', '10-2057-8480', '2000-12-06 14:48:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100776, '吴岚', '9904589732', '487738', '农户', 'lawu@icloud.com', '168-6320-5782', '2021-04-11 17:48:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100777, '萧嘉伦', '7861911704', '770232', '农户', 'jialuxiao6@outlook.com', '28-160-4732', '2008-07-15 13:00:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100778, '廖璐', '7651133061', '274366', '农户', 'luliao@mail.com', '21-1588-1925', '2001-05-19 07:11:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100779, 'Juanita Wilson', '1824367022', '721560', '消费者', 'juaniwilso@yahoo.com', '162-3970-0802', '2017-09-16 12:51:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100780, '常安琪', '7618772275', '529808', '农户', 'chang316@gmail.com', '21-162-6156', '2004-05-31 18:26:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100781, '严子韬', '2283196797', '220297', '农户', 'yazit@icloud.com', '154-0210-9430', '2009-01-16 19:20:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100782, 'Emma Nelson', '9259392378', '658791', '农户', 'nelse5@outlook.com', '172-9294-2181', '2015-10-07 19:36:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100783, '黎安琪', '8061711526', '407477', '消费者', 'anqili@gmail.com', '28-7500-1559', '2020-02-13 06:53:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100784, '蒋致远', '1430164783', '992267', '消费者', 'jzh805@icloud.com', '151-6024-2703', '2014-08-01 07:14:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100785, 'Cynthia Soto', '8121644124', '770720', '农户', 'sotocynth@icloud.com', '755-039-9445', '2019-12-06 00:23:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100786, '戴秀英', '9383427355', '316538', '农户', 'xiuydai@outlook.com', '20-6580-5514', '2020-09-19 04:48:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100787, '杜睿', '6943770414', '972999', '消费者', 'rui817@yahoo.com', '755-526-2640', '2000-10-06 01:00:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100788, 'Shawn Davis', '3193693422', '578874', '消费者', 'davis1994@mail.com', '148-9408-8400', '2009-03-07 13:37:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100789, 'Samuel Meyer', '2421215253', '395568', '农户', 'samuelmeyer@outlook.com', '166-4018-1200', '2018-04-10 14:53:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100790, 'Troy Murphy', '2951067853', '330764', '农户', 'murphytroy1110@yahoo.com', '173-3889-8734', '2021-10-09 22:54:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100791, 'Janet Hicks', '8211193870', '426898', '农户', 'janethi7@mail.com', '141-7450-7918', '2021-09-17 07:46:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100792, '周晓明', '3302213297', '511362', '消费者', 'xzhou@gmail.com', '769-502-3310', '2009-02-25 04:12:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100793, '高秀英', '9565112305', '282574', '消费者', 'xiuying1@icloud.com', '195-1237-0847', '2010-06-19 11:22:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100794, 'Irene Foster', '6692370833', '550271', '农户', 'foire914@yahoo.com', '20-203-5197', '2007-05-16 15:46:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100795, '秦秀英', '5932926593', '707593', '消费者', 'xiuying1965@outlook.com', '164-0448-5075', '2013-10-13 04:02:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100796, '崔睿', '2966405349', '803711', '消费者', 'ruicui10@gmail.com', '169-0315-5599', '2021-02-18 20:36:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100797, '程晓明', '2599536465', '722171', '农户', 'chengx1988@outlook.com', '760-670-1015', '2007-09-22 04:40:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100798, '邓安琪', '4700626827', '596792', '农户', 'deng1009@gmail.com', '140-9198-8978', '2010-08-29 14:26:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100799, '石安琪', '6686317467', '515221', '农户', 'anqis81@yahoo.com', '28-4132-5870', '2015-12-14 04:17:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100800, '李嘉伦', '2829983376', '143871', '消费者', 'jialul@hotmail.com', '139-5945-4136', '2014-07-20 02:59:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100801, 'Dorothy Peterson', '5034203136', '192409', '消费者', 'pdorothy87@gmail.com', '769-2771-9675', '2015-11-30 07:38:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100802, '林璐', '9376109906', '663895', '农户', 'linl6@gmail.com', '183-4509-2743', '2022-10-25 04:35:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100803, '韦震南', '6316112262', '325808', '消费者', 'zhennanwei@outlook.com', '28-923-7979', '2003-02-18 18:08:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100804, 'Elaine Harris', '6325285348', '486943', '消费者', 'harriselaine@outlook.com', '10-998-0446', '2015-02-17 18:48:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100805, '吕宇宁', '9668539523', '781864', '消费者', 'yuninglu@icloud.com', '138-3414-8441', '2003-10-27 11:14:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100806, '孔岚', '7047369605', '586877', '农户', 'kongla@icloud.com', '165-8157-5690', '2017-03-23 19:40:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100807, '陶云熙', '3625399279', '238399', '农户', 'yunxitao713@yahoo.com', '178-0828-6068', '2008-07-08 03:17:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100808, 'Harold Hayes', '3404333715', '229080', '消费者', 'harh406@outlook.com', '189-0655-9109', '2023-06-30 11:22:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100809, '蔡杰宏', '6867382206', '679923', '农户', 'cjiehong@yahoo.com', '21-850-4054', '2022-03-05 06:47:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100810, '卢璐', '1292950606', '839642', '农户', 'lulu@mail.com', '195-5251-8365', '2020-10-27 03:23:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100811, 'Eleanor Hawkins', '1901153141', '572780', '消费者', 'hawe@gmail.com', '769-4880-6143', '2022-03-06 02:37:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100812, '江璐', '8342608540', '241321', '农户', 'jiang930@outlook.com', '760-968-8619', '2002-02-22 21:17:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100813, 'Lucille Black', '6306715719', '855005', '农户', 'luciblack@yahoo.com', '755-2143-0682', '2002-08-16 22:36:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100814, 'Robin Harris', '7220253834', '168956', '农户', 'robinh@gmail.com', '760-9768-0730', '2005-12-19 23:50:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100815, '姚詩涵', '7954652058', '691088', '农户', 'shihan4@outlook.com', '132-6865-5348', '2023-01-09 04:20:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100816, '戴子异', '3413648301', '704254', '消费者', 'dai529@icloud.com', '139-0956-2494', '2011-02-02 03:44:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100817, 'Melissa Baker', '7625441708', '551756', '消费者', 'melissabak@gmail.com', '760-464-4624', '2018-01-24 15:46:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100818, '雷晓明', '9315340530', '687974', '农户', 'xl713@outlook.com', '168-4125-9238', '2006-07-20 04:28:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100819, '周嘉伦', '6226113557', '325140', '消费者', 'zhojialun3@yahoo.com', '20-978-1283', '2016-12-23 05:25:19', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100820, 'Evelyn Kelley', '5891063390', '814776', '农户', 'evelyn1@yahoo.com', '760-630-9314', '2018-08-17 18:01:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100821, 'Wanda Lee', '4357841183', '904381', '农户', 'lew4@gmail.com', '169-7546-5618', '2020-09-28 10:35:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100822, '阎子异', '6060632915', '530435', '消费者', 'ziyi1104@gmail.com', '165-7349-5504', '2020-09-21 20:00:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100823, '徐璐', '8345658952', '582117', '农户', 'luxu718@icloud.com', '20-349-2077', '2019-04-15 14:12:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100824, 'Brian Hall', '7288020143', '226168', '农户', 'brianhall19@outlook.com', '10-857-9916', '2011-08-28 18:06:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100825, '宋宇宁', '3308330780', '964068', '农户', 'yusong911@icloud.com', '189-0620-6011', '2004-08-07 02:11:44', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100826, '贾宇宁', '3524459726', '584859', '农户', 'yuningjia@mail.com', '28-107-1576', '2020-09-24 22:01:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100827, 'Elaine Foster', '6770375298', '284719', '农户', 'efoster@outlook.com', '152-3617-8739', '2004-07-04 00:59:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100828, 'Jeffrey Ruiz', '1023966101', '719907', '农户', 'jr8@yahoo.com', '28-239-0587', '2019-07-24 07:58:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100829, 'Jessica Adams', '1930920510', '480889', '农户', 'adams928@gmail.com', '142-2337-8066', '2006-02-05 23:04:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100830, 'Evelyn Black', '9073897479', '566074', '农户', 'eveblack@yahoo.com', '155-3156-7654', '2003-06-27 11:33:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100831, 'Dawn Hall', '7462745727', '797555', '农户', 'dawn01@icloud.com', '755-258-9720', '2003-11-27 15:37:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100832, '郝宇宁', '7822129719', '861773', '农户', 'yuninghao@gmail.com', '146-7668-9695', '2024-04-17 23:03:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100833, 'Marilyn Burns', '7665884443', '872786', '消费者', 'burnsm@gmail.com', '144-6970-6665', '2018-09-23 12:19:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100834, 'Jean Gutierrez', '7969760028', '300728', '消费者', 'jgutierrez810@yahoo.com', '755-875-9588', '2013-06-25 03:16:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100835, 'Matthew Garcia', '2081974665', '625155', '农户', 'mg05@hotmail.com', '20-6274-0573', '2004-03-01 10:01:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100836, '常晓明', '1386306715', '989858', '消费者', 'xiaomingchang@icloud.com', '179-1205-3175', '2013-06-11 06:47:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100837, '贺震南', '4125067719', '849660', '农户', 'he1007@mail.com', '152-3073-9933', '2008-08-15 14:58:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100838, '汤杰宏', '8288693797', '551447', '农户', 'tanjie@gmail.com', '20-0669-4695', '2009-07-04 15:14:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100839, '梁詩涵', '7238304811', '241092', '农户', 'shihanli@hotmail.com', '199-7122-9808', '2005-12-29 04:38:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100840, 'Douglas Lee', '5549328906', '484465', '农户', 'douglaslee@gmail.com', '21-0499-2957', '2004-09-15 03:52:45', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100841, 'Sheila Ruiz', '7482357696', '747515', '消费者', 'shru@outlook.com', '169-0224-7192', '2004-12-07 08:08:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100842, '卢嘉伦', '1461756035', '946192', '消费者', 'jiallu1993@mail.com', '151-0331-9828', '2025-04-16 03:47:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100843, '何杰宏', '2094111603', '395696', '农户', 'hejiehong@icloud.com', '28-0866-6985', '2001-09-18 20:23:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100844, '彭秀英', '8324441143', '203807', '农户', 'xiuyingpeng@gmail.com', '186-5238-9297', '2010-12-12 02:01:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100845, '汪子异', '2568926594', '452203', '消费者', 'wangz7@gmail.com', '164-0093-9882', '2001-01-13 13:29:59', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100846, '方子韬', '4006101223', '471547', '消费者', 'zitaofang@gmail.com', '769-1810-5450', '2024-11-29 11:25:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100847, 'Beverly Nichols', '1421839672', '845332', '消费者', 'nibeverly1027@gmail.com', '21-257-2282', '2020-01-27 19:44:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100848, '胡岚', '9503259266', '982188', '农户', 'lh3@outlook.com', '132-6395-3126', '2013-04-25 13:52:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100849, 'Margaret Adams', '7706180440', '736645', '农户', 'maa909@outlook.com', '182-7510-0398', '2015-09-17 23:54:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100850, '宋璐', '2352597140', '950050', '农户', 'songlu@gmail.com', '28-5951-5374', '2013-08-20 21:04:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100851, '江云熙', '9292639142', '948838', '农户', 'yunxij@hotmail.com', '169-6893-5787', '2013-04-17 13:30:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100852, '吕詩涵', '3404115329', '937914', '农户', 'lush@gmail.com', '135-5963-5224', '2023-07-22 00:22:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100853, 'Clarence Ford', '6061073214', '373153', '消费者', 'fclarence@hotmail.com', '28-242-3800', '2018-06-12 02:43:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100854, '方詩涵', '2283702988', '958160', '消费者', 'shfang@icloud.com', '755-9270-3754', '2005-05-28 13:19:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100855, 'Eva Gonzalez', '7291371122', '692531', '农户', 'goneva@icloud.com', '149-8507-0443', '2021-09-12 08:46:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100856, 'Mario Wallace', '5370714795', '105239', '农户', 'mwallace9@hotmail.com', '21-748-0537', '2005-12-09 18:39:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100857, 'Chris Fox', '2015269077', '299455', '农户', 'chrifo@icloud.com', '21-089-6398', '2024-09-29 01:16:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100858, 'George Freeman', '6144167842', '595247', '农户', 'freegeorg908@gmail.com', '755-5167-2095', '2000-09-10 04:01:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100859, 'Shawn Peterson', '4047686331', '462679', '农户', 'shawn1026@outlook.com', '172-7441-0939', '2003-10-31 08:19:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100860, 'Russell Woods', '3497536065', '935844', '农户', 'woorussell4@hotmail.com', '21-948-1542', '2004-05-14 00:40:04', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100861, 'Judith Mendoza', '8261952977', '357936', '农户', 'mendozajudith@mail.com', '174-5689-5827', '2010-04-09 05:24:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100862, '邵安琪', '8171081699', '252422', '农户', 'ashao207@outlook.com', '137-6538-1147', '2019-03-07 03:36:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100863, 'Frances Foster', '3845641743', '637493', '消费者', 'fosterfrances@icloud.com', '195-5170-8583', '2016-06-16 23:49:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100864, '莫晓明', '2986924983', '704583', '农户', 'xiaomingmo3@outlook.com', '10-184-8621', '2022-06-23 04:51:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100865, 'Ronald Nelson', '8795997625', '635158', '消费者', 'ronaldn5@outlook.com', '10-2634-6605', '2019-09-22 03:37:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100866, '朱杰宏', '5082376204', '969327', '农户', 'zhu1947@yahoo.com', '28-7191-5587', '2023-12-02 21:39:14', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100867, 'Keith Phillips', '7078040213', '285423', '农户', 'keithphi@gmail.com', '148-8059-1011', '2012-07-25 19:06:02', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100868, '韩嘉伦', '7575832385', '626904', '消费者', 'hanji@outlook.com', '145-4236-1786', '2006-06-12 13:25:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100869, '谭岚', '1487881664', '956703', '农户', 'lt104@mail.com', '172-7313-7856', '2020-01-13 15:12:00', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100870, 'Laura Black', '8563293902', '277356', '消费者', 'laurablack413@gmail.com', '195-2271-2156', '2001-05-25 22:44:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100871, 'Jeffery Perry', '4476301938', '129559', '消费者', 'pj5@gmail.com', '146-4573-4892', '2019-02-11 05:19:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100872, '陆晓明', '4464186192', '317563', '农户', 'xl1974@icloud.com', '193-6965-4170', '2001-06-05 14:22:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100873, 'Amanda Woods', '2583629373', '246116', '农户', 'amanw2012@icloud.com', '21-5544-6156', '2024-04-24 12:52:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100874, 'Marcus Reynolds', '3619604241', '731920', '消费者', 'reym@outlook.com', '20-2778-1815', '2021-06-04 18:52:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100875, '邵璐', '9816091653', '568955', '农户', 'shlu3@outlook.com', '167-9916-1061', '2022-08-05 01:24:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100876, 'Lois Rodriguez', '2574341795', '757595', '农户', 'lois10@gmail.com', '132-6341-8553', '2012-07-14 17:57:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100877, 'Alan Turner', '8887364329', '441736', '农户', 'alturner508@outlook.com', '159-0345-4417', '2007-07-30 12:30:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100878, 'Carol Edwards', '3552987188', '898975', '消费者', 'caroledwards6@gmail.com', '28-699-9940', '2009-04-10 22:03:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100879, '雷晓明', '7917238417', '293154', '农户', 'lei4@hotmail.com', '769-747-9036', '2016-07-02 04:19:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100880, 'Ernest Diaz', '2494299809', '105542', '农户', 'diaerne926@hotmail.com', '143-0165-7420', '2001-05-18 23:17:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100881, '田安琪', '6858254408', '865779', '消费者', 'anqi1@mail.com', '769-7530-8826', '2009-04-12 04:48:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100882, '常震南', '5135220640', '157088', '农户', 'changzhennan@outlook.com', '760-1021-5756', '2010-09-30 20:54:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100883, '孔云熙', '7754337901', '754209', '农户', 'kongyu@yahoo.com', '156-0167-8052', '2010-01-06 04:21:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100884, '郝震南', '1049914222', '122407', '消费者', 'zheh1960@yahoo.com', '139-0213-3977', '2021-12-11 10:55:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100885, '阎睿', '2221963631', '238675', '农户', 'yanrui@gmail.com', '165-6234-7150', '2013-08-05 06:37:29', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100886, '田秀英', '3903994638', '731417', '消费者', 'tian531@outlook.com', '172-1292-5276', '2016-07-23 09:38:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100887, '赵詩涵', '9358780996', '631474', '消费者', 'zhaoshih@yahoo.com', '151-9909-9452', '2021-01-14 18:43:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100888, 'Janice Henry', '1363575655', '220949', '农户', 'henry1107@icloud.com', '187-5307-8304', '2010-08-31 19:04:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100889, '叶宇宁', '4398645761', '187364', '农户', 'yuniye1995@gmail.com', '171-6571-1171', '2011-04-30 03:25:37', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100890, '黄璐', '7874479844', '912507', '农户', 'luhuang108@gmail.com', '133-7403-4255', '2011-11-24 06:03:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100891, 'Shawn Jenkins', '7154793940', '742218', '农户', 'shawn3@icloud.com', '173-3868-9571', '2010-07-11 23:59:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100892, 'Alice Payne', '7019885629', '375601', '消费者', 'palice91@yahoo.com', '760-1208-0132', '2000-12-31 14:30:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100893, 'Helen Jones', '3137506459', '289513', '农户', 'joneshelen@gmail.com', '164-4053-5946', '2008-10-14 16:58:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100894, '马睿', '5597440845', '854818', '消费者', 'marui@icloud.com', '769-743-6127', '2009-06-09 11:16:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100895, 'Jimmy Cole', '2411196534', '464356', '农户', 'jicole4@gmail.com', '180-5238-8342', '2005-01-23 23:08:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100896, 'Jeffrey Fernandez', '8384931886', '345484', '消费者', 'fernandezjef6@outlook.com', '174-8639-2048', '2012-03-15 13:33:35', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100897, '董宇宁', '4392538522', '613208', '消费者', 'yuningdong531@outlook.com', '156-7265-9312', '2023-04-13 18:10:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100898, 'Martha Collins', '8029040452', '239702', '消费者', 'collinsmartha4@gmail.com', '193-0781-0635', '2024-10-22 06:47:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100899, '廖岚', '7270216402', '954844', '消费者', 'llan@icloud.com', '769-1926-8778', '2002-03-15 10:00:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100900, '罗子异', '6421503893', '337298', '农户', 'luo82@gmail.com', '760-7335-0336', '2001-04-03 08:15:55', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100901, 'Victor Reynolds', '6973401517', '953891', '农户', 'victorreynolds@gmail.com', '183-4480-9107', '2020-08-29 13:21:33', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100902, '钱震南', '8343563591', '490323', '消费者', 'qian10@yahoo.com', '159-6205-0157', '2003-09-13 01:13:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100903, 'Elizabeth Gomez', '7666117472', '333355', '消费者', 'elizabeth9@gmail.com', '174-7780-2870', '2005-06-19 14:14:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100904, 'Gary Romero', '3494755732', '707525', '消费者', 'rgary@gmail.com', '28-6814-4532', '2008-06-29 14:47:38', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100905, '卢震南', '1386857734', '161122', '消费者', 'zhennan423@hotmail.com', '198-1791-1483', '2021-12-09 17:06:01', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100906, '杜晓明', '7184760241', '435893', '消费者', 'dux@gmail.com', '185-5749-1174', '2025-01-12 18:27:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100907, '孙晓明', '8881660741', '725016', '消费者', 'xiaomingsun@icloud.com', '20-6430-8557', '2015-11-24 12:29:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100908, 'Adam Wilson', '4583988135', '745201', '消费者', 'adamwilson1973@mail.com', '10-685-1565', '2011-02-07 13:02:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100909, '莫子异', '6713590924', '595063', '消费者', 'ziyimo209@icloud.com', '769-614-4381', '2002-07-03 00:54:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100910, 'Nicole Adams', '4922971665', '655762', '消费者', 'anicole@yahoo.com', '28-2693-2246', '2008-12-18 16:55:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100911, '龙詩涵', '8623006123', '177784', '农户', 'shihan72@yahoo.com', '28-3437-5455', '2023-08-10 10:00:43', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100912, 'Connie Thompson', '2254304606', '434936', '消费者', 'thompson9@icloud.com', '769-303-4760', '2021-11-16 03:44:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100913, '谭震南', '3257750264', '753433', '农户', 'tazh1026@outlook.com', '144-6773-8055', '2022-08-16 02:58:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100914, 'Joanne Stephens', '6698645960', '118960', '农户', 'joannestephens@gmail.com', '171-6996-3926', '2015-05-29 14:41:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100915, 'Gregory Fernandez', '9034500995', '460311', '消费者', 'gregoryf10@outlook.com', '173-3876-9529', '2010-10-16 13:35:32', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100916, 'Earl Stone', '3936454446', '342423', '消费者', 'earstone75@icloud.com', '160-4753-6339', '2006-12-17 20:25:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100917, '徐秀英', '8779727347', '729225', '消费者', 'xxu74@outlook.com', '760-645-7534', '2004-09-24 14:44:46', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100918, '姜晓明', '8012239879', '204571', '农户', 'xiaoming7@gmail.com', '188-2178-2681', '2000-01-17 03:59:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100919, '卢璐', '9890228676', '899118', '消费者', 'lulu@gmail.com', '755-3379-2270', '2009-04-06 04:12:21', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100920, '姚岚', '3714317473', '598543', '农户', 'lanyao@gmail.com', '165-5498-6415', '2001-07-24 04:32:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100921, '常晓明', '2258908357', '573015', '消费者', 'xiaoming4@outlook.com', '185-3237-4874', '2023-04-07 18:06:42', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100922, '孔晓明', '4564216443', '203416', '农户', 'konxiaom79@yahoo.com', '190-7306-9511', '2020-05-21 04:44:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100923, '严震南', '9122221307', '174216', '消费者', 'zyan@gmail.com', '28-218-3941', '2015-04-08 17:58:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100924, '陈嘉伦', '9074206536', '644987', '农户', 'jialuc@outlook.com', '134-1195-7479', '2023-04-01 15:58:10', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100925, 'Edwin Mendez', '3919284253', '355817', '农户', 'medwin@yahoo.com', '760-629-4061', '2011-01-17 18:11:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100926, 'Jeff Ford', '3518093330', '338720', '农户', 'fj1118@yahoo.com', '760-557-5173', '2017-12-30 05:53:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100927, 'Alfred Stone', '3092635696', '884891', '农户', 'alfstone630@yahoo.com', '156-1260-5199', '2022-03-02 19:32:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100928, '苏子韬', '3727844430', '295319', '消费者', 'zitaos@gmail.com', '28-5787-3330', '2022-10-06 17:45:58', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100929, '莫云熙', '3445625340', '496046', '消费者', 'moyunxi@yahoo.com', '10-1154-5740', '2003-12-02 06:21:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100930, 'Marjorie Boyd', '8054098090', '882752', '农户', 'boymarj@outlook.com', '133-0819-0979', '2014-06-04 05:04:12', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100931, 'Joyce Snyder', '6145971647', '955584', '消费者', 'joyce2@outlook.com', '28-709-8886', '2006-02-02 12:29:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100932, 'Dale Thomas', '5927060651', '216438', '消费者', 'thomdale8@icloud.com', '755-3275-3043', '2001-11-19 15:05:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100933, '何晓明', '5929548181', '737978', '农户', 'xiaoming03@gmail.com', '20-886-7421', '2004-05-20 09:16:06', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100934, '邵子异', '1750546535', '624645', '农户', 'shaoz@outlook.com', '151-2509-2411', '2008-10-07 13:30:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100935, 'Bradley Barnes', '2904554886', '997714', '农户', 'bradleyba@icloud.com', '165-9755-4954', '2015-01-23 16:32:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100936, 'Pamela Hughes', '9833779646', '323901', '农户', 'hughpamel@hotmail.com', '760-2425-9801', '2018-07-06 00:52:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100937, 'Joyce Hughes', '9585400659', '777306', '农户', 'huj@outlook.com', '28-3656-8382', '2023-05-27 16:31:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100938, '潘云熙', '5722050907', '864529', '农户', 'yunxipan72@gmail.com', '184-7799-0605', '2018-10-12 14:54:41', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100939, 'Rose Ford', '4609119455', '287220', '消费者', 'fordros@icloud.com', '755-7830-5438', '2017-08-24 21:21:47', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100940, 'Louise Gibson', '2132061911', '338205', '农户', 'gibsonlouise@outlook.com', '21-804-3984', '2018-04-18 02:02:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100941, '朱嘉伦', '3348464449', '604470', '消费者', 'zhujialun@outlook.com', '148-3276-2120', '2002-03-05 18:40:27', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100942, '顾詩涵', '2999754716', '699650', '农户', 'gs6@gmail.com', '769-048-4853', '2005-03-23 00:13:48', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100943, '钟岚', '2506671125', '834008', '消费者', 'lanzho@outlook.com', '175-2866-1136', '2023-09-20 23:17:36', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100944, '萧秀英', '1993563553', '643360', '农户', 'xiuyingxi@outlook.com', '10-334-3697', '2024-10-28 12:39:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100945, 'Frances Marshall', '3479763920', '520415', '消费者', 'mfr322@gmail.com', '195-0827-2321', '2003-10-31 09:55:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100946, 'Ryan Long', '1915907863', '983916', '农户', 'ryan904@gmail.com', '145-7052-9778', '2010-10-04 02:43:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100947, 'Leonard Patel', '3449733870', '654206', '农户', 'leonp@outlook.com', '769-4528-1960', '2005-12-21 12:58:07', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100948, '陈晓明', '2303213413', '339734', '农户', 'chen903@outlook.com', '10-9232-2597', '2004-10-13 09:17:08', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100949, '谭杰宏', '1567726736', '194347', '消费者', 'tanjiehong@icloud.com', '760-539-9187', '2002-02-05 07:11:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100950, '郭宇宁', '9655382463', '171584', '消费者', 'yuningg@icloud.com', '139-0017-1640', '2003-03-12 19:22:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100951, '尹杰宏', '2699116760', '507117', '农户', 'jiyin319@gmail.com', '194-5278-9110', '2001-05-27 07:57:11', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100952, '于杰宏', '7367553845', '816220', '消费者', 'yji@outlook.com', '163-2095-3598', '2005-11-25 11:37:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100953, '邱安琪', '3379970306', '330808', '消费者', 'aqi2@mail.com', '154-4901-9323', '2004-10-13 13:49:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100954, '崔宇宁', '8854651386', '463631', '消费者', 'yunc@outlook.com', '755-805-1997', '2012-02-20 06:12:51', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100955, '严詩涵', '2114132073', '929247', '农户', 'shyan4@hotmail.com', '181-8619-5996', '2024-03-28 14:11:34', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100956, '黄宇宁', '2233636992', '146611', '农户', 'huangy@hotmail.com', '179-3685-3519', '2014-01-29 02:13:27', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100957, '袁子韬', '4353732330', '763607', '农户', 'yuaz7@mail.com', '197-7085-4772', '2011-03-25 17:35:57', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100958, '马子韬', '6026991607', '511399', '消费者', 'zitaoma808@icloud.com', '10-6765-5217', '2011-09-05 07:09:31', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100959, '潘嘉伦', '8851964237', '986239', '消费者', 'panj4@hotmail.com', '20-435-1791', '2012-12-15 13:09:13', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100960, '徐璐', '3009377978', '809946', '农户', 'luxu215@icloud.com', '180-2989-7381', '2018-08-04 16:12:17', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100961, 'Melvin Webb', '3263663684', '405153', '消费者', 'melvinwebb53@outlook.com', '760-1468-0468', '2012-05-28 19:46:16', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100962, 'Joe Cook', '6475496230', '114851', '农户', 'cook4@outlook.com', '760-3648-4732', '2005-09-19 12:59:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100963, 'Andrew Graham', '4339154282', '101065', '消费者', 'andrewgraham@gmail.com', '152-5668-2284', '2002-06-12 16:40:20', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100964, 'Josephine Holmes', '2489940221', '973107', '消费者', 'hjo@icloud.com', '141-6106-5962', '2007-02-19 08:18:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100965, 'Stanley Stevens', '2148784937', '350299', '消费者', 'stanstevens@gmail.com', '28-102-3829', '2011-10-13 17:40:30', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100966, '卢宇宁', '2626075815', '767685', '农户', 'yuninglu@outlook.com', '166-0536-8239', '2022-02-11 21:17:26', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100967, '蒋秀英', '8473412132', '736118', '消费者', 'jianxiuying@yahoo.com', '171-0432-2464', '2001-04-22 23:56:28', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100968, 'Justin Mendez', '7726960807', '251691', '消费者', 'mendezj@outlook.com', '185-2822-2646', '2005-04-01 02:05:50', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100969, 'Dale Rodriguez', '4282650878', '482031', '农户', 'drodriguez@gmail.com', '196-1409-7726', '2006-08-04 18:24:15', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100970, '赵云熙', '8690440620', '306547', '消费者', 'zhaoyunx4@outlook.com', '149-0446-4503', '2018-11-19 06:38:03', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100971, 'Philip Payne', '1657073646', '619654', '农户', 'pphilip@hotmail.com', '20-844-1784', '2007-10-27 18:41:54', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100972, '史致远', '3918089220', '662975', '消费者', 'zhsh211@yahoo.com', '192-2150-8662', '2014-08-23 01:41:23', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100973, '叶岚', '5974402963', '474159', '消费者', 'lan98@yahoo.com', '28-308-7125', '2004-01-12 13:52:56', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100974, '严云熙', '2643154576', '733248', '消费者', 'yunxyan10@icloud.com', '164-4454-7910', '2006-02-15 04:09:09', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100975, '曹詩涵', '1000775089', '635809', '消费者', 'shihcao54@yahoo.com', '21-129-3108', '2014-01-27 13:07:49', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100976, '杜子韬', '8471381998', '205333', '消费者', 'zitaod@hotmail.com', '28-029-1443', '2023-04-30 10:44:22', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100977, 'Mike Coleman', '2308075360', '351111', '农户', 'mikec730@mail.com', '21-6065-6644', '2005-03-14 04:54:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100978, 'Carrie Patterson', '6958877414', '635258', '消费者', 'capatt204@icloud.com', '20-364-3951', '2022-07-10 06:20:52', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100979, 'Ronald Moreno', '9075887702', '351906', '农户', 'morenoron@yahoo.com', '755-558-6802', '2024-04-18 11:16:05', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100980, 'Joshua Evans', '1734772637', '706966', '农户', 'joshuaevans70@hotmail.com', '167-2293-9054', '2008-04-12 00:01:39', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100981, '郑詩涵', '6837019679', '673546', '农户', 'shihanzheng@outlook.com', '755-3147-2290', '2022-03-18 05:39:24', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100982, '曾致远', '9777941095', '142871', '消费者', 'zhiyuan80@gmail.com', '28-912-2799', '2003-01-18 12:04:53', 'avatar.jpg', 1);
INSERT INTO `user` VALUES (100983, '贺詩涵', '4651117343', '535138', '农户', 'shihan1208@hotmail.com', '160-5462-9218', '2003-11-21 20:26:53', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100984, 'Jacqueline Rivera', '6783250998', '616105', '农户', 'riveraj@icloud.com', '10-686-6293', '2008-10-22 19:33:09', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100985, '熊子异', '1063360674', '577463', '消费者', 'zxio@hotmail.com', '150-3862-9842', '2002-08-31 14:23:32', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100986, '邱杰宏', '5926176996', '900359', '农户', 'jqiu912@mail.com', '155-2928-4020', '2018-11-27 09:47:35', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100987, '程秀英', '8703706485', '751711', '农户', 'cheng501@icloud.com', '184-1375-7082', '2006-12-21 08:04:39', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100988, '刘岚', '4756453958', '787586', '消费者', 'liu9@yahoo.com', '142-0371-5186', '2017-05-17 12:38:46', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100989, '蔡詩涵', '1745907220', '142621', '消费者', 'shihan97@yahoo.com', '159-1293-4239', '2011-05-23 23:19:25', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100990, 'Nancy Sanders', '3366064633', '349716', '消费者', 'snan4@outlook.com', '190-5412-9852', '2014-11-10 19:39:03', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100991, '冯云熙', '6488839153', '173682', '消费者', 'yunxifen1211@gmail.com', '180-8242-2258', '2000-06-17 13:39:53', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100992, 'Adam Cooper', '1370409941', '699198', '消费者', 'adam220@mail.com', '21-746-6862', '2016-04-24 19:27:25', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100993, 'Phyllis White', '1996400881', '677758', '农户', 'phylliswhite@icloud.com', '194-0471-6914', '2021-01-21 12:45:17', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100994, '邓安琪', '9700723270', '902194', '消费者', 'dan@mail.com', '769-2545-6204', '2025-02-24 23:29:06', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100995, 'Ray Hernandez', '6226201289', '460935', '农户', 'rayh@hotmail.com', '21-0091-2567', '2019-11-20 02:16:33', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100996, 'Albert Ramirez', '4406199386', '901377', '消费者', 'ramirez52@hotmail.com', '175-9870-4964', '2016-05-29 12:33:20', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100998, 'Susan Aguilar', '8534282975', '205913', '消费者', 'agususan6@hotmail.com', '755-7318-8007', '2000-12-01 08:31:17', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (100999, '阎云熙', '3951679148', '328860', '消费者', 'yunxiyan@icloud.com', '21-248-0596', '2011-06-22 07:04:10', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (101000, '杜子韬', '1543342841', '588914', '消费者', 'duz1117@outlook.com', '760-7468-9501', '2022-06-19 23:58:25', 'avatar.jpg', 0);
INSERT INTO `user` VALUES (101022, 'aaa', 'A', '123', '消费者', '1@qq.com', '12345678901', '2025-05-01 23:59:35', 'avatar.jpg', 0);

SET FOREIGN_KEY_CHECKS = 1;
