create database db_app_center;

use db_app_center;


/***************************
 * 管理员权限部分
 **************************/


/** 创建管理员表 **/
create table if not exists t_admin(
    admin_id        int primary key auto_increment,
    admin_name      nvarchar(100) not null,
    admin_real_name nvarchar(100),
    admin_password  nvarchar(100) not null,
    admin_phone     nvarchar(20),
    admin_mobile    nvarchar(20),
    admin_sex       int not null,/*1 男；0女*/
    admin_email     nvarchar(200),
    create_date     date
);

/** 创建权限表 **/
create table if not exists t_authority (
    authority_id      int primary key auto_increment,
    authority_name    nvarchar(100) not null,
    authority_key     nvarchar(100) not null unique,
    last_modified_by  int, /** 最后修改人ID **/
    create_date       date
);

/** 角色表 **/
create table if not exists t_role(
    role_id    int primary key auto_increment,
    role_name  nvarchar(100) not null,
    role_key   nvarchar(100) not null unique,
    role_level int default 0, /** 权限级别 **/
    role_info  nvarchar(300),
    role_type  tinyint default 0, -- 0表示用户角色，1表示管理员角色.
    last_modified_by  int /** 最后修改人ID **/
);


/** 权限映射表 */
create table if not exists t_authority_role_mapping(
    mapping_id      int primary key auto_increment,
    authority_id    int not null,
    role_id        int not null,

    foreign key(authority_id) references t_authority(authority_id) on delete no action,
    foreign key(role_id) references t_role(role_id) on delete cascade
);

/** 人员权限组映射表 **/
create table if not exists t_admin_role_mapping(
    mapping_id  int primary key auto_increment,
    admin_id    int not null,
    role_id    int not null,

    foreign key(admin_id) references t_admin(admin_id) on delete cascade,
    foreign key(role_id) references t_role(role_id) on delete cascade
);

/** 查询用户拥有的权限名称 **/

create view t_view_authority_detail(
    admin_id,
    admin_name,
    admin_real_name,
    admin_sex,
    admin_email,
    role_id,
    role_key,
    role_name,
    role_level,
    role_type,
    authority_id,
    authority_key,
    authority_name
) as select ad.admin_id,ad.admin_name,ad.admin_real_name,ad.admin_sex,ad.admin_email,
	   ag.role_id,ag.role_key,ag.role_name,ag.role_level,ag.role_type,
	   au.authority_id,au.authority_key,au.authority_name 
from t_admin ad,
	 t_role ag,
	 t_admin_role_mapping agm,
	 t_authority au,
	 t_authority_role_mapping augm
where ad.admin_id=agm.admin_id 
	and agm.role_id=ag.role_id 
	and ag.role_id=augm.role_id 
	and augm.authority_id=au.authority_id 
	and ag.role_id=augm.role_id 
	and au.authority_id=augm.authority_id;

select * from t_view_authority_detail;



/***************************
 * 内容管理部分
 **************************/


/* 图片表 */
create table if not exists t_image(
    image_id        int primary key auto_increment,
    image_type      int default 0,     -- 图片类型.0-普通图片;1-用户头像；2-用户上传图片; 3-轮播图片；4-广告图片... 
    image_link      nvarchar(300),     -- 点击图片指向的链接
    image_url       nvarchar(300),     -- 图像URL
    image_name      nvarchar(200),     -- 图片名字
    image_description nvarchar(500),   -- 图片描述
    image_file_name nvarchar(200),     -- 图片文件名
    image_size      int,               -- 图片大小,字节
    image_order     int,
    image_create_date date, -- 创建日期
    image_status tinyint default 0 -- 0:正常; 1:删除; 2:冻结
);

