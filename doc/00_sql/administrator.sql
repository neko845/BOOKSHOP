CREATE TABLE `administrator` (
  `administrator_id` int NOT NULL AUTO_INCREMENT COMMENT '管理員編號',
  `administrator_account` varchar(20) NOT NULL COMMENT '管理員帳號',
  `administrator_password` varchar(20) NOT NULL COMMENT '管理員密碼',
  `administrator_class` int NOT NULL COMMENT '管理員階級',
  `administrator_authority` int NOT NULL COMMENT '管理員權限',
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `administrator_account_UNIQUE` (`administrator_account`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci