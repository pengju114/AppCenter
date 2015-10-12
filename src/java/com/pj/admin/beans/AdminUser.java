/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pj.admin.beans;

import com.pj.admin.services.AdminService;
import com.pj.jdbc.annotation.Column;
import com.pj.jdbc.annotation.Table;
import com.pj.jdbc.core.ResultList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author lzw
 */
@Table(name = AdminService.ADMIN_TABLE)
public class AdminUser {
    @Column(name ="admin_id",save = false)
    private Integer adminId;
    @Column(name ="admin_name")
    private String  adminName;
    @Column(name = "admin_real_name")
    private String  adminRealName;
    @Column(name = "admin_password")
    private String  password;
    @Column(name = "admin_phone")
    private String  phoneNumber;//固定电话
    @Column(name = "admin_mobile")
    private String  mobileNumber;//移动电话
    @Column(name = "admin_sex")
    private Integer sex;/*1 男；0女*/
    @Column(name = "admin_email")
    private String  email;
    @Column(name = "create_date")
    private Date    createDate;
    

    /**
     * @return the adminId
     */
    public Integer getAdminId() {
        return adminId;
    }

    /**
     * @param adminId the adminId to set
     */
    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    /**
     * @return the adminName
     */
    public String getAdminName() {
        return adminName;
    }

    /**
     * @param adminName the adminName to set
     */
    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    /**
     * @return the adminRealName
     */
    public String getAdminRealName() {
        return adminRealName;
    }

    /**
     * @param adminRealName the adminRealName to set
     */
    public void setAdminRealName(String adminRealName) {
        this.adminRealName = adminRealName;
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
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the mobileNumber
     */
    public String getMobileNumber() {
        return mobileNumber;
    }

    /**
     * @param mobileNumber the mobileNumber to set
     */
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    /**
     * @return the sex
     */
    public Integer getSex() {
        return sex;
    }

    /**
     * @param sex the sex to set
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the createDate
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public List<Role> getRoles(){
        AdminService service = new AdminService();
        ResultList<Role> list = service.getRolesByAdminId(getAdminId());
        if (list != null) {
            return list.toList();
        }
        return null;
    }
    
    public boolean hasAuthority(Authority authority){
        AdminService service = new AdminService();
        return service.hasAuthority(this, authority);
    }
}
