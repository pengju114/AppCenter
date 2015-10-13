create database db_app_center;

use db_app_center;


/***************************
 * 项目部分
 **************************/


/** 软件分类表 **/
create table if not exists t_app_category(
    category_id           int primary key auto_increment,
    category_name         nvarchar(100) not null,
    category_icon_url     nvarchar(500),
    category_parent_id    int default 0
);

/** 软件表，评论表用 t_comment表，article_id设置为app_id **/
create table if not exists t_app (
    app_id        int primary key auto_increment,
    app_url       nvarchar(300),     -- appURL
    app_icon_url  nvarchar(300),     -- app图标URL
    app_name      nvarchar(200),     -- app名字
    app_abstract  nvarchar(500),     -- app简述
    app_introduction nvarchar(2000), -- app介绍
    app_label     nvarchar(100),     -- app标签，类似口号
    app_tag       nvarchar(100),     -- app标记，多个用,隔开（如：无广告,安全）
    app_file_name nvarchar(200),     -- app文件名
    app_size      bigint,            -- app大小,字节
    app_level     int default 0,     -- 星评
    app_keywords  nvarchar(100),
    app_record_date date,            -- 创建日期
    app_status tinyint default 0,    -- 0:正常; 1:删除; 2:冻结
    app_version_name nvarchar(10),
    app_version_code bigint,
    app_download_count bigint,
    app_from      nvarchar(100),     -- 来源
    app_author    nvarchar(200),     -- 开发者
);

/** 软件平台表 **/
create table if not exists t_platform (
    platform_id        int primary key auto_increment,
    platform_name      nvarchar(100),     -- 平台名字
);

/** 软件<->软件分类映射表 **/
create table if not exists t_app_category_mapping(
    mapping_id           int primary key auto_increment,
    category_id          int,
    app_id               int
);

/** 软件<->软件平台映射表,一个app可能是多个平台，如java app **/
create table if not exists t_app_platform_mapping(
    mapping_id           int primary key auto_increment,
    platform_id          int,
    app_id               int
);

--创建约束

/* 软件截图表 */
create table if not exists t_app_image(
    image_id        int primary key auto_increment,
    image_type      int default 0,     -- 图片类型.0-普通图片;1-用户头像；2-用户上传图片; 3-轮播图片；4-广告图片... 
    image_link      nvarchar(300),     -- 点击图片指向的链接
    image_url       nvarchar(300),     -- 图像URL
    image_name      nvarchar(200),     -- 图片名字
    image_description nvarchar(500),   -- 图片描述
    image_file_name nvarchar(200),     -- 图片文件名
    image_size      int,               -- 图片大小,字节
    app_id          int
);