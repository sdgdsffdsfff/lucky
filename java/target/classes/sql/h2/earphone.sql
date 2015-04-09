/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50613
 Source Host           : localhost
 Source Database       : ops

 Target Server Version : 50613
 File Encoding         : utf-8

 Date: 11/05/2013 10:28:36 AM
*/
create database earphone;
use earphone;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '动作名称（例如增加，删除）',
  `path` varchar(200) DEFAULT NULL COMMENT '相对于主目录的路径',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `moduleId` int(11) DEFAULT NULL,
  `actionName` varchar(200) DEFAULT NULL,
  `orders` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `action`
-- ----------------------------
BEGIN;
INSERT INTO `action` VALUES ('82', 'admin:user:view', '2013-10-28 20:13:05', '14', '人员查看', '1'), ('83', 'admin:user:edit', '2013-10-28 20:13:32', '14', '人员编辑', '2'), ('84', 'index', '2013-10-28 20:13:54', '14', '进入首页', '3'), ('85', 'admin:role:edit', '2013-10-28 20:14:55', '11', '角色编辑', '2'), ('86', 'admin:role:view', '2013-10-28 20:15:23', '11', '角色查看', '1'), ('87', 'admin:module:view', '2013-10-28 20:15:49', '12', '模块查看', '1'), ('88', 'admin:module:edit', '2013-10-28 20:16:07', '12', '模块编辑', '2'), ('89', 'admin:action:view', '2013-10-28 20:16:33', '13', '权限查看', '1'), ('90', 'admin:action:edit', '2013-10-28 20:16:52', '13', '权限编辑', '2'), ('91', 'admin:menu:view', '2013-10-28 20:17:15', '17', '菜单查看', '1'), ('92', 'admin:menu:edit', '2013-10-28 20:17:33', '17', '菜单编辑', '2'), ('93', 'admin:category:view', '2013-10-31 13:53:05', '18', '耳机类型查看', '1'), ('94', 'admin:category:edit', '2013-10-31 13:53:28', '18', '耳机类型编辑', '2'), ('95', 'admin:earphone:view', '2013-10-31 13:54:05', '19', '耳机查看', '1'), ('96', 'admin:earphone:edit', '2013-10-31 13:54:25', '19', '耳机编辑', '2'), ('97', 'admin:article:edit', '2013-10-31 13:54:59', '20', '文章编辑', '2'), ('98', 'admin:article:view', '2013-10-31 13:55:22', '20', '文章查看', '1'), ('99', 'admin:reply:view', '2013-10-31 13:55:53', '21', '评论查看', '1'), ('100', 'admin:reply:edit', '2013-10-31 13:56:28', '21', '评论编辑', '2'), ('101', 'admin:global:edit', '2013-11-04 21:41:31', '22', '系统配置', '1');
COMMIT;

