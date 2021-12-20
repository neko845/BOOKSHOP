CREATE TABLE `order_content` (
  `order_id` int NOT NULL COMMENT '訂單編號',
  `book_id` int NOT NULL COMMENT '商品編號',
  KEY `order_id` (`order_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `order_content_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_title` (`order_id`),
  CONSTRAINT `order_content_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci