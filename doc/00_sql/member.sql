CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT COMMENT '會員編號',
  `member_account` varchar(16) NOT NULL COMMENT '會員帳號',
  `member_password` varchar(16) NOT NULL COMMENT '會員密碼',
  `member_nick` varchar(20) NOT NULL COMMENT '會員暱稱',
  `creat_time` datetime DEFAULT NULL COMMENT '創建時間',
  `member_state` int NOT NULL COMMENT '會員狀態0=下線,1=上線,2=刪除帳號',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

insert into EXAMPLE.member (member_account ,member_password,member_nick,creat_time,member_state) values ('test123','123465','���','2021-12-04 12:00',0)
insert into EXAMPLE.member (member_account ,member_password,member_nick,creat_time,member_state) values ('test','123','�����','2021-12-5 12:30',0)