-- ----------------------------
--  Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `viewCount` int(10) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `orders` int(11) NOT NULL COMMENT '排序',
  `loveCount` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `categoryId` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL COMMENT '图片',
  `replyCount` int(11) DEFAULT '0' COMMENT '回复数量',
  `createTime` datetime DEFAULT NULL,
  `detail` text NOT NULL COMMENT '文章详情',
  `shortDetail` text NOT NULL COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `article`
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES ('4', 'MT66A的黑檀木魅力，来自Sendiy的听歌神器', '2222', '1', '779', '5', 'http://ear.ttpod.com/upload/allimg/131021/1-1310211G5250-L.png', '0', '2013-10-31 10:44:57', '<p>小编前几天收到Sendiy出品的黑檀木耳机样品，估计也煲了几十个小时了，呵，今天大概说说这个耳机的试听感...<br />\r\n<br />\r\n先从外观说起,相当精致,拿在手中的感觉也挺有质感.<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H1112D.jpg\" style=\"height:auto; width:auto\" /><br />\r\n<br />\r\n用料：腔体-采用进口印尼黑檀木原料，色泽，纹理，成色都是上品。线材-4芯对编发烧银线。喇叭-商家透露是德国进口的8mm动圈，很多千元级的耳机用的都是这款单元。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H220301.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&nbsp;<br />\r\n做工：感叹MT66A的精细设计，可以说得上是十年磨一剑，纯手工打磨的高密度黑檀木腔体，低调中不失高贵，整体细节处理完美，这货是艺术品。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H14X19.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&nbsp;<br />\r\n三频（开声）：高频顺滑，高音上的去，中频稳定，饱满，低频下潜深，有弹性，解析高，比较耐听，听摇滚类别时候，瞬态过度也比较好，人声靠前，比较贴耳。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H24a59.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&nbsp;<br />\r\n听感：每个人的听感都不同，就像泡妞一样，处于暧昧期，双方都对彼此都有感觉以及有了深入的了解，但是离上床还差一点。这个价位段你想&ldquo;什么都听&rdquo;那是不可能的，而且很多价位段都不可能满足这个。你要明白自己要的是激情澎湃的还是温文婉约的声音，也就好比你喜欢什么样的女孩子一个意思。总之，适合自己的才是最好的！<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H30QJ.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&nbsp;<br />\r\n定位：经过几天的不离身试听，MT66A算是一款杂食塞子，适合各种类型风格的音乐，稍微偏摇滚流行多一些。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H354148.jpg\" style=\"height:auto; width:auto\" /><br />\r\n<br />\r\n&nbsp;<br />\r\n性价比：相比XX大品牌低端卖好几百的比，MT66A优势太大了，266元的零售价根本不是同价位任何耳机能比的，至于我说的对不对，亲们可以拿任何耳机去对比，如果觉得比不过，您扔了，给您全额退款！新款上市，买到不是赚是什么呢？<br />\r\n&nbsp;<br />\r\n包装：拿到这款，第一感觉就是包装太高档了，千元级以上的耳机也见过用过不少，像MT66A这款这样的包装，着实让我吃惊了一把，何况才卖200多的。。。厂家真是良心大大的。。赞！！！<br />\r\n&nbsp;<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H32b34.jpg\" style=\"height:auto; width:auto\" /><br />\r\n<br />\r\n本次测试曲目CD全部由本人用HIFI CD抓轨系统亲自压制成原汁原味的WAV作为试听曲目煲了有几十个小时了，下面说下此次评测的内容，此次评测我将挑选了不同类型的日本首版CD作为片源所抓出来原汁原味的WAV格式来测试MT66A。我想这样的测试更有意义价值也更能发挥MT66A的本质。<br />\r\n&nbsp;<br />\r\n人声篇 ：<br />\r\n在这里我选择了具有人声代表的林忆莲。林忆莲作为香港的一个常青树，从商业DJ跨越到歌手的转变，经过自己的努力，也成为了一个唱歌十分了得的歌手，废话少说，直接进评测。 在林忆莲的CD当中我选择了《梦了，倦了，疯了》这张作为此次的评测曲目。因为 梦了，倦了，疯了》是继《都市三部曲》后最巅峰的作品。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H41V62.jpg\" style=\"height:auto; width:auto\" /><br />\r\n<br />\r\n播放器我采用的是SONY A系停产了的845声音开到16格， 选到第八首《破晓Ⅱ》，这首也只在此张专辑呈现，为《破晓Ⅰ》的清唱版。我轻轻点了下PLAY， 伴随着一阵长笛SOLO缓缓从远方唱来，我知道这是前奏的开始，闭上眼睛，紧接着跟随过来的就是阿莲那性感磁性的声音，&ldquo;遗弃的声音又响起了,遗弃的感觉偏剩下多少 不听 不触摸 不痛楚 懒看 懒记忆 懒问我 今天得到的叫什么 管不了&quot;整个前段的歌曲在MT66A的诠释下很流畅，三频衔接自然，银线确实在分频好的前提下做好了本质工作。高频顺滑，中频清晰自然。横向声场很宽敞，齿音清晰，阿莲就如午夜歌姬一般，在你傍边轻轻吟唱，在你身边诉说着她的情感，她的故事。我陶醉在歌声中，原来一首看似简单的歌可以诠释表达这么多的情感，歌毕，我隐约感觉我的眼角有所湿润，我竟然被感动了，是阿莲？是歌词？是器材？这些我觉得都不是重点，重点的是我在听的过程中完全是于歌者达到了共鸣。爱 一天天的老，梦 一天天小 ，痛过才知道 ，我已不怕渺小，孤星也能照耀 ，就在某年某月某夜。。。。 此时此刻 就让我沉醉其中吧。。<br />\r\n&nbsp;<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H435Q4.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&nbsp;<br />\r\n舞曲篇：<br />\r\n舞曲测试时我换了个前端AK120。舞曲考研的是三频的衔接，定位，瞬态，解析，以及低频的下潜，我试听的片源为雷迪嘎嘎的舞曲MIX。 测试的曲目为《Poker Face (Space Cowboy Remix)这是日本独自策划重新编曲。 版本也有很多，选用这首是因为这首的旋律SOLO很爽，用到的乐器很多， 开测。点播，开头是机器SOLO，直接插进了金属乐，很闷很快的重击的鼓声，那种鼓声鼓点很集中，拳拳打到我的心窝，真是一个痛快，瞬态非常的棒，鼓声混而不乱，中间夹杂着金属RAP，1分01秒，一声巨大的鼓点敲下去，立马衔接到嘎嘎小姐的出场，定位感准，强，狠，低频下潜很深，很集中的爆发，收的不算快（比碎收的快 有所改进），空气感层次感强，解析依旧够牛逼，很自然，没有失真的感觉，金属贝斯吉他无黏滞感、管乐厚而饱满、打击乐器敲起来有空气振动的感觉。所有的乐器与人声都应具有重量感。曲毕，听完以后不会出现那种头晕胸闷的感觉，有种高潮刚过，欲想梅开二度的渴望。在舞曲上，我基本没找到不足的地方，如果要毛里求疵的话我觉得低频的太过抢戏掩盖住了中高频的热点。<br />\r\n&nbsp;<br />\r\n&nbsp;&nbsp;<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H453S0.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&nbsp;<br />\r\n钢琴+ACG篇：<br />\r\n钢琴里我最喜欢的有两位，一位是巨势典子，另外一位就是中村由利子， 试听曲《火宵の月テーマ》是由漫画改编的动画片《火宵の月》的主题曲。<br />\r\n<br />\r\n《Kasho no Tsuki火宵の月Firemoon火霄之月》原声专辑发行于2002年，是作曲家 中村由利子 为日本动画片《Kasho no Tsuki火宵の月》创作的配乐专辑。<br />\r\n<br />\r\n专辑总共10轨乐曲，其中第一轨《火宵の月&middot;テ-マ》使用了中国五声调式，便相对不免给人留下偏重中国乐风格的印象。而《秋狂言》中运用了能乐传统的乐器、曲调和唱腔，主音的和笛大量使用了清艳的半音，教人想起庄严华丽的和服。平领七重袖，青朽叶的上袭瑶白束脚裤，修长手指执着三十九骨唐绘桧扇，转身，屈膝。舞者带着古拙面具和假发，举手投足缓慢郑重，低头。就只看见颈项纤细白皙。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H512b1.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n开测，试听曲《火宵の月テーマ》<br />\r\n平淡的前奏，缓慢而悠扬，一滴水声缭绕，余音尚未散尽，主题旋律行云流水般直铺下来。MT66A在任何风格的曲目测试下，解析和定位都是达到了完美的境界，钢琴从高音区降至中音，自然而生动，流年一样平铺直叙。小提琴在这时加入，万缕千丝的委婉清洌在胸口轻微的纠结，蜻蜓点水般留不下痕迹。木落淮南，雨晴云梦，却依旧弃我去者不可留。 这段小钢琴的插入让我高潮了一下，瞬间将生活中所有烦闷的烦恼事全部带走。大提琴慢慢接着小提琴缓缓铺开，遮不住挽不回的流年偷换，无限感伤，只不过眉心一瞥淡雪轻漫再融化不得。涟漪半声，月明风袅。毒啊，66A在钢琴，小提琴这样小编制的诠释下完全不输给千元耳塞，中国古色古香的韵味表达的淋漓精致。说不出的畅快！犹如燥热的天气喝上一杯消暑的好茶。<br />\r\n<br />\r\n巨势典子试听曲目为主打同名《风の道》巨势典子听过人的人不多，晓得的人也甚微，但巨势典子的音乐绝对是我听过最棒最真情的钢琴曲，没有之一。如果中村由利子的音乐能够替你疗伤安魂，那巨势典子的钢琴就能替你忘却自己，忘却悲伤，回归自然。典子所有的专辑曲目 都由自己创作，并且由自己的公司发售，录音也是按照最原始的录音，随意听典子的音乐里带有古老黑胶的那种味道，很真实，给你摸得着看得见的真是情感。闲话不多说，直接进入评测，点击播放这首主打同名《风の道》，开篇钢琴像小雨点般细腻的将你带入典子的故事当中，66A的乐器的定位之准，让我感到匪夷所思，不偏不破，钢琴就在你的前方，面对着你，空间感很强，我闭上眼睛，从声音的传达，估计在4米的样子，典子就在4米开外，寄托着她的情感，真实的表达着自己。钢琴的透明感很强，听起来非常的柔和，耳朵不易疲劳，典子把她的钢琴交代的很清楚，此时此刻你只需要闭上眼睛倾听，整曲6分11秒的曲子，高潮时间摆在2分34秒到2分57秒，那种超强的技艺真的让人无比的幸福，我释然了，音乐的初衷就在于感动和共鸣，在欣赏音乐的同时，我又庆幸手上有66A这样的利器，能将这份感动扩大和释放，我此时也终于明白Sendiy品牌打造66A中途的辛苦，这是一种执着，一种信仰，更是一种无形的动力驱使着国内爱好者开拓出这样好的&ldquo;神兵利器&rdquo;。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/131021/1-1310211H530232.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&nbsp;<br />\r\n古典篇：<br />\r\n古典我听的比较少，但为了这次评测我还是拿了张比较有名的苏菲 穆特《卡门幻想曲》作为测试，版本为日本版，这张版本一般 ，不是天龙版 更加不是德国西德版<br />\r\n闲话少说。测试采用第三首歌曲(塔蒂尼：Ｇ小调奏鸣曲魔鬼的颤音) )<br />\r\n前奏，小提琴缓缓的拉的起来，这是一首略带感伤的古典交响曲，在66A的诠释下，小提琴的质感及音质、音色亦至真至美， 伴奏也非常出色， 全频相当平均，充满生气，独奏乐器与乐团的比例亦佳 ，空间感，层次感和定位感都非常的精准，音乐的张力十足，棱角分明，<br />\r\n琴手的技艺发挥得淋漓尽致，琴声真实，堂音丰富。歌曲播放到4分钟的时候，小提琴换成独奏，一阵阵的琴声犹如狂风暴雨迎面敲打过来，瞬息感强，高频感觉略平淡了些，中频和低频非常的给力，我仿佛能看到琴手轻轻的装上弱音器，&ldquo;极有表情地&rdquo;奏出充满感伤情调的旋律，悲伤的情绪达到极点。脑海中也构思出悲伤的画面感，琴声依旧没停，8分04秒，小提琴慢了下来，这中间的转换根本没出瑕疵和不足，三频衔接非常的好，我感觉这货就是W4R+EX1000的完美浓缩版，这种小编制乐器下，真心是无敌，9分20秒，各类器材汇集在一起 ，一点都没显的松垮混乱，小提琴是小提琴，大提琴是大提琴，11分钟，2/4拍子，急变为极快的快板<br />\r\n以管弦乐的强奏作为先导，小提琴演奏出十分欢快的旋律，右手的快速拨奏与高音区的滑奏无比欢愉；这一旋律告一段落后，又用小提琴的拨奏开始新的旋律。全曲16分32秒，12分50秒再次突进了一个小高潮，小提琴时起时落，时快时慢，此时此刻，我已经沉浸在器乐交叉当中。。。。<br />\r\n&nbsp;<br />\r\n总结：<br />\r\n从测试以上曲子来说，MT66A的表现可圈可点，毕竟是煲了不到200小时的状态，相比之下高频除了略显逊色外，中低频强处还是十分给力的，从听感，乐感，定位，解析，瞬态等等来说，都表现的非常好，素质也是奇高。目前就是继续煲。看400小时后，高频的拉升感能否改善。。。<br />\r\n作为一个全新的自主研发生产的国内品牌，能够做到这样的水准，确实让我和我的小伙伴都感到很惊喜，同时我也希望能够开发后续产品。将不足之处再弥补修改，打造出更加天籁的&ldquo;神器&rdquo;！</p>\r\n', '小编前几天收到Sendiy出品的黑檀木耳机样品，估计也煲了几十个小时了，呵，今天大概说说这个耳机的试听感.'), ('5', '小萌SS01 JVC-fxz200 IE80 对比评测', '2222', '2', '33', '5', 'http://ear.ttpod.com/upload/allimg/131008/1-13100Q315210-L.png', '0', '2013-10-31 10:46:25', '<p>关注耳机多年，一直觉得我们中国也应该出一款能与世界品牌抗衡的耳机，之前hifiman出过几款，不过售价确实不亲民。小萌三四百块的售价，应该能够吸引更多人的眼球。这次通过买FXZ200 送了一条第三版本的小萌，说实在的，JVC号称地外科技，总会退出一些奇奇怪怪的东西，在市场上很是冷门（当然，冷门并不是不好，相当年IPONE一代也很是冷门）。所以说，单单用FXZ200和小萌进行对比，无法给两者一个比较&nbsp; &nbsp; &nbsp; &nbsp; 清晰的市场产品定位。这是因为，假设，如果我们感觉FXZ200低频比小萌好，那么很有可能的事实是两者低频都很差，然后FXZ200稍微比较好一点。所以，把发烧友比较热门的IE80拿出来，才能真正说明这两个耳机好在哪里。<br />\r\n先对比几个非声音的因素。<br />\r\n外观：外观上的评价比较主观，萝卜青菜各有所爱，但从IE80涌现那么多假货而且很畅销这个事实上，可以说IE80的外观设计是比较成功的；FXZ200由于3动圈的关系，造型比较奇葩，并不是很多人能够接受，至于小萌，外观设计是比较成功的，双动圈安排的比较紧凑，加上正式版会有多色选择，应该比较卖座。<br />\r\n做工：IE80的做工很一般，完全衬不起它的售价，塑料感觉不是很坚固，换线的设计个人觉得主要就是为了能在线材上偷工减料；FXZ200的做工无敌，很细致，显得非常高档，内部整齐有序，三动圈排列清晰可见；小萌的整体做工略显一般，材质可能由于成本的问题，显得比较普通，类似于普通MP3的配机线，但由于是测试版，相信到了正式版应该会有很大改善。<br />\r\n佩戴：IE80的佩戴舒适度感觉一般，FXZ200由于耳机本身过重的问题，需要比较粗的套子才戴得紧，但这又会带来低音过重的不良影响。小萌的佩戴很让人惊喜，应该说是三者中最舒服最好的，比较稳。<br />\r\n下面开始声音的对比。我一直认为，好的耳机要有好的音源和前端搭配。前端差，音源不好，比如手机上听MP3，有时候地摊塞都会因为线材屏蔽优秀、听诊器效应小、低解析度带来的减少音源噪音而&ldquo;秒杀&rdquo;专业耳机。这次测试的前端是imod+fiio e12，imod现在应该很少人玩了，不过其强大的素质还是在的，飞傲E12是刚刚上市不久的耳放，其本身音染几乎没有，能够保留音乐原来的风格，从而能够体现不同耳机的特点。（另外说明一下，直插笔记本和手机，IE80由于所需推力较小，还是能出不错的声音，FXZ200和小萌则会使声音暗淡平直不少，所以强烈建议上耳放。）<br />\r\n低频：IE80的低频在发烧友的评价中向来是比较优秀的，得益于其宽大声场带来的气势，IE80的低频泛而有力，加上其可调节的设置，可以适应不同烧友的需求；FXZ200低频的量很足，个人认为相当于IE80低频调到最大，弹性比未换线的IE80好很多；小萌的低频在三者中相对较弱，低频散，下潜一般。<br />\r\n中频：FXZ200得益于三动圈设计，中频在三者中是最好的，饱满耐听；IE80依靠强大的解析，中频也可以，不过韵味不足；小萌的中频还可以，比低频要好很多。<br />\r\n高频：高频是小萌的最大优势，听小提琴的时候，无论音调多高，声音都不会有明显的变化，依旧韵味十足，相比较下，IE80高频有点过亮，FXZ200则有点闷。<br />\r\n解析：解析是最能把IE80和其他两者区分出来的方法，IE80解析太强大了，无论是高中低频都能展现其极高的水准；小萌的解析在同价位耳机中的素质也是很优秀的，特别是高频的细节很好；FXZ200我觉得在三者中是最差的，要推力足够大才能听出细节。<br />\r\n声场：IE80的声场是无敌的（当然我们没有必要拿K3003来对比），可以直接秒杀所有500元以下大耳，横向纵向都很宽，听雨声、听交响是很立体的，同时带来的气势是无与伦比的；FXZ200的纵向声场还过得去，但横向声场是残废的，乱作一团，听加州旅馆，掌声杂乱无章，不知道为何把它定义为live beat，个人感觉听solo会比IE80好很多。小萌的声场还是比较窄的，无论是横向还是纵向，但比FXZ200好的是不会乱，人声很靠前，在背景音较少的情况下能出很好的效果，直秒IE80残废的人声。<br />\r\n以上这些是在IE80 800小时，FXZ200 500小时，小萌100小时后写下的，对于双动圈的小萌来说，依然有很好的上升空间。我认为小萌是一件比较成功的作品，各方面较国外中端耳机都不落下风，性价比很高，希望其早点上市，让广大音乐爱好者都能享受这副国产双动圈耳机。</p>\r\n', '关注耳机多年，一直觉得我们中国也应该出一款能与世界品牌抗衡的耳机，之前hifiman出过几'), ('6', 'WAKI-WAKI K33首次听感评测 ，自然宽松的人声表现', '2', '4', '3', '5', 'http://ear.ttpod.com/upload/allimg/130929/1-1309291522330-L.png', '3', '2013-10-31 10:47:26', '<p>WAKI-WAKI 是一个新生的潮酷品牌，之前对其的了解不是太多，不过收到厂家寄送的样版WAKI 533之后的确有点吃惊，套用一个潮流的词语，高端大气上档次，，呵呵。<br />\r\n&nbsp;<br />\r\n先上一些包装图：从外部细节看看工厂的用心。<br />\r\n外观1.<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-13092310111Q45.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101200439.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-13092310122A50.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101244163.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-13092310131c51.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-13092310133LG.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101400951.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-13092310141OX.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101434164.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-13092310145J04.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101513C6.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101535556.png\" style=\"height:auto; width:auto\" /><br />\r\n打开包装盒，取出耳机的一瞬间，还是非常亮眼的，样版是纯黄耳机架配上高档的银灰色，从图片上看来也灰常有爱吧，嘿嘿，<br />\r\n&nbsp;<br />\r\n厂家也特意指出产品的设计点：独特的金属加工工艺，保证完美的视觉享受，经过改良的PU皮耳套，适合长时间佩戴不疲劳，便携式折叠设计，方便出行，另外采用了镀金插口，高质量的双色双拼TPE线材，随耳机还配送漂亮的包包，一键接听电话功能，嗯嗯，还有监听级的隔音效果。<br />\r\n&nbsp;<br />\r\n下列说说更惊喜的音质表现吧。<br />\r\n&nbsp;<br />\r\n由于采用了PRO扬声单元，直径为40MM大口径大动圈，所以小编对于耳机的音质表现也格外充满期待。<br />\r\n&nbsp;<br />\r\n因为是出街耳机，所以小编也就用随身的手机来做测试了。毕竟大多数购买此类风格的耳机都是匹配移动设备来欣赏音乐，我们也尽可能的多提供一点实际参考价值。<br />\r\n&nbsp;<br />\r\nWAKI 533首先来说是一款非常易于驱动的耳机，试过几台手机都轻松无压力，表现出众。<br />\r\n后面就用小米2S手机做一个全程测试表现效果。<br />\r\n测试之前耳机已经过二周左右的自然煲机，所以相信在表现上更趋近真实的水准。<br />\r\n&nbsp;<br />\r\n先用&ldquo;OPERA2&rdquo;测试，看看高频这一块有什么惊喜的表现，果然不失所望，在高频应有的通透和明亮上，基本做到了，完整表达出VITAS那紧张HIGH到极点的恐怖高音，听得也极是畅快淋漓，很正。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101552317.png\" style=\"height:auto; width:auto\" /><br />\r\n鉴于周杰伦的歌迷众多，所以也选择了&rdquo;菊花台&ldquo;做为测试歌曲，整体听感非常真实，轻轻柔柔表现得宽松自然，周董的人声也极是饱满，低频结实有力，整体氛围感很强，看来在人声这一块上也调教得非常理想，出乎意料。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101F1W7.png\" style=\"height:auto; width:auto\" /><br />\r\n在&ldquo;渡口&rdquo;这首歌上，前几声鼓令WAKI 533表现出了王者风范，着实结实有弹性，沉而潜，圆润不失力度，歌手蔡琴唱起后，明显感觉鼓声渐行渐远却下潜依然，（之前听过的大多数耳机在这个节点都表现得低频过于闷），和人声相扯的现象基本没有，突显出更准确的人声区域，而低频的烘托真是恰到好处，非常适合小编的品味。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101I4C8.png\" style=\"height:auto; width:auto\" /><br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101K1458.png\" style=\"height:auto; width:auto\" /><br />\r\n顺便也听了下力宏的&ldquo;唯一&rdquo;，钢琴独特的清脆明快的表现也令人浮想联翩，除此之外，力宏磁性的嗓音也表现得极是有韵味，非常适合流行风格的演绎。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101S0b5.png\" style=\"height:auto; width:auto\" /><br />\r\n收尾曲用了席琳迪昂的&ldquo;BECAUSE YOU LOVE ME&rdquo;,声场这个时候，完全释放出来，空间感十足，似乎CELINE DION正位于你正前方的舞台深情演绎，一曲听完，竟让人心生感动。<br />\r\n稍微总结一下，手机的听感和单纯的耳放相比在表现上是肯定有差距的，无论解析，爆发，量感上都明显不足，不过WAKI 533却表现出令人惊喜的宽松听感，看来不久的将来，满大街又会多一道明亮的风景。<br />\r\n<img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-130923101Ua62.png\" style=\"height:auto; width:auto\" /><br />\r\n值得一提的是WAKI-WAKI还推出了个性化的定制服务：增加80元即可在耳机上刻上独有的LOGO标记，相信会讨得不少情侣的青睐，打上爱的印记，相伴到永远！很有爱哟~~~~~<br />\r\n&nbsp;<br />\r\n呵，情侣套装，更有9折优惠。<br />\r\n喜欢WAKI 533的骚年朋友可直接在WAKI-WAKI的官方旗舰店下单购买，抢先有惊喜哟！现特惠价：仅299元<br />\r\n<a href=\"http://detail.tmall.com/item.htm?spm=a1z10.1.w6144565-3796639093.4.AHxNqL&amp;id=22019495326\"><img alt=\"\" src=\"http://ear.ttpod.com/upload/130923/1-13092310192b42.png\" style=\"height:auto; width:auto\" /></a><br />\r\n商城地址：http://waki-waki.tmall.com/shop/view_shop.htm?spm=a220m.1000862.1000725.3.1TMvLB&amp;user_number_id=1587280436&amp;rn=a716d6f52c91fa49cd46f64b1c196a4a</p>\r\n', 'WAKI-WAKI 是一个新生的潮酷品牌，之前对其的了解不是太多，不过收到厂家寄送的样版WAKI 533'), ('7', '初初神器 小萌耳机SS01 jvc fxz200 听感', '3', '3', '3', '5', 'http://ear.ttpod.com/upload/allimg/130921/1-1309211136310-L.jpg', '0', '2013-10-31 10:48:19', '<p>算起来这两个耳塞到手一个多月了，听音时间50&mdash;100小时的样子，基本上都是路上听的，不敢说煲透了。<br />\r\nFxz200是JVC家的三动圈旗舰，两个微动圈加一个大动圈的组合方式，地球上只此一家，别无分号，传说中的外星科技的产物。微动圈技术有把动圈向动铁化发展的趋势，小振膜换来高解析，缺点是一只单元往往无法做出全部的频段，通常是低频有欠缺，正如fxd80的声音。为此多单元动圈应运而生，fxt90、fxd200就是很有代表性的产品。而小萌ss01耳机就是odm厂商在fxt90的基础上经过改良的全新产品，属于后置双圈耳机，目前已经产出3批工程样品，lz手中的正是第二批扁线带耳麦版本。<br />\r\n&nbsp;<br />\r\n以下简单说一下试听的情况，，，，lz使用了手机、xduoo x1 、 neo jukebox 、ipt+ex3等不同推力的组合，套子换成了sony ex10a的白色哥套。&nbsp;&nbsp;显而易见fxz200比较吃电流，推力不够高频容易出毛刺、低频出不来， 小萌ss01则好伺候的多，手机听声音也有模有样，可以说小萌的易推使其的适应面更广<br />\r\n&nbsp;<br />\r\n。<br />\r\n由于单元和物理分析的设计类似，fxz200和小萌耳机的声音取向极为相似，总体来说是中正的声音，没有明显的音染，三频都有。和新版hd600比fxz200的低频量多一些，高频收了一些， 小萌耳机的低频更多，高频降得更多，但是小萌在定价400的情况下把声音做的这么完整不偏的是很难得的。<br />\r\n&nbsp;<br />\r\n说起声音素质，两个耳塞接近，差别在于fxz200的中频更饱满，低频下潜更深。两个耳机差别最大的在于声场，fxz200的声场纵向更强，小萌耳机的声场更扁一些； 200的人声远，小萌耳机的人声近，听演唱会fxz200就是在中后排的感觉，小萌则是近乎在前一二排，听混缩的流行fxz200有种录音室的感觉。fxz200对音源明显更为挑剔，如果在录音的时候刻意突出了某一频段，fxz200出来的声音明显比不上小萌耳机；如果是乐器、现场录音、比较平衡的录音，fxz200的表现都不错，<br />\r\n<br />\r\n<br />\r\n<br />\r\n总体来说，小萌耳机是一款平民耳塞，好伺候、容易出好声、不挑剔。Fxz200就像一个公主、需要好前端、好音源、甚至好的录音品质来伺候。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130921/1140232105-0.jpg\" style=\"height:auto; width:auto\" /><br />\r\n<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130921/1140232214-1.jpg\" style=\"height:auto; width:auto\" /><br />\r\n<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130921/1140234140-2.jpg\" style=\"height:auto; width:auto\" /><br />\r\n<br />\r\n<br />\r\n体验链接：<a href=\"http://item.taobao.com/item.htm?spm=a1z10.1.w5592980-3460359291.16.RBZ2HY&amp;id=22470035533\"><img alt=\"\" src=\"http://ear.ttpod.com/upload/130921/1-13092111393T34.jpg\" style=\"height:auto; width:auto\" /></a></p>\r\n', '算起来这两个耳塞到手一个多月了，听音时间50&mdash;100小时的'), ('8', '满身尽是杀手锏 派诺特Zik蓝牙耳机评测', '0', '0', '10', '5', '/upload/2013/11/1/2013110110330285148.jpg', '18', '2013-10-31 11:15:59', '<p>提到Parrot派诺特耳机，可能关注音频器材的绝大多数朋友都没听过，因为Zik是Parrot派诺特刚发布不久的第一款耳机。但对于飞行器玩家来说，若不知道Parrot派诺特就好比打篮球的不知道乔丹，Parrot的四轴飞行器AR.Drone在业界是赫赫有名的；而对于关注车载无线通信系统的车迷来说，Parrot的无线通信系统或许也并不陌生。本次评测的Parrot Zik无线蓝牙耳机可以说是Parrot的跨界之作，同时成就了耳机行业的许多首创，对于蓝牙无线耳机市场也是个不小的冲击。Parrot Zik究竟是一款什么样的耳机呢，一起跟随笔者来详细了解下吧。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P131IF-0.jpg\" style=\"height:auto; width:auto\" /><br />\r\n还是先介绍下Parrot派诺特品牌吧，它是手机无线设备领域的全球领导者，一直在走创新前沿，这从它各个产品线的特点就可以看出来；同时Parrot派诺特也为汽车市场开发最完备的免提系统，是车载娱乐信息系统的核心厂商，获得在全球都获得了广泛认可；Parrot派诺特的AR.Drone也是第一款由WiFi控制的具有扩增实景技术的四轴飞行器，目前已经更新到第二代产品，在淘宝搜索就知道多么热销；Parrot派诺特还与全球多位著名艺术家合作推高端多媒体产品，本次评测的Parrot派诺特Zik蓝牙耳机就是由法国顶级设计师Philippe Starck打造的无线音频耳机，不仅有独特造型，更有高科技感应技术。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1311007-1.jpg\" style=\"height:auto; width:auto\" /><br />\r\nParrot的三大产品线 而今又增加了一款耳机Zik<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1314524-2.jpg\" style=\"height:auto; width:auto\" /><br />\r\n派诺特Zik于7月4日在大陆正式发布 图为Parrot亚洲区CEO Elise致辞<br />\r\nParrot Zik耳机由Philippe Starck设计，独家采用了最先进的技术，包括高性能的主动式降噪、&ldquo;空间感&rdquo;音乐表现力、触控式面板以实现体感运动、头部检测传感器、颌骨导传感器、5个麦克风和一个强大的数字信号处理器。可以说Zik重新定义了音频耳机，将会为广大耳机用户带来前所未有的感官体验。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1313R8-3.JPG\" style=\"height:auto; width:auto\" /><br />\r\nParrot Zik<br />\r\n不同于一般的无线耳机，Parrot的独特之处还在可用于iOS或安卓的免费应用软件，正如派诺特CEO Henri Seydoux指出的：&ldquo;我们派诺特创造的首先是软件。派诺特的工程师们多年来致力于&ldquo;空间感&rdquo;声效，使Zik比其它耳机更能够创造自然的氛围。耳机可以说是我们能够想象的最困难去创新的产品，因为在某种程度上，它也最普通、最常见的。&rdquo;<br />\r\n<br />\r\nParrot Zik的免费app应用软件功能演示<br />\r\n为此，Parrot Zik耳机配备了功能强大的DSP (数字信号处理) 算法，能够创造出自然的音乐旋律。也就是&ldquo;派诺特演奏厅&rdquo;算法：你所听到的音乐不是来自于左耳或者右耳，而是&ldquo;放置&rdquo;你的面前，如同置身于一个演奏厅。你体验到的不再是重重的声音，而是音乐厅般悦耳的声学效果，是一种更自然的聆听体验。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1315952-4.jpg\" style=\"height:auto; width:auto\" /><br />\r\n基于&ldquo;派诺特演奏厅&rdquo;算法的空间感声效调节界面<br />\r\nParrot ZIK将于8月于北京连卡佛、Apple Store苹果零售店、Apple Store苹果在线商店及其它指定零售店公开发售，零售价为人民币2999元。<br />\r\n那么Parrot Zik耳机的效果究竟如何？别急，让我们先来感受它独特的外观设计吧。<br />\r\n<strong>好马配好鞍</strong>&nbsp;<strong>包装及配件篇：在精不在多</strong><br />\r\n作为由法国顶尖设计师Philippe Starck设计的耳机，Parrot Zik的包装设计也不含糊，包装盒采用厚实硬朗的类似牛皮纸材质，充满复古和原生态感觉。包装盒的整个正面都采用如同玻璃的透明塑料，我们可以直观的看到耳机的基本外观设计，头梁中间位置的Porrot和大大的红色Zik型号非常醒目。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1312c4-5.JPG\" style=\"height:auto; width:auto\" /><br />\r\n包装盒正面<br />\r\n在包装盒左下角，可以看到这是一款Wireless无线耳机，并适用于iPod、iPhone和iPad，当然也可以用于PC、Mac和其他播放设备，只是在iPod、iPhone和iPad上可以得到更好的应用体验，比如专门设计的免费应用程序，当然也有可针对安卓平台。而且还支持iPhone通话。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P13122R-6.JPG\" style=\"height:auto; width:auto\" /><br />\r\n果粉有福了<br />\r\n在包装盒右下角可以看到design by S+ARCK,也就是该耳机由法国顶尖设计师Philippe Starck设计。<br />\r\n在包装盒左侧有一则关于Zik是如何诞生的故事，当Philippe Starck和Henri Seydoux决定在一起工作时，他们希望改变人们享受音乐的方式，于是经过四年的设计和工程技术研究，诞生了可以调节&ldquo;空间感&ldquo;声效的世界最强大无线耳机。包装盒右侧则是通过多国语言对该耳机进行大概介绍。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1313N8-7.JPG\" style=\"height:auto; width:auto\" /><br />\r\n改变人们的聆听体验是Parrot Zit的使命<br />\r\n在包装背面，可以看到Parrot Zik的爆炸式拆解解析图和技术特点。下方有Zik的触控操作面板的手势功能演示。另外也能找到耳机的音频参数，包括110dB的灵敏度、32欧姆阻抗、10Hz-20k Hz的频响范围，可以看到这应该是一款低频相对出色的低阻耳机，适合移动播放设备来推动。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P131Jc-8.JPG\" style=\"height:auto; width:auto\" /><br />\r\n包装背面<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P131J20-9.JPG\" style=\"height:auto; width:auto\" /><br />\r\n包装盒底部<br />\r\n类似高档数码产品的包装一样，Parrot Zik的耳机和配件也是分两层，取出耳机托盘可以看到底部的配件盒，里面包括1个USB充电线、1个800毫安时锂电池、1个3.5mm可插拔的耳机线、1本厚厚的说明书和1个绒布耳机收纳袋。对于一款无线耳机来说，这样的配件算是基本配置，不同的是锂电池是可拆解的，这就意味着以后用户有可能购买到另一块备用电池来增加续航时间，从官方提供的资料来看，该电池可以提供24小时的续航，对于耳机来说这样的续航算是不错了。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P13144H-10.JPG\" style=\"height:auto; width:auto\" /><br />\r\n简约的包装<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1316007-11.JPG\" style=\"height:auto; width:auto\" /><br />\r\n配件<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1312592-12.JPG\" style=\"height:auto; width:auto\" /><br />\r\n耳机收纳袋<br />\r\nParrot Zik的耳机线采用可插拔设计，可以减少耳机线被拉扯断的可能，也便于收纳。当然，耳机线和充电线本身都采用蛇皮编织材料包裹，具有较好的抗拉扯防护效果。音频线一段为直型插头，另一端为L型插头，用于接音频输出设备。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P131E27-13.JPG\" style=\"height:auto; width:auto\" /><br />\r\n3.5mm耳机线<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1315146-14.JPG\" style=\"height:auto; width:auto\" /><br />\r\nUSB充电线<br />\r\n下面，我们来看看Parrot Zik的外观设计细节吧。<br />\r\n<strong>人体工程学自然曲线</strong>&nbsp;<strong>满身尽是</strong><strong>&ldquo;</strong><strong>杀手锏</strong><strong>&rdquo;</strong><br />\r\n看到Parrot Zik时，你一定会对它的曲线着迷，这些也只是外表，因为Philippe Starck在设计Zik的曲线时，采用了派诺特工程师研发的&ldquo;生物灵感&rdquo;技术，让它成为一款&ldquo;融合&rdquo;产品，是布满传感器的敏感物体。Zik可反映出你的情绪、与你的身体融为一体，如同身体的技术延伸部分在聆听音乐。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1312125-15.jpg\" style=\"height:auto; width:auto\" /><br />\r\nParrot Zik<br />\r\n用Philippe Starck的话来说：&ldquo;尽管Zik设计简单、含蓄，但Zik绝对是今天最成功的直观人体工学产品。该款耳机实现了完美的平衡，几乎完全与人体融合，就像身体的一个简单延伸，并满足身体的所有需求。声音和音乐是个人世界里所追寻的自我价值；声音越接近你，你就会越喜欢这个音乐，感觉也越舒服。Zik为你创造出个人的宇宙空间。&rdquo;<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1312912-16.JPG\" style=\"height:auto; width:auto\" /><br />\r\nParrot Zik的金属支架<br />\r\n总之，它看起来是一款很具有艺术设计感的耳机。尤其是形同骨骼关节的支架和耳机外壳部分。下面，我们来看看各部分的细节吧。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1311305-17.JPG\" style=\"height:auto; width:auto\" /><br />\r\n独特的不锈钢金属支架和耳机外壳<br />\r\nParrot Zik的耳机外壳采用椭圆设计，耳机较厚实，如同椭圆形的蛋糕一般。耳机外壳不同于大家常见的耳机，Parrot Zik的设计赋予既圆润又富有线条感，外壳的后半部分有点像人的耳廓和耳垂，下端采用金属包裹，并采用凹面设计，最深处采用镂空，犹如人耳造型，弧形的凹槽延伸至耳机上方约4/5处，犹如耳廓。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1315G8-18.JPG\" style=\"height:auto; width:auto\" /><br />\r\n不对称设计之美<br />\r\n如此另类创意的外壳设计，并非哗众取宠，它其实是一块电容式触控板，如同智能手机一样，置于右侧耳机的整个外表面。只需一个手指垂直滑动即可控制音量，水平滑动即可跳到前或后一个音乐曲目。如果有电话呼入，你也无需寻找你的智能手机，只需轻轻单击右侧耳机即可接听电话，或者长按表面2秒钟拒绝接听来电。神器吧！下面，我们通过笔者拍摄的听音乐时的各种触摸操作视频来感受下Zik的触摸操控。<br />\r\n<br />\r\nParrot Zik的触控操作演示视频<br />\r\n除了触控板外，Parrot Zik还具有头部检测功能。在耳机上内置了头部监测传感器，只需要将Zik从你的头上拿下来放在颈部即可暂停音乐，讲Zik重新戴到头上，音乐再次响起。如此简单的动作即可实现音乐的暂停，想一想，当你正听歌时，有人找你说话，你只需要将耳机放到脖子上即可停止播放，而不需要在播放器上按暂停，同时，在刚取下耳机时，你正听的内容也不至于被他人听到。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1313R8-3.JPG\" style=\"height:auto; width:auto\" /><br />\r\nParrot Zik<br />\r\n除了头部监测传感器，Parrot Zik还具有颌骨导传感器，它置于左侧听筒海绵垫内，用于探测和分析颌骨的震动，并与周围所有的环境噪音进行比对。通过匹配用户在讲话时的动作，Parrot Zik能够将用户的讲话从周围的噪音中提取和分离出来。也就是说，该传感器主要解决了用户在通话时的降噪问题，可以让对方更清晰的听到你的说话声，而不被环境噪音所干扰。在实际通话测试中，让同事站在吵杂的马路边与笔者通话，确实能听到十分清晰的语音，而用手机直接通话时，噪音则较为明显。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1315K2-20.JPG\" style=\"height:auto; width:auto\" /><br />\r\nParrot Zik还具有颌骨导传感器<br />\r\n我们已经知道颌骨导传感器其实是为了辅助降噪，实际Parrot Zik还专门设计了主动式降噪，据称最高可消除25分贝的噪音。那么它是如何工作呢？在耳机的外部有2个麦克风，可以捕捉周围的噪音，另外2个麦克风在耳机上，一边一个，分析可能会破坏收听的其它噪声（低频）。被分析的外部噪音于是被相反的声波消除（降噪），创造一个安静的环境。有了主动降噪功能，不管在飞机上、火车上或是街道上，你都可以免受被这些环境噪音干扰，享受清静舒适的聆听体验。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P131A40-21.JPG\" style=\"height:auto; width:auto\" /><br />\r\n这么多麦克风 不仅是为了采集声音 也为了降噪<br />\r\nParrot Zik可以说浑身是技术，说到麦克风，除了刚才提到的用于降噪的颌骨导传感器和主动式降噪，Parrot Zik还拥有派若特专利的双麦克风噪音抑制系统。在实际使用中，两个麦克风同时记录声音，并确定其方向；然后Parrot Zik数字信号处理器确定噪音来源并消除噪音。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1312L4-22.jpg\" style=\"height:auto; width:auto\" /><br />\r\n主动降噪原理示意<br />\r\n下面，我们来看看Parrot Zik的一些机身细节。<br />\r\n<strong>更多外观细节：耳垫、电池、支架、头梁</strong><br />\r\n在上一页介绍了Parrot Zik的诸多技术特点，下面我们来看看它的其他设计细节吧。在前面介绍颌骨传感器时，相信熟悉耳机的朋友已经能从图片上感受到Parrot Zik的记忆棉耳垫是多么的柔软了，从它表面的皮质纹理就可以看出来十分柔软的，摸上去就像是人的皮肤一样光滑稚嫩；内衬的海棉具有很大的压缩特性和慢回弹能力，也就是常说的记忆棉，可以保持惰性。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P13120Q-23.JPG\" style=\"height:auto; width:auto\" /><br />\r\n除了传感器，不难看出Zik的记忆棉耳垫是多么柔软<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1312558-24.JPG\" style=\"height:auto; width:auto\" /><br />\r\n侧面<br />\r\n关于记忆棉耳垫其实许多耳机都有采用，但能用的像Parrot Zik这么到位的并不多。从耳垫的内径来看其实并不大，但是Parrot Zik的耳垫内侧采用的是倾斜的镂空设计，就好比是一口水井，井口细，越往下越内壁直径越大、越宽敞。因此，当你把Parrot Zik戴在头上时，耳廓会很意外的钻进耳罩内，耳廓的背面也有一部分耳垫包裹，这样就提供了效果非常出色的舒适度和隔音效果，当你带上Parrot Zik的时候，即使没播放音乐，也会感到世界清静了许多。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1312542-25.JPG\" style=\"height:auto; width:auto\" /><br />\r\n水井口式的耳垫设计<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P131G23-26.JPG\" style=\"height:auto; width:auto\" /><br />\r\n左侧耳机单元下方的2个麦克风<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P131M48-27.JPG\" style=\"height:auto; width:auto\" /><br />\r\n右侧除了1个麦克风 还有电源开关、耳机接口和充电接口<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1315224-28.JPG\" style=\"height:auto; width:auto\" /><br />\r\n电池仓<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P13142B-29.JPG\" style=\"height:auto; width:auto\" /><br />\r\n800mAh电池<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1311S6-30.JPG\" style=\"height:auto; width:auto\" /><br />\r\n转轴设计<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1311396-31.JPG\" style=\"height:auto; width:auto\" /><br />\r\n刻度<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P131B18-32.JPG\" style=\"height:auto; width:auto\" /><br />\r\n设计师STARCK的名字也刻在金属圈上<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1314S7-33.JPG\" style=\"height:auto; width:auto\" /><br />\r\n头梁下端的左右标志<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1311522-34.JPG\" style=\"height:auto; width:auto\" /><br />\r\n头梁顶部的Parrot logo<br />\r\n<strong>App Store</strong><strong>应用软件功能强大</strong>&nbsp;<strong>效果明显</strong><br />\r\n前面介绍到，Parrot Zik的优势在于软件，那就是可用于IOS设备的app免费应用软件，当然也有安卓系统版。这里，我们以app软件为例来说明。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1314627-35.jpg\" style=\"height:auto; width:auto\" /><br />\r\n软件主界面<br />\r\n下面通过视频来更直观的了解下Parrot Zik的app应用软件吧。<br />\r\n<br />\r\nParrot Zik的软件介绍<br />\r\n关于该软件的调节效果，首先说下主动降噪，当在软件中将主动降噪开启后，确实能感觉到世界一片清静的感觉，在吵杂的路边、汽车内、地铁上等都几乎智能听到车本身微弱的振动声，这种降噪效果是普通头戴式耳机不能比的，即使是入耳式，也很少有这么好的效果。或许你会问，如果没有和应用软件结合呢，降噪效果如何。这种情况下就是被动降噪了，即使是这样，凭借出色的耳机垫设计，Zik哪怕在你不听音乐时，也可以把它当一个噪音屏蔽设备。笔者距离电噪音本身比较明显的风扇1米元，此时带上Zik后，就几乎听不到风的噪音了。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1313030-36.jpg\" style=\"height:auto; width:auto\" /><br />\r\n降噪功能<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1311528-37.JPG\" style=\"height:auto; width:auto\" /><br />\r\n在出租车中试听 旁边呼啸而过的大货车的发动机声就小了很多 和普通耳机在室内听差不多<br />\r\n接下来说说Parrot Zik软件的&ldquo;空间感&rdquo;声效调节，这功能是基于&ldquo;派诺特演奏厅&rdquo;算法，你所听到的音乐不是来自于左耳或者右耳，而是&ldquo;放置&rdquo;你的面前，如同置身于一个演奏厅。你体验到的不再是重重的声音，而是音乐厅般悦耳的声学效果，是一种更自然的聆听体验。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1315952-4.jpg\" style=\"height:auto; width:auto\" /><br />\r\n&quot;派诺特演奏厅&quot;算法<br />\r\n对于&ldquo;空间感&rdquo;调节，当你听不同的音乐时，采用不同的设置会带来更佳出色的聆听效果。如果是人声，适宜选择living room效果，具有现场感和真实感，同时两个喇叭的夹角不易过大或过小，太大会造成人声定位不够精准，声音不够集中，角度太窄的话，人声又显得过远，且没有包围感，通过多次对比，发现听人声时，夹角设置在90&deg;左右是比较合适的。如果听交响乐，则角度适宜开的更大一些，营造宽阔的音场，同时，以选择Juzz Club或更远的一格。总之，多尝试几种组合，会收到不一样的惊喜。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1312235-39.jpg\" style=\"height:auto; width:auto\" /><br />\r\nEQ调节<br />\r\nEQ的调节下过也是非常明显的，软件本身提供了几种模式，我们还可以在每个模式下，通过拖动每一频率段的滑块来补偿，设定出最适合你的口味和音乐风格的效果。<br />\r\nParrot Zik的电量指示功能非常实用，在出门前，你可以通过手机查看Zik的电量是否充足，是否要事先充满电以满足一天的外出试听需求。假如没有该功能，虽然出门还可以打开电源，当往往当你刚上车就发现电量不多了，充电已经来不及，只能通过耳机线来听歌了，因为蓝牙配对需要开启电源。此外，在关闭电源下，耳机的一切运放和算法都消失，声音也会有所差别的。<br />\r\n<strong>音质表现及通话效果</strong><br />\r\nParrot Zik是周一刚刚拿到的全新耳机，由于时间有限，截止目前大概累计开声了30小时左右，显然这么短的时间不可能将其煲透，这种情况下Zik的真实素质不能够完全体现，不过也好，不管是暂时的失望还是惊喜，它的声音总会越来越好的。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1314563-40.jpg\" style=\"height:auto; width:auto\" /><br />\r\n试听设备<br />\r\n对于试听平台，笔者使用的是乐之邦的monitor 02 US耳放，对于阻抗32欧姆的Parrot Zik来说，推动它可以说是搓搓有余。毕竟这款主要针对移动环境下使用的耳机来用，可能大部分用户的播放设备都是iPhone等手机、iPod或其他MP3吧，当然不排除一些音乐发烧友会使用索尼D50录音笔之类的发烧级移动播放设备。所以，对于素质较高的耳机来说，更换更好的前段设备也更能发挥耳机的真实素质，受制于器材有限，这里我们就以这个耳放作为主要设备了。当然，笔者也接听过iPhone等便携播放器，推力绝对不是问题，别忘了Parrot Zik耳机本身内置耳放，所以当笔者在手机上把音量调节到最低时，依然可以在Zik的触控板上将音量提高到相当高的程度。所以，Parrot Zik对于播放前段设备要求并不高。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P13110S-41.jpg\" style=\"height:auto; width:auto\" /><br />\r\n惠威试音碟<br />\r\n关于音源，笔者主要使用了一些APE格式的试音碟和专辑，包括《惠威试音碟》、《终极参考》、《原音探究》、《世纪探索2》，以及DJ舞曲、HipPop等低频和节奏感较强的歌曲，当然也包括一些流行歌曲、人声和乐器。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1313064-42.jpg\" style=\"height:auto; width:auto\" /><br />\r\n《VOYAGE2》<br />\r\n因为Parrot Zik具有内置耳放，在电源开启和关闭情况下的声音肯定是不同的，那就首先来说下这个差别吧。在关闭电源时，Parrot Zik的声音稍微有些干涩，不够润，像是毫无雕饰的石头，中高频相对于低频稍好一些。当开启电源后，Zik将你带入了另一种氛围，声音变得润了些，低频的弹性有所增强，但相应的，声音不够那么直接，稍有发闷，不够十分通透，这种转变对于中高频段来说，并不明显，也就是说开启电源后，中高频的表现也是好于低频。另外，在开电源后，人声的距离也拉远了，而此前离人耳较近。<br />\r\n由于在移动环境下，使用该耳机听音乐时基本都是在电源开启时，通过蓝牙连接来听的。下面我们的评价主要针对开启电源时的音质表现来评价。<br />\r\n先说低频吧，Parrot Zik的低频下潜并不是很深，回弹速度一般，不过量感还是不错的，整体属于相对慢的风格，加上耳机整体音色偏暖，在听低频频段的歌曲时，稍微紧迫的速度感和力度，容易让人有慵懒之感，不过这样好让人更轻松的去欣赏音乐，如果你比较喜欢那种暖暖、油润的、有弹性但速度稍慢的低频风格，Parrot Zit倒是不错的。<br />\r\n中频方面，开启电源后，人声部分似乎有了一些润色，少了之前的那种青涩，人声更饱满厚实，不过人声变得相对远了一些，解析度似乎有所降低。比如听女声清唱时，在关闭电源时，人声较近，虽然稍薄了一点点，不过换气声、齿音都可以解析的十分清楚；在开启电源后，人声似乎丰满了一些，油润了一些，不过也因此少了一些细节，换气声和齿音少了很多。<br />\r\n高频方面，Parrot Zik的高频延伸还是不错的，在关闭电源时，对于多种乐器的解析和还原都比较到位，开启电源后，细节少有损失，声音的包围感降低，整体向前便宜，但并非很靠前的那种。<br />\r\n整体来看，Parrot Zik在自带耳放开启的情况下，声音经过了一些润色，可能比较耐听，不过或多或少会有细节损失，解析度降低，同时，声音的相对向前移动，这基本是各个频段都有的变化。<br />\r\n<strong>　通话功能及效果</strong>：Parrot Zik的通话音质是很不错的，人声还原比较到位。当有来电时，只需要手指点击一下右侧的触摸板即可接通，此时你会先听到类似主叫的等待声，大概2秒后，接通电话，听到对方的第一声。<br />\r\n<strong>通话距离：</strong>笔者将接通来电的手机放置在桌子上，头戴着Zik步行大概10米远后，通话出现断断续续卡顿现象，这中间有一些办公桌的隔板阻挡，在室外情况稍微好一些。当你处于信号较弱的地方时，比如地铁站下层，此时有来电信号不稳定。如果是听歌，当地铁进站时会有暂停现象，不过当列车稳定后，又会自动播放。<br />\r\n<strong>通话中的音量调节：</strong>通话过程中，用手指上下调节音量时，不改变对方听到的自己的声音大小，而是改变了对方声音的大小，在手机上你会看到音量滑块会移动。<br />\r\n<strong>拒接来电和挂断电话：</strong>当有来电时，手指按下触控板2秒以上即可拒接，当要挂断电话时，点击一下触控板即可挂断。　<br />\r\n<strong>评测总结：</strong>&nbsp;<strong>功能和体验最好的无线耳机</strong><br />\r\n随着耳机朝着多元化和创新方向发展，消费者对于耳机的认同已经不局限于品牌、音质和价格，创新的外观设计、高科技技术和全新的应用体验已经越来越多的影响用户选择。Parrot Zik就是拥有这样创新设计的产品，不仅拥有绝对非同寻常的艺术造型，更包括了主动式降噪、&ldquo;空间感&rdquo;音乐表现力、触控式面板以实现体感运动、头部检测传感器、颌骨导传感器、5个麦克风和一个强大的数字信号处理器，这么多技术特点可以给用户带来非同寻常的应用体验，成为庞大耳机市场中独一无二的产品。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1313R8-3.JPG\" style=\"height:auto; width:auto\" /><br />\r\nParrot Zik<br />\r\n从触摸操控及佩戴体验来讲：Parrot Zik的触摸操作灵敏度的失误率还是很低的，只要切换曲目时，手指保持水平滑动尽量长的距离即可；相应时间方面，音量调节的相应是最快的，其他操作有1秒左右的延迟，不过都是在可接受范围；当摘下耳机时自动暂停播放，不至于你正在听的内容干扰谈话或者泄露；另外，Parrot Zik的隔音效果确实非常明显，而且配搭也很舒适，虽然耳机的重量并不算轻，但长久佩戴也不疲劳。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1311305-17.JPG\" style=\"height:auto; width:auto\" /><br />\r\nParrot Zik<br />\r\n从应用软件来讲，Parrot Zik的配到软件功能确实强大，用户可以在iPhone、iPad等播放器上调节EQ和&ldquo;空间感&rdquo;声效 ，效果显著，如果结合不同类型的曲目来针对性调节，能带来不一样听感体验。正如派诺特CEO Henri Seydoux所说的：&ldquo;我们派诺特创造的首先是软件。派诺特的工程师们多年来致力于&ldquo;空间感&rdquo;声效，使Zik比其它耳机更能够创造自然的氛围。耳机可以说是我们能够想象的最困难去创新的产品，因为在某种程度上，它也最普通、最常见的。&rdquo;此外，软件中的电量显示功能让用户随时对续航情况有清楚得了解，有目的为耳机进行充电准备。<br />\r\n<img src=\"http://ear.ttpod.com/upload/allimg/130912/1P1314627-35.jpg\" style=\"height:auto; width:auto\" /><br />\r\n强大的应用软件<br />\r\n总得来说，Parrot Zik的诞生对于无线音频耳机甚至有线耳机都是不小的冲击，尽管只是一个新生耳机品牌，但Zik集诸多创新技术与一身，加上顶级设计师参与设计带来的独特的造型和操控体验都是其他耳机所不具备的，即使和耳机大厂AKG的K840无线耳机相比，Parrot Zik也在多方面完胜无疑。在2999元价位，Parrot Zik毫无疑问是最佳选择。</p>\r\n', '提到Parrot派诺特耳机，可能关注音频器材的绝大多数朋友都没听过，因为Zik是Parrot派诺特刚发布不久的第一');
COMMIT;

