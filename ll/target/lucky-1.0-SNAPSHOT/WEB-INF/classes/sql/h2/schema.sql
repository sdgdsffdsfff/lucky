DROP TABLE IF EXISTS `action`;

CREATE TABLE `action` (
  `id` int(10) unsigned zerofill NOT NULL auto_increment COMMENT '动作名称（例如增加，删除）',
  `path` varchar(200) NOT NULL COMMENT '相对于主目录的路径',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `moduleId` int(11) default NULL,
  `actionName` varchar(200) default NULL,
  `orders` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL auto_increment COMMENT '菜单自动增长id',
  `menuName` varchar(50) NOT NULL COMMENT '显示名称',
  `parentId` int(11) default NULL COMMENT '父id',
  `url` varchar(100) default NULL COMMENT '链接url',
  `imageUrl` varchar(100) default NULL COMMENT '图片url',
  `dept` int(11) default NULL COMMENT '第几层，方便查询',
  `createTime` datetime default NULL COMMENT '创建时间',
  `orders` varchar(11) NOT NULL default '0' COMMENT '排序',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=ucs2;



DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(11) NOT NULL auto_increment,
  `moduleName` varchar(765) NOT NULL,
  `moduleInfo` text,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `roleName` varchar(20) NOT NULL COMMENT '角色名称',
  `roleInfo` text COMMENT '角色介绍',
  `createTime` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS `roleaction`;

CREATE TABLE `roleaction` (
  `roleId` int(11) NOT NULL COMMENT '角色Id',
  `actionId` varchar(50) NOT NULL COMMENT '关联action中的action',
  KEY `FK_bbs_roleaction` (`roleId`),
  KEY `FK_bbs_roleaction1` (`actionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS `rolemenu`;

CREATE TABLE `rolemenu` (
  `roleId` int(11) default NULL,
  `menuId` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;


DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) unsigned zerofill NOT NULL auto_increment COMMENT '自动增长Id',
  `userName` varchar(20) NOT NULL COMMENT '用户名',
  `userPassword` varchar(20) NOT NULL COMMENT '用户密码',
  `email` varchar(20) default NULL COMMENT 'email',
  `createTime` datetime NOT NULL COMMENT '注册时间'
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=415 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `userrole`;

CREATE TABLE `userrole` (
  `userId` int(11) NOT NULL COMMENT '用户id',
  `roleId` int(11) NOT NULL COMMENT '角色Id',
  KEY `FK_bbs_userrole` (`roleId`),
  KEY `FK_bbs_userrole1` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;