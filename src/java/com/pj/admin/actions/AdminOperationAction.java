/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pj.admin.actions;

import com.pj.actions.BaseAction;
import com.pj.admin.beans.AdminUser;
import com.pj.admin.services.AdminService;
import com.pj.utilities.StringUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author lzw
 */
public class AdminOperationAction extends BaseAction{
    
    public String listRoles(){
        AdminService service = new AdminService();
        ServletActionContext.getRequest().setAttribute("roles", service.listRoles());
        return SUCCESS;
    }
    
    private AdminUser admin;
    private String[]    roleList;
    
    public  String addNewAdmin(){
        
        if (admin == null) {
            
            listRoles();
            return INPUT;
        }
        
        if (StringUtility.isEmpty(admin.getAdminName())) {
            ServletActionContext.getRequest().setAttribute("error", "用户名不能为空");
            
            return ERROR;
        }
        
        if (StringUtility.isEmpty(admin.getAdminRealName())) {
            ServletActionContext.getRequest().setAttribute("error", "真实姓名不能为空");
            
            return ERROR;
        }
        
        if (StringUtility.isEmpty(admin.getPassword())) {
            ServletActionContext.getRequest().setAttribute("error", "密码不能为空");
            
            return ERROR;
        }
        
        if (roleList == null || roleList.length < 1) {
            ServletActionContext.getRequest().setAttribute("error", "至少要选择一个角色");
            
            return ERROR;
        }
        
        
        AdminService service = new AdminService();
        if (service.addAdmin(admin, roleList)) {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            try {
                ServletActionContext.getRequest().getRequestDispatcher("/admin/ListAdmins.action").forward(request, response);
            } catch (Exception e) {
                Logger.getLogger(this.getClass()).error("添加管理员", e);
            }
        }
        
        ServletActionContext.getRequest().setAttribute("error", "添加失败");
        return ERROR;
    }
    
    
    private String[] adminIds;
    public String deleteAdmin(){
        
        if (adminIds != null && adminIds.length > 0) {
            Integer[] intIds = new Integer[adminIds.length];
            for (int i = 0; i < adminIds.length; i++) {
                intIds[i] = Integer.valueOf(adminIds[i]);
            }
            
            AdminService service = new AdminService();
            HttpServletResponse response = ServletActionContext.getResponse();
            if (service.deleteAdmins(intIds)) {
                
                try {
                    response.getWriter().write("OK");
                } catch (Exception e) {
                }
                
            }else{
                try {
                    response.getWriter().write("FAIL");
                } catch (Exception e) {
                }
            }
        }
        return null;
    }

    public String[] getAdminIds() {
        return adminIds;
    }

    public void setAdminIds(String[] adminIds) {
        this.adminIds = adminIds;
    }
    
    

    public AdminUser getAdmin() {
        return admin;
    }

    public void setAdmin(AdminUser admin) {
        this.admin = admin;
    }

    public String[] getRoleList() {
        return roleList;
    }

    public void setRoleList(String[] roleList) {
        this.roleList = roleList;
    }
    
}