-- ----------------------------
--  Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `orders` int(11) NOT NULL COMMENT '排序',
  `createTime` datetime NOT NULL,
  `type` int(255) NOT NULL DEFAULT '1' COMMENT '1为耳机，2为文章',
  `alias` varchar(20) NOT NULL COMMENT '别名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `category`
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES ('4', '热卖耳机', '1', '2013-10-29 16:28:31', '1', 'hot'), ('3', '极速秒杀', '3', '2013-10-29 16:28:21', '1', 'seckill'), ('5', '发烧广场', '4', '2013-10-29 16:28:57', '2', 'plaza'), ('12', '耳机', '4', '2013-11-01 14:53:55', '1', '耳机');
COMMIT;

-- ----------------------------
--  Table structure for `earphone`
-- ----------------------------
DROP TABLE IF EXISTS `earphone`;
CREATE TABLE `earphone` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `originalPrice` float(10,1) NOT NULL COMMENT '原价',
  `salePrice` float(10,1) NOT NULL COMMENT '特价',
  `viewCount` int(11) DEFAULT '0' COMMENT '浏览量',
  `buyCount` int(11) DEFAULT '0' COMMENT '购买数',
  `detail` text COMMENT '详细描述',
  `jumpUrl` varchar(255) DEFAULT NULL COMMENT '外链',
  `categoryId` int(11) NOT NULL COMMENT '所属类型',
  `orders` int(11) DEFAULT NULL COMMENT '排序',
  `image` varchar(200) DEFAULT NULL COMMENT '图片',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `earphone`
