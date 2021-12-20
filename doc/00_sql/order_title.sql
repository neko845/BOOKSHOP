CREATE TABLE `order_title` (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '訂單編號',
  `member_account` varchar(80) NOT NULL COMMENT '會員帳號',
  `order_time` datetime DEFAULT NULL COMMENT '成立時間',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci