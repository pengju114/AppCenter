/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pj.admin.beans;

import com.pj.admin.services.AdminService;
import com.pj.jdbc.annotation.Column;
import com.pj.jdbc.annotation.Table;
import com.pj.jdbc.core.ResultList;
import java.util.List;

/**
 *
 * @author lzw
 */
@Table(name = "t_role")
public class Role {
    @Column(name = "role_id",save = false)
    private Integer roleId    ;
    
    @Column(name = "role_name")
    private String roleName  ;
    
    @Column(name = "role_key")
    private String rolekey   ;
    
    @Column(name = "role_level")
    private Integer roleLevel ; /** 权限级别 **/
    
    @Column(name = "role_type")
    private Integer roleType  ; /** 权限类别 **/
    
    @Column(name = "role_info")
    private String roleInfo  ;
    
    @Column(name = "last_modified_by")
    private Integer lastModified  ; /** 最后修改人ID **/

    /**
     * 角色ID
     * @return
     */
    public Integer getRoleId() {
        return roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public void setRolekey(String rolekey) {
        this.rolekey = rolekey;
    }

    public String getRolekey() {
        return rolekey;
    }

    public void setRoleLevel(Integer roleLevel) {
        this.roleLevel = roleLevel;
    }

    public Integer getRoleLevel() {
        return roleLevel;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleInfo(String roleInfo) {
        this.roleInfo = roleInfo;
    }

    public String getRoleInfo() {
        return roleInfo;
    }

    public void setLastModified(Integer lastModified) {
        this.lastModified = lastModified;
    }

    public Integer getLastModified() {
        return lastModified;
    }
    
    public List<Authority> getAuthorities(){
        AdminService service = new AdminService();
        ResultList<Authority> list = service.getAuthoritiesByRoleId(getRoleId());
        if (list != null) {
            return list.toList();
        }
        return null;
    }
}
