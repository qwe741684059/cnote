/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.20 : Database - cnote
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cnote` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cnote`;

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `file_id` int NOT NULL AUTO_INCREMENT COMMENT '文件Id',
  `parent_id` int DEFAULT NULL COMMENT '父节点',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `file` */

insert  into `file`(`file_id`,`parent_id`,`file_name`,`file_type`,`file_path`,`create_time`,`update_time`) values (1,0,'index.html',NULL,'','2022-06-24 17:15:37','2022-06-24 17:15:40'),(2,1,'.git',NULL,'index.html','2022-06-24 17:16:22','2022-06-24 17:16:25'),(3,1,'logo','png','index.html','2022-06-24 17:17:11','2022-06-24 17:17:13'),(4,1,'中文测试','md','index.html','2022-06-24 17:18:08','2022-06-24 17:18:10'),(5,2,'文件夹测试','txt','index.html/.git','2022-06-24 17:21:43','2022-06-24 17:21:51'),(6,2,'三层文件夹',NULL,'index.html/.git','2022-06-25 17:02:45','2022-06-25 17:02:47'),(7,1,'test','md','index.html','2022-06-26 18:02:53','2022-06-26 18:02:53'),(8,2,'test','md','index.html/.git','2022-06-26 18:04:06','2022-06-26 18:04:06'),(9,2,'test',NULL,'index.html/.git','2022-06-26 18:04:22','2022-06-26 18:04:22'),(10,6,'中文',NULL,'index.html/.git/三层文件夹','2022-06-26 18:05:24','2022-06-26 18:05:24'),(11,6,'中文','md','index.html/.git/三层文件夹','2022-06-26 18:13:37','2022-06-26 18:13:37'),(12,1,'刷新测试','md','index.html','2022-06-26 18:29:14','2022-06-26 18:29:14'),(13,1,'123',NULL,'index.html','2022-06-26 18:31:17','2022-06-26 18:31:17'),(14,1,'项目文档','md','index.html','2022-06-26 18:37:13','2022-06-26 18:37:13'),(15,1,'1','md','index.html','2022-06-26 18:37:29','2022-06-26 18:37:29'),(16,1,'2','md','index.html','2022-06-26 18:37:34','2022-06-26 18:37:34'),(17,1,'3','md','index.html','2022-06-26 18:37:38','2022-06-26 18:37:38'),(18,1,'4','md','index.html','2022-06-26 18:37:42','2022-06-26 18:37:42');

/*Table structure for table `file_detail` */

DROP TABLE IF EXISTS `file_detail`;

