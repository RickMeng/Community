create database community;

CREATE TABLE `user` (
  `userid` int NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `gender` tinyint DEFAULT NULL COMMENT '1男 2女',
  `nickname` varchar(30) DEFAULT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `createtime` varchar(100) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  primary key(userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

insert into user()


create table comment(
commentid int auto_increment,
content varchar(100) not null,
userid int not null,
postid int not null,
checked int default 0,
createtime datetime,
primary key(commentid),
foreign key(userid) references user(userid),
foreign key(postid) references post(postid)
)