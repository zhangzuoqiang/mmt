USE `mmt_db`;

#
# 客户信息表
#

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `cust_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '客户介绍',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态（1：有效；0：无效）',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='客户信息表';

#
# 微信配置表
#

CREATE TABLE `weixin_config` (
  `cust_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `wx_account` varchar(50) NOT NULL DEFAULT '' COMMENT '微信号',
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '微信接入TOKEN',
  `subscribe_msg` text COMMENT '订阅事件需要发送的消息',
  `biz_class` varchar(255) NOT NULL DEFAULT '' COMMENT '业务代码实现类',
  `appid` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方用户唯一凭证',
  `secret` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方用户唯一凭证密钥',
  `api_url` char(40) NOT NULL DEFAULT '' COMMENT '客户微信API的URL(UNIQUE)',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信配置信息表';

#
# 微信粉丝表
#

CREATE TABLE `weixin_fans` (
  `wxid` char(32) NOT NULL DEFAULT '' COMMENT '微信ID',
  `cust_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户编号',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态（1：订阅：0：取消订阅）',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近更新',
  PRIMARY KEY (`wxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信粉丝表'

#
# 微信消息日志表
#

CREATE TABLE `weixin_log_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cust_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户编号',
  `msgType` varchar(8) NOT NULL DEFAULT '' COMMENT '消息类型',
  `msg` text NOT NULL COMMENT '消息内容',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8 COMMENT='微信消息日志';

#
# 微信接口接入日志
#

CREATE TABLE `weixin_log_siteaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cust_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户编号',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '签名',
  `nonce` varchar(30) DEFAULT NULL COMMENT '接收到的nonce',
  `echostr` varchar(50) DEFAULT NULL COMMENT '接收到的echostr',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT '微信接入TOKEN',
  `timestamp` varchar(20) DEFAULT NULL COMMENT '接收到的timestamp',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='微信接口接入日志';

#
# 微信订阅日志表
#

CREATE TABLE `weixin_log_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cust_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户编号',
  `wxid` char(32) NOT NULL DEFAULT '' COMMENT '微信ID',
  `subscribe_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订阅时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信订阅日志表';

#
# 微信退订日志表
#

CREATE TABLE `weixin_log_unsubscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cust_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户编号',
  `wxid` char(32) NOT NULL DEFAULT '' COMMENT '微信ID',
  `unsubscribe_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '取消订阅时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信退订日志表';

#
# 微信接收消息汇总表
#

CREATE TABLE `weixin_recvmsg_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cust_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户编号',
  `toUserName` varchar(100) NOT NULL DEFAULT '' COMMENT '接受者微信ID',
  `fromUserName` varchar(100) NOT NULL DEFAULT '' COMMENT '发送者微信ID',
  `createTime` bigint(20) NOT NULL DEFAULT '0' COMMENT '微信创建时间',
  `msgType` varchar(10) NOT NULL DEFAULT '' COMMENT '信息类型',
  `msgId` bigint(20) DEFAULT NULL COMMENT '信息ID',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '接收时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='微信消息接收汇总表';

#
# 微信事件消息接收表
#

CREATE TABLE `weixin_recvmsg_event` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应detail表ID',
  `eventType` varchar(11) NOT NULL DEFAULT '' COMMENT '事件类型',
  `eventKey` char(64) NOT NULL DEFAULT '' COMMENT '事件KEY',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信事件消息接收表';

#
# 微信图片消息接收表
#

CREATE TABLE `weixin_recvmsg_image` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应detail表ID',
  `picUrl` varchar(100) DEFAULT NULL COMMENT '图片链接',
  `mediaId` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图片消息接收表';

#
# 微信链接消息接收表
#

CREATE TABLE `weixin_recvmsg_link` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应detail表ID',
  `title` varchar(250) DEFAULT '' COMMENT '标题',
  `description` text COMMENT '详情',
  `url` varchar(100) DEFAULT '' COMMENT '链接地址',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信链接消息接收表';

#
# 微信地理位置消息接收表
#

CREATE TABLE `weixin_recvmsg_location` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应detail表ID',
  `location_X` varchar(15) NOT NULL DEFAULT '0' COMMENT 'X坐标',
  `location_Y` varchar(15) NOT NULL DEFAULT '0' COMMENT 'Y坐标',
  `scale` int(11) NOT NULL DEFAULT '0' COMMENT '放大倍数',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信地理位置消息接收表';

#
# 微信文本消息接收表
#

CREATE TABLE `weixin_recvmsg_text` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应detail表ID',
  `content` text COMMENT '文本内容',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信文本消息接收表';

#
# 微信视频消息接收表
#

CREATE TABLE `weixin_recvmsg_video` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应detail表ID',
  `mediaId` char(64) NOT NULL,
  `thumbMediaId` varchar(255) NOT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信视频消息接收表';

#
# 微信语音消息接收表
#

CREATE TABLE `weixin_recvmsg_voice` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应detail表ID',
  `mediaId` char(64) NOT NULL,
  `format` varchar(10) NOT NULL DEFAULT '' COMMENT '格式',
  `recognition` varchar(255) NOT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信语音消息接收表';

#
# 微信消息发送汇总表
#

CREATE TABLE `weixin_sendmsg_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cust_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户编号',
  `toUserName` varchar(100) NOT NULL DEFAULT '' COMMENT '接受者微信ID',
  `fromUserName` varchar(100) NOT NULL DEFAULT '' COMMENT '发送者微信ID',
  `createTime` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `msgType` varchar(10) NOT NULL DEFAULT '' COMMENT '信息类型',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息发送汇总表';

#
# 微信音乐消息发送表
#

CREATE TABLE `weixin_sendmsg_music` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应发送detail表ID',
  `musicUrl` varchar(100) NOT NULL DEFAULT '' COMMENT '音乐地址',
  `hqMusicUrl` varchar(100) NOT NULL DEFAULT '' COMMENT '高清音乐地址',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信音乐消息发送表';

#
# 微信图文消息发送表
#

CREATE TABLE `weixin_sendmsg_news` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应发送detail表ID',
  `articleCount` decimal(2,0) NOT NULL DEFAULT '0' COMMENT '文章数量',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文消息发送表';

#
# 微信图文消息发送表——文章
#

CREATE TABLE `weixin_sendmsg_news_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应news表ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '详情',
  `picUrl` varchar(100) NOT NULL DEFAULT '' COMMENT '图片地址',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '文章地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文消息发送表——文章';

#
# 微信文本消息发送表
#

CREATE TABLE `weixin_sendmsg_text` (
  `detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应发送detail表ID',
  `content` text NOT NULL COMMENT '文本内容',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信文本消息发送表';