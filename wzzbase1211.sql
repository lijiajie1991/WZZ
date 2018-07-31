/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost
 Source Database       : wzz

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : utf-8

 Date: 12/11/2016 22:39:22 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `base_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `base_attendance`;
CREATE TABLE `base_attendance` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fat` int(11) DEFAULT '0',
  `fadt` int(11) DEFAULT '0',
  `fremark` varchar(255) DEFAULT NULL,
  `fisEnable` tinyint(3) DEFAULT '1',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_attendance`
-- ----------------------------
BEGIN;
INSERT INTO `base_attendance` VALUES ('0015-fcb42ac3-26ec-45f0-9df9-35692af22b89', '0001', '请假/半天', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '0', '1', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-98add0d8-f6de-48e3-bae2-2fc36c9034f8', '0002', '请假/全天', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '0', '1', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-82c92be9-7668-42da-8ebd-42245dfc78ac', '0003', '请假/小时', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '0', '2', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-b223bfc6-e4be-4cdd-bc08-24e92d4aca8c', '0004', '请假/分钟', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '0', '3', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-2ed996c9-f5ef-4c4e-8de7-fd71f00cdf73', '0005', '旷工/半天', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '1', '1', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-c7d2b394-2120-42bd-b78b-3f8c89e1874f', '0006', '旷工/全天', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '1', '1', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-3d77754e-3f86-48d4-9e18-86276f5b79c9', '0007', '旷工/小时', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '1', '2', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-b6e2596c-a098-44e5-9ab4-6b00df2b5df0', '0008', '旷工/分钟', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '1', '3', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-7c0c73cb-7d4a-4638-84a2-d798da0045a6', '0009', '迟到/半天', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '2', '1', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-8c7fc8d2-22aa-420c-8276-d84a77bd44f3', '0010', '迟到/全天', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '2', '1', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-29ca7aab-67ca-4ac5-9006-a00f1aaddfad', '0011', '迟到/小时', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '2', '2', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-22c81fcf-5119-4ac4-ba20-d532b1e5ec5b', '0012', '迟到/分钟', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '2', '3', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-68fa2758-a939-4ae3-a8a6-703356aba45d', '0013', '早退/半天', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '3', '1', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-c8e4e9d2-02c7-41af-b153-dd012e16169b', '0014', '早退/全天', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '3', '1', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-94bee753-3d15-4f84-b595-6149550d2741', '0015', '早退/小时', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '3', '2', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0015-e81ac1fd-2abb-44e2-99df-202016a7dc76', '0016', '早退/分钟', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '3', '3', null, '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31');
COMMIT;

-- ----------------------------
--  Table structure for `base_attendance_entry`
-- ----------------------------
DROP TABLE IF EXISTS `base_attendance_entry`;
CREATE TABLE `base_attendance_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fjobId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT '0',
  `fremark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_attendance_entry`
