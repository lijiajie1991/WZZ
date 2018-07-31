创建数据表


#add by ljj@2070128 微信支付设置
DROP TABLE IF EXISTS `base_wxpayset`;
CREATE TABLE `base_wxpayset` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fappId` varchar(100) DEFAULT NULL,
  `fmchID` varchar(100) DEFAULT NULL,
  `fsubMchID` varchar(100) DEFAULT NULL,
  `fcertLocalPath` varchar(100) DEFAULT NULL,
  `fcertPassword` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20170128 支付日志
DROP TABLE IF EXISTS `bill_paylog`;
CREATE TABLE `bill_paylog` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpayId` varchar(44) DEFAULT NULL,
  `fmacIp` varchar(44) DEFAULT NULL,
  `fbody` varchar(255) DEFAULT NULL,
  `fattach` varchar(255) DEFAULT NULL,
  `ftag` varchar(100) DEFAULT NULL,
  `fpt` int DEFAULT 0,
  `ftimeStart` timestamp NULL DEFAULT NULL,
  `ftimeExpire` timestamp NULL DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `fisSuccess` tinyint(3) DEFAULT '0',
  `ftransactionId` varchar(255) DEFAULT NULL,
  `fremark` varchar(255) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




#add by ljj@20160911 权限项
DROP TABLE IF EXISTS `base_permission`;
CREATE TABLE `base_permission` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `flongnumber` varchar(255) DEFAULT NULL,
  `flongname` varchar(255) DEFAULT NULL,
  
  `fparentid` varchar(44) DEFAULT NULL,
  `fpt` int DEFAULT 0,
  
  `fuipath` varchar(44) DEFAULT NULL,
  `fbtnpath` varchar(44) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160911 店铺
DROP TABLE IF EXISTS `base_shop`;
CREATE TABLE `base_shop` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `flongnumber` varchar(255) DEFAULT NULL,
  `flongname` varchar(255) DEFAULT NULL,
  
  `fparentid` varchar(44) DEFAULT NULL,
  `fst` int DEFAULT 0,
  `fpft` int DEFAULT 0,
  
  `faddress` varchar(100) DEFAULT NULL,
  `fphone` varchar(44) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



#add by ljj@20160911 用户表
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fpassword` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminshopId` varchar(44) DEFAULT NULL,
  `fdefShopId` varchar(44) DEFAULT NULL,

  `fuseCount` int DEFAULT 0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160911 用户角色分录
DROP TABLE IF EXISTS `base_user_roleentry`;
CREATE TABLE `base_user_roleentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  `froleid` varchar(44) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160911 用户店铺分录
DROP TABLE IF EXISTS `base_user_shopentry`;
CREATE TABLE `base_user_shopentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



#add by ljj@20160911 角色
DROP TABLE IF EXISTS `base_userrole`;
CREATE TABLE `base_userrole` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  
  `fuseCount` int DEFAULT 0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160911 角色分录
