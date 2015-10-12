/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pj.admin.actions;

import com.pj.actions.BaseAction;
import com.pj.admin.beans.AdminUser;
import com.pj.admin.services.AdminService;
import com.pj.web.res.Constans;
import com.pj.utilities.ImageUtility;
import com.pj.utilities.StringUtility;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author lzw
 */
public class AdminLoginAction extends BaseAction {
    private String userName;
    private String password;
    private String validationCode;

    @Override
    public String execute() throws Exception {
        if (StringUtility.isEmpty(getValidationCode()) || !StringUtility.ensureAsString(ServletActionContext.getRequest().getSession(true).getAttribute(ImageUtility.RandomCodeImageRanderer.RANDOM_STRING)).equalsIgnoreCase(validationCode)) {
            ServletActionContext.getRequest().setAttribute("error", "验证码错误");
            return INPUT;
        }
        
        if (StringUtility.isEmpty(getUserName())) {
            ServletActionContext.getRequest().setAttribute("error", "用户名为空");
            return INPUT;
        }
        
        if(StringUtility.isEmpty(getPassword())){
            ServletActionContext.getRequest().setAttribute("error", "密码为空");
            return INPUT;
        }
        
        AdminService adminService=new AdminService();
        AdminUser user=adminService.findAdminUserByNameAndPassword(getUserName(), getPassword());
        if (user!=null) {
            ServletActionContext.getRequest().getSession(true).setAttribute(Constans.Key.CURRENT_ADMIN, user);
            ServletActionContext.getRequest().getSession(true).setAttribute("admin", user);//方便访问
            return SUCCESS;
        }else{
            ServletActionContext.getRequest().setAttribute("error", "用户名或密码错误");
            return INPUT;
        }
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the validationCode
     */
    public String getValidationCode() {
        return validationCode;
    }

    /**
     * @param validationCode the validationCode to set
     */
    public void setValidationCode(String validationCode) {
        this.validationCode = validationCode;
    }
    
    
    public String logout(){
        ServletActionContext.getRequest().getSession(true).invalidate();
        return INPUT;
    }
}