-- ----------------------------
BEGIN;
INSERT INTO `earphone` VALUES ('6', 'KZ-R1专业版入耳式耳机--HIFI发烧耳塞质感重低音优异的全频音质', '200.0', '41.3', '0', '0', '                    推荐理由：R1专业版--作为KZ品牌重头产品，以意想不到的低价撼动整个耳机专业领域，让更多的人可以体验纯正德系声学风格的声音。', 'http://item.taobao.com/item.htm?spm=a1z10.1.w4004-3250890010.4.tIkqi5&id=19675325405', '4', '2', '/upload/2013/11/1/2013110111503503496.jpeg', '2013-10-31 11:20:05'), ('5', '双动圈耳机入耳式耳机耳塞小萌耳机SS01', '999.0', '389.0', '22', '33', '      值得购买', 'http://item.taobao.com/item.htm?spm=a1z10.1.w5592980-3460359291.16.RBZ2HY&id=22470035533', '3', '1', '/upload/2013/11/1/2013110110330285148.jpg', '2013-10-31 11:18:51'), ('7', '正品包邮 头戴式电脑耳机 带麦克风 笔记本游戏耳麦 手机耳机潮流', '305.0', '200.0', '1', '1', '    推荐理由：低音澎湃强劲，堪称R&B歌曲神器！航空级设计，高保真音质，尊享顶级音乐', 'http://item.taobao.com/item.htm?id=25906392020&ali_trackid=2:mm_41989256_0_0:1383189669_3k6_365960702', '3', '3', 'http://ear.ttpod.com/upload/130802/1-130P2230311192.jpg', '2013-10-31 11:21:26'), ('9', '不好看的耳机', '12.0', '13.0', '0', '0', '        大大', 'http://item.taobao.com/item.htm?id=25906392020&ali_trackid=2:mm_41989256_0_0:1383189669_3k6_365960702', '4', '3', '/upload/2013/11/1/2013110110330285148.jpg', '2013-11-01 10:49:58');
COMMIT;