DROP TABLE IF EXISTS `base_userrole_perentry`;
CREATE TABLE `base_userrole_perentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  `fpermissionid` varchar(44) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



#add by ljj@20160918 菜单
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `flongnumber` varchar(255) DEFAULT NULL,
  `flongname` varchar(255) DEFAULT NULL,
  
  `fparentid` varchar(44) DEFAULT NULL,
  `frptId` varchar(44) DEFAULT NULL,
  
  `fmt` int DEFAULT 0,
  `fseq` int DEFAULT 0,
  `fclsName` varchar(255) DEFAULT NULL,
  `fisVisable` tinyint(3) DEFAULT '0',
    
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160924 员工职位
DROP TABLE IF EXISTS `base_job`;
CREATE TABLE `base_job` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,

  `fpft` int DEFAULT 0,
  `fsalary` double DEFAULT 0.0,
  `fbounty` double DEFAULT 0.0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20161204 店铺参数
DROP TABLE IF EXISTS `base_shopparam`;
CREATE TABLE `base_shopparam` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,

  `fshopName` varchar(100) DEFAULT NULL,
  `fshopPhone` varchar(100) DEFAULT NULL,
  `fhour` int DEFAULT 22,
  `fday` int DEFAULT 1,
  `fisSaleEntry` tinyint(3) DEFAULT '0',
  `fisPurchaseEntry` tinyint(3) DEFAULT '0',
  `fisBossSms` tinyint(3) DEFAULT '0',
  `fisCustomerSms` tinyint(3) DEFAULT '0',
  `fisBarcode` tinyint(3) DEFAULT '0',
  `fisCustomerCard` tinyint(3) DEFAULT '0',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160924 员工
DROP TABLE IF EXISTS `base_person`;
CREATE TABLE `base_person` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,

  `fpst` int DEFAULT 0,
  `fjobId` varchar(44) DEFAULT NULL,
  
  `fuseCount` int DEFAULT 0,
  
  `fpersonId` varchar(25) DEFAULT NULL,
  `fbirth` varchar(25) DEFAULT NULL,
  `fphone` varchar(25) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;






#add by ljj@20160924 项目类型
DROP TABLE IF EXISTS `base_projectgroup`;
CREATE TABLE `base_projectgroup` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 项目
DROP TABLE IF EXISTS `base_project`;
CREATE TABLE `base_project` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fptId` varchar(44) DEFAULT NULL,
  `fpcId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT NULL,
  `fisEnable` tinyint(3) DEFAULT '0',
  `fremark` varchar(255) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 提成比例
DROP TABLE IF EXISTS `base_percent`;
CREATE TABLE `base_percent` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 提成比例分录
DROP TABLE IF EXISTS `base_percent_entry`;
CREATE TABLE `base_percent_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fjobId` varchar(44) DEFAULT NULL,
  `fpt` int DEFAULT 0,
  `fval` double DEFAULT 0.0,
  `fremark` varchar(255) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160924 会员类型
DROP TABLE IF EXISTS `base_vip`;
CREATE TABLE `base_vip` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 客户
DROP TABLE IF EXISTS `base_customer`;
CREATE TABLE `base_customer` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fcardId` varchar(44) DEFAULT NULL,
  `fbirth` varchar(25) DEFAULT NULL,
  `fphone` varchar(25) DEFAULT NULL,
  `fvipId` varchar(44) DEFAULT NULL,
  
  `fpoints` double DEFAULT 0.0,
  `fbalance` double DEFAULT 0.0,
  
  `fisEnable` tinyint(3) DEFAULT '1',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 计量单位
DROP TABLE IF EXISTS `base_measureunit`;
CREATE TABLE `base_measureunit` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fcoe` double DEFAULT 0.0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 产品类型
DROP TABLE IF EXISTS `base_materialgroup`;
CREATE TABLE `base_materialgroup` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160925 产品
DROP TABLE IF EXISTS `base_material`;
CREATE TABLE `base_material` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fmgId` varchar(44) DEFAULT NULL,
  `fmodel` varchar(100) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  
  `fprice` double DEFAULT 0.0,
  `fpcId` varchar(44) DEFAULT NULL,
  
  `fisEnable` tinyint(3) DEFAULT '1',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160925 供应商
DROP TABLE IF EXISTS `base_supplier`;
CREATE TABLE `base_supplier` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fphone` varchar(100) DEFAULT NULL,
  `faddress` varchar(100) DEFAULT NULL,
  `fremark` varchar(255) DEFAULT NULL,
  
  `fisEnable` tinyint(3) DEFAULT '1',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



#add by ljj@20160925 考勤策略
DROP TABLE IF EXISTS `base_attendance`;
CREATE TABLE `base_attendance` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fat` int DEFAULT 0,
  `fadt` int DEFAULT 0,
  `fremark` varchar(255) DEFAULT NULL,
  
  `fisEnable` tinyint(3) DEFAULT '1',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160924 考勤策略分录
DROP TABLE IF EXISTS `base_attendance_entry`;
CREATE TABLE `base_attendance_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fjobId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `fremark` varchar(255) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;





#add by ljj@20160925 价目表
DROP TABLE IF EXISTS `bill_price`;
CREATE TABLE `bill_price` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fdateFrom` timestamp NULL DEFAULT NULL,
  `fdateTo` timestamp NULL DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160924 项目价目表
DROP TABLE IF EXISTS `bill_price_projectentry`;
CREATE TABLE `bill_price_projectentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fprojectId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT 0.0,
  `fisFloat` tinyint(3) DEFAULT '0',
  `fremark` varchar(255) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 产品价目表
DROP TABLE IF EXISTS `bill_price_materialentry`;
CREATE TABLE `bill_price_materialentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT 0.0,
  `fisFloat` tinyint(3) DEFAULT '0',
  `fremark` varchar(255) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;









