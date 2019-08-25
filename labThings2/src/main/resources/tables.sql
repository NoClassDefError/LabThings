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
    id      bigint auto_increment,
    content varchar(500),
    thingId bigint,
    date    timestamp not null default current_timestamp,
    constraint fk_thingId foreign key (thingId) references things (thingId)
) comment '物品事件记录';

drop table if exists image;
create table image
(
    imageId   bigint primary key auto_increment,
    thingId    bigint,
    logId      bigint,
    categoryId bigint,
    url        varchar(100),
    constraint fk_thing2Id foreign key (thingId) references things (thingId),
    constraint fk_logId foreign key (logId) references log (id),
    constraint fk_categoryId foreign key (categoryId) references category (id)
) comment '图片表';

alter table image add imageId bigint primary key auto_increment;
insert into image (categoryId,url) VALUES (21,'a');

