/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/11/16 15:34:51                          */
/*==============================================================*/
SET FOREIGN_KEY_CHECKS = 0;

drop table if exists account;

drop table if exists comment;

drop table if exists liked;

drop table if exists weibo;

/*==============================================================*/
/* Table: account                                               */
/*==============================================================*/
create table account
(
   aid                  int(5) not null auto_increment,
   email                varchar(50) not null,
   nick_name            varchar(50),
   password             varchar(50) not null,
   follow               int,
   fans                 int,
   weibo                int,
   pic                  varchar(50),
   primary key (aid)
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   cid                  int(5) not null auto_increment,
   wid                  int(5),
   aid                  int(5),
   ccontent             varchar(140),
   ctime                datetime,
   primary key (cid)
);

/*==============================================================*/
/* Table: liked                                                 */
/*==============================================================*/
create table liked
(
   aid                  int(5),
   wid                  int(5) not null,
   ltime                datetime,
   primary key (wid)
);

/*==============================================================*/
/* Table: weibo                                                 */
/*==============================================================*/
create table weibo
(
   wid                  int(5) not null auto_increment,
   aid                  int(5),
   wcontent             varchar(140),
   last_update_time     datetime,
   service              varchar(100),
   liked                int,
   comment              int,
   primary key (wid)
);

alter table comment add constraint FK_Relationship_2 foreign key (aid)
      references account (aid) on delete restrict on update restrict;

alter table comment add constraint FK_Relationship_3 foreign key (wid)
      references weibo (wid) on delete restrict on update restrict;

alter table liked add constraint FK_Relationship_4 foreign key (aid)
      references account (aid) on delete restrict on update restrict;

alter table liked add constraint FK_Relationship_5 foreign key (wid)
      references weibo (wid) on delete restrict on update restrict;

alter table weibo add constraint FK_Relationship_1 foreign key (aid)
      references account (aid) on delete restrict on update restrict;