#add by ljj@20160925 店铺库存
DROP TABLE IF EXISTS `base_shopstock`;
CREATE TABLE `base_shopstock` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fmaterialId` varchar(44) DEFAULT NULL,
  `fqty` double DEFAULT 0.0,
  `fupTime` varchar(25) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



#add by ljj@20160925 入库单
DROP TABLE IF EXISTS `bill_inwh`;
CREATE TABLE `bill_inwh` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `finStockDate` timestamp NULL DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT 0.0,
  `fqty` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0,
  `fsourceBillId` varchar(44) DEFAULT NULL,
  `fremark` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160925 入库单
DROP TABLE IF EXISTS `bill_outwh`;
CREATE TABLE `bill_outwh` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `foutStockDate` timestamp NULL DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT 0.0,
  `fqty` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0,
  `fsourceBillId` varchar(44) DEFAULT NULL,
  `fremark` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160925 销售单
DROP TABLE IF EXISTS `bill_sale`;
CREATE TABLE `bill_sale` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpt` int DEFAULT 0,
  `fpersonId` varchar(44) DEFAULT NULL,
  `fcustomerId` varchar(44) DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT 0.0,
  `fqty` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0,
  `ffactamt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL,
  `fisBalance` tinyint(3) DEFAULT '0',
  `fsourceBillId` varchar(44) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160925 销售单
DROP TABLE IF EXISTS `bill_salemutil`;
CREATE TABLE `bill_salemutil` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpt` int DEFAULT 0,
  `fpersonId` varchar(44) DEFAULT NULL,
  `fcustomerId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `ffactamt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL,
  `fisBalance` tinyint(3) DEFAULT '0',
  `fsourceBillId` varchar(44) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 销售单分录
DROP TABLE IF EXISTS `bill_salemutil_entry`;
CREATE TABLE `bill_salemutil_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT 0.0,
  `fqty` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0,
  `ffactamt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL,
  `fbarCode` varchar(100) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




#add by ljj@20160925 服务单
DROP TABLE IF EXISTS `bill_service`;
CREATE TABLE `bill_service` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpt` int DEFAULT 0,
  `fpersonId` varchar(44) DEFAULT NULL,
  `fcustomerId` varchar(44) DEFAULT NULL,
  `fprojectId` varchar(44) DEFAULT NULL,
  `fqty` double DEFAULT 0.0,
  `fprice` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0,
  `ffactamt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL,
  `fisBalance` tinyint(3) DEFAULT '0',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;







#add by ljj@20160925 采购单
DROP TABLE IF EXISTS `bill_purchasemutil`;
CREATE TABLE `bill_purchasemutil` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpersonId` varchar(44) DEFAULT NULL,
  `fsupplierId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 采购单分录
DROP TABLE IF EXISTS `bill_purchasemutil_entry`;
CREATE TABLE `bill_purchasemutil_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT 0.0,
  `fqty` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;












#add by ljj@20160925 折扣策略
DROP TABLE IF EXISTS `base_discount`;
CREATE TABLE `base_discount` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fvipId` varchar(44) DEFAULT NULL,
  `fisEnable` tinyint(3) DEFAULT '1',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 项目折扣
DROP TABLE IF EXISTS `base_discount_projectentry`;
CREATE TABLE `base_discount_projectentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fprojectId` varchar(44) DEFAULT NULL,
  `fdiscount` double DEFAULT 100,
  `fremark` varchar(255) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 产品折扣
DROP TABLE IF EXISTS `base_discount_materialentry`;
CREATE TABLE `base_discount_materialentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fmaterialId` varchar(44) DEFAULT NULL,
  `fdiscount` double DEFAULT 100,
  `fremark` varchar(255) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;










#add by ljj@20160925 充值记录
DROP TABLE IF EXISTS `bill_rechargerecord`;
CREATE TABLE `bill_rechargerecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpersonId` varchar(44) DEFAULT NULL,
  `fcustomerId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `fgiveamt` double DEFAULT 0.0,
  `ffactamt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;