-- ----------------------------
--  Table structure for `earphone_copy`
-- ----------------------------
DROP TABLE IF EXISTS `earphone_copy`;
CREATE TABLE `earphone_copy` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `originalPrice` float(10,1) NOT NULL COMMENT '原价',
  `salePrice` float(10,1) NOT NULL COMMENT '特价',
  `viewCount` int(11) DEFAULT '0' COMMENT '浏览量',
  `buyCount` int(11) DEFAULT '0' COMMENT '购买数',
  `detail` text COMMENT '详细描述',
  `jumpUrl` varchar(255) DEFAULT NULL COMMENT '外链',
  `categoryId` int(11) NOT NULL COMMENT '所属类型',
  `orders` int(11) DEFAULT NULL COMMENT '排序',
  `image` varchar(200) DEFAULT NULL COMMENT '图片',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `earphone_copy`
-- ----------------------------
BEGIN;
INSERT INTO `earphone_copy` VALUES ('6', 'KZ-R1专业版入耳式耳机--HIFI发烧耳塞质感重低音优异的全频音质', '200.0', '41.3', '0', '0', '                    推荐理由：R1专业版--作为KZ品牌重头产品，以意想不到的低价撼动整个耳机专业领域，让更多的人可以体验纯正德系声学风格的声音。', 'http://item.taobao.com/item.htm?spm=a1z10.1.w4004-3250890010.4.tIkqi5&id=19675325405', '4', '2', '/upload/2013/11/1/2013110111503503496.jpeg', '2013-10-31 11:20:05'), ('5', '双动圈耳机入耳式耳机耳塞小萌耳机SS01', '999.0', '389.0', '22', '33', '      值得购买', 'http://item.taobao.com/item.htm?spm=a1z10.1.w5592980-3460359291.16.RBZ2HY&id=22470035533', '3', '1', '/upload/2013/11/1/2013110110330285148.jpg', '2013-10-31 11:18:51'), ('7', '正品包邮 头戴式电脑耳机 带麦克风 笔记本游戏耳麦 手机耳机潮流', '305.0', '200.0', '1', '1', '    推荐理由：低音澎湃强劲，堪称R&B歌曲神器！航空级设计，高保真音质，尊享顶级音乐', 'http://item.taobao.com/item.htm?id=25906392020&ali_trackid=2:mm_41989256_0_0:1383189669_3k6_365960702', '3', '3', 'http://ear.ttpod.com/upload/130802/1-130P2230311192.jpg', '2013-10-31 11:21:26'), ('9', '不好看的耳机', '12.0', '13.0', '0', '0', '        大大', 'http://item.taobao.com/item.htm?id=25906392020&ali_trackid=2:mm_41989256_0_0:1383189669_3k6_365960702', '4', '3', '/upload/2013/11/1/2013110110330285148.jpg', '2013-11-01 10:49:58');
COMMIT;

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单自动增长id',
  `menuName` varchar(50) CHARACTER SET ucs2 NOT NULL COMMENT '显示名称',
  `parentId` int(11) DEFAULT NULL COMMENT '父id',
  `url` varchar(100) CHARACTER SET ucs2 DEFAULT NULL COMMENT '链接url',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `orders` varchar(11) CHARACTER SET ucs2 NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `menu`
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('4', '用户管理', '0', '', '2010-07-23 00:00:00', '1'), ('5', '人员管理', '4', 'admin/user', '2010-07-23 00:00:00', '1.1'), ('6', '角色管理', '4', 'admin/role', '2010-07-23 00:00:00', '1.2'), ('7', '模块管理', '4', 'admin/module', '2010-07-23 00:00:00', '1.3'), ('8', '权限管理', '4', 'admin/action', '2010-07-23 00:00:00', '1.4'), ('9', '菜单管理', '4', 'admin/menu', '2010-07-23 00:00:00', '1.5'), ('20', '耳机管理', '0', '', '2013-10-29 16:21:23', '2'), ('21', '耳机类型管理', '20', 'admin/category', '2013-10-29 16:21:47', '2.1'), ('22', '耳机管理', '20', 'admin/earphone', '2013-10-29 16:22:16', '2.2'), ('23', '文章管理', '20', 'admin/article', '2013-10-29 16:22:41', '2.3'), ('24', '评论管理', '20', 'admin/reply', '2013-10-29 16:23:18', '2.4'), ('25', '系统管理', '0', '', '2013-11-04 21:39:14', '3'), ('26', '系统配置', '25', 'admin/global/toEdit', '2013-11-04 21:39:28', '3.1');
COMMIT;