CREATE TABLE `file_detail` (
  `file_detail_id` int NOT NULL AUTO_INCREMENT COMMENT '详细文件Id',
  `file_id` int NOT NULL COMMENT '文件id',
  `theme` varchar(255) DEFAULT NULL COMMENT '主题',
  `md_content` text COMMENT 'markdown内容',
  `html_content` text COMMENT 'html内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`file_detail_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `file_detail_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `file` (`file_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `file_detail` */

insert  into `file_detail`(`file_detail_id`,`file_id`,`theme`,`md_content`,`html_content`,`create_time`,`update_time`) values (1,3,'oneDark','```\n12312\n```','<div class=\"code-block\"><span class=\"copy-code\">复制代码</span><pre><code>12312</code></pre></div>',NULL,'2022-06-26 14:26:24'),(2,4,'dark','```\n测试中\n```','<div class=\"code-block\"><span class=\"copy-code\">复制代码</span><pre><code>测试中</code></pre></div>',NULL,'2022-06-26 14:33:18'),(3,5,'light','sadsa','<p>sadsa</p>\n',NULL,'2022-06-26 18:36:56'),(4,11,'light','sadas','<p>sadas</p>\n',NULL,'2022-06-26 18:21:44'),(5,14,'light','# 云知识系统\n\n## 1.需求分析\n\n### 1.1 项目目标与愿景分析（项目背景介绍，项目内容介绍，项目目标做成什么样介绍）\n\n本项目主要目标在于实现随时随地学习与分享。\n\n目前市面上有着大量的开源社区，以及笔记本系统，但对于用户而言，他们既想要给自己做笔记的同时，还想要学习他人的知识，所以只能够分别在笔记本系统上做笔记，以及去开源社区学习想要的知识。\n\n本系统则是统一两者，实现个人笔记的同时，允许用户分享交流协作完成笔记，做到既有社区的活跃以及学习性，又有笔记本系统的私人记笔记的功能。\n\n\n\n### 1.2 可行性分析\n\n自己搞\n\n\n\n### 1.3 需求分析 （项目模块分析，画用例图，以及用例对应的规约表，画类图以及类属性的说明，画类与类之间的关系图，各个图要有一定的说明）\n\n系统分为：\n\n- 用户模块：注册，登录，信息修改(密码等个人资料管理)\n- 权限模块：用户对于系统的权限如：游客，用户，管理员权限，用户对于笔记的权限\n- 交友模块：关注，私聊，拉黑。\n\n- 笔记模块：\n\n  - 个人笔记模块：增删改查笔记，增删改查目录，导出，导入笔记\n  - 分享笔记模块：分享笔记，取消笔记分享，点赞转发收藏笔记，导出笔记，对笔记发起issue\n    - issue模块：对笔记发起issue，回复issue，\n\n  - 协作笔记模块：邀请加入队伍，实现基于git的协作完成笔记功能\n\n- 移动端：主要用于查看。\n\n## 2.系统设计\n\n\n\n## 3.系统开发与部署\n\n### 3.1 系统运行所需环境\n\n- 前端：windows10系统\n- 后端：mysql数据库，Maven，java1.8\n\n### 3.2 系统开发\n\n#### 3.2.1 前端\n\n```\n// 前端依赖\n- element-ui：UI组件库\n- vant UI：UI组件库\n- vuetify：UI组件库\n- vue：系统框架\n- vue-meditor：开源的markdown编辑器\n- vue-router：路由\n- axios：前后端交互\n- sass：CSS preloader\n- electron：将web封装成客户端\n```\n\n\n\n```\n// 前端结构\n- src：系统目录\n    - api：存放与后端交互的js文件\n    	- file.js：与FileController交互\n    	- fileDeatil.js：与FileDetailController交互\n    - components：存放封装视图组件\n    	- File：存放文件相关的组件\n    	- BreadCrumb.vue：面包屑导航组件\n    	- LeftMenu.vue：左菜单栏组件\n    - plugins：存放插件的js文件\n    - router：存放路由的相关配置\n    - utils：存放工具型js\n    	- request.js：封装axios\n    - views：存放视图\n    - APP.vue：主视图\n    - background.js：electron配置\n    - main.js：Vue配置\n- .env.development：开发环境配置\n- .env.production：运行环境配置\n```\n\n\n\n#### 3.2.2 后端\n\n```\n// 后端依赖\n- spring data jpa：与数据库交互\n- spring web：SpringBoot Web容器\n- swagger：接口文档\n- mysql-connector-java：mysql驱动\n- lombok：lombok插件，用于快速生成方法\n- fastjson：解析json数据\n```\n\n\n\n```\n// 后端结构\n- base：存放基本类\n- config：存放配置类\n- controller：存放controller\n- domain：存放实体类与VO\n- repository：存放与数据库交互的接口\n- service：存放Service接口\n	- impl：存放Service接口的实现类\n```\n\n\n\n### 3.3 系统部署\n\n#### 3.3.1 前端\n\n下载源代码，修改`.env.production`中相关的配置，如后端的IP与接口等。\n\n执行`vue-cli-service electron:build`命令，将代码打包成安装文件与对应的exe\n\n#### 3.3.2 后端\n\n安装mysql数据库，在resources包中找到sql包，使用sql命令建表。\n\n修改application.yml配置类，将代码打成jar包，在服务器中后台运行即可。\n\n\n\n','<h1 id=\"云知识系统\">云知识系统</h1>\n<h2 id=\"1需求分析\">1.需求分析</h2>\n<h3 id=\"11-项目目标与愿景分析（项目背景介绍，项目内容介绍，项目目标做成什么样介绍）\">1.1 项目目标与愿景分析（项目背景介绍，项目内容介绍，项目目标做成什么样介绍）</h3>\n<p>本项目主要目标在于实现随时随地学习与分享。</p>\n<p>目前市面上有着大量的开源社区，以及笔记本系统，但对于用户而言，他们既想要给自己做笔记的同时，还想要学习他人的知识，所以只能够分别在笔记本系统上做笔记，以及去开源社区学习想要的知识。</p>\n<p>本系统则是统一两者，实现个人笔记的同时，允许用户分享交流协作完成笔记，做到既有社区的活跃以及学习性，又有笔记本系统的私人记笔记的功能。</p>\n<h3 id=\"12-可行性分析\">1.2 可行性分析</h3>\n<p>自己搞</p>\n<h3 id=\"13-需求分析-（项目模块分析，画用例图，以及用例对应的规约表，画类图以及类属性的说明，画类与类之间的关系图，各个图要有一定的说明）\">1.3 需求分析 （项目模块分析，画用例图，以及用例对应的规约表，画类图以及类属性的说明，画类与类之间的关系图，各个图要有一定的说明）</h3>\n<p>系统分为：</p>\n<ul>\n<li class=\" \"><p>用户模块：注册，登录，信息修改(密码等个人资料管理)</p>\n</li>\n<li class=\" \"><p>权限模块：用户对于系统的权限如：游客，用户，管理员权限，用户对于笔记的权限</p>\n</li>\n<li class=\" \"><p>交友模块：关注，私聊，拉黑。</p>\n</li>\n<li class=\" \"><p>笔记模块：</p>\n<ul>\n<li class=\" \"><p>个人笔记模块：增删改查笔记，增删改查目录，导出，导入笔记</p>\n</li>\n<li class=\" \"><p>分享笔记模块：分享笔记，取消笔记分享，点赞转发收藏笔记，导出笔记，对笔记发起issue</p>\n<ul>\n<li class=\" \">issue模块：对笔记发起issue，回复issue，</li>\n</ul>\n</li>\n<li class=\" \"><p>协作笔记模块：邀请加入队伍，实现基于git的协作完成笔记功能</p>\n</li>\n</ul>\n</li>\n<li class=\" \"><p>移动端：主要用于查看。</p>\n</li>\n</ul>\n<h2 id=\"2系统设计\">2.系统设计</h2>\n<h2 id=\"3系统开发与部署\">3.系统开发与部署</h2>\n<h3 id=\"31-系统运行所需环境\">3.1 系统运行所需环境</h3>\n<ul>\n<li class=\" \">前端：windows10系统</li>\n<li class=\" \">后端：mysql数据库，Maven，java1.8</li>\n</ul>\n<h3 id=\"32-系统开发\">3.2 系统开发</h3>\n<h4 id=\"321-前端\">3.2.1 前端</h4>\n<div class=\"code-block\"><span class=\"copy-code\">复制代码</span><pre><code>// 前端依赖\n<span class=\"hljs-bullet\">- </span>element-ui：UI组件库\n<span class=\"hljs-bullet\">- </span>vant UI：UI组件库\n<span class=\"hljs-bullet\">- </span>vuetify：UI组件库\n<span class=\"hljs-bullet\">- </span>vue：系统框架\n<span class=\"hljs-bullet\">- </span>vue-meditor：开源的markdown编辑器\n<span class=\"hljs-bullet\">- </span>vue-router：路由\n<span class=\"hljs-bullet\">- </span>axios：前后端交互\n<span class=\"hljs-bullet\">- </span>sass：CSS preloader\n<span class=\"hljs-bullet\">- </span>electron：将web封装成客户端</code></pre></div><div class=\"code-block\"><span class=\"copy-code\">复制代码</span><pre><code>// 前端结构\n<span class=\"hljs-bullet\">- </span>src：系统目录\n<span class=\"hljs-bullet\">    - </span>api：存放与后端交互的js文件\n<span class=\"hljs-bullet\">        - </span>file.js：与FileController交互\n<span class=\"hljs-bullet\">        - </span>fileDeatil.js：与FileDetailController交互\n<span class=\"hljs-bullet\">    - </span>components：存放封装视图组件\n<span class=\"hljs-bullet\">        - </span>File：存放文件相关的组件\n<span class=\"hljs-bullet\">        - </span>BreadCrumb.vue：面包屑导航组件\n<span class=\"hljs-bullet\">        - </span>LeftMenu.vue：左菜单栏组件\n<span class=\"hljs-bullet\">    - </span>plugins：存放插件的js文件\n<span class=\"hljs-bullet\">    - </span>router：存放路由的相关配置\n<span class=\"hljs-bullet\">    - </span>utils：存放工具型js\n<span class=\"hljs-bullet\">        - </span>request.js：封装axios\n<span class=\"hljs-bullet\">    - </span>views：存放视图\n<span class=\"hljs-bullet\">    - </span>APP.vue：主视图\n<span class=\"hljs-bullet\">    - </span>background.js：electron配置\n<span class=\"hljs-bullet\">    - </span>main.js：Vue配置\n<span class=\"hljs-bullet\">- </span>.env.development：开发环境配置\n<span class=\"hljs-bullet\">- </span>.env.production：运行环境配置</code></pre></div><h4 id=\"322-后端\">3.2.2 后端</h4>\n<div class=\"code-block\"><span class=\"copy-code\">复制代码</span><pre><code>// 后端依赖\n<span class=\"hljs-bullet\">- </span>spring data jpa：与数据库交互\n<span class=\"hljs-bullet\">- </span>spring web：SpringBoot Web容器\n<span class=\"hljs-bullet\">- </span>swagger：接口文档\n<span class=\"hljs-bullet\">- </span>mysql-connector-java：mysql驱动\n<span class=\"hljs-bullet\">- </span>lombok：lombok插件，用于快速生成方法\n<span class=\"hljs-bullet\">- </span>fastjson：解析json数据</code></pre></div><div class=\"code-block\"><span class=\"copy-code\">复制代码</span><pre><code>// 后端结构\n<span class=\"hljs-bullet\">- </span>base：存放基本类\n<span class=\"hljs-bullet\">- </span>config：存放配置类\n<span class=\"hljs-bullet\">- </span>controller：存放controller\n<span class=\"hljs-bullet\">- </span>domain：存放实体类与VO\n<span class=\"hljs-bullet\">- </span>repository：存放与数据库交互的接口\n<span class=\"hljs-bullet\">- </span>service：存放Service接口\n<span class=\"hljs-bullet\">    - </span>impl：存放Service接口的实现类</code></pre></div><h3 id=\"33-系统部署\">3.3 系统部署</h3>\n<h4 id=\"331-前端\">3.3.1 前端</h4>\n<p>下载源代码，修改<code>.env.production</code>中相关的配置，如后端的IP与接口等。</p>\n<p>执行<code>vue-cli-service electron:build</code>命令，将代码打包成安装文件与对应的exe</p>\n<h4 id=\"332-后端\">3.3.2 后端</h4>\n<p>安装mysql数据库，在resources包中找到sql包，使用sql命令建表。</p>\n<p>修改application.yml配置类，将代码打成jar包，在服务器中后台运行即可。</p>\n',NULL,'2022-06-26 19:59:12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