#add by ljj@20160925 充值优惠
DROP TABLE IF EXISTS `bill_rechargegive`;
CREATE TABLE `bill_rechargegive` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fname` varchar(100) DEFAULT NULL,
  `fdateFrom` timestamp NULL DEFAULT NULL,
  `fdateTo` timestamp NULL DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#add by ljj@20160924 充值优惠分录
DROP TABLE IF EXISTS `bill_rechargegive_entry`;
CREATE TABLE `bill_rechargegive_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `famt` double DEFAULT 0.0,
  `fgiveamt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;







#add by ljj@20160925 考勤记录
DROP TABLE IF EXISTS `bill_attendrecord`;
CREATE TABLE `bill_attendrecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpersonId` varchar(44) DEFAULT NULL,
  `fat` int DEFAULT 0,
  `fadt` int DEFAULT 0,
  `fqty` double DEFAULT 0.0,
  `fisBalance` tinyint(3) DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




#add by ljj@20160925 预支记录
DROP TABLE IF EXISTS `bill_advancerecord`;
CREATE TABLE `bill_advancerecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpersonId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `fisBalance` tinyint(3) DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;







#add by ljj@20160925 工资单
DROP TABLE IF EXISTS `bill_salary`;
CREATE TABLE `bill_salary` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fdateFrom` timestamp NULL DEFAULT NULL,
  `fdateTo` timestamp NULL DEFAULT NULL,
  `fpersonId` varchar(44) DEFAULT NULL,
  `fsalary` double DEFAULT 0.0,
  `fbounty` double DEFAULT 0.0,
  `fpercentamt` double DEFAULT 0.0,
  `fpunishamt` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160924 工资单分录
DROP TABLE IF EXISTS `bill_salary_entry`;
CREATE TABLE `bill_salary_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fname` varchar(100) DEFAULT NULL,
  `fremark` varchar(100) DEFAULT NULL,
  `ftotalAmt` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




#add by ljj@20160925 采购单
DROP TABLE IF EXISTS `bill_purchase`;
CREATE TABLE `bill_purchase` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fpersonId` varchar(44) DEFAULT NULL,
  `fsupplierId` varchar(44) DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT 0.0,
  `fqty` double DEFAULT 0.0,
  `famt` double DEFAULT 0.0,
  `fremark` varchar(100) DEFAULT NULL,
  `fsourcebillid` varchar(100) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



#add by ljj@20161127 盘点单
DROP TABLE IF EXISTS `bill_invcheck`;
CREATE TABLE `bill_invcheck` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20161127 盘点单分路
DROP TABLE IF EXISTS `bill_invcheck_entry`;
CREATE TABLE `bill_invcheck_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fthisQty` double DEFAULT 0.0,
  `fcheckQty` double DEFAULT 0.0,
  `flostQty` double DEFAULT 0.0
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20161006 店铺余额
DROP TABLE IF EXISTS `base_shopbalance`;
CREATE TABLE `base_shopbalance` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,

  
  `fuseCount` int DEFAULT 0,
  
  `fcustomerShopId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `fprice` double DEFAULT 0.0,
  `fisSms` tinyint(3) DEFAULT '0',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20161006 串口参数
DROP TABLE IF EXISTS `base_comparam`;
CREATE TABLE `base_comparam` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,

  
  `fuseCount` int DEFAULT 0,
  
  `fComName` varchar(100) DEFAULT NULL,
  `fBoudIndex` int DEFAULT 0,
  `fDataBits` int DEFAULT 0,
  `fStopBits` int DEFAULT 0,
  `fParityV` int DEFAULT 0,
  `fct` int DEFAULT 0,
  
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



#add by ljj@20160925 店铺充值记录
DROP TABLE IF EXISTS `bill_shoppayment`;
CREATE TABLE `bill_shoppayment` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fcustomerShopId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `fisSms` tinyint(3) DEFAULT '0',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




#add by ljj@20161006 参数
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  
  `fuseCount` int DEFAULT 0,
  
   `fval` varchar(255) DEFAULT NULL,
  
  `fcustomerShopId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT 0.0,
  `fprice` double DEFAULT 0.0,
  `fisSms` tinyint(3) DEFAULT '0',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;












