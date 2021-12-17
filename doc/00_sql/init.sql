CREATE TABLE `administrator` (
  `administrator_id` int NOT NULL AUTO_INCREMENT COMMENT '管理員編號',
  `administrator_account` varchar(20) NOT NULL COMMENT '管理員帳號',
  `administrator_password` varchar(20) NOT NULL COMMENT '管理員密碼',
  `administrator_class` int NOT NULL COMMENT '管理員階級',
  `administrator_authority` int NOT NULL COMMENT '管理員權限',
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `administrator_account_UNIQUE` (`administrator_account`)
)

CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT COMMENT '商品編號',
  `book_name` varchar(50) NOT NULL COMMENT '商品名稱',
  `book_content` varchar(200) NOT NULL COMMENT '商品介紹',
  `book_qty` int NOT NULL COMMENT '商品數量',
  `book_img` longblob COMMENT '商品圖片',
  `added_time` datetime DEFAULT NULL COMMENT '上架時間',
  `down_time` datetime DEFAULT NULL COMMENT '下架時間',
  PRIMARY KEY (`book_id`)
)


CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT COMMENT '會員編號',
  `member_account` varchar(16) NOT NULL COMMENT '會員帳號',
  `member_password` varchar(16) NOT NULL COMMENT '會員密碼',
  `member_nick` varchar(20) NOT NULL COMMENT '會員暱稱',
  `creat_time` datetime DEFAULT NULL COMMENT '創建時間',
  `member_state` int NOT NULL COMMENT '會員狀態0=下線,1=上線,2=刪除帳號',
  PRIMARY KEY (`member_id`)
)