/*
 Navicat Premium Data Transfer

 Source Server         : cone
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : quiz

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 10/04/2020 20:35:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for claacc
-- ----------------------------
DROP TABLE IF EXISTS `claacc`;
CREATE TABLE `claacc`  (
  `clasacc_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '这个表用于保存及格率，我并未保存，所以为空',
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cla_id` int(20) NULL DEFAULT NULL,
  `tosc_per` int(20) NULL DEFAULT NULL,
  `acsc_per` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`clasacc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for classe
-- ----------------------------
DROP TABLE IF EXISTS `classe`;
CREATE TABLE `classe`  (
  `classe_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '班级编号',
  `classe_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级名',
  `teacher_id` int(20) NULL DEFAULT NULL COMMENT '对应教师',
  PRIMARY KEY (`classe_id`) USING BTREE,
  INDEX `classe_id`(`classe_id`, `classe_name`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classe
-- ----------------------------
INSERT INTO `classe` VALUES (1, '计算机1班', 1);
INSERT INTO `classe` VALUES (2, '计算机2班', 2);
INSERT INTO `classe` VALUES (3, '电子商务1班', 3);
INSERT INTO `classe` VALUES (4, '数字媒体1班', 10);
INSERT INTO `classe` VALUES (13, '电子信息1班', 9);
INSERT INTO `classe` VALUES (15, '电子商务2班', 6);

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `exam_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '考试安排编号',
  `paper_id` int(11) NULL DEFAULT NULL COMMENT '对应试卷',
  `exam_begin` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `exam_end` datetime(0) NULL DEFAULT NULL COMMENT ' 结束时间',
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (19, 11, '2020-02-01 10:00:00', '2020-02-01 12:00:00');
INSERT INTO `exam` VALUES (21, 12, '2020-02-01 10:00:00', '2020-02-01 12:00:00');
INSERT INTO `exam` VALUES (22, 13, '2020-02-01 13:30:00', '2020-02-01 15:00:00');
INSERT INTO `exam` VALUES (23, 11, '2020-02-09 10:00:00', '2020-02-09 11:00:00');
INSERT INTO `exam` VALUES (24, 12, '2020-02-09 11:00:00', '2020-02-09 13:00:00');
INSERT INTO `exam` VALUES (25, 14, '2020-02-09 15:00:00', '2020-02-09 16:00:00');
INSERT INTO `exam` VALUES (26, 13, '2020-03-05 12:00:00', '2020-03-05 13:30:00');
INSERT INTO `exam` VALUES (27, 11, '2020-03-05 12:00:00', '2020-03-05 14:00:00');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `paper_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '试卷编号',
  `paper_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷名字',
  `score_sin` int(20) NULL DEFAULT NULL COMMENT '单选分数',
  `score_che` int(20) NULL DEFAULT NULL COMMENT '多选分数',
  `score_jug` int(20) NULL DEFAULT NULL COMMENT '判断分数',
  PRIMARY KEY (`paper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (11, 'java综合测试', 8, 15, 10);
INSERT INTO `paper` VALUES (12, 'python综合测试1', 8, 15, 10);
INSERT INTO `paper` VALUES (13, 'C语言测试', 5, 8, 10);
INSERT INTO `paper` VALUES (14, 'java测试2', 10, 15, 20);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '题目编号',
  `question_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目类型x单选，y多选，z判断',
  `question_course` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是什么课程的问题python，java,c等',
  `question_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目问题',
  `question_opa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项A',
  `question_opb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项B',
  `question_opc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项C',
  `question_opd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项D',
  `question_opright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确选项',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, 'x', 'java', '下列说法正确的是', 'JAVA程序的main方法必须写在类里面', 'JAVA程序中可以有多个main方法', 'JAVA程序中类名必须与文件名一样', 'JAVA程序的main方法中如果只有一条语句，可以不用{}(大括号)括起来', 'A');
INSERT INTO `question` VALUES (2, 'x', 'python', '下面哪个不是Python合法的标识符', 'int32', '40XL', 'self', '__name__', 'B');
INSERT INTO `question` VALUES (3, 'x', 'java', '下列值不为true的表达式有', '\"john\" = = \"john\"', '\"john\".equals(\"john\")', '\"john\" = \"john\"', '\"john\".equals(new String(\"john\"))', 'C');
INSERT INTO `question` VALUES (4, 'x', 'java', '假设web应用的文档根目录为MyApp，那么可以从哪里找到database.jar文件', 'MyApp目录下', 'MyApp\\images目录下', 'MyApp\\WEB-INF目录下', 'MyApp\\WEB-INF\\lib目录下', 'D');
INSERT INTO `question` VALUES (5, 'x', 'java', '从以下哪一个选项中可以获得Servlet的初始化参数', 'Servlet', 'ServletContext', 'ServletConfig', 'GenericServlet', 'C');
INSERT INTO `question` VALUES (6, 'x', 'java', '哪一个对象可以用于获得浏览器发送的请求', 'HttpServletRequest', 'HttpServletResponse', 'HttpServlet', 'Http', 'A');
INSERT INTO `question` VALUES (7, 'y', 'java', '下面哪些关键字能用来控制对类成员的访问', 'public', 'private', 'protected', 'default', 'ABC');
INSERT INTO `question` VALUES (8, 'z', 'java', '描述对象的两个要素是属性和方法', 'T', 'F', NULL, NULL, 'T');
INSERT INTO `question` VALUES (9, 'z', 'python', '列表中的元素可以是不同数据类型 ', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (10, 'z', 'python', '元组中的元素是不可更改的', 'T', 'F', NULL, NULL, 'T');
INSERT INTO `question` VALUES (11, 'z', 'python', 'python不能多继承', 'T', 'F', NULL, NULL, 'F');
INSERT INTO `question` VALUES (12, 'x', 'c', '__是构成C语言程序的基本单位', '函数', '过程', '子程序', '子例程', 'A');
INSERT INTO `question` VALUES (13, 'x', 'c', 'C语言程序从__开始执行', '程序中第一条可执行语句', '程序中第一个函数', '程序中的main函数 ', '包含文件中的第一个函数', 'C');
INSERT INTO `question` VALUES (14, 'x', 'java', '在类的定义中可以有两个同名函数，这种现象称为函数', '封装', '继承', '重载', '覆盖', 'C');
INSERT INTO `question` VALUES (15, 'x', 'java', '如果一个类的成员变量只能在所在类中使用，则该成员变量必须使用的修饰是', 'public ', 'protected', 'private', 'static', 'C');
INSERT INTO `question` VALUES (16, 'x', 'java', '哪个关键字可以对对象加互斥锁？', 'transient', 'synchronized', 'serialize', 'static', 'B');
INSERT INTO `question` VALUES (17, 'x', 'java', '关于抽象方法的说法正确的是', '可以有方法体', '可以出现在非抽象类中', '是没有方法体的方法', '抽象类中的方法都是抽象方法', 'D');
INSERT INTO `question` VALUES (18, 'x', 'java', 'java.io 包的File 类是', '字符流', '字节流类然后引用filestream', '对象流类', '非流类', 'B');
INSERT INTO `question` VALUES (19, 'x', 'java', '以下关于继承的叙述正确的是', '在Java 中类只允许单一继承', '在Java 中一个类只能实现一个接口', '在Java 中一个类不能同时继承一个类和实现一个接口', '在Java 中接口只允许单一继承', 'A');
INSERT INTO `question` VALUES (20, 'x', 'java', '若有定义：byte[] x={11,22,33,-66};</p> <p>其中0≤k ≤3，则对x 数组元素错误的引用是', 'x[5-3]', 'x[k]', 'x[k+5]', 'x[0]', 'C');
INSERT INTO `question` VALUES (21, 'y', 'java', '下面能让线程停止执行的有', ' sleep()', 'stop()', 'notify()', 'synchronized()', 'ABD');
INSERT INTO `question` VALUES (22, 'x', 'java', '下面哪个可以改变容器的布局', 'setLayout(aLayoutManager)', 'addLayout(aLayoutManager)', 'layout(aLayoutManager)', 'setLayoutManager(aLayoutManager)', 'A');
INSERT INTO `question` VALUES (23, 'x', 'java', '下面哪个是applet传递参数的正确方式', '<applet code=Test.class age=33 width=1 height=1>', '<param name=age value=33>', '<applet code=Test.class name=age value=33 width=1 height=1>', '<applet Test 33>', 'B');
INSERT INTO `question` VALUES (24, 'x', 'java', '提供Java存取数据库能力的包是', 'java.sql', 'java.awt', 'java.lang', 'java.swing', 'A');
INSERT INTO `question` VALUES (25, 'y', 'java', '不能用来修饰interface的有', 'private', 'public', 'protected', 'static', 'ACD');
INSERT INTO `question` VALUES (26, 'y', 'java', '下列说法错误的有', '在类方法中可用this来调用本类的类方法', '在类方法中调用本类的类方法时可直接调用', '在类方法中只能调用本类中的类方法', '在类方法中绝对不能调用实例方法', 'ACD');
INSERT INTO `question` VALUES (27, 'y', 'java', '有关线程的哪些叙述是对的', '一旦一个线程被创建，它就立即开始运行。', '使用start()方法可以使一个线程成为可运行的，但是它不一定立即开始运行', '当一个线程因为抢先机制而停止运行，它被放在可运行队列的前面', '一个线程可能因为不同的原因停止并进入就绪状态', 'BCD');
INSERT INTO `question` VALUES (28, 'y', 'java', '下面的哪些声明是合法的？', 'long 1 = 499', 'int i = 4L', 'float f =1.1', 'double d = 34.4', 'AD');
INSERT INTO `question` VALUES (29, 'y', 'java', ' 选择Java语言中的基本数据类型', '.byte', 'Integer', 'char', 'long', 'ACD');
INSERT INTO `question` VALUES (30, 'y', 'java', '从下列选项中选择正确的Java表达式', 'int k=new String(“aa”)', 'String str=String(“bb”)', 'char c=74;', 'long j=8888;', 'BCD');
INSERT INTO `question` VALUES (31, 'y', 'java', '关于Java语言，下列描述正确的是', ' switch 不能够作用在String类型上', 'List， Set， Map都继承自Collection接口', 'Java语言支持goto语句', 'GC是垃圾收集器，程序员不用担心内存管理', 'AD');
INSERT INTO `question` VALUES (32, 'y', 'java', '下列描述中，哪些符合Java语言的特征', '支持跨平台(Windows，Linux，Unix等)', 'GC(自动垃圾回收)，提高了代码安全性', '支持类C的指针运算操作', '不支持与其它语言书写的程序进行通讯', 'AB');
INSERT INTO `question` VALUES (33, 'z', 'java', '序列图描述对象是如何交互的并且将重点放在消息序列上', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (34, 'z', 'java', '一个XML必须有DTD或Schemas', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (35, 'y', 'java', '下列哪些是J2EE的体系', 'JSP', 'JAVA', 'Servlet', 'WebService', 'ACD');
INSERT INTO `question` VALUES (36, 'x', 'java', '在Struts中实现页面跳转主要通过什么方法来实现', 'server.transfer', 'response.redirect', 'mapping.findForward', 'response.sendRedirect', 'C');
INSERT INTO `question` VALUES (37, 'z', 'java', '用final修饰的变量叫常量', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (38, 'z', 'java', 'Java支持多重继承', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (39, 'z', 'java', '一个类可以实现多接口', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (40, 'z', 'java', 'Java语言是编译解释型语言', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (41, 'z', 'java', '一个类实现一个接口，则该类必须实现接口中的所有方法', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (42, 'z', 'java', '在方法定义中，可能发生的异常都必须用try{} catch ){}捕捉', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (43, 'z', 'java', 'Java 语言的标识符是不区分大小写的', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (44, 'x', 'c', 'C语言中主函数的个数', '1', '2', '无穷', '任意', 'A');
INSERT INTO `question` VALUES (45, 'x', 'c', 'c语言源程序文件后缀为', '.EXE', '.obj', '.c', '.java', 'C');
INSERT INTO `question` VALUES (46, 'x', 'c', 'C语言属于__语言', '机器语言', '汇编语言', '高级语言', '面向对象语言', 'B');
INSERT INTO `question` VALUES (47, 'x', 'c', 'C语言中普通整型变量int在内存中占__字节', '1', '2', '3', '4', 'B');
INSERT INTO `question` VALUES (48, 'x', 'c', '下列不是C语言基本数据类型的是  ', '字符型', '整型 ', '浮点型', '结构体', 'A');
INSERT INTO `question` VALUES (49, 'x', 'c', '有关自增、自减运算,以下只有__是正确的', 'a-b++', '---f ', '++78', 'a--', 'D');
INSERT INTO `question` VALUES (50, 'x', 'c', '有关自增、自减运算,以下只有__是正确的', '1', '2', '3', '0', 'D');
INSERT INTO `question` VALUES (51, 'x', 'c', '有关自增、自减运算,以下只有__是正确的', 'if', '_xy', 'case', '0xy', 'B');
INSERT INTO `question` VALUES (52, 'z', 'c', '“A”是一个字符常量', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (53, 'z', 'c', '在程序运行过程中其值可以改变的量称为变量', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (54, 'z', 'c', '在C语言中，变量可以先使用再定义', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (55, 'z', 'c', '在C语言中，所有算术运算符的优先级都相同', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (56, 'z', 'c', '程序中若要使用数学函数就必须包含头文件{stdio.h}', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (57, 'z', 'c', '在标准C中，“=”是判断两个数是否相等', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (58, 'z', 'c', '/%20运算符要求运算数必须是整数', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (59, 'z', 'c', 'Int, #a15 , char都是合法的标识符', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (60, 'z', 'c', '算法要有一定的逻辑性和健壮性', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (61, 'x', 'c', 'C语言的输入与输出操作是由__完成的', '输入语句 ', '输出语句 ', '输入与输出函数', '传入传出语句', 'C');
INSERT INTO `question` VALUES (62, 'x', 'c', '以下哪个数学函数的作用是求某数的平方根 ', 'sqrt()', 'fabs()', 'pow() ', 'exp()', 'A');
INSERT INTO `question` VALUES (63, 'y', 'c', '以下可以定义为用户标识符的有 ', 'scanf', 'short ', '_3com_', 'int', 'AC');
INSERT INTO `question` VALUES (64, 'y', 'c', '以下选项中不是C语言合法整数的是', '10110 ', '0386', '0Xffa', 'x2a2', 'BD');
INSERT INTO `question` VALUES (65, 'y', 'c', '以下合法的十六进制数是', 'oxff ', '0Xabc ', '0x01 ', '0X9X', 'BC');
INSERT INTO `question` VALUES (66, 'y', 'c', '以下4个选项中,可以看作是一条语句的有', '{;} ', 'a=0,b=0,c=0', 'if(a>0)', 'if', 'ABC');
INSERT INTO `question` VALUES (67, 'y', 'c', '以下对C语言中的函数描述不正确的有()', '可以嵌套定义,不可以嵌套调用', '不可以嵌套定义,可以嵌套调用', '可以嵌套定义,也可以嵌套调用 ', '嵌套定义和嵌套调用都不允许', 'ACD');
INSERT INTO `question` VALUES (68, 'y', 'c', '下列选项中是C语言合法标志符的有', 'good_morning', 'main ', 'stdio.h', '8abc', 'AB');
INSERT INTO `question` VALUES (69, 'y', 'c', '以下不合法的赋值语句是', 'x=y=100', 'd--', 'x y;', 'c=int(a b)', 'ACD');
INSERT INTO `question` VALUES (70, 'x', 'python', '下列哪种说法是错误的', '除字典类型外，所有标准对象均可以用于布尔测试', '空字符串的布尔值是False', '空列表对象的布尔值是False', '值为0的任何数字对象的布尔值是False', 'A');
INSERT INTO `question` VALUES (71, 'x', 'python', 'Python不支持的数据类型有', 'char ', 'int ', 'float', 'list', 'A');
INSERT INTO `question` VALUES (72, 'x', 'python', '关于Python中的复数，下列说法错误的是', '表示复数的语法是real + image j ', '实部和虚部都是浮点数 ', '虚部必须后缀j，且必须是小写  ', '方法conjugate返回复数的共轭复数', 'C');
INSERT INTO `question` VALUES (73, 'x', 'python', '关于字符串下列说法错误的是 ', '字符应该视为长度为1的字符串', '字符串以\\0标志字符串的结束', '既可以用单引号，也可以用双引号创建字符串', '在三引号字符串中可以包含换行回车等特殊字符', 'B');
INSERT INTO `question` VALUES (74, 'x', 'python', '以下不能创建一个字典的语句是 ', 'dict1 = {}', 'dict2 = { 3 : 5 }', 'dict3 = {[1,2,3]: “uestc”}', 'dict4 = {(1,2,3): “uestc”}', 'C');
INSERT INTO `question` VALUES (75, 'x', 'python', '下列Python语句正确的是 ', 'min = x  if  x < y  else  y ', 'max = x > y ? x : y', 'if (x > y) print x', 'while True : pass', 'D');
INSERT INTO `question` VALUES (76, 'x', 'python', 'python源程序执行的方式', '编译执行 ', '解析执行', '直接执行', '边编译边执行', 'B');
INSERT INTO `question` VALUES (77, 'x', 'python', ' 以下是字符转换成字节的方法是', ' decode() ', ' encode()', 'upper() ', ' rstrip()', 'B');
INSERT INTO `question` VALUES (78, 'y', 'python', '以下是正确的字符串', '‘abc”ab”', '‘abc”ab’', '“abc”ab”', '“abc\\”ab”', 'BD');
INSERT INTO `question` VALUES (79, 'y', 'python', '下面对count（），index(), find()方法描述错误的是', 'count() 方法用于统计字符串里某个字符出现的次数 ', 'find() 方法检测字符串中是否包含子字符串 str  如果包含子字符串返回开始的索引值，否则会报一个异常', 'index() 方法检测字符串中是否包含子字符串 str， 如果str不在 返回-1', '以上都错误', 'BD');
INSERT INTO `question` VALUES (80, 'y', 'python', '下面说明错误的是', '该类实例中包含__dir__（）方法', '该类实例中包含__hash__（）方法', '该类实例中只包含__dir__（），不包含__hash__（）', '该类没有定义任何方法，所以该实例中没有包含任何方法', 'CD');
INSERT INTO `question` VALUES (81, 'x', 'python', '以下哪项python能正常启动', '拼写错误  ', '错误表达式', '缩进错误 ', ' 手动抛出异常', 'D');
INSERT INTO `question` VALUES (82, 'x', 'python', '有关异常说法正确的是', '程序中抛出异常终止程序', '程序中抛出异常不一定终止程序', '拼写错误会导致程序终止', ' 缩进错误会导致程序终止', 'B');
INSERT INTO `question` VALUES (83, 'z', 'python', '拼写错误会导致程序终止', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (84, 'z', 'python', '可以不加声明就使用变量', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (85, 'z', 'python', '一个函数中只允许有一条return语句', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (86, 'z', 'python', 'Python语言是面向对象的', 'T', 'F', '', '', 'T');
INSERT INTO `question` VALUES (87, 'z', 'python', '存在一个程序判别一个Python程序的运行是否可以停止', 'T', 'F', '', '', 'F');
INSERT INTO `question` VALUES (88, 'y', 'python', 'Python支持的数据类型有 ', 'char ', 'int ', 'float ', 'list', 'BCD');
INSERT INTO `question` VALUES (89, 'y', 'python', '下列Python语句不正确的是', 'min = x if x < y else y ', 'max = x > y and x : y  ', 'if (x > y) print x ', 'while True : pass', 'ABC');
INSERT INTO `question` VALUES (90, 'y', 'python', '下面哪个是Python合法的标识符', 'int32', '40XL', 'self*', 'name', 'AD');
INSERT INTO `question` VALUES (91, 'y', 'python', '关于 Python 语言的特点，以下选项中描述正确的是 ', 'Python 语言是非开源语言', 'Python 语言是跨平台语言', 'Python 语言是多模型语言', 'Python 语言是脚本语言', 'BCD');
INSERT INTO `question` VALUES (92, 'y', 'python', '以下选项属于程序设计语言类别的是', '机器语言', '汇编语言', '高级语言', '解释语言 正确答案', 'ABC');

-- ----------------------------
-- Table structure for question_copy1
-- ----------------------------
DROP TABLE IF EXISTS `question_copy1`;
CREATE TABLE `question_copy1`  (
  `question_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '题目编号',
  `question_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目类型x单选，y多选，z判断',
  `question_course` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是什么课程的问题python，java,c等',
  `question_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目问题',
  `question_opa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项A',
  `question_opb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项B',
  `question_opc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项C',
  `question_opd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项D',
  `question_opright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确选项',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_copy1
-- ----------------------------
INSERT INTO `question_copy1` VALUES (1, 'x', 'java', '下列说法正确的是', 'JAVA程序的main方法必须写在类里面', 'JAVA程序中可以有多个main方法', 'JAVA程序中类名必须与文件名一样', 'JAVA程序的main方法中如果只有一条语句，可以不用{}(大括号)括起来', 'A');
INSERT INTO `question_copy1` VALUES (2, 'x', 'python', '下面哪个不是Python合法的标识符', 'int32', '40XL', 'self', '__name__', 'B');
INSERT INTO `question_copy1` VALUES (3, 'x', 'java', '下列值不为true的表达式有', '\"john\" = = \"john\"', '\"john\".equals(\"john\")', '\"john\" = \"john\"', '\"john\".equals(new String(\"john\"))', 'C');
INSERT INTO `question_copy1` VALUES (4, 'x', 'java', '假设web应用的文档根目录为MyApp，那么可以从哪里找到database.jar文件', 'MyApp目录下', 'MyApp\\images目录下', 'MyApp\\WEB-INF目录下', 'MyApp\\WEB-INF\\lib目录下', 'D');
INSERT INTO `question_copy1` VALUES (5, 'x', 'java', '从以下哪一个选项中可以获得Servlet的初始化参数', 'Servlet', 'ServletContext', 'ServletConfig', 'GenericServlet', 'C');
INSERT INTO `question_copy1` VALUES (6, 'x', 'java', '哪一个对象可以用于获得浏览器发送的请求', 'HttpServletRequest', 'HttpServletResponse', 'HttpServlet', 'Http', 'A');
INSERT INTO `question_copy1` VALUES (7, 'y', 'java', '下面哪些关键字能用来控制对类成员的访问', 'public', 'private', 'protected', 'default', 'ABC');
INSERT INTO `question_copy1` VALUES (8, 'z', 'java', '描述对象的两个要素是属性和方法', 'T', 'F', NULL, NULL, 'T');
INSERT INTO `question_copy1` VALUES (9, 'z', 'python', '列表中的元素可以是不同数据类型 ', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (10, 'z', 'python', '元组中的元素是不可更改的', 'T', 'F', NULL, NULL, 'T');
INSERT INTO `question_copy1` VALUES (11, 'z', 'python', 'python不能多继承', 'T', 'F', NULL, NULL, 'F');
INSERT INTO `question_copy1` VALUES (12, 'x', 'c', '__是构成C语言程序的基本单位', '函数', '过程', '子程序', '子例程', 'A');
INSERT INTO `question_copy1` VALUES (13, 'x', 'c', 'C语言程序从__开始执行', '程序中第一条可执行语句', '程序中第一个函数', '程序中的main函数 ', '包含文件中的第一个函数', 'C');
INSERT INTO `question_copy1` VALUES (14, 'x', 'java', '在类的定义中可以有两个同名函数，这种现象称为函数', '封装', '继承', '重载', '覆盖', 'C');
INSERT INTO `question_copy1` VALUES (15, 'x', 'java', '如果一个类的成员变量只能在所在类中使用，则该成员变量必须使用的修饰是', 'public ', 'protected', 'private', 'static', 'C');
INSERT INTO `question_copy1` VALUES (16, 'x', 'java', '哪个关键字可以对对象加互斥锁？', 'transient', 'synchronized', 'serialize', 'static', 'B');
INSERT INTO `question_copy1` VALUES (17, 'x', 'java', '关于抽象方法的说法正确的是', '可以有方法体', '可以出现在非抽象类中', '是没有方法体的方法', '抽象类中的方法都是抽象方法', 'D');
INSERT INTO `question_copy1` VALUES (18, 'x', 'java', 'java.io 包的File 类是', '字符流', '字节流类然后引用filestream', '对象流类', '非流类', 'B');
INSERT INTO `question_copy1` VALUES (19, 'x', 'java', '以下关于继承的叙述正确的是', '在Java 中类只允许单一继承', '在Java 中一个类只能实现一个接口', '在Java 中一个类不能同时继承一个类和实现一个接口', '在Java 中接口只允许单一继承', 'A');
INSERT INTO `question_copy1` VALUES (20, 'x', 'java', '若有定义：byte[] x={11,22,33,-66};</p> <p>其中0≤k ≤3，则对x 数组元素错误的引用是', 'x[5-3]', 'x[k]', 'x[k+5]', 'x[0]', 'C');
INSERT INTO `question_copy1` VALUES (21, 'y', 'java', '下面能让线程停止执行的有', ' sleep()', 'stop()', 'notify()', 'synchronized()', 'ABD');
INSERT INTO `question_copy1` VALUES (22, 'x', 'java', '下面哪个可以改变容器的布局', 'setLayout(aLayoutManager)', 'addLayout(aLayoutManager)', 'layout(aLayoutManager)', 'setLayoutManager(aLayoutManager)', 'A');
INSERT INTO `question_copy1` VALUES (23, 'x', 'java', '下面哪个是applet传递参数的正确方式', '<applet code=Test.class age=33 width=1 height=1>', '<param name=age value=33>', '<applet code=Test.class name=age value=33 width=1 height=1>', '<applet Test 33>', 'B');
INSERT INTO `question_copy1` VALUES (24, 'x', 'java', '提供Java存取数据库能力的包是', 'java.sql', 'java.awt', 'java.lang', 'java.swing', 'A');
INSERT INTO `question_copy1` VALUES (25, 'y', 'java', '不能用来修饰interface的有', 'private', 'public', 'protected', 'static', 'ACD');
INSERT INTO `question_copy1` VALUES (26, 'y', 'java', '下列说法错误的有', '在类方法中可用this来调用本类的类方法', '在类方法中调用本类的类方法时可直接调用', '在类方法中只能调用本类中的类方法', '在类方法中绝对不能调用实例方法', 'ACD');
INSERT INTO `question_copy1` VALUES (27, 'y', 'java', '有关线程的哪些叙述是对的', '一旦一个线程被创建，它就立即开始运行。', '使用start()方法可以使一个线程成为可运行的，但是它不一定立即开始运行', '当一个线程因为抢先机制而停止运行，它被放在可运行队列的前面', '一个线程可能因为不同的原因停止并进入就绪状态', 'BCD');
INSERT INTO `question_copy1` VALUES (28, 'y', 'java', '下面的哪些声明是合法的？', 'long 1 = 499', 'int i = 4L', 'float f =1.1', 'double d = 34.4', 'AD');
INSERT INTO `question_copy1` VALUES (29, 'y', 'java', ' 选择Java语言中的基本数据类型', '.byte', 'Integer', 'char', 'long', 'ACD');
INSERT INTO `question_copy1` VALUES (30, 'y', 'java', '从下列选项中选择正确的Java表达式', 'int k=new String(“aa”)', 'String str=String(“bb”)', 'char c=74;', 'long j=8888;', 'BCD');
INSERT INTO `question_copy1` VALUES (31, 'y', 'java', '关于Java语言，下列描述正确的是', ' switch 不能够作用在String类型上', 'List， Set， Map都继承自Collection接口', 'Java语言支持goto语句', 'GC是垃圾收集器，程序员不用担心内存管理', 'AD');
INSERT INTO `question_copy1` VALUES (32, 'y', 'java', '下列描述中，哪些符合Java语言的特征', '支持跨平台(Windows，Linux，Unix等)', 'GC(自动垃圾回收)，提高了代码安全性', '支持类C的指针运算操作', '不支持与其它语言书写的程序进行通讯', 'AB');
INSERT INTO `question_copy1` VALUES (33, 'z', 'java', '序列图描述对象是如何交互的并且将重点放在消息序列上', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (34, 'z', 'java', '一个XML必须有DTD或Schemas', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (35, 'y', 'java', '下列哪些是J2EE的体系', 'JSP', 'JAVA', 'Servlet', 'WebService', 'ACD');
INSERT INTO `question_copy1` VALUES (36, 'x', 'java', '在Struts中实现页面跳转主要通过什么方法来实现', 'server.transfer', 'response.redirect', 'mapping.findForward', 'response.sendRedirect', 'C');
INSERT INTO `question_copy1` VALUES (37, 'z', 'java', '用final修饰的变量叫常量', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (38, 'z', 'java', 'Java支持多重继承', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (39, 'z', 'java', '一个类可以实现多接口', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (40, 'z', 'java', 'Java语言是编译解释型语言', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (41, 'z', 'java', '一个类实现一个接口，则该类必须实现接口中的所有方法', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (42, 'z', 'java', '在方法定义中，可能发生的异常都必须用try{} catch ){}捕捉', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (43, 'z', 'java', 'Java 语言的标识符是不区分大小写的', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (44, 'x', 'c', 'C语言中主函数的个数', '1', '2', '无穷', '任意', 'A');
INSERT INTO `question_copy1` VALUES (45, 'x', 'c', 'c语言源程序文件后缀为', '.EXE', '.obj', '.c', '.java', 'C');
INSERT INTO `question_copy1` VALUES (46, 'x', 'c', 'C语言属于__语言', '机器语言', '汇编语言', '高级语言', '面向对象语言', 'B');
INSERT INTO `question_copy1` VALUES (47, 'x', 'c', 'C语言中普通整型变量int在内存中占__字节', '1', '2', '3', '4', 'B');
INSERT INTO `question_copy1` VALUES (48, 'x', 'c', '下列不是C语言基本数据类型的是  ', '字符型', '整型 ', '浮点型', '结构体', 'A');
INSERT INTO `question_copy1` VALUES (49, 'x', 'c', '有关自增、自减运算,以下只有__是正确的', 'a-b++', '---f ', '++78', 'a--', 'D');
INSERT INTO `question_copy1` VALUES (50, 'x', 'c', '有关自增、自减运算,以下只有__是正确的', '1', '2', '3', '0', 'D');
INSERT INTO `question_copy1` VALUES (51, 'x', 'c', '有关自增、自减运算,以下只有__是正确的', 'if', '_xy', 'case', '0xy', 'B');
INSERT INTO `question_copy1` VALUES (52, 'z', 'c', '“A”是一个字符常量', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (53, 'z', 'c', '在程序运行过程中其值可以改变的量称为变量', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (54, 'z', 'c', '在C语言中，变量可以先使用再定义', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (55, 'z', 'c', '在C语言中，所有算术运算符的优先级都相同', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (56, 'z', 'c', '程序中若要使用数学函数就必须包含头文件{stdio.h}', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (57, 'z', 'c', '在标准C中，“=”是判断两个数是否相等', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (58, 'z', 'c', '/%20运算符要求运算数必须是整数', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (59, 'z', 'c', 'Int, #a15 , char都是合法的标识符', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (60, 'z', 'c', '算法要有一定的逻辑性和健壮性', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (61, 'x', 'c', 'C语言的输入与输出操作是由__完成的', '输入语句 ', '输出语句 ', '输入与输出函数', '传入传出语句', 'C');
INSERT INTO `question_copy1` VALUES (62, 'x', 'c', '以下哪个数学函数的作用是求某数的平方根 ', 'sqrt()', 'fabs()', 'pow() ', 'exp()', 'A');
INSERT INTO `question_copy1` VALUES (63, 'y', 'c', '以下可以定义为用户标识符的有 ', 'scanf', 'short ', '_3com_', 'int', 'AC');
INSERT INTO `question_copy1` VALUES (64, 'y', 'c', '以下选项中不是C语言合法整数的是', '10110 ', '0386', '0Xffa', 'x2a2', 'BD');
INSERT INTO `question_copy1` VALUES (65, 'y', 'c', '以下合法的十六进制数是', 'oxff ', '0Xabc ', '0x01 ', '0X9X', 'BC');
INSERT INTO `question_copy1` VALUES (66, 'y', 'c', '以下4个选项中,可以看作是一条语句的有', '{;} ', 'a=0,b=0,c=0', 'if(a>0)', 'if', 'ABC');
INSERT INTO `question_copy1` VALUES (67, 'y', 'c', '以下对C语言中的函数描述不正确的有()', '可以嵌套定义,不可以嵌套调用', '不可以嵌套定义,可以嵌套调用', '可以嵌套定义,也可以嵌套调用 ', '嵌套定义和嵌套调用都不允许', 'ACD');
INSERT INTO `question_copy1` VALUES (68, 'y', 'c', '下列选项中是C语言合法标志符的有', 'good_morning', 'main ', 'stdio.h', '8abc', 'AB');
INSERT INTO `question_copy1` VALUES (69, 'y', 'c', '以下不合法的赋值语句是', 'x=y=100', 'd--', 'x y;', 'c=int(a b)', 'ACD');
INSERT INTO `question_copy1` VALUES (70, 'x', 'python', '下列哪种说法是错误的', '除字典类型外，所有标准对象均可以用于布尔测试', '空字符串的布尔值是False', '空列表对象的布尔值是False', '值为0的任何数字对象的布尔值是False', 'A');
INSERT INTO `question_copy1` VALUES (71, 'x', 'python', 'Python不支持的数据类型有', 'char ', 'int ', 'float', 'list', 'A');
INSERT INTO `question_copy1` VALUES (72, 'x', 'python', '关于Python中的复数，下列说法错误的是', '表示复数的语法是real + image j ', '实部和虚部都是浮点数 ', '虚部必须后缀j，且必须是小写  ', '方法conjugate返回复数的共轭复数', 'C');
INSERT INTO `question_copy1` VALUES (73, 'x', 'python', '关于字符串下列说法错误的是 ', '字符应该视为长度为1的字符串', '字符串以\\0标志字符串的结束', '既可以用单引号，也可以用双引号创建字符串', '在三引号字符串中可以包含换行回车等特殊字符', 'B');
INSERT INTO `question_copy1` VALUES (74, 'x', 'python', '以下不能创建一个字典的语句是 ', 'dict1 = {}', 'dict2 = { 3 : 5 }', 'dict3 = {[1,2,3]: “uestc”}', 'dict4 = {(1,2,3): “uestc”}', 'C');
INSERT INTO `question_copy1` VALUES (75, 'x', 'python', '下列Python语句正确的是 ', 'min = x  if  x < y  else  y ', 'max = x > y ? x : y', 'if (x > y) print x', 'while True : pass', 'D');
INSERT INTO `question_copy1` VALUES (76, 'x', 'python', 'python源程序执行的方式', '编译执行 ', '解析执行', '直接执行', '边编译边执行', 'B');
INSERT INTO `question_copy1` VALUES (77, 'x', 'python', ' 以下是字符转换成字节的方法是', ' decode() ', ' encode()', 'upper() ', ' rstrip()', 'B');
INSERT INTO `question_copy1` VALUES (78, 'y', 'python', '以下是正确的字符串', '‘abc”ab”', '‘abc”ab’', '“abc”ab”', '“abc\\”ab”', 'BD');
INSERT INTO `question_copy1` VALUES (79, 'y', 'python', '下面对count（），index(), find()方法描述错误的是', 'count() 方法用于统计字符串里某个字符出现的次数 ', 'find() 方法检测字符串中是否包含子字符串 str  如果包含子字符串返回开始的索引值，否则会报一个异常', 'index() 方法检测字符串中是否包含子字符串 str， 如果str不在 返回-1', '以上都错误', 'BD');
INSERT INTO `question_copy1` VALUES (80, 'y', 'python', '下面说明错误的是', '该类实例中包含__dir__（）方法', '该类实例中包含__hash__（）方法', '该类实例中只包含__dir__（），不包含__hash__（）', '该类没有定义任何方法，所以该实例中没有包含任何方法', 'CD');
INSERT INTO `question_copy1` VALUES (81, 'x', 'python', '以下哪项python能正常启动', '拼写错误  ', '错误表达式', '缩进错误 ', ' 手动抛出异常', 'D');
INSERT INTO `question_copy1` VALUES (82, 'x', 'python', '有关异常说法正确的是', '程序中抛出异常终止程序', '程序中抛出异常不一定终止程序', '拼写错误会导致程序终止', ' 缩进错误会导致程序终止', 'B');
INSERT INTO `question_copy1` VALUES (83, 'z', 'python', '拼写错误会导致程序终止', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (84, 'z', 'python', '可以不加声明就使用变量', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (85, 'z', 'python', '一个函数中只允许有一条return语句', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (86, 'z', 'python', 'Python语言是面向对象的', 'T', 'F', '', '', 'T');
INSERT INTO `question_copy1` VALUES (87, 'z', 'python', '存在一个程序判别一个Python程序的运行是否可以停止', 'T', 'F', '', '', 'F');
INSERT INTO `question_copy1` VALUES (88, 'y', 'python', 'Python支持的数据类型有 ', 'char ', 'int ', 'float ', 'list', 'BCD');
INSERT INTO `question_copy1` VALUES (89, 'y', 'python', '下列Python语句不正确的是', 'min = x if x < y else y ', 'max = x > y and x : y  ', 'if (x > y) print x ', 'while True : pass', 'ABC');
INSERT INTO `question_copy1` VALUES (90, 'y', 'python', '下面哪个是Python合法的标识符', 'int32', '40XL', 'self*', 'name', 'AD');
INSERT INTO `question_copy1` VALUES (91, 'y', 'python', '关于 Python 语言的特点，以下选项中描述正确的是 ', 'Python 语言是非开源语言', 'Python 语言是跨平台语言', 'Python 语言是多模型语言', 'Python 语言是脚本语言', 'BCD');
INSERT INTO `question_copy1` VALUES (92, 'y', 'python', '以下选项属于程序设计语言类别的是', '机器语言', '汇编语言', '高级语言', '解释语言 正确答案', 'ABC');

-- ----------------------------
-- Table structure for question_paper
-- ----------------------------
DROP TABLE IF EXISTS `question_paper`;
CREATE TABLE `question_paper`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `question_id` int(20) NULL DEFAULT NULL COMMENT '试题编号',
  `paper_id` int(20) NULL DEFAULT NULL COMMENT '试卷编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_paper
-- ----------------------------
INSERT INTO `question_paper` VALUES (95, 6, 11);
INSERT INTO `question_paper` VALUES (97, 26, 11);
INSERT INTO `question_paper` VALUES (98, 32, 11);
INSERT INTO `question_paper` VALUES (99, 38, 11);
INSERT INTO `question_paper` VALUES (101, 3, 11);
INSERT INTO `question_paper` VALUES (105, 14, 11);
INSERT INTO `question_paper` VALUES (106, 16, 11);
INSERT INTO `question_paper` VALUES (107, 17, 11);
INSERT INTO `question_paper` VALUES (108, 8, 11);
INSERT INTO `question_paper` VALUES (109, 70, 12);
INSERT INTO `question_paper` VALUES (110, 2, 12);
INSERT INTO `question_paper` VALUES (111, 72, 12);
INSERT INTO `question_paper` VALUES (112, 73, 12);
INSERT INTO `question_paper` VALUES (113, 74, 12);
INSERT INTO `question_paper` VALUES (117, 10, 11);
INSERT INTO `question_paper` VALUES (120, 13, 13);
INSERT INTO `question_paper` VALUES (121, 44, 13);
INSERT INTO `question_paper` VALUES (122, 45, 13);
INSERT INTO `question_paper` VALUES (123, 51, 13);
INSERT INTO `question_paper` VALUES (124, 61, 13);
INSERT INTO `question_paper` VALUES (125, 62, 13);
INSERT INTO `question_paper` VALUES (126, 64, 13);
INSERT INTO `question_paper` VALUES (127, 65, 13);
INSERT INTO `question_paper` VALUES (128, 66, 13);
INSERT INTO `question_paper` VALUES (129, 67, 13);
INSERT INTO `question_paper` VALUES (130, 68, 13);
INSERT INTO `question_paper` VALUES (131, 9, 13);
INSERT INTO `question_paper` VALUES (132, 10, 13);
INSERT INTO `question_paper` VALUES (133, 52, 13);
INSERT INTO `question_paper` VALUES (134, 80, 12);
INSERT INTO `question_paper` VALUES (135, 88, 12);
INSERT INTO `question_paper` VALUES (136, 10, 12);
INSERT INTO `question_paper` VALUES (137, 11, 12);
INSERT INTO `question_paper` VALUES (138, 83, 12);
INSERT INTO `question_paper` VALUES (139, 17, 14);
INSERT INTO `question_paper` VALUES (140, 18, 14);
INSERT INTO `question_paper` VALUES (141, 19, 14);
INSERT INTO `question_paper` VALUES (142, 20, 14);
INSERT INTO `question_paper` VALUES (143, 14, 14);
INSERT INTO `question_paper` VALUES (144, 21, 14);
INSERT INTO `question_paper` VALUES (145, 26, 14);
INSERT INTO `question_paper` VALUES (146, 34, 14);
INSERT INTO `question_paper` VALUES (147, 37, 14);
INSERT INTO `question_paper` VALUES (160, 37, 15);
INSERT INTO `question_paper` VALUES (161, 41, 15);
INSERT INTO `question_paper` VALUES (162, 32, 15);
INSERT INTO `question_paper` VALUES (163, 42, 15);
INSERT INTO `question_paper` VALUES (164, 19, 15);
INSERT INTO `question_paper` VALUES (165, 30, 15);
INSERT INTO `question_paper` VALUES (166, 27, 15);
INSERT INTO `question_paper` VALUES (167, 28, 15);
INSERT INTO `question_paper` VALUES (168, 36, 15);
INSERT INTO `question_paper` VALUES (169, 35, 15);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `record_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `record_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试名称',
  `student_id` int(20) NULL DEFAULT NULL COMMENT '学生id',
  `paper_id` int(20) NULL DEFAULT NULL COMMENT '试卷id',
  `record_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答题记录',
  `record_acc` double(255, 2) NULL DEFAULT NULL COMMENT '正确率',
  `record_score` int(20) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (15, 'java综合测试', 1, 11, 'D,A,C,C,B,ACD,AB,T,F,T', 1.00, 100);
INSERT INTO `record` VALUES (16, 'java综合测试', 2, 11, 'A,C,C,D,B,ABC,C,T,F,T', 0.50, 46);
INSERT INTO `record` VALUES (17, 'python综合测试1', 1, 12, 'A,B,C,B,C,CD,BCD,T,F,T', 0.60, 66);
INSERT INTO `record` VALUES (18, 'python综合测试1', 2, 12, 'B,B,C,B,C,AC,BCD,T,F,T', 0.60, 59);
INSERT INTO `record` VALUES (19, 'java综合测试', 3, 11, 'C,C,B,C,C,BCD,AB,F,T,T', 0.70, 69);
INSERT INTO `record` VALUES (20, 'python综合测试1', 3, 12, 'B,B,C,B,A,CD,ABCD,T,F,T', 0.50, 51);
INSERT INTO `record` VALUES (21, 'java综合测试', 7, 11, 'C,C,B,B,C,ABC,AB,T,F,T', 0.50, 49);
INSERT INTO `record` VALUES (22, 'python综合测试1', 7, 12, 'B,B,B,B,C,AC,BC,T,F,F', 0.60, 54);
INSERT INTO `record` VALUES (23, 'java综合测试', 8, 11, 'A,C,B,B,C,C,AB,F,T,T', 0.60, 61);
INSERT INTO `record` VALUES (24, 'python综合测试1', 8, 12, 'B,C,C,C,C,ABC,B,T,F,T', 0.50, 44);
INSERT INTO `record` VALUES (25, 'java综合测试', 10, 11, 'C,C,B,A,A,C,AB,F,T,T', 0.80, 77);
INSERT INTO `record` VALUES (26, 'python综合测试1', 10, 12, 'C,C,A,B,C,BC,BC,T,F,T', 0.60, 52);
INSERT INTO `record` VALUES (27, 'java综合测试', 9, 11, 'C,C,B,B,C,ABC,AB,T,T,T', 0.60, 59);
INSERT INTO `record` VALUES (28, 'python综合测试1', 9, 12, 'A,B,B,B,C,ABC,BC,T,F,F', 0.50, 46);
INSERT INTO `record` VALUES (29, 'java综合测试', 11, 11, 'C,C,B,C,C,ABC,AB,F,T,T', 0.70, 69);
INSERT INTO `record` VALUES (30, 'python综合测试1', 11, 12, 'A,C,C,D,B,ABC,BCD,T,F,T', 0.40, 43);
INSERT INTO `record` VALUES (31, 'C语言测试', 1, 13, 'A,C,B,C,A,C,A,CD,AC,BC,ABC,T,T,F', 0.79, 76);
INSERT INTO `record` VALUES (32, 'C语言测试', 2, 13, 'C,A,C,A,C,A,D,BC,ABC,B,ABC,T,T,F', 0.57, 55);
INSERT INTO `record` VALUES (33, 'C语言测试', 6, 13, 'A,C,A,C,A,C,ABC,AB,BC,ABC,B,T,T,F', 0.64, 63);
INSERT INTO `record` VALUES (34, 'C语言测试', 7, 13, 'A,C,A,C,A,C,AB,AB,ABC,BD,A,T,T,F', 0.64, 63);
INSERT INTO `record` VALUES (35, 'C语言测试', 8, 13, 'A,C,B,C,A,C,C,AB,ABC,BC,ABC,F,T,F', 0.79, 74);
INSERT INTO `record` VALUES (36, 'C语言测试', 9, 13, 'A,C,B,C,A,C,ABC,A,BC,BC,ABC,T,F,T', 0.64, 56);
INSERT INTO `record` VALUES (37, 'C语言测试', 10, 13, 'A,C,B,C,A,C,C,AB,BD,AB,ABC,T,F,F', 0.79, 74);
INSERT INTO `record` VALUES (38, 'C语言测试', 11, 13, 'A,C,B,C,A,C,BC,B,AB,BC,B,T,T,F', 0.71, 68);
INSERT INTO `record` VALUES (39, 'C语言测试', 12, 13, 'A,C,B,C,A,C,AC,AB,AB,BC,ABC,T,F,T', 0.71, 64);
INSERT INTO `record` VALUES (40, 'java综合测试', 14, 11, 'C,C,B,B,B,B,A,F,T,T', 0.60, 54);
INSERT INTO `record` VALUES (41, 'java综合测试', 14, 11, 'C,C,C,D,B,C,A,T,F,T', 0.30, 26);
INSERT INTO `record` VALUES (42, 'java综合测试', 14, 11, 'A,C,B,A,A,AB,BC,T,T,F', 0.40, 34);
INSERT INTO `record` VALUES (43, 'java综合测试', 14, 11, 'A,A,B,C,B,AB,BC,F,T,T', 0.40, 34);
INSERT INTO `record` VALUES (44, 'python综合测试1', 1, 12, 'B,B,B,C,C,B,B,T,F,T', 0.40, 36);
INSERT INTO `record` VALUES (45, 'java测试2', 1, 14, 'D,B,A,C,C,AB,ACD,T,F', 0.67, 65);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '学生编号，默认生成',
  `student_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `student_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号英文数字组成，可以理解为学号',
  `student_gender` int(20) NULL DEFAULT NULL COMMENT '性别',
  `student_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `student_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `classe_id` int(20) NOT NULL COMMENT '对应班级，外键',
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '舒照', '2020001', 1, '1258104016@qq.com', '123456', 1);
INSERT INTO `student` VALUES (2, '刘得滑', '2020002', 1, 'liudehua@qq.com', '123456', 2);
INSERT INTO `student` VALUES (3, '秦岚', 'ql1234', 1, 'ql@qq.com', '123456', 13);
INSERT INTO `student` VALUES (5, '黄霖', 'hl11', 0, 'hl@qq.com', '123456', 4);
INSERT INTO `student` VALUES (6, '张三', 'zhangsan', 1, 'zhangsan@qq.com', '123456', 3);
INSERT INTO `student` VALUES (7, '王五', 'wangwu', 1, 'wangwu@16.com', '123456', 1);
INSERT INTO `student` VALUES (8, '赵六', 'zhaolilu', 0, 'zhaoliu@qq.com', '123456', 1);
INSERT INTO `student` VALUES (9, '荷兰', 'helan', 0, 'helan@qqom', '123456', 2);
INSERT INTO `student` VALUES (10, '周舟', 'zhouzhou', 1, 'zhou@qqcom', '123456', 1);
INSERT INTO `student` VALUES (11, '武当', 'wudang', 1, 'wudang@aacom', '123456', 1);
INSERT INTO `student` VALUES (12, '贺新郎', 'hehua', 1, 'hehua@qq.com', '123456', 2);
INSERT INTO `student` VALUES (13, '刘宝', 'liubao', 1, 'liubao@sohu.com', '123456', 3);
INSERT INTO `student` VALUES (14, '韩飞', 'hanfei', 1, 'hanfei@qq.com', '123456', 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '老师编号',
  `teacher_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `teacher_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师登录账号',
  `teacher_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `teacher_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `power` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '拥有后台更改权力',
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '赵四', 'zhaosi', 'zhaosi@qq.com', '123456', 1);
INSERT INTO `teacher` VALUES (2, '梅长苏', '20201001', 'mei@163.com', '123456', 0);
INSERT INTO `teacher` VALUES (3, '郝秀', '20201002', 'xiu@gmail.com', '123456', 0);
INSERT INTO `teacher` VALUES (6, '韩函', 'han12', 'han12@qq.com', '123456', 0);
INSERT INTO `teacher` VALUES (7, '古力', 'gu123', 'gu@qq.com', '123456', 0);
INSERT INTO `teacher` VALUES (9, '爱德华', 'adh', 'asd@qq.com', '123456', 0);
INSERT INTO `teacher` VALUES (10, '叶问', 'yewen', 'yw1@qq.com', '123456', 0);

-- ----------------------------
-- Table structure for toscore
-- ----------------------------
DROP TABLE IF EXISTS `toscore`;
CREATE TABLE `toscore`  (
  `toscore_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `paper_id` int(20) NULL DEFAULT NULL COMMENT '试卷id',
  `toscore` int(20) NULL DEFAULT NULL COMMENT '总分',
  PRIMARY KEY (`toscore_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of toscore
-- ----------------------------
INSERT INTO `toscore` VALUES (1, 11, 100);
INSERT INTO `toscore` VALUES (2, 12, 100);
INSERT INTO `toscore` VALUES (3, 13, 100);
INSERT INTO `toscore` VALUES (4, 14, 120);

SET FOREIGN_KEY_CHECKS = 1;