#add by ljj@20160925 短信
DROP TABLE IF EXISTS `bill_smsrecord`;
CREATE TABLE `bill_smsrecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fctx` varchar(255) DEFAULT NULL,
  `fphone` varchar(100) DEFAULT NULL,
  `fcode` varchar(255) DEFAULT NULL,
  `fisSuccess` tinyint(3) DEFAULT '0',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;








#add by ljj@20160925 注册
DROP TABLE IF EXISTS `bill_register`;
CREATE TABLE `bill_register` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fshopName` varchar(100) DEFAULT NULL,
  `fshopAddress` varchar(100) DEFAULT NULL,
  `fshopPhone` varchar(100) DEFAULT NULL,
  `fpft` int DEFAULT 0,
  
  `fsmsphone` varchar(100) DEFAULT NULL,
  `fhour` int DEFAULT 22,
  `fday` int DEFAULT 1,
  `fisSaleEntry` tinyint(3) DEFAULT '0',
  `fisPurchaseEntry` tinyint(3) DEFAULT '0',
  `fisBossSms` tinyint(3) DEFAULT '0',
  `fisCustomerSms` tinyint(3) DEFAULT '0',
  
  `fremark` varchar(255) DEFAULT NULL,
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


#add by ljj@20160924 注册
DROP TABLE IF EXISTS `bill_register_entry`;
CREATE TABLE `bill_register_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fshopName` varchar(100) DEFAULT NULL,
  `fshopAddress` varchar(100) DEFAULT NULL,
  `fshopPhone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


＃add by lijiajie@20161023 报表相关数据标
DROP TABLE IF EXISTS `sys_rpt_column`;
CREATE TABLE `sys_rpt_column` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fkeyStr` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fval` varchar(100) DEFAULT NULL,
  `fwidth` int DEFAULT 100,
  `falign` int DEFAULT 0,
  `fdt` int DEFAULT 0,
  `fisSum` tinyint(3) DEFAULT '0',
  `flevel` int DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `sys_rpt_crosssum`;
CREATE TABLE `sys_rpt_crosssum` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fkeyStr` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fval` varchar(100) DEFAULT NULL,
  `fwidth` int DEFAULT 100,
  `falign` int DEFAULT 0,
  `fdt` int DEFAULT 0,
  `fisSum` tinyint(3) DEFAULT '0',
  `flevel` int DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_rpt_crossSuffix`;
CREATE TABLE `sys_rpt_crossSuffix` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fkeyStr` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fval` varchar(100) DEFAULT NULL,
  `fwidth` int DEFAULT 100,
  `falign` int DEFAULT 0,
  `fdt` int DEFAULT 0,
  `fisSum` tinyint(3) DEFAULT '0',
  `flevel` int DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `sys_rpt_condition`;
CREATE TABLE `sys_rpt_condition` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fkeyStr` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fitems` varchar(255) DEFAULT NULL,
  `fhttpcls` varchar(255) DEFAULT NULL,
  `ffilter` varchar(255) DEFAULT NULL,
  `ftype` int DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `sys_rpt_shop`;
CREATE TABLE `sys_rpt_shop` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_rpt_listrpt`;
CREATE TABLE `sys_rpt_listrpt` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fname` varchar(255) DEFAULT NULL,
  `fsqlStr` text DEFAULT NULL,
  `ftype` int DEFAULT 0,
  `fisfree` tinyint(3) DEFAULT '0',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS `sys_rpt_crossrpt`;
CREATE TABLE `sys_rpt_crossrpt` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int DEFAULT 0,
  
  `fname` varchar(255) DEFAULT NULL,
  `fsqlStr` text DEFAULT NULL,
  `ftype` int DEFAULT 0,
  `fisfree` tinyint(3) DEFAULT '0',
  
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

 
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fremark` varchar(255) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `sys_sumrecord`;
CREATE TABLE `sys_sumrecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int not Null auto_increment primary key,
  `fshopId` varchar(44) DEFAULT NULL,
  `fdatestr` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




DROP TABLE IF EXISTS `sys_print`;
CREATE TABLE `sys_print` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  
  `fuseCount` int DEFAULT 0,
  
  `fclsName` varchar(255) DEFAULT NULL,
  `fprintMethod` varchar(255) DEFAULT NULL,

  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_print_entry`;
CREATE TABLE `sys_print_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  `fseq` int DEFAULT 0,
  `fparentid` varchar(44) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fisdef` tinyint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