-- ----------------------------
BEGIN;
INSERT INTO `base_attendance_entry` VALUES ('001501-7f4d475b-bc3c-41d0-ab0d-bdab00ce35d4', '0', '0015-fcb42ac3-26ec-45f0-9df9-35692af22b89', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-624a443b-f877-4be0-ad35-9c1a0c19204c', '0', '0015-fcb42ac3-26ec-45f0-9df9-35692af22b89', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-6e561526-4e1d-4bf5-84db-b3b92e81f881', '0', '0015-fcb42ac3-26ec-45f0-9df9-35692af22b89', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-49fbe36e-72b5-4f13-a268-f243f151bee1', '0', '0015-98add0d8-f6de-48e3-bae2-2fc36c9034f8', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-cbcaed4f-e3e7-4b84-97c0-3000fe8da699', '0', '0015-98add0d8-f6de-48e3-bae2-2fc36c9034f8', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-475f43e0-05f9-4d92-8bd5-3aef8224376b', '0', '0015-98add0d8-f6de-48e3-bae2-2fc36c9034f8', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-e32ca9cd-d753-4d13-a50a-e793010ba3fa', '0', '0015-82c92be9-7668-42da-8ebd-42245dfc78ac', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-c3a8f32e-9c76-4d33-b3d8-4766c8ce7a7a', '0', '0015-82c92be9-7668-42da-8ebd-42245dfc78ac', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-2fce9622-4670-4d4b-b539-016b0600cae4', '0', '0015-82c92be9-7668-42da-8ebd-42245dfc78ac', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-1a243d96-9e62-42c6-ae99-3de84292fe06', '0', '0015-b223bfc6-e4be-4cdd-bc08-24e92d4aca8c', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-9eb3d828-5b7d-4b84-a90e-2d01ee024606', '0', '0015-b223bfc6-e4be-4cdd-bc08-24e92d4aca8c', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-c1887abc-f02a-4616-bdf0-02b9b3a79940', '0', '0015-b223bfc6-e4be-4cdd-bc08-24e92d4aca8c', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-b5bf228c-2c5a-42dc-8e4e-fb56cef9474f', '0', '0015-2ed996c9-f5ef-4c4e-8de7-fd71f00cdf73', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-5bb8ccf5-034a-47c9-9557-25c892c350d1', '0', '0015-2ed996c9-f5ef-4c4e-8de7-fd71f00cdf73', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-b1f9e3b5-79ad-4c90-b41d-b6c0609832fd', '0', '0015-2ed996c9-f5ef-4c4e-8de7-fd71f00cdf73', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-c74526a8-f927-460e-92a9-4b1993a477e4', '0', '0015-c7d2b394-2120-42bd-b78b-3f8c89e1874f', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-ed55aec1-641b-4a5e-a91e-602cbaa20612', '0', '0015-c7d2b394-2120-42bd-b78b-3f8c89e1874f', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-e6799eec-8b95-4401-a2e3-b84f9e863f6d', '0', '0015-c7d2b394-2120-42bd-b78b-3f8c89e1874f', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-1f24eccd-540c-4ed0-ab8a-8d122161405d', '0', '0015-3d77754e-3f86-48d4-9e18-86276f5b79c9', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-a047a609-91af-4d9d-a835-12837facfef6', '0', '0015-3d77754e-3f86-48d4-9e18-86276f5b79c9', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-f45804b6-7082-4e4f-b9e5-80ac68bef034', '0', '0015-3d77754e-3f86-48d4-9e18-86276f5b79c9', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-c231b2c8-c1c0-411a-8c39-bc3d64cfe898', '0', '0015-b6e2596c-a098-44e5-9ab4-6b00df2b5df0', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-34fbcf28-86dd-44ed-b39d-42ff342612ee', '0', '0015-b6e2596c-a098-44e5-9ab4-6b00df2b5df0', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-e6291976-f2e1-467b-948e-2650262194b7', '0', '0015-b6e2596c-a098-44e5-9ab4-6b00df2b5df0', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-eb9ef5bf-4437-4a7a-a3bd-0afafbaf2185', '0', '0015-7c0c73cb-7d4a-4638-84a2-d798da0045a6', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-a5839ebd-b5e4-4e7d-9ef3-45b445649b69', '0', '0015-7c0c73cb-7d4a-4638-84a2-d798da0045a6', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-bb494d34-f12b-4b77-8752-dde1134554a7', '0', '0015-7c0c73cb-7d4a-4638-84a2-d798da0045a6', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-178abd62-cdc4-4285-814c-62b3f78487ba', '0', '0015-8c7fc8d2-22aa-420c-8276-d84a77bd44f3', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-36cded66-d5fc-4f78-a406-9da6596e7ac8', '0', '0015-8c7fc8d2-22aa-420c-8276-d84a77bd44f3', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-d4b9afc2-2078-45b5-b80a-7cc03f0d0c9c', '0', '0015-8c7fc8d2-22aa-420c-8276-d84a77bd44f3', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-b75ef718-5de6-4ab0-a5b8-1f4f07006887', '0', '0015-29ca7aab-67ca-4ac5-9006-a00f1aaddfad', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-ca01d05d-9ed6-4dc0-8222-4cfcab10610c', '0', '0015-29ca7aab-67ca-4ac5-9006-a00f1aaddfad', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-6bad8257-3a02-43e2-902d-cc07e09b71b6', '0', '0015-29ca7aab-67ca-4ac5-9006-a00f1aaddfad', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-6778b48d-52c0-4154-9e84-febe81cf61c6', '0', '0015-22c81fcf-5119-4ac4-ba20-d532b1e5ec5b', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-3a997d20-763e-41ec-86b9-25fb527551d8', '0', '0015-22c81fcf-5119-4ac4-ba20-d532b1e5ec5b', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-0f3e3147-893e-41d1-a58d-d6479076af1a', '0', '0015-22c81fcf-5119-4ac4-ba20-d532b1e5ec5b', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-b3665c14-6235-465f-8052-523033bb0da7', '0', '0015-68fa2758-a939-4ae3-a8a6-703356aba45d', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-47a6b390-79b4-4dfb-a4ae-a4e190abcb92', '0', '0015-68fa2758-a939-4ae3-a8a6-703356aba45d', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-6f31c92f-19f1-4662-945d-6e6b75ba98c5', '0', '0015-68fa2758-a939-4ae3-a8a6-703356aba45d', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-7acb376e-b343-4d4f-8587-275ef0b4691d', '0', '0015-c8e4e9d2-02c7-41af-b153-dd012e16169b', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-2910d422-06a6-4917-959a-459429b72f1e', '0', '0015-c8e4e9d2-02c7-41af-b153-dd012e16169b', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-0ec6996c-8dd1-4ae5-be46-27ed879e7f6d', '0', '0015-c8e4e9d2-02c7-41af-b153-dd012e16169b', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-1b5b6254-0e0b-4b4f-9b3d-7bf0572b4bc7', '0', '0015-94bee753-3d15-4f84-b595-6149550d2741', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-ae032250-d16f-470c-b78c-0c2d5897fcef', '0', '0015-94bee753-3d15-4f84-b595-6149550d2741', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-de877735-ba91-4fbb-968c-a2dd5887824e', '0', '0015-94bee753-3d15-4f84-b595-6149550d2741', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', ''), ('001501-e894f43a-2e0a-4941-b7e8-a22afc4af3ac', '0', '0015-e81ac1fd-2abb-44e2-99df-202016a7dc76', '0006-9883266d-292e-4f3b-b379-37acdb711b4a', '0', ''), ('001501-a0939700-8f57-4ab6-8459-409adb14a634', '0', '0015-e81ac1fd-2abb-44e2-99df-202016a7dc76', '0006-b3d4d9e8-77b0-4ac4-b08f-f5f25823c071', '0', ''), ('001501-7f13c618-79fd-4f3d-bbc9-f1bb93209919', '0', '0015-e81ac1fd-2abb-44e2-99df-202016a7dc76', '0006-acc68cc1-5ff1-4e3f-9a5a-bbc21d80b0eb', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `base_customer`
-- ----------------------------
DROP TABLE IF EXISTS `base_customer`;
CREATE TABLE `base_customer` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcardId` varchar(44) DEFAULT NULL,
  `fbirth` varchar(25) DEFAULT NULL,
  `fphone` varchar(25) DEFAULT NULL,
  `fvipId` varchar(44) DEFAULT NULL,
  `fpoints` double DEFAULT '0',
  `fbalance` double DEFAULT '0',
  `fisEnable` tinyint(3) DEFAULT '1',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_discount`
-- ----------------------------
DROP TABLE IF EXISTS `base_discount`;
CREATE TABLE `base_discount` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fvipId` varchar(44) DEFAULT NULL,
  `fisEnable` tinyint(3) DEFAULT '1',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_discount_materialentry`
-- ----------------------------
DROP TABLE IF EXISTS `base_discount_materialentry`;
CREATE TABLE `base_discount_materialentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `fdiscount` double DEFAULT '100',
  `fremark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_discount_projectentry`
-- ----------------------------
DROP TABLE IF EXISTS `base_discount_projectentry`;
CREATE TABLE `base_discount_projectentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fprojectId` varchar(44) DEFAULT NULL,
  `fdiscount` double DEFAULT '100',
  `fremark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_job`
-- ----------------------------
DROP TABLE IF EXISTS `base_job`;
CREATE TABLE `base_job` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpft` int(11) DEFAULT '0',
  `fsalary` double DEFAULT '0',
  `fbounty` double DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_material`
-- ----------------------------
DROP TABLE IF EXISTS `base_material`;
CREATE TABLE `base_material` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fmgId` varchar(44) DEFAULT NULL,
  `fmodel` varchar(100) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fpcId` varchar(44) DEFAULT NULL,
  `fisEnable` tinyint(3) DEFAULT '1',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_materialgroup`
-- ----------------------------
DROP TABLE IF EXISTS `base_materialgroup`;
CREATE TABLE `base_materialgroup` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_measureunit`
-- ----------------------------
DROP TABLE IF EXISTS `base_measureunit`;
CREATE TABLE `base_measureunit` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcoe` double DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_measureunit`
-- ----------------------------
BEGIN;
INSERT INTO `base_measureunit` VALUES ('0013-6da33ff8-4217-466d-bba0-036ae2a2f60f', '0001', '瓶', '0001', '', '27', '1', '001', '001', '2016-10-03 07:06:54', '2016-09-27 20:26:13'), ('0013-6a21b949-f9b9-4d98-8d61-25ea6ce874ab', '0002', '支', '0001', '', '0', '1', '001', '001', '2016-09-27 20:26:20', '2016-09-27 20:26:20'), ('0013-b54f2e94-6a11-4848-bef5-754f9a467325', '0003', '包', '0001', '', '44', '1', '001', '001', '2016-10-03 07:06:23', '2016-09-27 20:26:28'), ('0013-b67ecfab-8b69-45c2-b457-8f90c0e6aa39', '0004', '袋', '0001', '', '0', '1', '001', '001', '2016-09-27 20:26:33', '2016-09-27 20:26:33'), ('0013-245a9dd2-3573-4f50-aa54-488b939c46ab', '0005', '个', '0001', '', '0', '1', '001', '001', '2016-09-27 20:26:36', '2016-09-27 20:26:36'), ('0013-383b3fc7-8b80-43a0-ae2b-10a110994f43', '0001', '瓶', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '27', '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0013-e72f4839-4346-4c7f-925f-75111d81880a', '0002', '支', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0013-8dc6d471-7293-43c9-a234-4507ac600df4', '0003', '包', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '44', '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0013-703d1c43-1c26-4c9b-b5ef-aa37a0c29b12', '0004', '袋', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0013-523b1e7f-e0c5-4b47-b4b3-09325d0c73b5', '0005', '个', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '96', '1', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31');
COMMIT;

-- ----------------------------
--  Table structure for `base_percent`
-- ----------------------------
DROP TABLE IF EXISTS `base_percent`;
CREATE TABLE `base_percent` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_percent_entry`
-- ----------------------------
DROP TABLE IF EXISTS `base_percent_entry`;
CREATE TABLE `base_percent_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fjobId` varchar(44) DEFAULT NULL,
  `fpt` int(11) DEFAULT '0',
  `fval` double DEFAULT '0',
  `fremark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_permission`
-- ----------------------------
DROP TABLE IF EXISTS `base_permission`;
CREATE TABLE `base_permission` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `flongnumber` varchar(255) DEFAULT NULL,
  `flongname` varchar(255) DEFAULT NULL,
  `fparentid` varchar(44) DEFAULT NULL,
  `fpt` int(11) DEFAULT '0',
  `fuipath` varchar(44) DEFAULT NULL,
  `fbtnpath` varchar(44) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_permission`
-- ----------------------------
BEGIN;
INSERT INTO `base_permission` VALUES ('0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de', '007000', '角色定义', '007000', '角色定义', '', '0', 'bas.sys.userrole.UserRoleInfo', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-3f978afb-5c7f-4d7a-accf-6dad61d6c87f', '007001', '列表界面', '007000!007001', '角色定义!列表界面', '0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de', '2', 'bas.sys.userrole.UserRoleListUI', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-c9d642e7-a4f3-4de0-ab9b-c00d710a315e', '007002', '编辑界面', '007000!007002', '角色定义!编辑界面', '0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de', '3', 'bas.sys.userrole.UserRoleEditUI', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-09471813-2cdd-4d3f-9732-871fc2d7eb94', '007003', '新增', '007000!007003', '角色定义!新增', '0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de', '5', 'bas.sys.userrole.UserRoleInfo', 'addnew', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-6c0de36d-e4a5-4b21-8894-de8329d4003c', '007004', '编辑', '007000!007004', '角色定义!编辑', '0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de', '5', 'bas.sys.userrole.UserRoleInfo', 'edit', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-e3dea012-e138-4776-ad50-c63bdec8c7e4', '007005', '删除', '007000!007005', '角色定义!删除', '0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de', '5', 'bas.sys.userrole.UserRoleInfo', 'delete', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-3f0a7531-62d9-42a7-b684-cd65045ca91c', '007006', '保存', '007000!007006', '角色定义!保存', '0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de', '5', 'bas.sys.userrole.UserRoleInfo', 'save', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-e8992f85-3d29-4385-b9ad-7899cad7682a', '008000', '用户', '008000', '用户', '', '0', 'bas.sys.user.UserInfo', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-035e11cd-ca30-48be-ad11-34453835c800', '008001', '列表界面', '008000!008001', '用户!列表界面', '0003-e8992f85-3d29-4385-b9ad-7899cad7682a', '2', 'bas.sys.user.UserListUI', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-242a05e5-5461-4984-a642-b2fc8160910d', '008002', '编辑界面', '008000!008002', '用户!编辑界面', '0003-e8992f85-3d29-4385-b9ad-7899cad7682a', '3', 'bas.sys.user.UserEditUI', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-16a8cb0c-dc43-439a-8e8c-10d258b21d0e', '008003', '新增', '008000!008003', '用户!新增', '0003-e8992f85-3d29-4385-b9ad-7899cad7682a', '5', 'bas.sys.user.UserInfo', 'addnew', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-bf919b79-edba-4fdf-9af5-270336b761f5', '008004', '编辑', '008000!008004', '用户!编辑', '0003-e8992f85-3d29-4385-b9ad-7899cad7682a', '5', 'bas.sys.user.UserInfo', 'edit', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-c18d3dde-cbc0-444f-a9ce-bb0821d86a2c', '008005', '删除', '008000!008005', '用户!删除', '0003-e8992f85-3d29-4385-b9ad-7899cad7682a', '5', 'bas.sys.user.UserInfo', 'delete', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-9f3e2210-8f96-4d72-bb1a-db12ef1c43b0', '008006', '保存', '008000!008006', '用户!保存', '0003-e8992f85-3d29-4385-b9ad-7899cad7682a', '5', 'bas.sys.user.UserInfo', 'save', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed', '009000', '员工职位', '009000', '员工职位', '', '0', 'bas.job.JobInfo', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-0a26c6f9-59e2-4494-a5bd-89f90fb7c691', '009001', '列表界面', '009000!009001', '员工职位!列表界面', '0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed', '2', 'bas.job.JobListUI', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-be58b61f-1adb-4927-ba47-09eb86944f47', '009002', '编辑界面', '009000!009002', '员工职位!编辑界面', '0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed', '3', 'bas.job.JobEditUI', '', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-4dd96bb0-cb8a-4242-94da-906598ce7a74', '009003', '新增', '009000!009003', '员工职位!新增', '0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed', '5', 'bas.job.JobInfo', 'addnew', '', '', '2016-10-04 13:25:55', '2016-10-04 13:25:55'), ('0003-e919f180-1d10-4f0d-86f0-6249d8082cf9', '009004', '编辑', '009000!009004', '员工职位!编辑', '0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed', '5', 'bas.job.JobInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-f633c4cb-d4e3-4a3f-87ec-6778bd1e8551', '009005', '删除', '009000!009005', '员工职位!删除', '0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed', '5', 'bas.job.JobInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-a7d8e9b0-f2ec-4cf3-b7bc-11ad7d4a9ce5', '009006', '保存', '009000!009006', '员工职位!保存', '0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed', '5', 'bas.job.JobInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38', '010000', '考勤策略', '010000', '考勤策略', '', '0', 'bas.attendance.AttendanceInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-855c3738-3082-4ac7-b6b7-9b8b2bb2326e', '010001', '列表界面', '010000!010001', '考勤策略!列表界面', '0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38', '2', 'bas.attendance.AttendanceListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-b9b02c65-838d-4fb5-8633-2c11e029d2b1', '010002', '编辑界面', '010000!010002', '考勤策略!编辑界面', '0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38', '3', 'bas.attendance.AttendanceEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-00f2074f-82d8-4e2d-a378-47527b33eb98', '010003', '新增', '010000!010003', '考勤策略!新增', '0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38', '5', 'bas.attendance.AttendanceInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-ddecd5d8-7e0e-46c9-88a1-233b44204ab9', '010004', '编辑', '010000!010004', '考勤策略!编辑', '0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38', '5', 'bas.attendance.AttendanceInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-9bbde7ce-3406-4e3e-93b7-44b48e01163a', '010005', '删除', '010000!010005', '考勤策略!删除', '0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38', '5', 'bas.attendance.AttendanceInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-82fef0ae-bf7a-46be-9dd6-6627dd90e912', '010006', '保存', '010000!010006', '考勤策略!保存', '0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38', '5', 'bas.attendance.AttendanceInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657', '011000', '提成比例', '011000', '提成比例', '', '0', 'bas.percent.PercentInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-1e6a580a-4987-403c-ab2c-9b707e86a50f', '011001', '列表界面', '011000!011001', '提成比例!列表界面', '0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657', '2', 'bas.percent.PercentListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-134df6c7-ded1-43c7-b449-0f5a4aadf5e3', '011002', '编辑界面', '011000!011002', '提成比例!编辑界面', '0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657', '3', 'bas.percent.PercentEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-1d267574-06a4-4119-ad67-9993e43afff0', '011003', '新增', '011000!011003', '提成比例!新增', '0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657', '5', 'bas.percent.PercentInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-36d75167-26cf-427b-b78f-20c064e49efa', '011004', '编辑', '011000!011004', '提成比例!编辑', '0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657', '5', 'bas.percent.PercentInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-44b23fc1-47ef-4482-b145-b1acccf42fb8', '011005', '删除', '011000!011005', '提成比例!删除', '0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657', '5', 'bas.percent.PercentInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-c7a533a6-d5e1-4f7c-b153-6f678f627018', '011006', '保存', '011000!011006', '提成比例!保存', '0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657', '5', 'bas.percent.PercentInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-9255e618-e79f-429f-b59c-d50a4ada7c6b', '012000', '员工', '012000', '员工', '', '0', 'bas.person.PersonInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-73634515-4028-4ade-84c9-434a573fc8f3', '012001', '列表界面', '012000!012001', '员工!列表界面', '0003-9255e618-e79f-429f-b59c-d50a4ada7c6b', '2', 'bas.person.PersonListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-a6789192-0440-43a0-b856-06610ed909c0', '012002', '编辑界面', '012000!012002', '员工!编辑界面', '0003-9255e618-e79f-429f-b59c-d50a4ada7c6b', '3', 'bas.person.PersonEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-80b4ecc7-760a-4877-92b8-3783f5f9568a', '012003', '新增', '012000!012003', '员工!新增', '0003-9255e618-e79f-429f-b59c-d50a4ada7c6b', '5', 'bas.person.PersonInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-2b9b9a5f-e181-40b3-b771-16dea5226637', '012004', '编辑', '012000!012004', '员工!编辑', '0003-9255e618-e79f-429f-b59c-d50a4ada7c6b', '5', 'bas.person.PersonInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-6c46adb3-85d0-4519-936e-15056cee5c7b', '012005', '删除', '012000!012005', '员工!删除', '0003-9255e618-e79f-429f-b59c-d50a4ada7c6b', '5', 'bas.person.PersonInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-04dd4945-86db-41a1-9e82-684798211720', '012006', '保存', '012000!012006', '员工!保存', '0003-9255e618-e79f-429f-b59c-d50a4ada7c6b', '5', 'bas.person.PersonInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-0980477c-7e9e-4efa-9a8f-22d78d381013', '013000', '员工工资单', '013000', '员工工资单', '', '0', 'bill.salary.SalaryInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-b446eae2-4065-4088-bd7d-ea49f8a7eaa7', '013001', '列表界面', '013000!013001', '员工工资单!列表界面', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013', '2', 'bill.salary.SalaryListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-46915174-b470-491f-ac44-1d5b8b9b12d5', '013002', '编辑界面', '013000!013002', '员工工资单!编辑界面', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013', '3', 'bill.salary.SalaryEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-1c08779c-ac54-44da-9bf7-68fe2e905cf7', '013003', '新增', '013000!013003', '员工工资单!新增', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013', '5', 'bill.salary.SalaryInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-c4bd4f90-34a9-41c0-93f4-b1eba9f63ac2', '013004', '编辑', '013000!013004', '员工工资单!编辑', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013', '5', 'bill.salary.SalaryInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-4cc54545-db72-4315-9353-e4115d6210ac', '013005', '删除', '013000!013005', '员工工资单!删除', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013', '5', 'bill.salary.SalaryInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-2e6a5454-7f54-41fc-ac9d-0fa2472e9144', '013006', '确认', '013000!013006', '员工工资单!确认', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013', '5', 'bill.salary.SalaryInfo', 'audittrue', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-a149d6e5-84ea-435f-87b4-81f926ec006d', '013007', '改单', '013000!013007', '员工工资单!改单', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013', '5', 'bill.salary.SalaryInfo', 'auditfalse', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-d7607f0e-a3a4-43da-b942-01fbe6e47294', '014000', '考勤记录', '014000', '考勤记录', '', '0', 'bill.attendrecord.AttendRecordInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-ad456bd1-09e6-4286-8ba4-402f2959894a', '014001', '列表界面', '014000!014001', '考勤记录!列表界面', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294', '2', 'bill.attendrecord.AttendRecordListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-55e51490-2ce9-4af9-b9dd-f4eaa8f8401e', '014002', '编辑界面', '014000!014002', '考勤记录!编辑界面', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294', '3', 'bill.attendrecord.AttendRecordEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-f7e927cf-4260-4ebd-a327-35be901dbe82', '014003', '新增', '014000!014003', '考勤记录!新增', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294', '5', 'bill.attendrecord.AttendRecordInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-ac301560-c19b-4b78-8bbd-ee88ed43bbae', '014004', '编辑', '014000!014004', '考勤记录!编辑', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294', '5', 'bill.attendrecord.AttendRecordInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-c44fc857-7510-4921-9fee-557eaf88a2e1', '014005', '删除', '014000!014005', '考勤记录!删除', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294', '5', 'bill.attendrecord.AttendRecordInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-c4dfbca1-3e7b-4cbb-9306-eb6841c1e8ee', '014006', '确认', '014000!014006', '考勤记录!确认', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294', '5', 'bill.attendrecord.AttendRecordInfo', 'audittrue', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-8f415956-8767-4eb9-89d1-a56f5c34b024', '014007', '改单', '014000!014007', '考勤记录!改单', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294', '5', 'bill.attendrecord.AttendRecordInfo', 'auditfalse', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-bb376046-43ac-447c-a094-2b9ab34a230f', '015000', '项目类型', '015000', '项目类型', '', '0', 'bas.project.group.ProjectGroupInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-d7024b09-4e02-4739-93d8-565ae71dc1c7', '015001', '列表界面', '015000!015001', '项目类型!列表界面', '0003-bb376046-43ac-447c-a094-2b9ab34a230f', '2', 'bas.project.group.ProjectGroupListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-befe6756-8197-46cf-85b6-3d005bc9e209', '015002', '编辑界面', '015000!015002', '项目类型!编辑界面', '0003-bb376046-43ac-447c-a094-2b9ab34a230f', '3', 'bas.project.group.ProjectGroupEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-a2a1380e-4c1d-46f6-a8c7-9e78bcf5ea8f', '015003', '新增', '015000!015003', '项目类型!新增', '0003-bb376046-43ac-447c-a094-2b9ab34a230f', '5', 'bas.project.group.ProjectGroupInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-1d8df33d-1e86-412f-abc0-efe2e1845032', '015004', '编辑', '015000!015004', '项目类型!编辑', '0003-bb376046-43ac-447c-a094-2b9ab34a230f', '5', 'bas.project.group.ProjectGroupInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-4c0c20da-e7ce-427c-bc6b-8525b1fd2fcf', '015005', '删除', '015000!015005', '项目类型!删除', '0003-bb376046-43ac-447c-a094-2b9ab34a230f', '5', 'bas.project.group.ProjectGroupInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-bc509be6-9216-4eb5-be29-0c55e885504c', '015006', '保存', '015000!015006', '项目类型!保存', '0003-bb376046-43ac-447c-a094-2b9ab34a230f', '5', 'bas.project.group.ProjectGroupInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-4212bcb3-457c-4d08-8bd1-6534d414f84e', '016000', '项目', '016000', '项目', '', '0', 'bas.project.ProjectInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-30a85729-42d6-4b25-8456-63469a3d3b00', '016001', '列表界面', '016000!016001', '项目!列表界面', '0003-4212bcb3-457c-4d08-8bd1-6534d414f84e', '2', 'bas.project.ProjectListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-aa350146-680f-4df6-b389-11518f4856d0', '016002', '编辑界面', '016000!016002', '项目!编辑界面', '0003-4212bcb3-457c-4d08-8bd1-6534d414f84e', '3', 'bas.project.ProjectEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-83137276-d0ae-4abd-a6a3-4a5147fd0574', '016003', '新增', '016000!016003', '项目!新增', '0003-4212bcb3-457c-4d08-8bd1-6534d414f84e', '5', 'bas.project.ProjectInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-dd1f1e85-a40e-49b0-9cdc-0d9e96c488a2', '016004', '编辑', '016000!016004', '项目!编辑', '0003-4212bcb3-457c-4d08-8bd1-6534d414f84e', '5', 'bas.project.ProjectInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-9ebd6a3b-7be4-4e1d-a008-40827d84a173', '016005', '删除', '016000!016005', '项目!删除', '0003-4212bcb3-457c-4d08-8bd1-6534d414f84e', '5', 'bas.project.ProjectInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-19cc2b57-9c80-4712-b5e3-f238f3fd898b', '016006', '保存', '016000!016006', '项目!保存', '0003-4212bcb3-457c-4d08-8bd1-6534d414f84e', '5', 'bas.project.ProjectInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-60a573a4-c585-4b21-8136-5daed3d875e7', '017000', '会员类型', '017000', '会员类型', '', '0', 'bas.vip.VipInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-59d721db-9afe-427c-8917-34edf1effba2', '017001', '列表界面', '017000!017001', '会员类型!列表界面', '0003-60a573a4-c585-4b21-8136-5daed3d875e7', '2', 'bas.vip.VipListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-6ef72c13-bad3-4773-a60a-4de66427291b', '017002', '编辑界面', '017000!017002', '会员类型!编辑界面', '0003-60a573a4-c585-4b21-8136-5daed3d875e7', '3', 'bas.vip.VipEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-ecd8bb2f-fcee-4b25-898c-b05d003abaa7', '017003', '新增', '017000!017003', '会员类型!新增', '0003-60a573a4-c585-4b21-8136-5daed3d875e7', '5', 'bas.vip.VipInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-e3d6a6d0-58f0-4b54-b9f6-941c1024976c', '017004', '编辑', '017000!017004', '会员类型!编辑', '0003-60a573a4-c585-4b21-8136-5daed3d875e7', '5', 'bas.vip.VipInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-c63924c3-6fac-4415-89ce-72c032ce7b6c', '017005', '删除', '017000!017005', '会员类型!删除', '0003-60a573a4-c585-4b21-8136-5daed3d875e7', '5', 'bas.vip.VipInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-b43480ac-4ff0-4fe6-a35c-97f52936c25d', '017006', '保存', '017000!017006', '会员类型!保存', '0003-60a573a4-c585-4b21-8136-5daed3d875e7', '5', 'bas.vip.VipInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9', '018000', '折扣策略', '018000', '折扣策略', '', '0', 'bas.discount.DiscountInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-496691d6-d56b-4c06-b1cb-5fb537adb53b', '018001', '列表界面', '018000!018001', '折扣策略!列表界面', '0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9', '2', 'bas.discount.DiscountListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-f5ddc2f8-3744-4731-b1d2-bbe6b9b3511c', '018002', '编辑界面', '018000!018002', '折扣策略!编辑界面', '0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9', '3', 'bas.discount.DiscountEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-e6197246-c442-4ab6-b725-d80472e9cd54', '018003', '新增', '018000!018003', '折扣策略!新增', '0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9', '5', 'bas.discount.DiscountInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-2df8df8d-ea55-452d-b59e-fc2a80546b9c', '018004', '编辑', '018000!018004', '折扣策略!编辑', '0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9', '5', 'bas.discount.DiscountInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-a98ef7a2-09a5-41bb-b3b6-2b8ccd86c8ef', '018005', '删除', '018000!018005', '折扣策略!删除', '0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9', '5', 'bas.discount.DiscountInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-8db9b837-fb35-476f-b320-4608b04eb929', '018006', '保存', '018000!018006', '折扣策略!保存', '0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9', '5', 'bas.discount.DiscountInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-a61a810e-fd36-4041-b033-a0359c145948', '019000', '客户', '019000', '客户', '', '0', 'bas.customer.CustomerInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-87e77cd7-a5d3-4043-84f9-526af10af3d1', '019001', '列表界面', '019000!019001', '客户!列表界面', '0003-a61a810e-fd36-4041-b033-a0359c145948', '2', 'bas.customer.CustomerListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-3608f749-17aa-4276-a278-3fce54d50daa', '019002', '编辑界面', '019000!019002', '客户!编辑界面', '0003-a61a810e-fd36-4041-b033-a0359c145948', '3', 'bas.customer.CustomerEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-54f0a293-9c8e-4702-953d-1d3b88b1f21c', '019003', '新增', '019000!019003', '客户!新增', '0003-a61a810e-fd36-4041-b033-a0359c145948', '5', 'bas.customer.CustomerInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-e4679c30-0d24-41cc-acf7-3f13b395d571', '019004', '编辑', '019000!019004', '客户!编辑', '0003-a61a810e-fd36-4041-b033-a0359c145948', '5', 'bas.customer.CustomerInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-6695a5e5-d4db-4832-badf-5881da74b1c8', '019005', '删除', '019000!019005', '客户!删除', '0003-a61a810e-fd36-4041-b033-a0359c145948', '5', 'bas.customer.CustomerInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-d779294e-7c0c-4aea-8409-7eb96ce2c6d0', '019006', '保存', '019000!019006', '客户!保存', '0003-a61a810e-fd36-4041-b033-a0359c145948', '5', 'bas.customer.CustomerInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7', '020000', '充值记录', '020000', '充值记录', '', '0', 'bill.recharge.RechargeRecordInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-ccea19b6-c7e0-4981-84fa-2e1ce884abba', '020001', '列表界面', '020000!020001', '充值记录!列表界面', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7', '2', 'bill.recharge.RechargeRecordListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-3b916594-ee33-415c-aac9-3547a3864c0a', '020002', '编辑界面', '020000!020002', '充值记录!编辑界面', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7', '3', 'bill.recharge.RechargeRecordEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-327c49c6-ecbe-44cd-8a6c-7d95e409486c', '020003', '新增', '020000!020003', '充值记录!新增', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7', '5', 'bill.recharge.RechargeRecordInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-c4cefb67-d9c3-45ee-86fb-617948914dfa', '020004', '编辑', '020000!020004', '充值记录!编辑', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7', '5', 'bill.recharge.RechargeRecordInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-415ad7c2-cc3a-47b5-ae7a-532b06244496', '020005', '删除', '020000!020005', '充值记录!删除', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7', '5', 'bill.recharge.RechargeRecordInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-4ecb4827-39bc-462a-8bf6-97b6ff4a2565', '020006', '确认', '020000!020006', '充值记录!确认', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7', '5', 'bill.recharge.RechargeRecordInfo', 'audittrue', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-3a6734cf-6668-4726-94ee-a50fe18cbff1', '020007', '改单', '020000!020007', '充值记录!改单', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7', '5', 'bill.recharge.RechargeRecordInfo', 'auditfalse', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-2aeb0586-65fa-4bab-95ee-280759977f79', '021000', '充值优惠', '021000', '充值优惠', '', '0', 'bill.rechargegive.RechargeGiveInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-d8fcc626-96d4-429c-8251-12d57bb1c431', '021001', '列表界面', '021000!021001', '充值优惠!列表界面', '0003-2aeb0586-65fa-4bab-95ee-280759977f79', '2', 'bill.rechargegive.RechargeGiveListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-d903f147-6db3-44f5-8a0c-4bbac7467157', '021002', '编辑界面', '021000!021002', '充值优惠!编辑界面', '0003-2aeb0586-65fa-4bab-95ee-280759977f79', '3', 'bill.rechargegive.RechargeGiveEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-fccf4c14-73eb-4d12-9285-0ba3bad1682f', '021003', '新增', '021000!021003', '充值优惠!新增', '0003-2aeb0586-65fa-4bab-95ee-280759977f79', '5', 'bill.rechargegive.RechargeGiveInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-574df5b9-e2d8-48fc-951d-56772faa6a0a', '021004', '编辑', '021000!021004', '充值优惠!编辑', '0003-2aeb0586-65fa-4bab-95ee-280759977f79', '5', 'bill.rechargegive.RechargeGiveInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-3a1d09e0-3fce-421f-a071-513ffe5f3eb5', '021005', '删除', '021000!021005', '充值优惠!删除', '0003-2aeb0586-65fa-4bab-95ee-280759977f79', '5', 'bill.rechargegive.RechargeGiveInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-044babde-6b9f-4c2b-9ebe-72cbfd47266b', '021006', '确认', '021000!021006', '充值优惠!确认', '0003-2aeb0586-65fa-4bab-95ee-280759977f79', '5', 'bill.rechargegive.RechargeGiveInfo', 'audittrue', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-315e6a10-7a51-4dce-8eff-eb2758e246be', '021007', '改单', '021000!021007', '充值优惠!改单', '0003-2aeb0586-65fa-4bab-95ee-280759977f79', '5', 'bill.rechargegive.RechargeGiveInfo', 'auditfalse', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b', '022000', '计量单位', '022000', '计量单位', '', '0', 'bas.measureunit.MeasureUnitInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-dad1464e-ea36-449f-b0d0-167be7e05afd', '022001', '列表界面', '022000!022001', '计量单位!列表界面', '0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b', '2', 'bas.measureunit.MeasureUnitListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-ce907f31-5a0c-4268-9da4-4772497754a6', '022002', '编辑界面', '022000!022002', '计量单位!编辑界面', '0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b', '3', 'bas.measureunit.MeasureUnitEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-70c39a27-86fb-4c52-ae10-d8c446a07d61', '022003', '新增', '022000!022003', '计量单位!新增', '0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b', '5', 'bas.measureunit.MeasureUnitInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-a178be9f-66d7-44c6-b4c7-6c39b91f7b81', '022004', '编辑', '022000!022004', '计量单位!编辑', '0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b', '5', 'bas.measureunit.MeasureUnitInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-ef49c10a-9709-4ef4-a20a-66206898eb5b', '022005', '删除', '022000!022005', '计量单位!删除', '0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b', '5', 'bas.measureunit.MeasureUnitInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-1186556c-b616-469e-be0f-18a7e13f3311', '022006', '保存', '022000!022006', '计量单位!保存', '0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b', '5', 'bas.measureunit.MeasureUnitInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-94cd8d8e-8f2c-4872-b86f-06096573be85', '023000', '产品类型', '023000', '产品类型', '', '0', 'bas.material.group.MaterialGroupInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-165fceb5-0b5d-4cee-b568-b19dd99a22f6', '023001', '列表界面', '023000!023001', '产品类型!列表界面', '0003-94cd8d8e-8f2c-4872-b86f-06096573be85', '2', 'bas.material.group.MaterialGroupListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-5be48f0c-0273-4ab1-9fd4-b37f629bc2e5', '023002', '编辑界面', '023000!023002', '产品类型!编辑界面', '0003-94cd8d8e-8f2c-4872-b86f-06096573be85', '3', 'bas.material.group.MaterialGroupEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-52b71b7e-c8fb-43dd-bb3f-3a41126ac46a', '023003', '新增', '023000!023003', '产品类型!新增', '0003-94cd8d8e-8f2c-4872-b86f-06096573be85', '5', 'bas.material.group.MaterialGroupInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-70d66d2d-f215-4c05-a3e9-65ef9731b6d5', '023004', '编辑', '023000!023004', '产品类型!编辑', '0003-94cd8d8e-8f2c-4872-b86f-06096573be85', '5', 'bas.material.group.MaterialGroupInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-a590e3ad-9aa0-4061-afb4-70934a114302', '023005', '删除', '023000!023005', '产品类型!删除', '0003-94cd8d8e-8f2c-4872-b86f-06096573be85', '5', 'bas.material.group.MaterialGroupInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-25e1feda-1443-4c30-82ce-42fe6eff0a18', '023006', '保存', '023000!023006', '产品类型!保存', '0003-94cd8d8e-8f2c-4872-b86f-06096573be85', '5', 'bas.material.group.MaterialGroupInfo', 'save', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41', '024000', '产品', '024000', '产品', '', '0', 'bas.material.MaterialInfo', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-708dadae-72f1-4309-9132-fa1503529154', '024001', '列表界面', '024000!024001', '产品!列表界面', '0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41', '2', 'bas.material.MaterialListUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-2c0af578-195a-4ed8-8b66-a253e8a60bb3', '024002', '编辑界面', '024000!024002', '产品!编辑界面', '0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41', '3', 'bas.material.MaterialEditUI', '', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-5b016ba1-7604-49fe-b44c-7a1c3a1a53a6', '024003', '新增', '024000!024003', '产品!新增', '0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41', '5', 'bas.material.MaterialInfo', 'addnew', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-3f0d8e2f-6d39-4fae-8034-64e110416422', '024004', '编辑', '024000!024004', '产品!编辑', '0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41', '5', 'bas.material.MaterialInfo', 'edit', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-21fa8f4d-4b11-4d3b-94a5-3fc6415fab5e', '024005', '删除', '024000!024005', '产品!删除', '0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41', '5', 'bas.material.MaterialInfo', 'delete', '', '', '2016-10-04 13:25:56', '2016-10-04 13:25:56'), ('0003-f09e71ab-fa88-45b6-b9ee-aa32a5c5b867', '024006', '保存', '024000!024006', '产品!保存', '0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41', '5', 'bas.material.MaterialInfo', 'save', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-0c3055c8-9fe0-431a-b131-9ff17d495da8', '025000', '采购单', '025000', '采购单', '', '0', 'bill.purchase.PurchaseInfo', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-eb3563d9-0121-4421-8971-9868de9078b3', '025001', '列表界面', '025000!025001', '采购单!列表界面', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8', '2', 'bill.purchase.PurchaseListUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-1bea1e63-451a-4280-a32f-781acd40e4d2', '025002', '编辑界面', '025000!025002', '采购单!编辑界面', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8', '3', 'bill.purchase.PurchaseEditUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-304698bb-e576-41fa-a366-01d7228beae4', '025003', '新增', '025000!025003', '采购单!新增', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8', '5', 'bill.purchase.PurchaseInfo', 'addnew', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-1f1ab1f0-055a-4186-b41d-04a708dbb17c', '025004', '编辑', '025000!025004', '采购单!编辑', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8', '5', 'bill.purchase.PurchaseInfo', 'edit', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-babcf3af-b737-43ad-a04a-a3453d478108', '025005', '删除', '025000!025005', '采购单!删除', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8', '5', 'bill.purchase.PurchaseInfo', 'delete', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-6edee99b-e939-4fed-826f-126589d0b9e7', '025006', '确认', '025000!025006', '采购单!确认', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8', '5', 'bill.purchase.PurchaseInfo', 'audittrue', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-e19368bf-6178-428f-8a9a-16ed056c2994', '025007', '改单', '025000!025007', '采购单!改单', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8', '5', 'bill.purchase.PurchaseInfo', 'auditfalse', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0', '026000', '供应商', '026000', '供应商', '', '0', 'bas.supplier.SupplierInfo', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-d1fe4ca3-0321-4f53-89cd-46dc29273b5e', '026001', '列表界面', '026000!026001', '供应商!列表界面', '0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0', '2', 'bas.supplier.SupplierListUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-64f051f7-4090-4639-8c8d-f3cf668e1f00', '026002', '编辑界面', '026000!026002', '供应商!编辑界面', '0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0', '3', 'bas.supplier.SupplierEditUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-f7ddd96e-242c-415c-bbdf-9b69c9a598ef', '026003', '新增', '026000!026003', '供应商!新增', '0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0', '5', 'bas.supplier.SupplierInfo', 'addnew', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-f656a86a-57d5-45b1-a556-5c9310013fdd', '026004', '编辑', '026000!026004', '供应商!编辑', '0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0', '5', 'bas.supplier.SupplierInfo', 'edit', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-06cf52ee-5f07-480d-a2e8-774a716e9926', '026005', '删除', '026000!026005', '供应商!删除', '0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0', '5', 'bas.supplier.SupplierInfo', 'delete', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-5cca01fe-0bc8-4d62-8af1-40f304152a6d', '026006', '保存', '026000!026006', '供应商!保存', '0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0', '5', 'bas.supplier.SupplierInfo', 'save', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab', '027000', '价目表维护', '027000', '价目表维护', '', '0', 'bill.price.PriceInfo', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-7ff04fcc-1782-49b1-b443-d818bd6cb0fa', '027001', '列表界面', '027000!027001', '价目表维护!列表界面', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab', '2', 'bill.price.PriceListUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-2bff7195-781b-483c-bc51-c71df06e57f2', '027002', '编辑界面', '027000!027002', '价目表维护!编辑界面', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab', '3', 'bill.price.PriceEditUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-0fc8ce4d-49ed-49c5-a2b4-9f397d5bcc88', '027003', '新增', '027000!027003', '价目表维护!新增', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab', '5', 'bill.price.PriceInfo', 'addnew', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-6db300bd-3e3d-4509-8c25-e6f430997753', '027004', '编辑', '027000!027004', '价目表维护!编辑', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab', '5', 'bill.price.PriceInfo', 'edit', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-dbdeff94-72cc-4caf-a935-357496b84d4e', '027005', '删除', '027000!027005', '价目表维护!删除', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab', '5', 'bill.price.PriceInfo', 'delete', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-79eaed61-3fa1-40bc-b53b-75f98656456d', '027006', '确认', '027000!027006', '价目表维护!确认', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab', '5', 'bill.price.PriceInfo', 'audittrue', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-6d582e73-0d94-4f49-81a1-6563e0db34bc', '027007', '改单', '027000!027007', '价目表维护!改单', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab', '5', 'bill.price.PriceInfo', 'auditfalse', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-8e46c38f-7530-4454-8417-ae8dd51bedc6', '028000', '销售单', '028000', '销售单', '', '0', 'bill.sale.SaleInfo', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-c6312782-88aa-4153-a75f-a41b3e98db19', '028001', '列表界面', '028000!028001', '销售单!列表界面', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6', '2', 'bill.sale.SaleListUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-5c81d9da-c002-4dfa-a0e4-9f697d5f79ea', '028002', '编辑界面', '028000!028002', '销售单!编辑界面', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6', '3', 'bill.sale.SaleEditUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-660d5725-f47d-418a-a12a-cb37bd3ff776', '028003', '新增', '028000!028003', '销售单!新增', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6', '5', 'bill.sale.SaleInfo', 'addnew', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-5dfa599e-5be1-4f1f-a439-e8c16b801d3f', '028004', '编辑', '028000!028004', '销售单!编辑', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6', '5', 'bill.sale.SaleInfo', 'edit', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-8f81d8be-5823-45f5-8b86-9fdaa17b1cba', '028005', '删除', '028000!028005', '销售单!删除', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6', '5', 'bill.sale.SaleInfo', 'delete', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-912c7b89-caeb-4965-b1eb-79790099c79e', '028006', '确认', '028000!028006', '销售单!确认', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6', '5', 'bill.sale.SaleInfo', 'audittrue', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-61a175e8-5a6f-44cd-b233-6b50e03d89da', '028007', '改单', '028000!028007', '销售单!改单', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6', '5', 'bill.sale.SaleInfo', 'auditfalse', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-db070ea3-8bf1-4884-a799-f9c963156e1e', '029000', '服务单', '029000', '服务单', '', '0', 'bill.service.ServiceInfo', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-87655fea-a6ad-483b-9ea2-9bb6d7e5f451', '029001', '列表界面', '029000!029001', '服务单!列表界面', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e', '2', 'bill.service.ServiceListUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-7a4d5fc0-add7-4365-b2a4-14e183d2aa77', '029002', '编辑界面', '029000!029002', '服务单!编辑界面', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e', '3', 'bill.service.ServiceEditUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-3cc5fc0e-e80a-4c83-818d-33d39b1cbfda', '029003', '新增', '029000!029003', '服务单!新增', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e', '5', 'bill.service.ServiceInfo', 'addnew', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-9974c46b-79e4-44c1-bd2b-750c442161bd', '029004', '编辑', '029000!029004', '服务单!编辑', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e', '5', 'bill.service.ServiceInfo', 'edit', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-43d6d728-7520-4500-abbb-c678abd6a50a', '029005', '删除', '029000!029005', '服务单!删除', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e', '5', 'bill.service.ServiceInfo', 'delete', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-8dd4bace-72e7-4882-a8a1-4f3fb2f09598', '029006', '确认', '029000!029006', '服务单!确认', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e', '5', 'bill.service.ServiceInfo', 'audittrue', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-5378a42c-0510-4c71-86aa-a0ce7fa0aa50', '029007', '改单', '029000!029007', '服务单!改单', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e', '5', 'bill.service.ServiceInfo', 'auditfalse', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-21a5ce84-785d-4e60-8b78-7f7c192d2cd6', '030000', '收银前台', '030000', '收银前台', '', '2', 'ui.center.NailCenterUI', '', '', '', '2016-10-04 13:25:57', '2016-10-04 13:25:57'), ('0003-20fae3ec-3ed5-41e7-9372-07ac4f399558', '000120161004153550', '显示电话号码', '019000!019002!000120161004153550', '客户!编辑界面!显示电话号码', '0003-3608f749-17aa-4276-a278-3fce54d50daa', '4', 'bas.customer.CustomerEditUI', 'btnShowPhone', '', '', '2016-10-04 15:36:59', '2016-10-04 15:36:59'), ('0003-256607b7-362b-45d5-988b-8516a23faebe', '02600201', '显示电话号码', '026000!026002!02600201', '供应商!编辑界面!显示电话号码', '0003-64f051f7-4090-4639-8c8d-f3cf668e1f00', '2', 'bas.supplier.SupplierEditUI', 'btnShowPhone', '', '', '2016-10-04 15:37:14', '2016-10-04 15:37:14'), ('0003-7ef3afd4-24f7-4c14-aceb-07e566345bfd', '031001', '统计报表', '031001', '统计报表', '', '1', '3423423', '', '', '', '2016-10-12 03:34:33', '2016-10-12 03:34:33'), ('0003-8033cc65-3d7f-48eb-b644-64e6ea834ba0', '31002', '项目消费记录查询', '31002', '项目消费记录查询', '', '1', 'report.listrpt.ui.ListRptUI', '0036-49210375-fe20-4c05-a40b-114008182849', '', '', '2016-10-26 22:40:01', '2016-10-26 22:40:01'), ('0003-484ce96e-3308-4fde-a553-18f0629edcc7', '31003', '客户余额跟踪报表', '31003', '客户余额跟踪报表', '', '1', 'report.listrpt.ui.ListRptUI', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', '', '', '2016-11-29 05:10:46', '2016-11-29 05:10:46');
COMMIT;

-- ----------------------------
--  Table structure for `base_person`
-- ----------------------------
DROP TABLE IF EXISTS `base_person`;
CREATE TABLE `base_person` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fpst` int(11) DEFAULT '0',
  `fjobId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpersonId` varchar(25) DEFAULT NULL,
  `fbirth` varchar(25) DEFAULT NULL,
  `fphone` varchar(25) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_project`
-- ----------------------------
DROP TABLE IF EXISTS `base_project`;
CREATE TABLE `base_project` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
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

-- ----------------------------
--  Table structure for `base_projectgroup`
-- ----------------------------
DROP TABLE IF EXISTS `base_projectgroup`;
CREATE TABLE `base_projectgroup` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_shop`
-- ----------------------------
DROP TABLE IF EXISTS `base_shop`;
CREATE TABLE `base_shop` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `flongnumber` varchar(255) DEFAULT NULL,
  `flongname` varchar(255) DEFAULT NULL,
  `fparentid` varchar(44) DEFAULT NULL,
  `fst` int(11) DEFAULT '0',
  `fpft` int(11) DEFAULT '0',
  `faddress` varchar(100) DEFAULT NULL,
  `fphone` varchar(44) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_shop`
-- ----------------------------
BEGIN;
INSERT INTO `base_shop` VALUES ('0001', '0001', '铭洋管理店', '0001', '铭洋管理店', '', '1', '0', '广东省云浮市新兴县', '18023757191', '', '', '2016-09-20 19:47:12', '2016-09-20 19:47:12'), ('0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0002', '杨龙纹身美甲点', '0002', '杨龙纹身美甲点', '', '1', '1', '233223', '', '', '', '2016-12-04 00:15:30', '2016-12-04 00:15:30'), ('0004-5ed230a7-6f70-4f47-bcad-3bac07056fd2', '0003', '清镇店', '0002!0003', '杨龙纹身美甲点!清镇店', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '0', '2332', '3233', '', '', '2016-12-04 00:15:31', '2016-12-04 00:15:31');
COMMIT;

-- ----------------------------
--  Table structure for `base_shopbalance`
-- ----------------------------
DROP TABLE IF EXISTS `base_shopbalance`;
CREATE TABLE `base_shopbalance` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcustomerShopId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT '0',
  `fprice` double DEFAULT '0',
  `fisSms` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_shopbalance`
-- ----------------------------
BEGIN;
INSERT INTO `base_shopbalance` VALUES ('0028-56162146-4228-4fa1-a531-b7e2739031c2', '', '', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '30', '30', '0', '001', '001', '2016-12-04 00:15:30', '2016-12-04 00:15:30');
COMMIT;

-- ----------------------------
--  Table structure for `base_shopparam`
-- ----------------------------
DROP TABLE IF EXISTS `base_shopparam`;
CREATE TABLE `base_shopparam` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fshopName` varchar(100) DEFAULT NULL,
  `fshopPhone` varchar(100) DEFAULT NULL,
  `fhour` int(11) DEFAULT '22',
  `fday` int(11) DEFAULT '1',
  `fisSaleEntry` tinyint(3) DEFAULT '0',
  `fisPurchaseEntry` tinyint(3) DEFAULT '0',
  `fisBossSms` tinyint(3) DEFAULT '0',
  `fisCustomerSms` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_shopparam`
-- ----------------------------
BEGIN;
INSERT INTO `base_shopparam` VALUES ('0039-a958f8341e9547aa9fab4009d5d9be6a', '0003', '清镇店', '0004-5ed230a7-6f70-4f47-bcad-3bac07056fd2', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', null, '18023757191', '22', '1', '1', '1', '1', '1', '001', '001', '2016-12-04 15:50:13', '2016-12-04 15:51:58');
COMMIT;

-- ----------------------------
--  Table structure for `base_shopstock`
-- ----------------------------
DROP TABLE IF EXISTS `base_shopstock`;
CREATE TABLE `base_shopstock` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fmaterialId` varchar(44) DEFAULT NULL,
  `fqty` double DEFAULT '0',
  `fupTime` varchar(25) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `base_supplier`;
CREATE TABLE `base_supplier` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fphone` varchar(100) DEFAULT NULL,
  `faddress` varchar(100) DEFAULT NULL,
  `fremark` varchar(255) DEFAULT NULL,
  `fisEnable` tinyint(3) DEFAULT '1',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `base_user`
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fpassword` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminshopid` varchar(44) DEFAULT NULL,
  `fdefShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_user`
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES ('001', 'admin', '管理员', 'admin', '001', '', '0001', '0', '', '001', '2016-09-18 13:23:29', '2016-12-09 20:21:33'), ('0001-2c29e22e-5cc2-4413-981a-9e48b7bbf127', '0003', '清镇店收银员', '123456', '0004-5ed230a7-6f70-4f47-bcad-3bac07056fd2', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-5ed230a7-6f70-4f47-bcad-3bac07056fd2', '0', '001', '001', '2016-12-04 00:15:31', '2016-12-04 00:15:31'), ('0001-53d45395-911d-493d-bd9b-cce78547ffa8', 'lijiajie', '杨龙纹身美甲点管理员', '1', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0', '001', '0001-53d45395-911d-493d-bd9b-cce78547ffa8', '2016-12-04 00:15:31', '2016-12-09 20:24:58');
COMMIT;

-- ----------------------------
--  Table structure for `base_user_roleentry`
-- ----------------------------
DROP TABLE IF EXISTS `base_user_roleentry`;
CREATE TABLE `base_user_roleentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `froleid` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_user_roleentry`
-- ----------------------------
BEGIN;
INSERT INTO `base_user_roleentry` VALUES ('000101-ee268df1-4463-4594-b843-83e5a841062f', '0', '0001-2c29e22e-5cc2-4413-981a-9e48b7bbf127', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a'), ('000101-f5f2655bacad49adbe4194bcff29e591', '0', '0001-53d45395-911d-493d-bd9b-cce78547ffa8', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f');
COMMIT;

-- ----------------------------
--  Table structure for `base_user_shopentry`
-- ----------------------------
DROP TABLE IF EXISTS `base_user_shopentry`;
CREATE TABLE `base_user_shopentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_user_shopentry`
-- ----------------------------
BEGIN;
INSERT INTO `base_user_shopentry` VALUES ('000102-136d9cc3-a7cc-43e2-ac15-376644b720a5', '0', '0001-2c29e22e-5cc2-4413-981a-9e48b7bbf127', '0004-5ed230a7-6f70-4f47-bcad-3bac07056fd2'), ('000102-7fcee5a1ed154983aa92b6e5edff7179', '0', '0001-53d45395-911d-493d-bd9b-cce78547ffa8', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4'), ('000102-9dae1496095548e0ae8adbf20cd472ec', '0', '0001-53d45395-911d-493d-bd9b-cce78547ffa8', '0004-5ed230a7-6f70-4f47-bcad-3bac07056fd2');
COMMIT;

-- ----------------------------
--  Table structure for `base_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `base_userrole`;
CREATE TABLE `base_userrole` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_userrole`
-- ----------------------------
BEGIN;
INSERT INTO `base_userrole` VALUES ('0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0001', '管理员', '0001', '', '0', '001', '001', '2016-10-05 19:19:45', '2016-10-27 00:10:35'), ('0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0002', '收银员', '0001', '', '0', '001', '001', '2016-10-05 19:20:25', '2016-10-05 19:20:25'), ('0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0001', '杨龙纹身美甲点管理员', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '2', '001', '001', '2016-12-04 00:15:30', '2016-12-04 00:15:30'), ('0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0002', '杨龙纹身美甲点收银员', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '0004-ac3eb718-259e-491a-b7f8-333c920f2da4', '1', '001', '001', '2016-12-04 00:15:30', '2016-12-04 00:15:30');
COMMIT;

-- ----------------------------
--  Table structure for `base_userrole_perentry`
-- ----------------------------
DROP TABLE IF EXISTS `base_userrole_perentry`;
CREATE TABLE `base_userrole_perentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fpermissionid` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `base_userrole_perentry`
-- ----------------------------
BEGIN;
INSERT INTO `base_userrole_perentry` VALUES ('000201-7ced90ba-22fd-4f76-9ba8-3121f18f5b45', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294'), ('000201-48d9cd4d-0b30-49c6-862a-83331f3b9219', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-8f81d8be-5823-45f5-8b86-9fdaa17b1cba'), ('000201-4e9847e6-f5bd-463d-b6a0-a160879d47dc', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-3a6734cf-6668-4726-94ee-a50fe18cbff1'), ('000201-501deb11-a6e2-4abb-b30f-51742cd9b653', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-a61a810e-fd36-4041-b033-a0359c145948'), ('000201-114c6819-e960-4694-91fa-3dffa7886f32', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-5378a42c-0510-4c71-86aa-a0ce7fa0aa50'), ('000201-f37bc527-9e62-44d2-9fd6-e3f7b4792556', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6'), ('000201-e59ca6e9-0f56-4a97-999f-059c8ee87474', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-8f415956-8767-4eb9-89d1-a56f5c34b024'), ('000201-5ba609c4-891f-42c5-9fc8-c0b8acaa4540', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-ac301560-c19b-4b78-8bbd-ee88ed43bbae'), ('000201-188821e7-dcfd-4f66-9e23-407ff6e659ba', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-5dfa599e-5be1-4f1f-a439-e8c16b801d3f'), ('000201-1c2c2118-7584-402c-9a50-e525f9f95038', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-8dd4bace-72e7-4882-a8a1-4f3fb2f09598'), ('000201-903730ff-334e-49d5-80af-6a4eccd672cb', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-660d5725-f47d-418a-a12a-cb37bd3ff776'), ('000201-121f7c14-a5bd-40f0-b4b4-374d3174a2e1', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-3b916594-ee33-415c-aac9-3547a3864c0a'), ('000201-ae0a0457-7632-4186-b09c-60758851b12f', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-ccea19b6-c7e0-4981-84fa-2e1ce884abba'), ('000201-ce3985f4-7680-444d-8ff7-3671f89b7d14', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-87655fea-a6ad-483b-9ea2-9bb6d7e5f451'), ('000201-1e1deeb2-4af1-4e12-ba5a-aa7c4477f185', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-327c49c6-ecbe-44cd-8a6c-7d95e409486c'), ('000201-c673ee14-8d35-42b9-82ce-b6ef096e72c4', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-54f0a293-9c8e-4702-953d-1d3b88b1f21c'), ('000201-ab80bcb1-c264-456c-a55f-f06a2ef0dedf', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-7a4d5fc0-add7-4365-b2a4-14e183d2aa77'), ('000201-7be33454-6f2f-4b99-840f-f10d3e8aa149', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-61a175e8-5a6f-44cd-b233-6b50e03d89da'), ('000201-a5c8239a-87cd-454c-aace-ed61f0c2d830', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-f7e927cf-4260-4ebd-a327-35be901dbe82'), ('000201-91f2b904-2914-4736-850c-a1659823e03e', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-c4cefb67-d9c3-45ee-86fb-617948914dfa'), ('000201-ea1066ee-d7ea-4918-8e4e-f2238bf4fecf', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-9974c46b-79e4-44c1-bd2b-750c442161bd'), ('000201-f29bb5b6-f602-46c7-b902-1a6fc5532d91', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-415ad7c2-cc3a-47b5-ae7a-532b06244496'), ('000201-95646657-d108-4f6d-b714-c1d34047a977', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-87e77cd7-a5d3-4043-84f9-526af10af3d1'), ('000201-2df410e2-9206-4d71-82ce-f34b6afae49d', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-e4679c30-0d24-41cc-acf7-3f13b395d571'), ('000201-0131b39a-b898-4341-9074-312b9f79d61d', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-c44fc857-7510-4921-9fee-557eaf88a2e1'), ('000201-eb1e8d3f-2d74-4e14-9112-2a93124df758', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-5c81d9da-c002-4dfa-a0e4-9f697d5f79ea'), ('000201-ec825127-1677-456e-b9d6-103b4e720785', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7'), ('000201-5363c8c3-6fb7-4301-89db-712e76b8d2c9', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-d779294e-7c0c-4aea-8409-7eb96ce2c6d0'), ('000201-4b5b33b2-507c-43cd-b6f5-a4fd1a95962e', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-3cc5fc0e-e80a-4c83-818d-33d39b1cbfda'), ('000201-816a4739-8590-4bc9-9aa4-464fed29756e', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-4ecb4827-39bc-462a-8bf6-97b6ff4a2565'), ('000201-5d1a6154-7faa-4128-8d71-510206a34628', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-912c7b89-caeb-4965-b1eb-79790099c79e'), ('000201-625cf117-f7b2-4bab-94a9-2cf0fd4a1e98', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-c6312782-88aa-4153-a75f-a41b3e98db19'), ('000201-6c8e5c36-af96-4446-8a3d-c9299ca47486', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-3608f749-17aa-4276-a278-3fce54d50daa'), ('000201-86ec8e80-a797-4578-8d00-781617fcd945', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e'), ('000201-c6542450-584b-4d87-ba54-60566e355ec2', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-ad456bd1-09e6-4286-8ba4-402f2959894a'), ('000201-d634aa68-2690-4daa-9bc1-0eb448e1dec8', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-55e51490-2ce9-4af9-b9dd-f4eaa8f8401e'), ('000201-c6f63223-7dea-496d-8279-04cf0ef730b9', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-c4dfbca1-3e7b-4cbb-9306-eb6841c1e8ee'), ('000201-2eff9f27-1910-43df-b03e-f86593ad4bb9', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-43d6d728-7520-4500-abbb-c678abd6a50a'), ('000201-9d82ee41-99e1-4980-9990-57035da4f3a3', '0', '0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09', '0003-21a5ce84-785d-4e60-8b78-7f7c192d2cd6'), ('000201-fe41dc6c-4fb0-4077-9b1a-e739ca74f37e', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0'), ('000201-8fa52add-08bd-4fda-9a18-b1a139d48a6c', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', ''), ('000201-c7ecbd01-d527-4d03-9795-72dccf9945c8', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-708dadae-72f1-4309-9132-fa1503529154'), ('000201-2b788a25-4d58-413d-af38-7b728c25bd84', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294'), ('000201-6502db8b-00b9-4ddc-b672-aa40a0b106b8', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-70d66d2d-f215-4c05-a3e9-65ef9731b6d5'), ('000201-6a94260a-4157-4cdc-b756-e68ade258fcc', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a2a1380e-4c1d-46f6-a8c7-9e78bcf5ea8f'), ('000201-a4337d51-6c7a-4c1b-9eac-d4a15257170d', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-8f81d8be-5823-45f5-8b86-9fdaa17b1cba'), ('000201-8e8c1df7-9cf7-4644-b820-4d1132cb72e5', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a61a810e-fd36-4041-b033-a0359c145948'), ('000201-1deb2cd9-fdf7-4704-9b6d-4ff2e0b203cd', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-36d75167-26cf-427b-b78f-20c064e49efa'), ('000201-4c0d164b-6aa6-4846-9f33-b23a6278e85d', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-3a6734cf-6668-4726-94ee-a50fe18cbff1'), ('000201-dc9059dd-4351-4b9f-afcd-d840d645a133', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-7ff04fcc-1782-49b1-b443-d818bd6cb0fa'), ('000201-39242cf2-1398-4508-91ad-96a116be3627', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-1186556c-b616-469e-be0f-18a7e13f3311'), ('000201-07dfab6e-f070-4b4c-b827-bfbc1f0b7d71', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-5378a42c-0510-4c71-86aa-a0ce7fa0aa50'), ('000201-b272f75f-b5d3-478b-9f83-ed1164535cc7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-134df6c7-ded1-43c7-b449-0f5a4aadf5e3'), ('000201-b9a75479-a14b-45ba-b517-d07f7016ff5f', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-2e6a5454-7f54-41fc-ac9d-0fa2472e9144'), ('000201-4c36224b-630f-43a2-8c6e-07fcf8535f04', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-574df5b9-e2d8-48fc-951d-56772faa6a0a'), ('000201-b45eeb2b-477e-4670-8224-b7433261965c', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-4cc54545-db72-4315-9353-e4115d6210ac'), ('000201-d374de01-c15d-4aee-9791-3650cec05555', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-f5ddc2f8-3744-4731-b1d2-bbe6b9b3511c'), ('000201-977de8dd-3bdd-492e-8a88-228119a44c5e', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-04dd4945-86db-41a1-9e82-684798211720'), ('000201-6d29f6c3-0b39-4fba-adbb-6cb835c2510b', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-82fef0ae-bf7a-46be-9dd6-6627dd90e912'), ('000201-3b6a34e5-a7b8-45ad-b2e1-40fa860ba0e7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-e19368bf-6178-428f-8a9a-16ed056c2994'), ('000201-68898394-0c3b-4f0e-8356-ce014c18b8b3', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6'), ('000201-2324adb5-503d-4a4c-bcbc-779b66f202cc', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-8f415956-8767-4eb9-89d1-a56f5c34b024'), ('000201-932f1d61-43e6-4209-8951-f0d606eb0cac', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-2df8df8d-ea55-452d-b59e-fc2a80546b9c'), ('000201-d20768cb-3801-4bf7-a08d-ed930562ba21', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-ac301560-c19b-4b78-8bbd-ee88ed43bbae'), ('000201-0c13c029-1665-44f5-a2d2-1fee86467314', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-94cd8d8e-8f2c-4872-b86f-06096573be85'), ('000201-454a4329-6d46-4f0a-9765-1e4ae6c251f2', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-5dfa599e-5be1-4f1f-a439-e8c16b801d3f'), ('000201-51edc416-cc7d-48aa-a098-68685e1ba217', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-9bbde7ce-3406-4e3e-93b7-44b48e01163a'), ('000201-8f036fbc-5f40-451a-bf7f-a6d25d192756', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-ce907f31-5a0c-4268-9da4-4772497754a6'), ('000201-fe7197aa-b1bd-43e3-a26f-63f96bd57ceb', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-315e6a10-7a51-4dce-8eff-eb2758e246be'), ('000201-8f1ea627-203e-45bc-93b3-939c8d89048e', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-4dd96bb0-cb8a-4242-94da-906598ce7a74'), ('000201-ac53e4b7-e688-40cb-9101-4fd89a5e5d01', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-0a26c6f9-59e2-4494-a5bd-89f90fb7c691'), ('000201-3343e9c1-45e6-451d-971c-cfe09de3c7e8', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-8dd4bace-72e7-4882-a8a1-4f3fb2f09598'), ('000201-ab6146be-8746-4386-8640-a04cbba588a3', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-19cc2b57-9c80-4712-b5e3-f238f3fd898b'), ('000201-e068653e-f6a5-4770-9818-026042f2fa38', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-44b23fc1-47ef-4482-b145-b1acccf42fb8'), ('000201-b1418270-5be1-4f8e-8019-d5fdf40df361', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-e3d6a6d0-58f0-4b54-b9f6-941c1024976c'), ('000201-3fa73d67-e32b-44fd-bd91-ed332e44477a', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-e3dea012-e138-4776-ad50-c63bdec8c7e4'), ('000201-49d77101-0a60-4be4-a0c8-414a8e952341', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a149d6e5-84ea-435f-87b4-81f926ec006d'), ('000201-c2b57f24-27b2-4224-a6ec-56adad627ecc', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8'), ('000201-4475291c-8cdd-48c4-b75b-948484c51167', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-1d8df33d-1e86-412f-abc0-efe2e1845032'), ('000201-b0286f71-1a1a-4bb0-b079-1f774c2ffba7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-855c3738-3082-4ac7-b6b7-9b8b2bb2326e'), ('000201-2ffd1539-92eb-40b5-b2a0-e0b45e70e5aa', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-64f051f7-4090-4639-8c8d-f3cf668e1f00'), ('000201-0dfc6ef6-a467-48c6-9f17-c367219596d6', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a7d8e9b0-f2ec-4cf3-b7bc-11ad7d4a9ce5'), ('000201-2a547ed0-69e9-4641-8926-1c611f19cae1', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-bb376046-43ac-447c-a094-2b9ab34a230f'), ('000201-10a4ea5e-d31d-497e-9934-f2a75c167911', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c9d642e7-a4f3-4de0-ab9b-c00d710a315e'), ('000201-367eafc1-cc80-4551-97f7-4829fdb3e4c1', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-1e6a580a-4987-403c-ab2c-9b707e86a50f'), ('000201-0ffc0cfe-774b-4319-93f0-a46a6eec1693', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-660d5725-f47d-418a-a12a-cb37bd3ff776'), ('000201-6f3bfd44-e112-4828-96e6-9ab6b31b2afb', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-3b916594-ee33-415c-aac9-3547a3864c0a'), ('000201-0b54dc5f-9bc8-41be-aebc-367b382190bd', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-e6197246-c442-4ab6-b725-d80472e9cd54'), ('000201-00722b9a-bb75-4696-b502-44618a0a6224', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-ddecd5d8-7e0e-46c9-88a1-233b44204ab9'), ('000201-7af591e9-6a28-4032-b4d0-615ec6ee938c', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-4c0c20da-e7ce-427c-bc6b-8525b1fd2fcf'), ('000201-b04c7f3e-66d6-4125-a879-a9d5a18ac336', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-304698bb-e576-41fa-a366-01d7228beae4'), ('000201-2d1e0d93-faf1-48b6-91ee-57d66c9b1c9a', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41'), ('000201-9dc6335e-6a95-4308-bbd2-ea1e11415057', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-242a05e5-5461-4984-a642-b2fc8160910d'), ('000201-6240bc65-dc26-43d4-9982-6c805829383a', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-8033cc65-3d7f-48eb-b644-64e6ea834ba0'), ('000201-fe9be131-b2af-4e6f-9366-35f198e0be65', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-52b71b7e-c8fb-43dd-bb3f-3a41126ac46a'), ('000201-500d90bf-9403-4f58-bf97-9b0e126d9c23', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-0fc8ce4d-49ed-49c5-a2b4-9f397d5bcc88'), ('000201-4f83a23f-7355-4dc1-8d17-e79c55123685', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-befe6756-8197-46cf-85b6-3d005bc9e209'), ('000201-9ff01324-3d3d-440e-8fdb-e7eb6376e74a', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-ccea19b6-c7e0-4981-84fa-2e1ce884abba'), ('000201-cc0d316f-ad2e-4bc5-96ee-cbbd78002abe', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-60a573a4-c585-4b21-8136-5daed3d875e7'), ('000201-bd04ea10-563c-4ddc-bdd4-2fc4b311a927', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-87655fea-a6ad-483b-9ea2-9bb6d7e5f451'), ('000201-12014bbb-0975-4966-920c-a9625b9c2b24', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c4bd4f90-34a9-41c0-93f4-b1eba9f63ac2'), ('000201-351039ea-4b1b-416e-8e35-2919dce9afd1', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-044babde-6b9f-4c2b-9ebe-72cbfd47266b'), ('000201-d32116ce-102a-4a1f-bd83-1a414f4874ea', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-5cca01fe-0bc8-4d62-8af1-40f304152a6d'), ('000201-5760be4f-4211-437e-8e24-ca7ed86bc1b3', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-327c49c6-ecbe-44cd-8a6c-7d95e409486c'), ('000201-25c947ae-14a5-479b-8630-1ffe219a2325', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-20fae3ec-3ed5-41e7-9372-07ac4f399558'), ('000201-af50c685-5834-4aeb-9e60-209f3b08df31', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-09471813-2cdd-4d3f-9732-871fc2d7eb94'), ('000201-f7636a6c-a4c9-40f7-a277-a945b8355947', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-8db9b837-fb35-476f-b320-4608b04eb929'), ('000201-4c1797ca-e429-4b92-888e-175fb093c103', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-f7ddd96e-242c-415c-bbdf-9b69c9a598ef'), ('000201-aea4393a-9385-4f53-8ced-e3293ce6908d', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-d1fe4ca3-0321-4f53-89cd-46dc29273b5e'), ('000201-b282f9c3-71b7-424a-ae30-53bb297f0344', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-54f0a293-9c8e-4702-953d-1d3b88b1f21c'), ('000201-25588da3-8d69-4f4e-a0a4-0a460ae64520', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-00f2074f-82d8-4e2d-a378-47527b33eb98'), ('000201-c65b046c-2ab9-421b-9280-77b8230e00f4', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-bc509be6-9216-4eb5-be29-0c55e885504c'), ('000201-da3874e2-dd30-431e-927f-cff0ebfebcd9', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-16a8cb0c-dc43-439a-8e8c-10d258b21d0e'), ('000201-a01a687d-961a-4d8b-a314-4322198f58e3', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-83137276-d0ae-4abd-a6a3-4a5147fd0574'), ('000201-ed9f7087-8df0-4f1b-86f9-1c3e0ec133fb', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-9ebd6a3b-7be4-4e1d-a008-40827d84a173'), ('000201-38209c17-f5a8-423b-9066-1022149045db', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-1bea1e63-451a-4280-a32f-781acd40e4d2'), ('000201-2a64dc9c-4578-4f45-aa70-f0e0d0007c41', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-2aeb0586-65fa-4bab-95ee-280759977f79'), ('000201-a8a65a8f-7137-47fb-9ee3-69c4f9ab2fa4', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-21fa8f4d-4b11-4d3b-94a5-3fc6415fab5e'), ('000201-d8cb128e-f1f0-43e1-a7ce-00b4cac5b677', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-7a4d5fc0-add7-4365-b2a4-14e183d2aa77'), ('000201-2f18bc9e-0a82-4c04-b88a-6a763adae73f', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a590e3ad-9aa0-4061-afb4-70934a114302'), ('000201-8e8599ff-8bc8-491b-bb00-750f701a25a8', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-25e1feda-1443-4c30-82ce-42fe6eff0a18'), ('000201-1e50ab4f-b544-434f-84c5-119f745c5863', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-b9b02c65-838d-4fb5-8633-2c11e029d2b1'), ('000201-7a3590d2-0f9d-4579-adda-0e9a4ed217a7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-3f0a7531-62d9-42a7-b684-cd65045ca91c'), ('000201-319e5aaf-5c62-48dc-95ce-2c732dc013f9', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-fccf4c14-73eb-4d12-9285-0ba3bad1682f'), ('000201-8d39aaf2-af56-467f-a4ee-a3d0a1811f4d', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-73634515-4028-4ade-84c9-434a573fc8f3'), ('000201-5b61613b-d7fb-46a3-a231-3abed54522e8', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-f656a86a-57d5-45b1-a556-5c9310013fdd'), ('000201-b9b8ca72-1e65-4399-8526-f52988254958', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-61a175e8-5a6f-44cd-b233-6b50e03d89da'), ('000201-e732cb67-0806-46df-8ed5-23fd64f8ba7c', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-2bff7195-781b-483c-bc51-c71df06e57f2'), ('000201-85194ebc-97be-45c3-8e2d-c3bdbd88ea3b', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-6d582e73-0d94-4f49-81a1-6563e0db34bc'), ('000201-cff148a1-bcbe-4c52-bff2-e8054118d870', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-6c0de36d-e4a5-4b21-8894-de8329d4003c'), ('000201-00844871-ed29-4ec8-9094-6eb6b3a0f731', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-1c08779c-ac54-44da-9bf7-68fe2e905cf7'), ('000201-352f482e-5f51-4660-8c1a-407f00316379', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-f7e927cf-4260-4ebd-a327-35be901dbe82'), ('000201-0be22fd6-7b04-4753-be7c-8b2b3d10835b', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c63924c3-6fac-4415-89ce-72c032ce7b6c'), ('000201-66e9367c-9ee1-42ba-8f34-f7927948befa', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-ecd8bb2f-fcee-4b25-898c-b05d003abaa7'), ('000201-7ea8324c-bcd8-485a-bc48-d72b39d45f66', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b'), ('000201-5e515e88-5ed7-499c-be04-f0754e61e149', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-3f0d8e2f-6d39-4fae-8034-64e110416422'), ('000201-9dc05f31-615b-46ed-85f3-8791fbdcfae4', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c4cefb67-d9c3-45ee-86fb-617948914dfa'), ('000201-5e9cd65a-b66a-46bd-9ad0-49a8c4127f87', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-415ad7c2-cc3a-47b5-ae7a-532b06244496'), ('000201-ac0a77f4-ee02-4a97-b841-35c48394d967', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-9974c46b-79e4-44c1-bd2b-750c442161bd'), ('000201-5b9b3b8d-bced-4c61-b518-8afe2ba372ef', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-2c0af578-195a-4ed8-8b66-a253e8a60bb3'), ('000201-76114a62-aa9b-4e53-9603-a519f0946ea7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-b43480ac-4ff0-4fe6-a35c-97f52936c25d'), ('000201-e36e73b3-e19e-40b2-a6b6-59a95d14ad66', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-87e77cd7-a5d3-4043-84f9-526af10af3d1'), ('000201-ad8498b4-94ea-40c4-b0c1-3fb60c9103ba', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-d7024b09-4e02-4739-93d8-565ae71dc1c7'), ('000201-2b1a02f6-e85a-47ac-963a-3497e64fbbdc', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-e4679c30-0d24-41cc-acf7-3f13b395d571'), ('000201-f78ae7fa-a148-4c6c-ac4d-b096f656f81f', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-06cf52ee-5f07-480d-a2e8-774a716e9926'), ('000201-08475a64-f418-457c-9f47-6d4dbafec841', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-f09e71ab-fa88-45b6-b9ee-aa32a5c5b867'), ('000201-66dc0847-df24-40c4-a700-e3d535a406ba', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-aa350146-680f-4df6-b389-11518f4856d0'), ('000201-f3e1dc20-4f61-4c2d-aca2-8f97c355fcbd', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-2b9b9a5f-e181-40b3-b771-16dea5226637'), ('000201-22953b4f-4af8-490f-8be8-7838b7d20d9a', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c44fc857-7510-4921-9fee-557eaf88a2e1'), ('000201-37629f7f-cd79-4301-adda-6a0661deda3e', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-496691d6-d56b-4c06-b1cb-5fb537adb53b'), ('000201-db43fbef-ccda-46d8-84bc-12291d78e8dc', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-59d721db-9afe-427c-8917-34edf1effba2'), ('000201-1c1737ec-6c02-4793-a28d-30e90e287159', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-e8992f85-3d29-4385-b9ad-7899cad7682a'), ('000201-930ed0d0-7079-4538-b0f1-91986d25de57', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-bf919b79-edba-4fdf-9af5-270336b761f5'), ('000201-46d92edf-1018-40e0-8abd-aa3b40d66a51', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c18d3dde-cbc0-444f-a9ce-bb0821d86a2c'), ('000201-ad85023d-0af2-4b6b-9f41-d1dc5de430dd', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-5b016ba1-7604-49fe-b44c-7a1c3a1a53a6'), ('000201-3552f956-13a4-435e-9503-b0761a8ff4f2', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-6ef72c13-bad3-4773-a60a-4de66427291b'), ('000201-0ce11f5f-8c7d-41c8-b466-969c820bb9a1', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-b446eae2-4065-4088-bd7d-ea49f8a7eaa7'), ('000201-9238f445-b54b-4b08-98af-9cf66dda4cb4', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-6695a5e5-d4db-4832-badf-5881da74b1c8'), ('000201-26f181ad-d855-4579-b715-e85fd5beb734', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-d8fcc626-96d4-429c-8251-12d57bb1c431'), ('000201-59e08b52-ef1c-4aa3-9d90-21d0a3574827', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-d903f147-6db3-44f5-8a0c-4bbac7467157'), ('000201-1990c4d7-7a7f-4d4e-b5f4-80744691b52d', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-70c39a27-86fb-4c52-ae10-d8c446a07d61'), ('000201-17388012-f0b9-4eaa-85b9-8db252b3ef41', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-5c81d9da-c002-4dfa-a0e4-9f697d5f79ea'), ('000201-1ee791d8-f2b9-4bf1-a709-2dcb92ebac6b', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7'), ('000201-c2a7dba9-5e75-471d-9101-ae7ea343903d', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-3f978afb-5c7f-4d7a-accf-6dad61d6c87f'), ('000201-4e7023e6-e16b-40c1-8d25-8eca33d5d61f', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-256607b7-362b-45d5-988b-8516a23faebe'), ('000201-523ac84d-33ce-4d14-871f-34570ae93cf7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-d779294e-7c0c-4aea-8409-7eb96ce2c6d0'), ('000201-fec9717d-dcd0-4644-aecf-0fc96aff3193', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-dad1464e-ea36-449f-b0d0-167be7e05afd'), ('000201-a6e1b422-3e38-4751-a5f9-17419e5f8066', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-dd1f1e85-a40e-49b0-9cdc-0d9e96c488a2'), ('000201-68821293-99e0-4164-a7bd-3cd4835b85b5', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-9255e618-e79f-429f-b59c-d50a4ada7c6b'), ('000201-db0cd198-bf6a-43a4-b8c1-8b1bd2d20c56', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-3cc5fc0e-e80a-4c83-818d-33d39b1cbfda'), ('000201-358e2a3a-28ce-43d7-8368-6ada5a4ce9d0', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-4ecb4827-39bc-462a-8bf6-97b6ff4a2565'), ('000201-6341797d-6adf-4c21-ba63-0f8cb9c465af', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-1f1ab1f0-055a-4186-b41d-04a708dbb17c'), ('000201-e2e7ce19-ab6a-48fa-b7ad-1bf75dc1b1f1', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-be58b61f-1adb-4927-ba47-09eb86944f47'), ('000201-31187fd2-a1a2-4dbc-86ba-c80c50862662', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657'), ('000201-4d911918-9e32-431b-af09-14c4ee85580c', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-6db300bd-3e3d-4509-8c25-e6f430997753'), ('000201-394bb3be-c9ee-4864-8ad5-0ea2a1d18ef4', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-dbdeff94-72cc-4caf-a935-357496b84d4e'), ('000201-e9a831f1-084f-491e-bbdb-a49cb5398042', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-3a1d09e0-3fce-421f-a071-513ffe5f3eb5'), ('000201-7610f29d-7c47-4d6a-8e2a-88bbb7b5c9bb', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38'), ('000201-43186ef8-993a-447f-80d3-116afad2f085', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-6edee99b-e939-4fed-826f-126589d0b9e7'), ('000201-f8a9f786-cd1a-4a9f-8e13-31ea9440f025', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a98ef7a2-09a5-41bb-b3b6-2b8ccd86c8ef'), ('000201-1565fd8b-2904-4b7d-83f4-aff126a150ba', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-912c7b89-caeb-4965-b1eb-79790099c79e'), ('000201-792bcadc-70e3-4619-9642-2031e69831c1', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-ef49c10a-9709-4ef4-a20a-66206898eb5b'), ('000201-8758dde2-5210-48ee-a9db-b0e4965c5451', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c6312782-88aa-4153-a75f-a41b3e98db19'), ('000201-84006ef1-225f-446e-b40c-f8ee65dd8baf', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-46915174-b470-491f-ac44-1d5b8b9b12d5'), ('000201-6b86d24e-8e70-46c3-90bc-e07f6d8e3356', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-035e11cd-ca30-48be-ad11-34453835c800'), ('000201-65b8fba5-94f3-4a84-b3c7-95776e9aa1d8', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-165fceb5-0b5d-4cee-b568-b19dd99a22f6'), ('000201-f9de2bb4-8557-47db-a1f7-ac3d9d8ceda2', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-3608f749-17aa-4276-a278-3fce54d50daa'), ('000201-b88fba9a-1478-48e2-9535-de83bd6e045d', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-9f3e2210-8f96-4d72-bb1a-db12ef1c43b0'), ('000201-08f499eb-c2bc-43b4-a1ff-d169cb003bfc', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e'), ('000201-093e979a-7d4e-4be8-b772-9b8f7c259d1c', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-ad456bd1-09e6-4286-8ba4-402f2959894a'), ('000201-1562a20a-2fb1-430f-a934-5e0cad83ddb7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-6c46adb3-85d0-4519-936e-15056cee5c7b'), ('000201-a0fa2e54-8e7e-4b7d-9ce6-cd8b18bf30cd', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de'), ('000201-98b7bc62-ea01-4270-b7a4-7a6cdb299da8', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a178be9f-66d7-44c6-b4c7-6c39b91f7b81'), ('000201-8ea1c4f0-8d31-4bc2-895d-7c739a0fad86', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-55e51490-2ce9-4af9-b9dd-f4eaa8f8401e'), ('000201-e0d29883-e380-4994-99c1-8a2e053ec869', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-eb3563d9-0121-4421-8971-9868de9078b3'), ('000201-1bce4e34-852d-4136-b216-b3d65a888997', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c4dfbca1-3e7b-4cbb-9306-eb6841c1e8ee'), ('000201-72b3b348-0329-4561-b43e-37e6ab3248e8', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-f633c4cb-d4e3-4a3f-87ec-6778bd1e8551'), ('000201-6e74d1ea-7c23-41fc-98ed-ddbab68bf6d7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-79eaed61-3fa1-40bc-b53b-75f98656456d'), ('000201-d200e46f-89c5-4e60-9e6e-6431c0d228d4', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-5be48f0c-0273-4ab1-9fd4-b37f629bc2e5'), ('000201-f4a99a43-c23a-4ba1-8936-7fab8839dd66', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-a6789192-0440-43a0-b856-06610ed909c0'), ('000201-3870cd20-2711-4862-9c27-66e15128b001', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-80b4ecc7-760a-4877-92b8-3783f5f9568a'), ('000201-bf8013bd-3722-46ab-a3b5-bf8682a304ab', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-e919f180-1d10-4f0d-86f0-6249d8082cf9'), ('000201-b2bf6cbb-da2a-4b82-976f-1ebaf3f6aa81', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab'), ('000201-b7011cad-053f-422f-98ea-14e37c0ab7bc', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-43d6d728-7520-4500-abbb-c678abd6a50a'), ('000201-e27148e5-0e2d-4712-83b3-e3b9a4d0f325', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-c7a533a6-d5e1-4f7c-b153-6f678f627018'), ('000201-0f82a106-11c2-401b-ab66-bdc37c7a3e7c', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed'), ('000201-3c6d5f5a-cd05-4529-98d3-5977d655da38', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-4212bcb3-457c-4d08-8bd1-6534d414f84e'), ('000201-ec724cc9-0061-4299-b3b3-942f86ad56e6', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013'), ('000201-2997455f-5375-4f12-8198-de2167505fa7', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-1d267574-06a4-4119-ad67-9993e43afff0'), ('000201-8ea78de0-75c8-42aa-a79e-f5146bdfff43', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-30a85729-42d6-4b25-8456-63469a3d3b00'), ('000201-4d5b53b6-a3e8-41b7-95b0-0cbe64d411f0', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-babcf3af-b737-43ad-a04a-a3453d478108'), ('000201-cac77d19-45ba-424d-93fb-ec41fef04b78', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-21a5ce84-785d-4e60-8b78-7f7c192d2cd6'), ('000201-6d32e7fe-bf41-4984-b099-092c4667e1af', '0', '0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749', '0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9'), ('000201-75f29155-5344-4125-a6ac-f3ba43f5c8b0', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-5c132d22-e31f-4454-8e8b-c8bc50609bc0'), ('000201-532f79e3-057b-4e39-ab57-e4fb2668a749', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-9bbde7ce-3406-4e3e-93b7-44b48e01163a'), ('000201-29c1d036-e8da-4399-822e-853ae6a9a830', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c6312782-88aa-4153-a75f-a41b3e98db19'), ('000201-2c34fe05-d3f1-4165-b6a0-f9f983af77e1', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-0980477c-7e9e-4efa-9a8f-22d78d381013'), ('000201-98492581-45b2-4009-b393-f67a08e068e5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-20fae3ec-3ed5-41e7-9372-07ac4f399558'), ('000201-1a5aa82d-00b8-497e-b6b3-6e396215560f', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-bb376046-43ac-447c-a094-2b9ab34a230f'), ('000201-28cc3d9c-1d7e-4b7a-a4f2-b4ebced5fc6f', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-6ef72c13-bad3-4773-a60a-4de66427291b'), ('000201-b7807b22-0751-44af-9178-ed6e594d60fd', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-e4679c30-0d24-41cc-acf7-3f13b395d571'), ('000201-d5715ef6-fb20-4a4b-b7bd-209385254c0d', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-3a1d09e0-3fce-421f-a071-513ffe5f3eb5'), ('000201-64cb4210-f74d-4d9a-a780-053881546778', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-25e1feda-1443-4c30-82ce-42fe6eff0a18'), ('000201-5b821e51-ff51-4465-86ca-0a04a3f18955', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-16a8cb0c-dc43-439a-8e8c-10d258b21d0e'), ('000201-4cd35872-cd2d-4649-9f73-732a3e86be8f', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-304698bb-e576-41fa-a366-01d7228beae4'), ('000201-09b47211-ae7a-41eb-8eb5-a8b0a6b337df', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-9246b0dc-57f5-4ce2-b372-c9c5aecb6a38'), ('000201-42e56b9c-641a-41ea-b6c5-ad918d90c399', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-6db300bd-3e3d-4509-8c25-e6f430997753'), ('000201-316e9d46-16f5-40be-a33b-e255ed1113ed', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a6789192-0440-43a0-b856-06610ed909c0'), ('000201-32f8f573-e8bf-4e19-a3bf-4e30d3e77aa5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-9974c46b-79e4-44c1-bd2b-750c442161bd'), ('000201-c8eef550-d26c-4a4e-911a-e52a22505cbe', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-f7e927cf-4260-4ebd-a327-35be901dbe82'), ('000201-f8fc9336-74c0-41ea-b879-2b659750cdb1', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-dd1f1e85-a40e-49b0-9cdc-0d9e96c488a2'), ('000201-d8aa1750-62a6-4559-9247-f596e9786250', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-8db9b837-fb35-476f-b320-4608b04eb929'), ('000201-e3509908-1e29-4851-8e8b-fbccf0bbdd35', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-2aeb0586-65fa-4bab-95ee-280759977f79'), ('000201-106205c8-9977-4138-8ebb-56eae52baaee', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-165fceb5-0b5d-4cee-b568-b19dd99a22f6'), ('000201-bb21ba15-7b3c-4a3c-927a-6cc6bcdced3b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-e3dea012-e138-4776-ad50-c63bdec8c7e4'), ('000201-5ea09cfc-5990-4a16-85ae-c3e7c9182a18', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-be58b61f-1adb-4927-ba47-09eb86944f47'), ('000201-8fb10b84-26f5-4d4c-b439-3d3a8ed337f5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-5cca01fe-0bc8-4d62-8af1-40f304152a6d'), ('000201-5c3affd0-2b6d-48a1-b199-c5dbbc48619b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-36d75167-26cf-427b-b78f-20c064e49efa'), ('000201-d750d5c3-2738-4fd2-aa74-b359291baf0b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-61a175e8-5a6f-44cd-b233-6b50e03d89da'), ('000201-15b8ddf5-491b-4fa1-b1d8-7210c3303d57', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-2e6a5454-7f54-41fc-ac9d-0fa2472e9144'), ('000201-8e270157-7af9-4e74-b4ca-04dfb6b8b500', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-bc509be6-9216-4eb5-be29-0c55e885504c'), ('000201-67207230-828a-4290-920d-0a8a8a7a3542', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-496691d6-d56b-4c06-b1cb-5fb537adb53b'), ('000201-920960e3-7b6d-4664-981b-de2c7e9f0810', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-327c49c6-ecbe-44cd-8a6c-7d95e409486c'), ('000201-d3f9a8b9-b73c-481c-9fd3-f08c9f7ccbdb', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-70c39a27-86fb-4c52-ae10-d8c446a07d61'), ('000201-582c9c15-8602-4356-a48b-c2e59bd76a65', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a9472d95-1d6a-47b4-996c-a1f9b54f30de'), ('000201-c4717280-aa09-43b4-a5f3-761fc3fbc85a', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-21fa8f4d-4b11-4d3b-94a5-3fc6415fab5e'), ('000201-0d932d3d-c505-459c-acca-554199a02825', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-d1fe4ca3-0321-4f53-89cd-46dc29273b5e'), ('000201-70a62f27-022c-4e41-9364-3cc10d22dcd8', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-82fef0ae-bf7a-46be-9dd6-6627dd90e912'), ('000201-e990cd0e-4653-40c5-a794-b79c7621e4d5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-5c81d9da-c002-4dfa-a0e4-9f697d5f79ea'), ('000201-7bc9258a-5fce-4809-8a35-75ecf2c525af', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-b446eae2-4065-4088-bd7d-ea49f8a7eaa7'), ('000201-6fb81f4a-d0b7-43e4-928d-c18309b4eaa4', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-256607b7-362b-45d5-988b-8516a23faebe'), ('000201-57025f6b-9cf4-45d8-964a-e310af9c477c', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-d7024b09-4e02-4739-93d8-565ae71dc1c7'), ('000201-2cbf7d49-76a3-4a86-aa50-670560725744', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-ecd8bb2f-fcee-4b25-898c-b05d003abaa7'), ('000201-bbd3bcbc-0ac6-4b99-84f9-9f6414f20c7a', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-6695a5e5-d4db-4832-badf-5881da74b1c8'), ('000201-2c4d6341-18ca-443b-b37e-6684ebd98b37', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-044babde-6b9f-4c2b-9ebe-72cbfd47266b'), ('000201-2d3575fa-7838-4c3e-a5d5-23aacf0cfbe7', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c6cd3f1a-64ad-4235-af39-2f699ddeef41'), ('000201-962e423b-848c-4dd4-9891-1313ce583a52', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-bf919b79-edba-4fdf-9af5-270336b761f5'), ('000201-191a1f15-94a0-4b69-b9df-5b29ec8b4aa0', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-1f1ab1f0-055a-4186-b41d-04a708dbb17c'), ('000201-a44d7ee3-794b-4935-a4a4-dc6369cce944', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-855c3738-3082-4ac7-b6b7-9b8b2bb2326e'), ('000201-ced5a8f9-287e-401e-a01c-5810f7898aa5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-dbdeff94-72cc-4caf-a935-357496b84d4e'), ('000201-d7c08300-0691-4d68-beac-3aa39a04fa88', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-80b4ecc7-760a-4877-92b8-3783f5f9568a'), ('000201-46793cc3-a7ed-444a-8a2c-b1643f7a5a15', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-43d6d728-7520-4500-abbb-c678abd6a50a'), ('000201-7708c690-fefb-4fcf-aae1-50b6c9cb286b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-ac301560-c19b-4b78-8bbd-ee88ed43bbae'), ('000201-45af266d-d365-4a6b-94c1-f719de91e07e', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-9ebd6a3b-7be4-4e1d-a008-40827d84a173'), ('000201-f632bd1d-9e0a-4bfb-a0b8-6a01ebbec1a4', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a61a810e-fd36-4041-b033-a0359c145948'), ('000201-2e0100f3-534a-4263-92f5-df7945d2f31d', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-d8fcc626-96d4-429c-8251-12d57bb1c431'), ('000201-ff8bc2d5-ed55-46c7-af84-f1953eeade48', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-5be48f0c-0273-4ab1-9fd4-b37f629bc2e5'), ('000201-82898b5a-8cb3-43f3-8172-d17cb0ad4c54', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-3f0a7531-62d9-42a7-b684-cd65045ca91c'), ('000201-b01f8b08-c4df-4ce5-ad33-863026d810bf', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-4dd96bb0-cb8a-4242-94da-906598ce7a74'), ('000201-79ea75ff-ea5f-49fb-b6b4-3ca6e62a8389', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-178c3ebc-6fe3-4f8b-96e2-93bcd9b481ab'), ('000201-4bde210f-b63e-4652-af00-6bc7e898586a', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-44b23fc1-47ef-4482-b145-b1acccf42fb8'), ('000201-049b2e3f-ad67-4f09-9419-208e9f2674c3', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e'), ('000201-4e963e42-9a32-4c7f-aa52-4c6cd444db0b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a149d6e5-84ea-435f-87b4-81f926ec006d'), ('000201-4cf5ed51-6ac1-400e-8c21-27f89134c94d', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-4212bcb3-457c-4d08-8bd1-6534d414f84e'), ('000201-7c0c1500-55f8-4e7d-8af4-679c97569952', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-f5ddc2f8-3744-4731-b1d2-bbe6b9b3511c'), ('000201-c2331d57-226b-4017-b126-3b60b230ee3d', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c4cefb67-d9c3-45ee-86fb-617948914dfa'), ('000201-805150ee-485b-4982-a14d-235d96dc42fa', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a178be9f-66d7-44c6-b4c7-6c39b91f7b81'), ('000201-9b7b9da0-4c5d-4734-8ffa-6015ded56952', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-3f978afb-5c7f-4d7a-accf-6dad61d6c87f'), ('000201-a903479e-ad1c-4177-aa66-3c66f5aa8e68', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-f09e71ab-fa88-45b6-b9ee-aa32a5c5b867'), ('000201-be44d10a-597e-4b5b-afb3-38fc74bb4b0e', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-64f051f7-4090-4639-8c8d-f3cf668e1f00'), ('000201-6f087647-db2b-415a-a694-464b33921d18', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-6e262bbb-4c70-4c1d-b794-abcfb9a72657'), ('000201-82c5c71a-4724-4177-ac15-7eb49b9ffe0a', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-660d5725-f47d-418a-a12a-cb37bd3ff776'), ('000201-961ddbd1-c185-4c04-ac69-fae529b50af7', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-46915174-b470-491f-ac44-1d5b8b9b12d5'), ('000201-d1dddaff-e303-4eed-9618-02afe4432b1b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-8033cc65-3d7f-48eb-b644-64e6ea834ba0'), ('000201-36be98f0-8958-44f4-9313-4b15db7afa72', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-befe6756-8197-46cf-85b6-3d005bc9e209'), ('000201-b33c24c3-7a01-4dcb-9452-ad7ec64444b3', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-e3d6a6d0-58f0-4b54-b9f6-941c1024976c'), ('000201-25353c3e-9b4b-441a-8a57-6037256c4df8', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-d779294e-7c0c-4aea-8409-7eb96ce2c6d0'), ('000201-bdaf7237-061e-42af-aa16-3bab9bd8f3f2', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-315e6a10-7a51-4dce-8eff-eb2758e246be'), ('000201-8c69b7e5-b2d2-40a2-82d8-2e16035edb11', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-708dadae-72f1-4309-9132-fa1503529154'), ('000201-9012f449-6b58-4dad-a85e-c950c06bfd14', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c18d3dde-cbc0-444f-a9ce-bb0821d86a2c'), ('000201-ec3d65ea-1ad0-4242-ae73-20244c17e085', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-babcf3af-b737-43ad-a04a-a3453d478108'), ('000201-0ce0baca-c610-4386-9cba-fc531dfdd648', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-b9b02c65-838d-4fb5-8633-2c11e029d2b1'), ('000201-59aa6ef2-2930-4fc5-b63a-7150c2798514', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-79eaed61-3fa1-40bc-b53b-75f98656456d'), ('000201-786e79e3-4b7a-465d-a92d-fe6e89bf6a9b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-2b9b9a5f-e181-40b3-b771-16dea5226637'), ('000201-401b6cb4-57f0-4b91-9c0c-c6e47f08d06e', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-8dd4bace-72e7-4882-a8a1-4f3fb2f09598'), ('000201-5ce2a0db-9110-4fff-87a1-cd5b98aa0bbc', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c44fc857-7510-4921-9fee-557eaf88a2e1'), ('000201-c5b545df-4fd5-409d-8cf1-75daf98c1b05', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-19cc2b57-9c80-4712-b5e3-f238f3fd898b'), ('000201-c9eba681-d60b-4980-8410-49ec41486752', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-87e77cd7-a5d3-4043-84f9-526af10af3d1'), ('000201-5e3a2917-802d-4234-8ced-1a44f8222f7e', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-d903f147-6db3-44f5-8a0c-4bbac7467157'), ('000201-a9d49ae0-f665-42e5-a4c8-d61d4d24e4d5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-52b71b7e-c8fb-43dd-bb3f-3a41126ac46a'), ('000201-ae7ebb3f-0b0d-4882-8714-3b9e31c86017', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-e8992f85-3d29-4385-b9ad-7899cad7682a'), ('000201-f5fcdb95-26b3-4958-9d95-f3cf11ade451', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-e919f180-1d10-4f0d-86f0-6249d8082cf9'), ('000201-355d9aa7-5175-4c8a-a9d1-65f49bd96843', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-7ff04fcc-1782-49b1-b443-d818bd6cb0fa'), ('000201-f098f830-8f0b-4424-93b7-70928d8ab1bf', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c7a533a6-d5e1-4f7c-b153-6f678f627018'), ('000201-04ea36bf-eccb-4a98-a818-37efd2b71766', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-87655fea-a6ad-483b-9ea2-9bb6d7e5f451'), ('000201-71a698dd-8b74-4ef0-9e33-fc4657424b56', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294'), ('000201-5a517f81-24ec-4596-9c42-b38183b48685', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-30a85729-42d6-4b25-8456-63469a3d3b00'), ('000201-1bb65d07-0b14-41d6-a735-34e5c477f3d3', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-e6197246-c442-4ab6-b725-d80472e9cd54'), ('000201-003aa60f-6265-498c-96a7-9e7ff8220ff0', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-415ad7c2-cc3a-47b5-ae7a-532b06244496'), ('000201-b1c95668-a81e-4166-895b-d70a79bdedc0', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-ef49c10a-9709-4ef4-a20a-66206898eb5b'), ('000201-a9761627-41ce-42c1-b54e-9d48a7fb36cb', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c9d642e7-a4f3-4de0-ab9b-c00d710a315e'), ('000201-cc24e512-1aae-4728-bb9b-335f18545fb2', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-0c3055c8-9fe0-431a-b131-9ff17d495da8'), ('000201-7eeb8b5c-0b17-4db4-8024-6dce949ad2d1', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-f7ddd96e-242c-415c-bbdf-9b69c9a598ef'), ('000201-87652b6e-50ea-424c-8fe4-acd2001bde82', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-1e6a580a-4987-403c-ab2c-9b707e86a50f'), ('000201-87bb0041-c7a7-46d3-b2b9-04a4b037275f', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-5dfa599e-5be1-4f1f-a439-e8c16b801d3f'), ('000201-c41d0968-9d80-45e0-a823-a5873c3e16fe', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-1c08779c-ac54-44da-9bf7-68fe2e905cf7'), ('000201-ad911965-35ee-4e71-88a7-0a0b465308d5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', ''), ('000201-4912ee1f-258e-4c6c-8ece-e7ce2f6358da', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a2a1380e-4c1d-46f6-a8c7-9e78bcf5ea8f'), ('000201-aef7695c-8287-4726-afcd-d8c0942e3cff', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c63924c3-6fac-4415-89ce-72c032ce7b6c'), ('000201-1563ef3b-ec3f-4909-92ab-41aeeb152848', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7'), ('000201-af93eb0c-be2f-43bd-9861-cacc5a98171a', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-fdf80c66-b967-4b4a-8cf6-62789031fd2b'), ('000201-142b25aa-a0b9-4f46-b9f5-6f52b7db0011', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-2c0af578-195a-4ed8-8b66-a253e8a60bb3'), ('000201-06e41c27-10e6-4f9b-8ab7-56c4f68b242f', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-9f3e2210-8f96-4d72-bb1a-db12ef1c43b0'), ('000201-25447966-1456-4049-836d-0af47f3842fd', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-6edee99b-e939-4fed-826f-126589d0b9e7'), ('000201-73e40703-e2b3-43d6-bd76-ccad943363e9', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-00f2074f-82d8-4e2d-a378-47527b33eb98'), ('000201-07d82cab-3e04-4b04-960a-a068fda4b935', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-6d582e73-0d94-4f49-81a1-6563e0db34bc'), ('000201-743db710-c9ef-4937-bc17-a0ef09cd65e3', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-6c46adb3-85d0-4519-936e-15056cee5c7b'), ('000201-fd4a4373-9ac0-405e-a1d3-f48a33b656ce', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-5378a42c-0510-4c71-86aa-a0ce7fa0aa50'), ('000201-23dd2d2f-f93b-4401-a913-024f498ac2ed', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c4dfbca1-3e7b-4cbb-9306-eb6841c1e8ee'), ('000201-677ad11c-9d04-49f1-a82f-fe98901eaa4c', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-60a573a4-c585-4b21-8136-5daed3d875e7'), ('000201-6819abe7-2330-4435-b86f-6cc4dcc7e4f5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-3608f749-17aa-4276-a278-3fce54d50daa'), ('000201-8653196c-5110-4766-97f0-189bbab33eb9', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-fccf4c14-73eb-4d12-9285-0ba3bad1682f'), ('000201-049c9c8d-be46-4093-aae7-6d80c17566b7', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-70d66d2d-f215-4c05-a3e9-65ef9731b6d5'), ('000201-13b0606c-6d9a-4b62-af88-d1dad901cd3b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-035e11cd-ca30-48be-ad11-34453835c800'), ('000201-2e62eb8e-5163-4159-a2d0-b8c2cf66bec9', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-f633c4cb-d4e3-4a3f-87ec-6778bd1e8551'), ('000201-97cb2602-87de-4e23-98a4-9580e279d495', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-2bff7195-781b-483c-bc51-c71df06e57f2'), ('000201-1aa849da-e210-4d21-b12f-661eb636c5eb', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-9255e618-e79f-429f-b59c-d50a4ada7c6b'), ('000201-9690ad23-9a54-434d-a9ac-84e64e3d8fa9', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-7a4d5fc0-add7-4365-b2a4-14e183d2aa77'), ('000201-d8c111a7-a750-416c-b707-5d5d2ea924c1', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-ad456bd1-09e6-4286-8ba4-402f2959894a'), ('000201-89f67cd0-9b34-41d6-8a0c-8cf72eb68e34', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-aa350146-680f-4df6-b389-11518f4856d0'), ('000201-cb0e9ab9-bc0f-4103-9d20-d4f5e45e7ca8', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-2df8df8d-ea55-452d-b59e-fc2a80546b9c'), ('000201-ccbc13b9-ee22-46bb-bb8a-3d1f2d88d8a2', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-4ecb4827-39bc-462a-8bf6-97b6ff4a2565'), ('000201-b4b96149-4f8f-43cc-b9bd-3f5c1905d9c6', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-1186556c-b616-469e-be0f-18a7e13f3311'), ('000201-9161bcc7-9b92-43c8-8713-6167f50bf69a', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-09471813-2cdd-4d3f-9732-871fc2d7eb94'), ('000201-8bd64fcf-38bf-4488-a3e3-a67c8390df86', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-eb3563d9-0121-4421-8971-9868de9078b3'), ('000201-71137371-111e-4f07-a90e-fe34adcd1b1c', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-f656a86a-57d5-45b1-a556-5c9310013fdd'), ('000201-816161fd-e2fb-41ae-8962-a68901841d55', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-134df6c7-ded1-43c7-b449-0f5a4aadf5e3'), ('000201-95dc44cb-9cd3-45b2-aecc-b9a889a9a122', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-8f81d8be-5823-45f5-8b86-9fdaa17b1cba'), ('000201-ca11dd60-b77b-4743-b512-3c501371c92d', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-c4bd4f90-34a9-41c0-93f4-b1eba9f63ac2'), ('000201-d2a1220e-6b68-4971-b1fa-6ebf321cc708', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-1d8df33d-1e86-412f-abc0-efe2e1845032'), ('000201-fe1192a3-0018-46a3-8e19-87305de53862', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-b43480ac-4ff0-4fe6-a35c-97f52936c25d'), ('000201-9684cc39-77e0-48c2-9164-31e88bd77738', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-ccea19b6-c7e0-4981-84fa-2e1ce884abba'), ('000201-b2ca9f3a-d3ff-4ce9-833a-cf706b929fd5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-dad1464e-ea36-449f-b0d0-167be7e05afd'), ('000201-77963714-38ae-4ae4-92ec-0914526f34cd', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-5b016ba1-7604-49fe-b44c-7a1c3a1a53a6'), ('000201-2e1843cb-7725-4bbc-8757-b7e3fc769f00', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-ee0adcdd-cf26-4f3c-a912-b0c445e6f9ed'), ('000201-deaa95b5-4cbf-4e0c-8d44-8136b0dab6f5', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-e19368bf-6178-428f-8a9a-16ed056c2994'), ('000201-a212a2bf-c9f7-4412-9e0d-f8ba3fbc6578', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-ddecd5d8-7e0e-46c9-88a1-233b44204ab9'), ('000201-09ac3740-2c7d-4f55-ac98-891c0feb2702', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6'), ('000201-b039c83b-6d41-4022-9462-885587873d41', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-04dd4945-86db-41a1-9e82-684798211720'), ('000201-14a56df2-34fe-43b3-900b-695583ef3cb1', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-21a5ce84-785d-4e60-8b78-7f7c192d2cd6'), ('000201-fcdab5c7-ea08-46b3-a58b-2cf3f410a731', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-8f415956-8767-4eb9-89d1-a56f5c34b024'), ('000201-7632b80f-ee28-4120-bdc9-45961da16398', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-59d721db-9afe-427c-8917-34edf1effba2'), ('000201-ef658fc4-6e68-4d21-ae00-f3752745f688', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-54f0a293-9c8e-4702-953d-1d3b88b1f21c'), ('000201-64602bfc-b381-4bf6-9e1a-585878527ee4', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-574df5b9-e2d8-48fc-951d-56772faa6a0a'), ('000201-46713c67-f0d0-49bf-ba60-df10e3747ad1', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a590e3ad-9aa0-4061-afb4-70934a114302'), ('000201-a92778eb-a612-4199-85e1-f1b2ee976b1c', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-242a05e5-5461-4984-a642-b2fc8160910d'), ('000201-87d06b7d-dd47-40f9-b2e1-57e3e5b76fe1', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-1bea1e63-451a-4280-a32f-781acd40e4d2'), ('000201-4669d189-7d80-4160-a66b-4744486078ad', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a7d8e9b0-f2ec-4cf3-b7bc-11ad7d4a9ce5'), ('000201-055b81fb-10cf-4d1c-978e-9c070d6df048', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-0fc8ce4d-49ed-49c5-a2b4-9f397d5bcc88'), ('000201-71209adb-be3f-41d6-948c-e85503d13e39', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-73634515-4028-4ade-84c9-434a573fc8f3'), ('000201-7234c3ba-9bff-47c8-9972-5793b13f3183', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-3cc5fc0e-e80a-4c83-818d-33d39b1cbfda'), ('000201-90997aad-fe04-4a5b-99b9-292f18b76c92', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-55e51490-2ce9-4af9-b9dd-f4eaa8f8401e'), ('000201-f7589e6f-3064-46c8-8bd1-7be2f108615d', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-83137276-d0ae-4abd-a6a3-4a5147fd0574'), ('000201-6b51bd50-dc52-437a-93b8-3a41e77074d4', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-a98ef7a2-09a5-41bb-b3b6-2b8ccd86c8ef'), ('000201-5c94348a-7303-4a21-a50c-6f57e5f5a9dd', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-3a6734cf-6668-4726-94ee-a50fe18cbff1'), ('000201-38aed26a-8dd8-4ac0-8854-720b83b9ce32', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-94cd8d8e-8f2c-4872-b86f-06096573be85'), ('000201-b28e6c0a-26c8-43fb-954c-d239bb811cfb', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-6c0de36d-e4a5-4b21-8894-de8329d4003c'), ('000201-06386e27-5415-41ff-b80f-4f1617fb0d5b', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-0a26c6f9-59e2-4494-a5bd-89f90fb7c691'), ('000201-60825236-b270-4a7f-8a8b-a2572469badd', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-06cf52ee-5f07-480d-a2e8-774a716e9926'), ('000201-5f7da337-a919-49e7-928e-9e63eeed9fca', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-1d267574-06a4-4119-ad67-9993e43afff0'), ('000201-b4889961-3506-4fc3-a531-5cd88fe8e183', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-912c7b89-caeb-4965-b1eb-79790099c79e'), ('000201-25a74246-4bb1-4f0c-9b98-500dce0a4344', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-4cc54545-db72-4315-9353-e4115d6210ac'), ('000201-15322798-71eb-4049-874c-fdb08836d055', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-4c0c20da-e7ce-427c-bc6b-8525b1fd2fcf'), ('000201-d563e03f-1fc2-413f-8732-32e80bdeff30', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-1c5368fc-53f8-4308-8cc3-9508efb5eee9'), ('000201-c27786e9-b795-4a42-8166-adb80c95bc65', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-3b916594-ee33-415c-aac9-3547a3864c0a'), ('000201-e215ceda-f4d1-447c-aac7-ee848f8c2858', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-ce907f31-5a0c-4268-9da4-4772497754a6'), ('000201-b7b68040-4ce3-46e5-a115-acf12f34f31a', '0', '0002-1c3a8062-35a9-4033-9d44-ac3bac6e007f', '0003-3f0d8e2f-6d39-4fae-8034-64e110416422'), ('000201-fd44c075-bdca-4e0f-9eaf-f420a1159821', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-3608f749-17aa-4276-a278-3fce54d50daa'), ('000201-18c202a3-a870-41e9-b654-abca84060d1b', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-5dfa599e-5be1-4f1f-a439-e8c16b801d3f'), ('000201-71d493a5-67eb-46b0-be9d-751f4572993e', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-3a6734cf-6668-4726-94ee-a50fe18cbff1'), ('000201-5a5c7255-98b4-48bd-833a-9ee7dd78ef43', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-5378a42c-0510-4c71-86aa-a0ce7fa0aa50'), ('000201-fb4587f8-68e9-4af5-b4d8-06f39106dcfc', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-c44fc857-7510-4921-9fee-557eaf88a2e1'), ('000201-002ae293-cd5d-478d-a9f3-36059e5907dd', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-3b916594-ee33-415c-aac9-3547a3864c0a'), ('000201-0c45822f-32ec-41ba-a0eb-48f513d86f55', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-7a4d5fc0-add7-4365-b2a4-14e183d2aa77'), ('000201-14d091ff-4894-4c1e-84cd-60da865000a7', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-d7607f0e-a3a4-43da-b942-01fbe6e47294'), ('000201-1bec3c38-1e0e-4b6d-9510-e83c5b3941e3', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-54f0a293-9c8e-4702-953d-1d3b88b1f21c'), ('000201-f829ba73-0876-4cdd-80e7-d531e6f0e149', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-8f81d8be-5823-45f5-8b86-9fdaa17b1cba'), ('000201-51ebf3de-0278-46b2-92f0-2f0493e9501a', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-8e46c38f-7530-4454-8417-ae8dd51bedc6'), ('000201-4a33811b-6d31-48ad-986f-0ad5db0664f6', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-21a5ce84-785d-4e60-8b78-7f7c192d2cd6'), ('000201-e0f286cf-1ccf-4601-9652-0aa0414f31c5', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-c4dfbca1-3e7b-4cbb-9306-eb6841c1e8ee'), ('000201-3e58b3e1-ee1d-43c7-982e-605c37122d06', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-327c49c6-ecbe-44cd-8a6c-7d95e409486c'), ('000201-36d00e75-6d43-431a-8482-2acca9e858c7', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-3cc5fc0e-e80a-4c83-818d-33d39b1cbfda'), ('000201-45c99dc2-6aff-46f2-bd08-e6cfa98cd4af', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-ad456bd1-09e6-4286-8ba4-402f2959894a'), ('000201-ba0bcc19-ebd9-4517-a0de-c9849ff3fd36', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-e4679c30-0d24-41cc-acf7-3f13b395d571'), ('000201-ef30feb4-e937-4952-8517-59e9d4624e57', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-912c7b89-caeb-4965-b1eb-79790099c79e'), ('000201-a72cbcdc-2336-4ce1-b696-f1115c98e272', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-c6312782-88aa-4153-a75f-a41b3e98db19'), ('000201-13555540-26f6-4d39-a1f5-d53d83a6f0a6', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-8f415956-8767-4eb9-89d1-a56f5c34b024'), ('000201-b306058e-ac94-446d-a7e1-57d6daf0b3e6', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-c4cefb67-d9c3-45ee-86fb-617948914dfa'), ('000201-4d80de2d-d506-466f-a09f-bd735bf27ba1', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-9974c46b-79e4-44c1-bd2b-750c442161bd'), ('000201-2efd59e3-e651-46b3-b788-f65da282ae4a', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-55e51490-2ce9-4af9-b9dd-f4eaa8f8401e'), ('000201-cb101538-d3b4-452a-a968-ca5cbc6c9ff7', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-d779294e-7c0c-4aea-8409-7eb96ce2c6d0'), ('000201-ab1bcdde-94b8-4a3c-84ad-af9cce281134', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-61a175e8-5a6f-44cd-b233-6b50e03d89da'), ('000201-d5094c56-fe2d-470f-ae5e-a702fb3e46e1', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-5c81d9da-c002-4dfa-a0e4-9f697d5f79ea'), ('000201-69c1bc5e-0625-4ff4-ad9c-a1ef42e04700', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-a61a810e-fd36-4041-b033-a0359c145948'), ('000201-e5da7054-2258-458e-8e1e-4e172522c2bc', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-415ad7c2-cc3a-47b5-ae7a-532b06244496'), ('000201-22341467-3ae0-43ff-aed0-9921c988f05c', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-43d6d728-7520-4500-abbb-c678abd6a50a'), ('000201-822406f3-94bd-4dc0-a82b-272cbd8c25c8', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-f7e927cf-4260-4ebd-a327-35be901dbe82'), ('000201-b5dc6ce2-2c72-43b0-a194-e500ad690b6d', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-b81f2e48-c4cc-468c-847d-9d3cc06374a7'), ('000201-dab081ab-4ac5-4d5c-8033-283148dfaa73', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-db070ea3-8bf1-4884-a799-f9c963156e1e'), ('000201-271d3ee0-eac7-4eba-81ef-35da64af5413', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-660d5725-f47d-418a-a12a-cb37bd3ff776'), ('000201-cbfa63bc-16ca-4503-b53e-a95653498a4a', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-87e77cd7-a5d3-4043-84f9-526af10af3d1'), ('000201-f230879f-0d5c-41f2-b2ab-17f470ccd772', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-4ecb4827-39bc-462a-8bf6-97b6ff4a2565'), ('000201-4b597347-11c7-4431-b018-92a229a0727e', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-8dd4bace-72e7-4882-a8a1-4f3fb2f09598'), ('000201-71504744-6c8a-45bb-9b61-f92eac63e431', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-ac301560-c19b-4b78-8bbd-ee88ed43bbae'), ('000201-1fe55a42-aeb9-4c62-a92c-11488bfc2680', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-ccea19b6-c7e0-4981-84fa-2e1ce884abba'), ('000201-e29c15a7-9951-4f00-891a-98a57e4484f7', '0', '0002-6b6091ac-c503-4800-bd12-b639c4d0da9a', '0003-87655fea-a6ad-483b-9ea2-9bb6d7e5f451');
COMMIT;

-- ----------------------------
--  Table structure for `base_vip`
-- ----------------------------
DROP TABLE IF EXISTS `base_vip`;
CREATE TABLE `base_vip` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_attendrecord`
-- ----------------------------
DROP TABLE IF EXISTS `bill_attendrecord`;
CREATE TABLE `bill_attendrecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpersonId` varchar(44) DEFAULT NULL,
  `fat` int(11) DEFAULT '0',
  `fadt` int(11) DEFAULT '0',
  `fqty` double DEFAULT '0',
  `fisBalance` tinyint(3) DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_inwh`
-- ----------------------------
DROP TABLE IF EXISTS `bill_inwh`;
CREATE TABLE `bill_inwh` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `finStockDate` timestamp NULL DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fqty` double DEFAULT '0',
  `famt` double DEFAULT '0',
  `fsourceBillId` varchar(44) DEFAULT NULL,
  `fremark` varchar(100) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_outwh`
-- ----------------------------
DROP TABLE IF EXISTS `bill_outwh`;
CREATE TABLE `bill_outwh` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `foutStockDate` timestamp NULL DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fqty` double DEFAULT '0',
  `famt` double DEFAULT '0',
  `fsourceBillId` varchar(44) DEFAULT NULL,
  `fremark` varchar(100) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_price`
-- ----------------------------
DROP TABLE IF EXISTS `bill_price`;
CREATE TABLE `bill_price` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fdateFrom` timestamp NULL DEFAULT NULL,
  `fdateTo` timestamp NULL DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_price_materialentry`
-- ----------------------------
DROP TABLE IF EXISTS `bill_price_materialentry`;
CREATE TABLE `bill_price_materialentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fisFloat` tinyint(3) DEFAULT '0',
  `fremark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_price_projectentry`
-- ----------------------------
DROP TABLE IF EXISTS `bill_price_projectentry`;
CREATE TABLE `bill_price_projectentry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fprojectId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fisFloat` tinyint(3) DEFAULT '0',
  `fremark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `bill_purchase`;
CREATE TABLE `bill_purchase` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpersonId` varchar(44) DEFAULT NULL,
  `fsupplierId` varchar(44) DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fqty` double DEFAULT '0',
  `famt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fsourcebillid` varchar(100) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_purchasemutil`
-- ----------------------------
DROP TABLE IF EXISTS `bill_purchasemutil`;
CREATE TABLE `bill_purchasemutil` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpersonId` varchar(44) DEFAULT NULL,
  `fsupplierId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_purchasemutil_entry`
-- ----------------------------
DROP TABLE IF EXISTS `bill_purchasemutil_entry`;
CREATE TABLE `bill_purchasemutil_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fqty` double DEFAULT '0',
  `famt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_rechargegive`
-- ----------------------------
DROP TABLE IF EXISTS `bill_rechargegive`;
CREATE TABLE `bill_rechargegive` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fname` varchar(100) DEFAULT NULL,
  `fdateFrom` timestamp NULL DEFAULT NULL,
  `fdateTo` timestamp NULL DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_rechargegive_entry`
-- ----------------------------
DROP TABLE IF EXISTS `bill_rechargegive_entry`;
CREATE TABLE `bill_rechargegive_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT '0',
  `fgiveamt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_rechargerecord`
-- ----------------------------
DROP TABLE IF EXISTS `bill_rechargerecord`;
CREATE TABLE `bill_rechargerecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpersonId` varchar(44) DEFAULT NULL,
  `fcustomerId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT '0',
  `fgiveamt` double DEFAULT '0',
  `ffactamt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_register`
-- ----------------------------
DROP TABLE IF EXISTS `bill_register`;
CREATE TABLE `bill_register` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fshopName` varchar(100) DEFAULT NULL,
  `fshopAddress` varchar(100) DEFAULT NULL,
  `fshopPhone` varchar(100) DEFAULT NULL,
  `fpft` int(11) DEFAULT '0',
  `fsmsphone` varchar(100) DEFAULT NULL,
  `fhour` int(11) DEFAULT '22',
  `fday` int(11) DEFAULT '1',
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

-- ----------------------------
--  Table structure for `bill_register_entry`
-- ----------------------------
DROP TABLE IF EXISTS `bill_register_entry`;
CREATE TABLE `bill_register_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fshopName` varchar(100) DEFAULT NULL,
  `fshopAddress` varchar(100) DEFAULT NULL,
  `fshopPhone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `bill_register_entry`
-- ----------------------------
BEGIN;
INSERT INTO `bill_register_entry` VALUES ('003201-37804418-ef9e-4add-8879-1fdeda6cb5ca', '0', '0032-2bbdb324-72db-492e-86bf-34b3fb31bd86', '清镇店', '2332', '3233');
COMMIT;

-- ----------------------------
--  Table structure for `bill_salary`
-- ----------------------------
DROP TABLE IF EXISTS `bill_salary`;
CREATE TABLE `bill_salary` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fdateFrom` timestamp NULL DEFAULT NULL,
  `fdateTo` timestamp NULL DEFAULT NULL,
  `fpersonId` varchar(44) DEFAULT NULL,
  `fsalary` double DEFAULT '0',
  `fbounty` double DEFAULT '0',
  `fpercentamt` double DEFAULT '0',
  `fpunishamt` double DEFAULT '0',
  `famt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_salary_entry`
-- ----------------------------
DROP TABLE IF EXISTS `bill_salary_entry`;
CREATE TABLE `bill_salary_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fremark` varchar(100) DEFAULT NULL,
  `ftotalAmt` double DEFAULT '0',
  `famt` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_sale`
-- ----------------------------
DROP TABLE IF EXISTS `bill_sale`;
CREATE TABLE `bill_sale` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpt` int(11) DEFAULT '0',
  `fpersonId` varchar(44) DEFAULT NULL,
  `fcustomerId` varchar(44) DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fqty` double DEFAULT '0',
  `famt` double DEFAULT '0',
  `ffactamt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fisBalance` tinyint(3) DEFAULT '0',
  `fsourceBillId` varchar(44) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_salemutil`
-- ----------------------------
DROP TABLE IF EXISTS `bill_salemutil`;
CREATE TABLE `bill_salemutil` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpt` int(11) DEFAULT '0',
  `fpersonId` varchar(44) DEFAULT NULL,
  `fcustomerId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT '0',
  `ffactamt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fisBalance` tinyint(3) DEFAULT '0',
  `fsourceBillId` varchar(44) DEFAULT NULL,
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_salemutil_entry`
-- ----------------------------
DROP TABLE IF EXISTS `bill_salemutil_entry`;
CREATE TABLE `bill_salemutil_entry` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fmaterialId` varchar(44) DEFAULT NULL,
  `funitId` varchar(44) DEFAULT NULL,
  `fprice` double DEFAULT '0',
  `fqty` double DEFAULT '0',
  `famt` double DEFAULT '0',
  `ffactamt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fbarCode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_service`
-- ----------------------------
DROP TABLE IF EXISTS `bill_service`;
CREATE TABLE `bill_service` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fpt` int(11) DEFAULT '0',
  `fpersonId` varchar(44) DEFAULT NULL,
  `fcustomerId` varchar(44) DEFAULT NULL,
  `fprojectId` varchar(44) DEFAULT NULL,
  `fqty` double DEFAULT '0',
  `fprice` double DEFAULT '0',
  `famt` double DEFAULT '0',
  `ffactamt` double DEFAULT '0',
  `fremark` varchar(100) DEFAULT NULL,
  `fisBalance` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_shoppayment`
-- ----------------------------
DROP TABLE IF EXISTS `bill_shoppayment`;
CREATE TABLE `bill_shoppayment` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fcustomerShopId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT '0',
  `fisSms` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `bill_smsrecord`
-- ----------------------------
DROP TABLE IF EXISTS `bill_smsrecord`;
CREATE TABLE `bill_smsrecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fctx` varchar(255) DEFAULT NULL,
  `fphone` varchar(100) DEFAULT NULL,
  `fcode` varchar(255) DEFAULT NULL,
  `fisSuccess` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `flongnumber` varchar(255) DEFAULT NULL,
  `flongname` varchar(255) DEFAULT NULL,
  `fparentid` varchar(44) DEFAULT NULL,
  `frptId` varchar(44) DEFAULT NULL,
  `fmt` int(11) DEFAULT '0',
  `fseq` int(11) DEFAULT '0',
  `fclsName` varchar(255) DEFAULT NULL,
  `fisVisable` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('0005-60ce198a-847a-4511-992e-4191cd76b83b', '000120160918230546', '用户管理', '000120160918230546', '用户管理', '', '', '0', '0', '', '1', '', '', '2016-09-18 23:05:55', '2016-09-18 23:05:55'), ('0005-1d3853e0-708e-4418-96dd-b6259f8075e9', '000120160918230558', '角色定义', '000120160918230546!000120160918230558', '用户管理!角色定义', '0005-60ce198a-847a-4511-992e-4191cd76b83b', '', '0', '0', 'bas.sys.userrole.UserRoleListUI', '1', '', '', '2016-09-18 23:06:07', '2016-09-18 23:06:07'), ('0005-d4c89555-75b3-41fb-8e7d-fece1df5c4dd', '000120160918230608', '用户', '000120160918230546!000120160918230608', '用户管理!用户', '0005-60ce198a-847a-4511-992e-4191cd76b83b', '', '0', '1', 'bas.sys.user.UserListUI', '1', '', '', '2016-09-18 23:06:15', '2016-09-18 23:06:15'), ('0005-c6f8f761-fb34-422d-be2f-11f0e2ff4996', '000120160924212036', '员工管理', '000120160924212036', '员工管理', '', '', '0', '1', '', '1', '', '', '2016-09-24 21:20:46', '2016-09-24 21:20:46'), ('0005-ac635bc9-916b-4e98-b580-00cf417fdfd4', '000120160924212050', '员工职位', '000120160924212036!000120160924212050', '员工管理!员工职位', '0005-c6f8f761-fb34-422d-be2f-11f0e2ff4996', '', '1', '0', 'bas.job.JobListUI', '1', '', '', '2016-09-24 21:21:11', '2016-09-24 21:21:11'), ('0005-56dda751-2a40-4446-9ac4-d8c09f310666', '000120160924212113', '员工', '000120160924212036!000120160924212113', '员工管理!员工', '0005-c6f8f761-fb34-422d-be2f-11f0e2ff4996', '', '1', '3', 'bas.person.PersonListUI', '1', '', '', '2016-09-24 21:21:29', '2016-09-24 21:21:29'), ('0005-35b0eec7-7833-46a4-aa51-5dd69cf0cd1c', '000120160924212133', '项目管理', '000120160924212133', '项目管理', '', '', '0', '2', '', '1', '', '', '2016-09-24 21:21:42', '2016-09-24 21:21:42'), ('0005-2c11e955-4299-4536-ab75-33dc2a26354c', '000120160924212159', '项目类型', '000120160924212133!000120160924212159', '项目管理!项目类型', '0005-35b0eec7-7833-46a4-aa51-5dd69cf0cd1c', '', '1', '0', 'bas.project.group.ProjectGroupListUI', '1', '', '', '2016-09-24 21:22:21', '2016-09-24 21:22:21'), ('0005-b6aa9bea-997a-40f7-b6ae-bb8e591b5f30', '000120160924212223', '项目', '000120160924212133!000120160924212223', '项目管理!项目', '0005-35b0eec7-7833-46a4-aa51-5dd69cf0cd1c', '', '1', '1', 'bas.project.ProjectListUI', '1', '', '', '2016-09-24 21:22:42', '2016-09-24 21:22:42'), ('0005-1416983a-c344-4be2-9ea0-e783835453da', '000120160924212252', '提成比例', '000120160924212036!000120160924212252', '员工管理!提成比例', '0005-c6f8f761-fb34-422d-be2f-11f0e2ff4996', '', '0', '2', 'bas.percent.PercentListUI', '1', '', '', '2016-09-24 21:23:18', '2016-09-24 21:23:18'), ('0005-63647c42-bb42-4779-900f-4d33e3f7cd27', '000120160924214444', '客户管理', '000120160924214444', '客户管理', '', '', '0', '3', '', '1', '', '', '2016-09-24 21:44:50', '2016-09-24 21:44:50'), ('0005-be419f14-0d9d-4e3d-bf9d-849f1b37a459', '000120160924214506', '会员类型', '000120160924214444!000120160924214506', '客户管理!会员类型', '0005-63647c42-bb42-4779-900f-4d33e3f7cd27', '', '0', '0', 'bas.vip.VipListUI', '1', '', '', '2016-09-24 21:45:27', '2016-09-24 21:45:27'), ('0005-a8f87da7-4262-49f1-9ae1-43e0de901407', '000120160924220821', '客户', '000120160924214444!000120160924220821', '客户管理!客户', '0005-63647c42-bb42-4779-900f-4d33e3f7cd27', '', '0', '2', 'bas.customer.CustomerListUI', '1', '', '', '2016-09-24 22:08:39', '2016-09-24 22:08:39'), ('0005-5d7e6a49-09b9-4165-8633-e9e0d14f9e2a', '000120160925072705', '产品管理', '000120160925072705', '产品管理', '', '', '0', '4', '', '1', '', '', '2016-09-25 07:27:12', '2016-09-25 07:27:12'), ('0005-7fc4f237-9293-4fed-b363-13fec4860454', '000120160925072714', '计量单位', '000120160925072705!000120160925072714', '产品管理!计量单位', '0005-5d7e6a49-09b9-4165-8633-e9e0d14f9e2a', '', '1', '0', 'bas.measureunit.MeasureUnitListUI', '1', '', '', '2016-09-25 07:27:56', '2016-09-25 07:27:56'), ('0005-d45d9c7a-c468-433c-8602-d405134c27df', '000120160925074205', '产品', '000120160925072705!000120160925074205', '产品管理!产品', '0005-5d7e6a49-09b9-4165-8633-e9e0d14f9e2a', '', '1', '2', 'bas.material.MaterialListUI', '1', '', '', '2016-09-25 07:42:24', '2016-09-25 07:42:24'), ('0005-3548aad2-e531-4ad6-bb10-83fb45b4793f', '000120160925081224', '产品类型', '000120160925072705!000120160925081224', '产品管理!产品类型', '0005-5d7e6a49-09b9-4165-8633-e9e0d14f9e2a', '', '0', '1', 'bas.material.group.MaterialGroupListUI', '1', '', '', '2016-09-25 08:12:45', '2016-09-25 08:12:45'), ('0005-1fb3b22a-597f-4df4-9206-c3483f66c251', '000120160925083758', '供应商', '000120160925072705!000120160925083758', '产品管理!供应商', '0005-5d7e6a49-09b9-4165-8633-e9e0d14f9e2a', '', '0', '3', 'bas.supplier.SupplierListUI', '1', '', '', '2016-09-25 08:38:18', '2016-09-25 08:38:18'), ('0005-af2a5d33-8864-45a3-b922-332f31b675fc', '000120160925143629', '考勤策略', '000120160924212036!000120160925143629', '员工管理!考勤策略', '0005-c6f8f761-fb34-422d-be2f-11f0e2ff4996', '', '0', '1', 'bas.attendance.AttendanceListUI', '1', '', '', '2016-09-25 14:37:11', '2016-09-25 14:37:11'), ('0005-1c9748d3-3797-4ad3-af55-5bd850b933cb', '000120160925164411', '业务相关', '000120160925164411', '业务相关', '', '', '0', '5', '', '1', '', '', '2016-09-25 16:44:26', '2016-09-25 16:44:26'), ('0005-4884c02a-5bd1-4d88-98d5-409dc6354c1a', '000120160925164428', '价目表维护', '000120160925164411!000120160925164428', '业务相关!价目表维护', '0005-1c9748d3-3797-4ad3-af55-5bd850b933cb', '', '2', '0', 'bill.price.PriceListUI', '1', '', '', '2016-09-25 16:44:47', '2016-09-25 16:44:47'), ('0005-75029b54-4225-4cd6-b1bd-bff992b129e2', '000120160927202240', '销售单', '000120160925164411!000120160927202240', '业务相关!销售单', '0005-1c9748d3-3797-4ad3-af55-5bd850b933cb', '', '2', '1', 'bill.sale.SaleListUI', '1', '', '', '2016-09-27 20:23:06', '2016-09-27 20:23:06'), ('0005-9c9533a3-fa17-4a14-a7d7-ec5d6bf96c26', '000120160927221916', '服务单', '000120160925164411!000120160927221916', '业务相关!服务单', '0005-1c9748d3-3797-4ad3-af55-5bd850b933cb', '', '2', '2', 'bill.service.ServiceListUI', '1', '', '', '2016-09-27 22:19:40', '2016-09-27 22:19:40'), ('0005-774c437c-bdc8-4667-a272-2dc390a89007', '000120160928131409', '折扣策略', '000120160924214444!000120160928131409', '客户管理!折扣策略', '0005-63647c42-bb42-4779-900f-4d33e3f7cd27', '', '1', '1', 'bas.discount.DiscountListUI', '1', '', '', '2016-09-28 13:14:32', '2016-09-28 13:14:32'), ('0005-20debf47-752f-4dd5-92c1-81306e9ca0f9', '000120160929032814', '收银前台', '000120160929220204!000120160929032814', '工作台!收银前台', '0005-724f7eeb-4fa8-4e95-897f-1843b7610df6', '', '4', '0', 'ui.center.NailCenterUI', '1', '', '', '2016-09-29 03:28:43', '2016-09-29 03:28:43'), ('0005-50e27420-5e76-43b0-93d4-98c3c63594ac', '000120160929220125', '充值记录', '000120160924214444!000120160929220125', '客户管理!充值记录', '0005-63647c42-bb42-4779-900f-4d33e3f7cd27', '', '2', '3', 'bill.recharge.RechargeRecordListUI', '1', '', '', '2016-09-29 22:01:57', '2016-09-29 22:01:57'), ('0005-724f7eeb-4fa8-4e95-897f-1843b7610df6', '000120160929220204', '工作台', '000120160929220204', '工作台', '', '', '0', '6', '', '1', '', '', '2016-09-29 22:02:36', '2016-09-29 22:02:36'), ('0005-2b219252-af39-4295-bedb-81590fce550f', '000120160929234112', '充值优惠', '000120160924214444!000120160929234112', '客户管理!充值优惠', '0005-63647c42-bb42-4779-900f-4d33e3f7cd27', '', '2', '4', 'bill.rechargegive.RechargeGiveListUI', '1', '', '', '2016-09-29 23:41:53', '2016-09-29 23:41:53'), ('0005-c45c87e1-3eef-485c-b028-c8f786bda121', '000120161001144216', '考勤记录', '000120160924212036!000120161001144216', '员工管理!考勤记录', '0005-c6f8f761-fb34-422d-be2f-11f0e2ff4996', '', '2', '4', 'bill.attendrecord.AttendRecordListUI', '1', '', '', '2016-10-01 14:42:44', '2016-10-01 14:42:44'), ('0005-5473f8f7-c8a3-47be-b7f6-755a7e0753b4', '000120161001211446', '员工工资单', '000120160924212036!000120161001211446', '员工管理!员工工资单', '0005-c6f8f761-fb34-422d-be2f-11f0e2ff4996', '', '0', '4', 'bill.salary.SalaryListUI', '1', '', '', '2016-10-01 21:15:12', '2016-10-01 21:15:12'), ('0005-c33e64d2-e610-4e22-af3c-7073849c296a', '000120161004130957', '采购单', '000120160925072705!000120161004130957', '产品管理!采购单', '0005-5d7e6a49-09b9-4165-8633-e9e0d14f9e2a', '', '0', '3', 'bill.purchase.PurchaseListUI', '1', '', '', '2016-10-04 13:10:27', '2016-10-04 13:10:27'), ('0005-e79b22d4-5a82-413e-a059-953bf107587f', '000120161012033216', '报表分析', '000120161012033216', '报表分析', '', '', '0', '7', '', '1', '', '', '2016-10-12 03:32:27', '2016-10-12 03:32:27'), ('0005-73bf4133-a799-4103-80f2-18419eb65923', '711993138', '项目消费记录查询', '000120161012033216!711993138', '报表分析!项目消费记录查询', '0005-e79b22d4-5a82-413e-a059-953bf107587f', '0036-49210375-fe20-4c05-a40b-114008182849', '3', '0', 'report.listrpt.ui.ListRptUI', '1', '', '', '2016-10-26 22:40:04', '2016-10-26 22:40:04'), ('0005-42c3f75f-7ea5-4008-8209-f777be110db4', '711993139', '客户余额跟踪报表', '000120161012033216!711993139', '报表分析!客户余额跟踪报表', '0005-e79b22d4-5a82-413e-a059-953bf107587f', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', '3', '0', 'report.listrpt.ui.ListRptUI', '1', '', '', '2016-11-29 05:10:44', '2016-11-29 05:10:44'), ('0005-31d073f9-5343-4ad1-ab19-fcba16758a94', '000120161203233119', '销售单', '000120160925164411!000120161203233119', '业务相关!销售单', '0005-1c9748d3-3797-4ad3-af55-5bd850b933cb', '', '2', '3', 'bill.sale.mutil.SaleMutilListUI', '1', '', '', '2016-12-04 00:12:47', '2016-12-04 00:12:47'), ('0005-db50472b6e384f17b3047561dc077268', '000120161205212437', '采购单', '000120160925072705!000120161205212437', '产品管理!采购单', '0005-5d7e6a49-09b9-4165-8633-e9e0d14f9e2a', '', '2', '5', 'bill.purchase.mutil.PurchaseMutilListUI', '1', '', '', '2016-12-05 21:25:15', '2016-12-05 21:25:15'), ('0005-a1e719c347ee432a8de2c539c0c0622b', '000120161210102922', '销售平台', '000120160929220204!000120161210102922', '工作台!销售平台', '0005-724f7eeb-4fa8-4e95-897f-1843b7610df6', '', '4', '1', 'ui.center.SaleCenterUI', '1', '', '', '2016-12-10 10:30:09', '2016-12-10 10:30:09');
COMMIT;

-- ----------------------------
--  Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fval` varchar(255) DEFAULT NULL,
  `fcustomerShopId` varchar(44) DEFAULT NULL,
  `famt` double DEFAULT '0',
  `fprice` double DEFAULT '0',
  `fisSms` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `sys_rpt_column`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rpt_column`;
CREATE TABLE `sys_rpt_column` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fkeyStr` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fval` varchar(100) DEFAULT NULL,
  `fwidth` int(11) DEFAULT '100',
  `falign` int(11) DEFAULT '0',
  `fdt` int(11) DEFAULT '0',
  `fisSum` tinyint(3) DEFAULT '0',
  `flevel` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `sys_rpt_column`
-- ----------------------------
BEGIN;
INSERT INTO `sys_rpt_column` VALUES ('0033-9d7441eb-573f-433f-b5c5-6e0fbe5763ba', '44', '0037-5819571c-17b7-433e-a1d5-8f0ee743dcf2', '4444', '4444', '4444', '444', '2', '1', '0', '0'), ('0033-bd52a19a-ae44-436e-92f1-336806f8a97d', '0', '0036-3c0fe0d3-83b4-46c7-8568-c6ef293fa7f4', 'fnumber', '编码', 'fnumber', '100', '2', '0', '0', '0'), ('0033-3bc0322e-d41e-4d43-a480-84fc1e0d8cf4', '0', '0036-49210375-fe20-4c05-a40b-114008182849', 'bizdate', '日期', 'bizdate', '100', '0', '0', '0', '0'), ('0033-da87ccd8-4204-4577-9a77-6579d2adc902', '1', '0036-49210375-fe20-4c05-a40b-114008182849', 'customer_name', '客户', 'customer_name', '100', '0', '0', '0', '0'), ('0033-d0832037-3865-47cc-8f90-2bb81c2b0019', '2', '0036-49210375-fe20-4c05-a40b-114008182849', 'project_name', '项目', 'project_name', '100', '0', '0', '0', '0'), ('0033-c4f616da-3c6a-455e-872e-270aeea67c6c', '3', '0036-49210375-fe20-4c05-a40b-114008182849', 'price', '单价', 'price', '100', '0', '2', '0', '0'), ('0033-1f036c47-a2f6-4e6c-a5b0-25efa6f41aab', '4', '0036-49210375-fe20-4c05-a40b-114008182849', 'qty', '次数', 'qty', '100', '0', '1', '0', '0'), ('0033-b0b3f07a-b5b7-4b46-96f8-e37b7331aae1', '5', '0036-49210375-fe20-4c05-a40b-114008182849', 'amt', '项目金额', 'amt', '100', '0', '2', '0', '0'), ('0033-9519b6b9-d865-45ad-8d22-9b59bf5ef11e', '6', '0036-49210375-fe20-4c05-a40b-114008182849', 'factamt', '实收金额', 'factamt', '100', '0', '2', '0', '0'), ('0033-cba2c3b3-cc4a-4013-9686-f9219c281497', '7', '0036-49210375-fe20-4c05-a40b-114008182849', 'pt', '付款方式', 'pt', '100', '0', '0', '0', '0'), ('0033-3d8961cc-7a5b-43de-9537-072eb54d7116', '8', '0036-49210375-fe20-4c05-a40b-114008182849', 'person_name', '负责任', 'person_name', '100', '0', '0', '0', '0'), ('0033-06cfd6d8e4b84d30ad7a7b8738321db1', '0', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'dateStr', '日期', 'dateStr', '100', '0', '0', '0', '0'), ('0033-cbf9698e9d584d5aab3415752a31acf6', '1', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'reAmt', '充值金额', 'reAmt', '150', '2', '0', '0', '0'), ('0033-2ac526918c3049ebbbb14fee96c62a35', '2', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'serCashAmt', '服务消费-现金', 'serCashAmt', '150', '2', '2', '0', '0'), ('0033-f783ba77b4f942dc9563bc6a5a4e2417', '3', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'serBankAmt', '服务消费-银行卡', 'serBankAmt', '150', '2', '2', '0', '0'), ('0033-fcbd108c6f6e4bd39b410944c5ac926f', '4', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'serVipAmt', '服务消费-下卡', 'serBankAmt', '150', '2', '2', '0', '0'), ('0033-23158bded3c44f4290954eb48cbadbd6', '5', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'serWebAmt', '服务消费-在线支付', 'serWebAmt', '150', '2', '2', '0', '0'), ('0033-a6f8e0d5a71e4b5d9d8357a15fa2d6e9', '6', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'serGroupAmt', '服务消费-团购', 'serGroupAmt', '150', '2', '2', '0', '0'), ('0033-404aaeec2f0d4e2f9dfb46e6bd2dafdc', '7', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'serAmt', '服务消费', 'serAmt', '150', '2', '2', '0', '0'), ('0033-b3612fb544d540699c7b1f11e2e1e192', '8', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'saleCashAmt', '购物消费-现金', 'saleCashAmt', '150', '2', '2', '0', '0'), ('0033-f4d2424c1310481ea8e5014c23f89abd', '9', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'saleBankAmt', '购物消费-银行卡', 'saleBankAmt', '150', '2', '2', '0', '0'), ('0033-3a33dc8a67644b2588c3f187d498417e', '10', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'saleVipAmt', '购物消费-下卡', 'saleVipAmt', '150', '2', '2', '0', '0'), ('0033-90cef21f0dbc4f7fa8d82a2653cac327', '11', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'saleWebAmt', '购物消费-在线支付', 'saleWebAmt', '150', '2', '2', '0', '0'), ('0033-fedcb241b2b34cbea2a2fc8dff9b5b0d', '12', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'saleGroupAmt', '购物消费-团购', 'saleGroupAmt', '150', '2', '2', '0', '0'), ('0033-476a0dfdab3a4a959ab34b3434cb657a', '13', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'saleAmt', '购物消费', 'saleAmt', '150', '2', '2', '0', '0'), ('0033-82a5450af731468da31a52ac01fe1799', '14', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'amt', '总消费金额', 'amt', '150', '2', '2', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_rpt_condition`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rpt_condition`;
CREATE TABLE `sys_rpt_condition` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fkeyStr` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fitems` varchar(255) DEFAULT NULL,
  `fhttpcls` varchar(255) DEFAULT NULL,
  `ffilter` varchar(255) DEFAULT NULL,
  `ftype` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `sys_rpt_condition`
-- ----------------------------
BEGIN;
INSERT INTO `sys_rpt_condition` VALUES ('0034-775d8b12-37da-4a55-86c1-a5bcdb8bfde7', '44', '0037-5819571c-17b7-433e-a1d5-8f0ee743dcf2', '444', '444', '444', '44444', '4444', '1'), ('0034-131a0fa4-31b3-4856-8c37-a40c4385bc1b', '0', '0036-49210375-fe20-4c05-a40b-114008182849', 'shopId', '店铺', 'shopId', '', '', '7'), ('0034-941feab6-e390-477a-b5c7-6516f2f82b2a', '1', '0036-49210375-fe20-4c05-a40b-114008182849', 'empty', '空', 'empty', '', '', '0'), ('0034-bc086fd2-463d-4ce1-8161-8ca69d5047e2', '2', '0036-49210375-fe20-4c05-a40b-114008182849', 'datefrom', '开始日期', 'datefrom', '', '', '6'), ('0034-a70782e0-eb9c-487e-be7a-9c2a1fbebec1', '3', '0036-49210375-fe20-4c05-a40b-114008182849', 'dateto', '结束日期', 'dateto', '', '', '6'), ('0034-c8a3a4db44854380a81de913dcd73b4f', '0', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'customerId', '客户', 'customerId', 'bas.customer.IHttpCustomer', '', '5'), ('0034-043e5eb1bf0b475f860fe9379e2056f2', '1', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'kong', '', '', '', '', '0'), ('0034-020102d122004a449317314bd27d8504', '2', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'dateFrom', '开始日期', 'dateFrom', '', '', '6'), ('0034-a9100cf8efcb4a2a9a969c4ef4ec3afa', '3', '0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', 'dateTo', '结束日期', 'dateTo', '', '', '6');
COMMIT;

-- ----------------------------
--  Table structure for `sys_rpt_crossrpt`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rpt_crossrpt`;
CREATE TABLE `sys_rpt_crossrpt` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fname` varchar(255) DEFAULT NULL,
  `fsqlStr` text,
  `ftype` int(11) DEFAULT '0',
  `fisfree` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `sys_rpt_crosssuffix`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rpt_crosssuffix`;
CREATE TABLE `sys_rpt_crosssuffix` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fkeyStr` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fval` varchar(100) DEFAULT NULL,
  `fwidth` int(11) DEFAULT '100',
  `falign` int(11) DEFAULT '0',
  `fdt` int(11) DEFAULT '0',
  `fisSum` tinyint(3) DEFAULT '0',
  `flevel` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `sys_rpt_crosssum`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rpt_crosssum`;
CREATE TABLE `sys_rpt_crosssum` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fkeyStr` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `fval` varchar(100) DEFAULT NULL,
  `fwidth` int(11) DEFAULT '100',
  `falign` int(11) DEFAULT '0',
  `fdt` int(11) DEFAULT '0',
  `fisSum` tinyint(3) DEFAULT '0',
  `flevel` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `sys_rpt_listrpt`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rpt_listrpt`;
CREATE TABLE `sys_rpt_listrpt` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fnumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fbizdate` timestamp NULL DEFAULT NULL,
  `fisAuditTrue` tinyint(3) DEFAULT '0',
  `fshopId` varchar(44) DEFAULT NULL,
  `fadminShopId` varchar(44) DEFAULT NULL,
  `fuseCount` int(11) DEFAULT '0',
  `fname` varchar(255) DEFAULT NULL,
  `fsqlStr` text,
  `ftype` int(11) DEFAULT '0',
  `fisfree` tinyint(3) DEFAULT '0',
  `fcreaterId` varchar(44) DEFAULT NULL,
  `flastUpdateUserId` varchar(44) DEFAULT NULL,
  `fcreatetime` timestamp NULL DEFAULT NULL,
  `flastUpdateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `sys_rpt_listrpt`
-- ----------------------------
BEGIN;
INSERT INTO `sys_rpt_listrpt` VALUES ('0036-49210375-fe20-4c05-a40b-114008182849', '00001', '2016-10-25 00:00:00', '1', '0001', '', '0', '项目消费记录查询', 'select\nperson.fname as person_name, \ncustomer.fname as customer_name, \nproject.fname as project_name, \na.fqty as qty,\na.fprice as price,\na.famt as amt,\na.ffactamt as factamt,\na.fremark as remark,\ncase when a.fpt = 0 then \'现金\' when a.fpt = 1 then \'刷银行卡\' when a.fpt = 2 then \'刷会员卡\' when a.fpt = 3 then \'微信/支付宝\' when a.fpt = 4 then \'团购\' else \'其他\' end as pt,\na.fnumber as number,\nDATE_FORMAT(a.fbizdate, \'%Y-%m-%d\')  as bizdate\nfrom bill_service a \nleft join base_person person on person.fid = a.fpersonid \nleft join base_customer customer on customer.fid = a.fcustomerid \nleft join base_project project on project.fid = a.fprojectid \nwhere a.fshopId = \':shopId\'\nand a.fbizdate >= \':datefrom\'\nand a.fbizdate <= \':dateto\'\nand a.fisAuditTrue = 1\norder by a.fnumber asc\n', '0', '1', '001', '001', '2016-10-25 00:10:19', '2016-10-25 13:31:13'), ('0036-1708f423-3f7d-4c68-8dfb-bef9f1a58e55', '00002', '2016-11-29 00:00:00', '1', '0001', '', '0', '客户余额跟踪报表', 'select\na.dateStr,\n\ncase when sum(a.giveAmt) > 0 then\nCONCAT(CAST(sum(a.amt) as char), \'(赠送金额：\', cast(sum(a.giveAmt) as char), \')\') \nelse CONCAT(cast(sum(a.amt) as char), \'\') end as reAmt,\n\n\nsum(a.serCashAmt) as serCashAmt,\nsum(a.serBankAmt) as serBankAmt,\nsum(a.serVipAmt) as serVipAmt,\nsum(a.serWebAmt) as serWebAmt,\nsum(a.serGroupAmt) as serGroupAmt,\nsum(a.serCashAmt) + sum(a.serBankAmt) + sum(a.serVipAmt) + sum(a.serWebAmt) + sum(a.serGroupAmt) as serAmt,\n\nsum(a.saleCashAmt) as saleCashAmt,\nsum(a.saleBankAmt) as saleBankAmt,\nsum(a.saleVipAmt) as saleVipAmt,\nsum(a.saleWebAmt) as saleWebAmt,\nsum(a.saleGroupAmt) as saleGroupAmt,\nsum(a.saleCashAmt) + sum(a.saleBankAmt) + sum(a.saleVipAmt) + sum(a.saleWebAmt) + sum(a.saleGroupAmt) as saleAmt,\n\n\nsum(a.serCashAmt) + sum(a.serBankAmt) + sum(a.serVipAmt) + sum(a.serWebAmt) + sum(a.serGroupAmt) + \nsum(a.saleCashAmt) + sum(a.saleBankAmt) + sum(a.saleVipAmt) + sum(a.saleWebAmt) + sum(a.saleGroupAmt) as amt\n\nfrom (\nselect\nDATE_FORMAT(r.fbizdate, \'%Y-%m-%d\') as dateStr,\nifnull(r.ffactamt, 0) as amt,\nifnull(r.fgiveamt, 0) as giveAmt,\n\n0 as serCashAmt,\n0 as serBankAmt,\n0 as serVipAmt,\n0 as serWebAmt,\n0 as serGroupAmt,\n\n0 as saleCashAmt,\n0 as saleBankAmt,\n0 as saleVipAmt,\n0 as saleWebAmt,\n0 as saleGroupAmt\n\nfrom bill_rechargerecord r\nwhere r.fisAuditTrue = 1\nand DATE_FORMAT(r.fbizdate, \'%Y-%m-%d\') >= \':dateFrom\'\nand DATE_FORMAT(r.fbizdate, \'%Y-%m-%d\') <= \':dateTo\'\nand r.fcustomerId = \':customerId\'\n\nunion all\n\nselect\nDATE_FORMAT(s.fbizdate, \'%Y-%m-%d\') as dateStr,\n0 as amt,\n0 as giveAmt,\n\ncase when s.fpt = 0 then s.ffactamt else 0 end as serCashAmt,\ncase when s.fpt = 1 then s.ffactamt else 0 end as serBankAmt,\ncase when s.fpt = 2 then s.ffactamt else 0 end as serVipAmt,\ncase when s.fpt = 3 then s.ffactamt else 0 end as serWebAmt,\ncase when s.fpt = 4 then s.ffactamt else 0 end as serGroupAmt,\n\n0 as saleCashAmt,\n0 as saleBankAmt,\n0 as saleVipAmt,\n0 as saleWebAmt,\n0 as saleGroupAmt\n\nfrom bill_service s\nwhere s.fisAuditTrue = 1\nand DATE_FORMAT(s.fbizdate, \'%Y-%m-%d\') >= \':dateFrom\'\nand DATE_FORMAT(s.fbizdate, \'%Y-%m-%d\') <= \':dateTo\'\nand s.fcustomerId = \':customerId\'\n\nunion all\n\nselect\nDATE_FORMAT(s.fbizdate, \'%Y-%m-%d\') as dateStr,\n0 as amt,\n0 as giveAmt,\n\n0 as serCashAmt,\n0 as serBankAmt,\n0 as serVipAmt,\n0 as serWebAmt,\n0 as serGroupAmt,\n\ncase when s.fpt = 0 then s.ffactamt else 0 end as saleCashAmt,\ncase when s.fpt = 1 then s.ffactamt else 0 end as saleBankAmt,\ncase when s.fpt = 2 then s.ffactamt else 0 end as saleVipAmt,\ncase when s.fpt = 3 then s.ffactamt else 0 end as saleWebAmt,\ncase when s.fpt = 4 then s.ffactamt else 0 end as saleGroupAmt\n\nfrom bill_sale s\nwhere s.fisAuditTrue = 1\nand DATE_FORMAT(s.fbizdate, \'%Y-%m-%d\') >= \':dateFrom\'\nand DATE_FORMAT(s.fbizdate, \'%Y-%m-%d\') <= \':dateTo\'\nand s.fcustomerId = \':customerId\'\n) a\ngroup by a.dateStr\norder by a.dateStr\n\n', '0', '1', '001', '001', '2016-11-29 05:10:38', '2016-12-04 23:12:17');
COMMIT;

-- ----------------------------
--  Table structure for `sys_rpt_shop`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rpt_shop`;
CREATE TABLE `sys_rpt_shop` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fseq` int(11) DEFAULT '0',
  `fparentid` varchar(44) DEFAULT NULL,
  `fshopId` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `sys_sumsmsrecord`
-- ----------------------------
DROP TABLE IF EXISTS `sys_sumsmsrecord`;
CREATE TABLE `sys_sumsmsrecord` (
  `fid` varchar(44) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fshopId` varchar(44) DEFAULT NULL,
  `fdateStr` varchar(44) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