-- ----------------------------
--  Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(765) NOT NULL,
  `moduleInfo` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `module`
-- ----------------------------
BEGIN;
INSERT INTO `module` VALUES ('11', '角色管理', '管理角色的基本信息', '2010-07-20 17:03:27'), ('12', '模块管理', '管理模块的基本信息', '2010-07-20 17:03:45'), ('13', '权限管理', '管理权限的基本信息', '2010-07-20 17:04:07'), ('14', '人员管理', '人员的基本信息管理', '2010-07-21 15:42:41'), ('17', '菜单管理', '菜单的基本信息管理', '2010-07-27 17:13:08'), ('18', '耳机类型管理', '耳机类型的基本管理\r\n', '2013-10-31 13:51:18'), ('19', '耳机管理', '耳机的基本管理', '2013-10-31 13:51:40'), ('20', '文章管理', '文章的基本管理', '2013-10-31 13:51:58'), ('21', '评论管理', '评论的基本管理', '2013-10-31 13:52:09'), ('22', '系统管理', '系统管理', '2013-11-04 21:40:34');
COMMIT;

-- ----------------------------
--  Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `replyContent` text NOT NULL COMMENT '回复内容',
  `replyUser` varchar(50) NOT NULL COMMENT '回复人',
  `createTime` datetime NOT NULL,
  `articleId` int(11) NOT NULL COMMENT '评论id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `reply`
