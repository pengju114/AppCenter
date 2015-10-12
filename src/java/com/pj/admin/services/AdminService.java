/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pj.admin.services;

import com.pj.admin.beans.AdminUser;
import com.pj.admin.beans.Authority;
import com.pj.admin.beans.Role;
import com.pj.jdbc.core.ResultList;
import com.pj.jdbc.core.ResultRow;
import com.pj.jdbc.services.BaseService;
import com.pj.utilities.ArrayUtility;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author lzw
 */
public class AdminService extends BaseService {
    public static final String ADMIN_TABLE="t_admin";
    public static final String ROLE_TABLE="t_role";
    public static final String ADMIN_ROLE_MAPPING_TABLE = "t_admin_role_mapping";
    public static final String AUTHORITY_TABLE = "t_authority";
    public static final String AUTHORITY_ROLE_MAPPING_TABLE = "t_authority_role_mapping";
    
    private static final Logger LOGGER=Logger.getLogger(AdminService.class.getName());
    
    public AdminUser findAdminUserByNameAndPassword(String name,String pwd){
        String sql="select * from "+ADMIN_TABLE+" as a where a.admin_name=? and a.admin_password=?";
        try {
            AdminUser user=getJdbcTemplate().querySingle(sql, new Object[]{name,pwd}, AdminUser.class);
            return user;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
        return null;
    }
    
    public List<AdminUser> findAdminUserByName(String name){
        String sql="select * from t_admin as a where a.admin_name like ? or a.admin_real_name like ?";
        name = "%"+name+"%";
        ResultList<AdminUser> list = getJdbcTemplate().executeQuery(sql, new Object[]{name,name}, AdminUser.class);
        if (list != null) {
            return list.toList();
        }
        return null;
    }
    
    public ResultList<AdminUser> listAdmins(int startRow,int rowCount){
        return  getJdbcTemplate().executeQuery("select * from "+ADMIN_TABLE,null, startRow, rowCount, AdminUser.class);
    }
    
    public ResultList<AdminUser> listAdmins(String name,int startRow,int rowCount){   
        name = "%"+name+"%";
        return  getJdbcTemplate().executeQuery("select * from "+ADMIN_TABLE+" a where a.admin_name like ? or a.admin_real_name like ?",new String[]{name,name}, startRow, rowCount, AdminUser.class);
    }
    
    public ResultList<Role> listRoles(){
        String sql = "select * from "+ROLE_TABLE;
        return getJdbcTemplate().executeQuery(sql, Role.class);
    }
    
    public ResultList<Authority> listAuthorities(){
        String sql = "select * from "+AUTHORITY_TABLE;
        return getJdbcTemplate().executeQuery(sql, Authority.class);
    }
    
    public boolean hasAuthority(AdminUser adminUser,Authority authority){
        if (adminUser == null || authority == null) {
            return false;
        }
        String sql = "select * from t_view_authority_detail where admin_id = ? and authority_id = ?";
        ResultRow row;
        try {
            row = getJdbcTemplate().querySingle(sql, new Object[]{adminUser.getAdminId(),authority.getAuthorityId()});
            
            return row != null;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AdminService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public ResultList<Role> getRolesByAdminId(Integer adminId){
        if (adminId == null) {
            return null;
        }
        String sql = "select r.* from %s r,%s a,%s m where r.role_id = m.role_id and a.admin_id = m.admin_id and a.admin_id = ?";
        sql = String.format(sql, ROLE_TABLE,ADMIN_TABLE,ADMIN_ROLE_MAPPING_TABLE);
        return getJdbcTemplate().executeQuery(sql, new Object[]{adminId}, Role.class);
    }
    
    public ResultList<Authority> getAuthoritiesByRoleId(Integer roleId){
        if (roleId == null) {
            return null;
        }
        String sql = "select a.* from %s a,%s r, % m where a.authority_id = m.authority_id and r.role_id = m.role_id and r.role_id = ?";
        sql = String.format(sql, AUTHORITY_TABLE,ROLE_TABLE,AUTHORITY_ROLE_MAPPING_TABLE);
        
        return getJdbcTemplate().executeQuery(sql, new Object[]{roleId}, Authority.class);
    }
    
    public boolean hasAuthorityByAuthorityKey(Integer adminUserId,String key){
        if (adminUserId == null || key == null) {
            return false;
        }
        String sql = "select * from t_view_authority_detail where admin_id = ? and authority_key = ?";
        ResultRow row = null;
        try {
            row = getJdbcTemplate().querySingle(sql, new Object[]{adminUserId,key});
            
            return row != null;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AdminService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean addAdmin( AdminUser adminUser, String[] roleIds){
        if (adminUser == null) {
            return false;
        }
        adminUser.setCreateDate(new java.sql.Date(System.currentTimeMillis()));
        boolean success = getJdbcTemplate().save(adminUser)>0;
        
        if (success) {
            
            ArrayList<Object[]> values = new ArrayList<Object[]>();
            AdminUser admin = null;
            try {
                admin = getJdbcTemplate().querySingle("select * from "+ADMIN_TABLE+" where admin_name=? and admin_real_name=? and admin_password=?", new Object[]{adminUser.getAdminName(),adminUser.getAdminRealName(),adminUser.getPassword()}, AdminUser.class);
               
            } catch (Exception e) {
            }
            
            
            for (String roleId : roleIds) {
                int index = roleId.indexOf('_');
                if (index == -1) {
                    continue;
                }
                String id = roleId.substring(0, index);
//                String key  = roleId.substring(index+1, roleId.length());
                values.add(new Object[]{admin.getAdminId(),id});
            }
            
            String sql = "insert into %s(admin_id ,role_id) values(?,?)";
            sql = String.format(sql, ADMIN_ROLE_MAPPING_TABLE);
            
            getJdbcTemplate().executeBatch(sql, values);
        }
        
        return success;
    }
    
    public boolean deleteAdmins(Integer[] adminIds){
        // 先删除关联角色
        String sql = "delete from %s where admin_id in (%s)";
        sql = String.format(sql, ADMIN_ROLE_MAPPING_TABLE,ArrayUtility.join("?", adminIds.length, ","));
        boolean ok = getJdbcTemplate().executeUpdate(sql, adminIds) > 0;
        
        // 删除管理员
        sql = String.format("delete from %s where admin_id in (%s)", ADMIN_TABLE,ArrayUtility.join("?", adminIds.length, ","));
        ok = getJdbcTemplate().executeUpdate(sql, adminIds) > 0;
        return ok;
    }
}
