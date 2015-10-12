/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pj.admin.actions;

import com.pj.actions.BaseAction;
import com.pj.admin.beans.AdminUser;
import com.pj.admin.services.AdminService;
import com.pj.web.res.Constans;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author lzw
 */
public class FindAdminAction extends BaseAction {
    private final int rowCount = 10;
    
    private int   startRow;
    public String listAdmins(){
        AdminService service = new AdminService();
        ServletActionContext.getRequest().setAttribute("admins", service.listAdmins(startRow, rowCount));
        ServletActionContext.getRequest().setAttribute("authorities", service.listAuthorities());
        
        setDeleteAndModifyAuthority(getCurrentAdmin());
        
        return SUCCESS;
    }

    public int getStartRow() {
        return startRow;
    }
    
    private void setDeleteAndModifyAuthority(AdminUser user){
        boolean has = false;
        if (user != null) {
            AdminService service = new  AdminService();
            has = service.hasAuthorityByAuthorityKey(user.getAdminId(), Constans.AuthorityKey.DELETE_ADMIN);
        }
        
        ServletActionContext.getRequest().setAttribute("delete", Boolean.valueOf(has));// 有删除权限
        ServletActionContext.getRequest().setAttribute("modify", Boolean.valueOf(has));// 有修改权限
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
    
    
    private String adminName;
    public String findAdmin(){
        ServletActionContext.getRequest().setAttribute("adminName", adminName);
        
        AdminService service = new AdminService();
        ServletActionContext.getRequest().setAttribute("admins", service.findAdminUserByName(adminName));
        ServletActionContext.getRequest().setAttribute("authorities", service.listAuthorities());
        
        setDeleteAndModifyAuthority(getCurrentAdmin());
        
        return SUCCESS;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }
    
}
