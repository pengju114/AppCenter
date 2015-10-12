/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pj.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.pj.admin.beans.AdminUser;
import com.pj.web.res.Constans;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author lzw
 */
public class BaseAction extends ActionSupport {
    public AdminUser getCurrentAdmin(){
        return (AdminUser)ServletActionContext.getRequest().getSession(true).getAttribute(Constans.Key.CURRENT_ADMIN);
    }
}
