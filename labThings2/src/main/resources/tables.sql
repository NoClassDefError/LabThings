drop table if exists category;
create table category
(
    id             bigint primary key auto_increment comment '物品类别id',
    name           varchar(50) not null,
    parentCategory bigint comment '必须为本表id或空',
    description    varchar(300) comment '描述',
    date           timestamp default current_timestamp comment '时间'
) comment '类别表，分为多个级别';

drop table if exists things;
create table things
(
    thingId     bigint auto_increment comment '物品id 自增长',
    category    bigint comment '种类',
    description varchar(300) comment '描述',
    imageUrl    varchar(100) comment '封面图片地址',
    name        varchar(100) not null comment '名字',
    date        timestamp default current_timestamp comment '购买时间',
    primary key (thingId),
    constraint fk_category foreign key (category) references category (id)
) comment '物品表';

drop table if exists log;
create table log
(
    id      bigint primary key auto_increment,
    content varchar(500),
    thingId bigint,
    date    timestamp not null default current_timestamp,
    constraint fk_thingId foreign key (thingId) references things (thingId)
) comment '物品事件记录';

drop table if exists image;
create table image
(
    imageId    bigint primary key auto_increment,
    thingId    bigint,
    logId      bigint,
    categoryId bigint,
    url        varchar(100),
    constraint fk_thing2Id foreign key (thingId) references things (thingId),
    constraint fk_logId foreign key (logId) references log (id),
    constraint fk_categoryId foreign key (categoryId) references category (id)
) comment '图片表';


alter table image
    add imageId bigint primary key auto_increment;
insert into image (categoryId, url)
VALUES (21, 'a');

INSERT INTO `category`
VALUES (1, '实验仪器', NULL, NULL, '2019-08-19 11:45:05'),
       (2, '电子仪器', 1, NULL, '2019-08-19 11:46:21'),
       (3, '元器件', 2, NULL, '2019-08-19 11:46:48'),
       (4, '晶体管', 3, NULL, '2019-08-19 11:47:08'),
       (5, '三极管', 4, NULL, '2019-08-19 11:47:38'),
       (6, 'NPN型三极管', 5, NULL, '2019-08-19 11:48:31'),
       (7, 'PNP型三极管', 5, NULL, '2019-08-19 11:50:30'),
       (8, '办公用品', NULL, NULL, '2019-08-19 11:52:42'),
       (9, '家具', 8, NULL, '2019-08-19 11:53:11'),
       (10, '试验台', 9, NULL, '2019-08-19 11:53:29'),
       (11, '计算机及其组件', 8, NULL, '2019-08-19 11:53:53'),
       (12, '服务器', 11, NULL, '2019-08-19 11:54:19'),
       (13, '台式主机', 11, NULL, '2019-08-19 11:54:42'),
       (14, '显示器', 11, NULL, '2019-08-19 11:55:55'),
       (15, '键盘', 11, NULL, '2019-08-19 11:56:20'),
       (16, '测量仪器', 2, NULL, '2019-08-19 11:56:57'),
       (17, '示波器', 16, NULL, '2019-08-19 11:57:17'),
       (18, '生产工具', NULL, NULL, '2019-08-19 11:59:08'),
       (19, '小型工具', 18, NULL, '2019-08-19 11:59:33'),
       (20, '大型工具', 18, NULL, '2019-08-19 11:59:47'),
       (21, '电焊枪', 19, NULL, '2019-08-25 08:46:15'),
       (24, '12341', 20, '333333', NULL);
select * from image;
insert into image values (1,NULL,NULL,21,'/img/img1');
drop table log;
drop table image;