-- ----------------------------
BEGIN;
INSERT INTO `reply` VALUES ('9', '很不错哦', '游客', '2013-10-31 11:33:05', '4'), ('10', '好人一生平安', '游客', '2013-10-31 17:25:44', '8'), ('11', 'gdgdg', '游客', '2013-10-31 17:27:37', '8'), ('12', 'tiutu', '游客', '2013-10-31 17:29:26', '8'), ('13', 'vxv', '游客', '2013-10-31 17:50:08', '8'), ('15', 'tete', '游客', '2013-10-31 17:52:15', '8'), ('16', 'tetet', '游客', '2013-10-31 17:52:17', '8'), ('17', 'tetet', '游客', '2013-10-31 17:52:19', '8'), ('22', 'gdgg', '游客', '2013-10-31 17:52:49', '8'), ('23', 'gdgdgdg', '游客', '2013-10-31 17:53:00', '8'), ('24', 'gdgdgdg', '游客', '2013-10-31 17:53:04', '8'), ('25', 'gdg', '游客', '2013-10-31 17:55:44', '8'), ('26', 'gdg', '游客', '2013-10-31 17:55:47', '8'), ('27', 'hfhfhf', '游客', '2013-10-31 17:56:02', '8'), ('28', 'khk', '游客', '2013-10-31 17:56:05', '8'), ('29', 'khk', '游客', '2013-10-31 17:56:06', '8'), ('30', 'hkdfgd', '游客', '2013-10-31 17:56:09', '8'), ('31', '士', '游客', '2013-10-31 19:25:09', '8'), ('32', '金刚经', '游客', '2013-10-31 19:25:12', '8'), ('33', '士', '游客', '2013-10-31 19:26:47', '6'), ('34', '哦哦', '游客', '2013-10-31 19:26:55', '6'), ('36', 'gy7hjjjjj', '游客', '2013-11-01 13:43:06', '6');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleName` varchar(20) NOT NULL COMMENT '角色名称',
  `roleInfo` text COMMENT '角色介绍',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('20', 'admin', '系统管理员', '2010-05-18 13:44:23'), ('43', 'view', '只有查看的权限', '2013-10-31 15:11:59'), ('42', 'earphoneManage', '耳机管理者', '2013-10-31 14:03:40');
COMMIT;

-- ----------------------------
--  Table structure for `roleaction`
-- ----------------------------
DROP TABLE IF EXISTS `roleaction`;
CREATE TABLE `roleaction` (
  `roleId` int(11) NOT NULL COMMENT '角色Id',
  `actionId` varchar(50) NOT NULL COMMENT '关联action中的action',
  KEY `FK_bbs_roleaction` (`roleId`),
  KEY `FK_bbs_roleaction1` (`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `roleaction`
