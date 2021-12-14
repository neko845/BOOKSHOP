CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT COMMENT '商品編號',
  `book_name` varchar(50) NOT NULL COMMENT '商品名稱',
  `book_content` varchar(200) NOT NULL COMMENT '商品介紹',
  `book_qty` int NOT NULL COMMENT '商品數量',
  `book_img` longblob COMMENT '商品圖片',
  `added_time` datetime DEFAULT NULL COMMENT '上架時間',
  `down_time` datetime DEFAULT NULL COMMENT '下架時間',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci