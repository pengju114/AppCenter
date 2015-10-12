use db_app_center;

insert into t_admin(
    admin_name,
    admin_real_name,
    admin_password,
    admin_phone,
    admin_mobile,
    admin_sex,/*1 男；0女*/
    admin_email,
    create_date) 
values (
	'pengju',
	'陆振文',
	'762354',
	'',
	'',
	1,
	'',
	current_date()
);

insert into t_admin(
    admin_name,
    admin_real_name,
    admin_password,
    admin_phone,
    admin_mobile,
    admin_sex,/*1 男；0女*/
    admin_email,
    create_date) 
values (
	'niclose',
	'尼可拉斯',
	'111111',
	'',
	'',
	1,
	'',
	current_date()
);

select * from t_admin;

insert into t_authority( 
	authority_name,
    authority_key,
    last_modified_by, /** 最后修改人ID **/
    create_date )
 values(
	'添加管理员',
	'tjgly',
	1,
	curdate()
);
insert into t_authority( 
	authority_name,
    authority_key,
    last_modified_by, /** 最后修改人ID **/
    create_date )
 values(
	'删除管理员',
	'scgly',
	1,
	curdate()
);

select * from t_authority;

insert  into t_role(
	role_name,
    role_key,
    role_level, /** 权限级别 **/
    role_type, /** 权限类别 **/
    role_info,
    last_modified_by
)
values(
	'超级管理员',
	'cjgly',
	1,
	1,
	'最高级管理员',
	1
);
select * from t_role;

insert into t_authority_role_mapping(
	authority_id,
    role_id
) 
values(
	1,
	1
);
insert into t_authority_role_mapping(
	authority_id,
    role_id   
) 
values(
	2,
	1
);
select * from t_authority_role_mapping;

insert into t_admin_role_mapping(
	admin_id ,
    role_id 
)
values(
	2,
	1
);

insert into t_admin_role_mapping(
	admin_id ,
    role_id 
)
values(
	1,
	1
);

select * from t_admin_role_mapping;

select * from t_view_authority_detail;