-- ----------------------------
BEGIN;
INSERT INTO `roleaction` VALUES ('42', '98'), ('42', '95'), ('42', '100'), ('42', '94'), ('42', '99'), ('42', '84'), ('42', '96'), ('42', '93'), ('42', '97'), ('43', '99'), ('43', '95'), ('43', '93'), ('43', '84'), ('43', '98'), ('20', '95'), ('20', '89'), ('20', '85'), ('20', '82'), ('20', '90'), ('20', '86'), ('20', '98'), ('20', '83'), ('20', '96'), ('20', '88'), ('20', '99'), ('20', '97'), ('20', '100'), ('20', '91'), ('20', '92'), ('20', '84'), ('20', '93'), ('20', '87'), ('20', '94'), ('20', '101');
COMMIT;

-- ----------------------------
--  Table structure for `rolemenu`
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
  `roleId` int(11) DEFAULT NULL,
  `menuId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `rolemenu`
-- ----------------------------
BEGIN;
INSERT INTO `rolemenu` VALUES ('20', '9'), ('20', '26'), ('20', '20'), ('20', '8'), ('20', '21'), ('20', '5'), ('43', '24'), ('20', '23'), ('20', '4'), ('20', '6'), ('42', '24'), ('42', '23'), ('42', '4'), ('20', '24'), ('20', '7'), ('42', '22'), ('42', '20'), ('42', '5'), ('20', '25'), ('43', '21'), ('43', '20'), ('43', '23'), ('43', '22'), ('20', '22'), ('42', '21');
COMMIT;

-- ----------------------------
--  Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '自动增长Id',
  `userName` varchar(20) NOT NULL COMMENT '用户名',
  `userPassword` varchar(20) NOT NULL COMMENT '用户密码',
  `email` varchar(20) DEFAULT NULL COMMENT 'email',
  `createTime` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  KEY `userinfo_userName_IDX` (`userName`)
) ENGINE=MyISAM AUTO_INCREMENT=429 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `userinfo`
-- ----------------------------
BEGIN;
INSERT INTO `userinfo` VALUES ('426', 'admin', 'admin', 'jiege82000@163.com', '2013-10-31 14:02:11'), ('427', 'ttpod', 'ttpod*()98', 'hr@ttpod.com', '2013-10-31 14:06:33'), ('428', 'view', 'view', 'hr@ttpod.com', '2013-10-31 15:11:39');
COMMIT;

-- ----------------------------
--  Table structure for `userrole`
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `userId` int(11) NOT NULL COMMENT '用户id',
  `roleId` int(11) NOT NULL COMMENT '角色Id',
  KEY `FK_bbs_userrole` (`roleId`),
  KEY `FK_bbs_userrole1` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `userrole`
-- ----------------------------
BEGIN;
INSERT INTO `userrole` VALUES ('420', '39'), ('391', '20'), ('389', '20'), ('426', '20'), ('1', '20'), ('37', '39'), ('37', '20'), ('35', '20'), ('35', '39'), ('201', '39'), ('349', '39'), ('1', '39'), ('427', '42'), ('428', '43');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