/* 附件表 */
create table if not exists t_attachment(
    attachment_id        int primary key auto_increment,
    attachment_url       nvarchar(300),     -- 图像URL
    attachment_name      nvarchar(200),     -- 图片名字
    attachment_description nvarchar(500),   -- 图片描述
    attachment_file_name nvarchar(200),     -- 图片文件名
    attachment_size      bigint,               -- 图片大小,字节
    attachment_level     int default 0,
    attachment_keywords  nvarchar(100),
    attachment_create_date date, -- 创建日期
    attachment_status tinyint default 0 -- 0:正常; 1:删除; 2:冻结
);


/* 用户表 */
create table if not exists t_user(
    user_id        int primary key auto_increment,
    user_name      nvarchar(100) not null,
    user_head_url  nvarchar(300),
    user_real_name nvarchar(100),
    user_password  nvarchar(100) not null,
    user_phone     nvarchar(20),
    user_mobile    nvarchar(20),
    user_sex       tinyint not null,/*1 男；0女*/
    user_email     nvarchar(200),
    user_create_date     date
);



create table if not exists t_category(
    category_id         int primary key auto_increment,
    category_parent_id  int default 0,     -- 父栏目ID,0表示顶级栏目
    category_type       tinyint default 0,     -- 栏目类型,0表示网站栏目；1表示管理系统栏目
    category_name       nvarchar(100) not null,   -- 栏目名称
    category_description  nvarchar(500),   -- 描述
    category_url        nvarchar(300) default '#',     -- 类别URL
    category_order      int,
    category_create_date date, -- 创建日期
    category_status tinyint default 0 -- 0:正常; 1:删除; 2:冻结
);

/** 栏目角色映射表 **/
create table if not exists t_category_role_mapping(
    mapping_id  int primary key auto_increment,
    category_id    int not null,
    role_id    int not null,

    foreign key(category_id) references t_category(category_id) on delete no action,
    foreign key(role_id) references t_role(role_id) on delete no action
);


/* 文章表 */

create table if not exists t_article(
    article_id        int primary key auto_increment,
    category_id       int,     -- 所属类别ID
    article_title     nvarchar(1000) not null,   -- 文章标题
    article_subtitle  nvarchar(1000),   -- 副标题
    article_url       nvarchar(300) default '#',    -- 文章URL
    article_author_id int ,      -- 作者ID
    article_create_date date, -- 创建日期
    article_content   text not null,
    article_keywords  nvarchar(100), -- 关键字,多个用英文逗号隔开
    article_abstract  nvarchar(800), -- 文章摘要
    article_show_flag tinyint default 1, -- 是否显示,0：不显示；1：显示
    article_level     int default 0, -- 文章级别; 0:一般
    article_publisher_id int, -- 发布者ID
    article_publish_date date, -- 发布日期
    article_comment_flag tinyint default 1, -- 是否允许评论 0:否；1:可以
    article_last_modify_date date,
    article_status tinyint default 0, -- 0:正常; 1:删除; 2:冻结

    foreign key(category_id) references t_category(category_id) on delete cascade,
    foreign key(article_author_id) references t_user(user_id) on delete cascade
);

/** 人员权限组映射表 **/
create table if not exists t_article_role_mapping(
    mapping_id  int primary key auto_increment,
    article_id    int not null,
    role_id    int not null,

    foreign key(article_id) references t_article(article_id) on delete no action,
    foreign key(role_id) references t_role(role_id) on delete no action
);


/* 留言/评论表 */
create table if not exists t_comment(
    comment_id        int primary key auto_increment,
    article_id        int,     -- 所属文章ID
    comment_parent_id int,   -- 父评论/留言ID
    comment_author_id int ,
    comment_create_date date, -- 创建日期
    comment_content   text not null,
    comment_keywords  nvarchar(100), -- 关键字,多个用英文逗号隔开
    comment_level     int default 0, -- 文章级别; 0:一般
    comment_status tinyint default 0, -- 0:正常; 1:删除; 2:冻结

    foreign key(article_id) references t_article(article_id) on delete cascade,
    foreign key(comment_author_id) references t_user(user_id) on delete no action
);
