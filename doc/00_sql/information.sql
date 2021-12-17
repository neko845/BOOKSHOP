CREATE TABLE `information` (
  `information_id` int NOT NULL AUTO_INCREMENT COMMENT '消息編號',
  `information_name` varchar(80) NOT NULL COMMENT '消息標題',
  `information_content` varchar(800) NOT NULL COMMENT '消息內容',
  `information_img` longblob NOT NULL COMMENT '消息圖片',
  `added_time` datetime DEFAULT NULL COMMENT '上架時間',
  `down_time` datetime DEFAULT NULL COMMENT '下架時間',
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

insert into EXAMPLE.information(information_name,information_content,added_time,down_time) values('消息標題','消息內容','2021-12-17 12:00','2021-12-31 12:00')
insert into EXAMPLE.information(information_name,information_content,added_time,down_time) values('消息標題2','消息內容2','2021-12-17 12:00','2021-12-31 12:00')