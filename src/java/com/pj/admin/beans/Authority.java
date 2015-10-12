/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pj.admin.beans;

import com.pj.jdbc.annotation.Column;
import com.pj.jdbc.annotation.Table;
import java.sql.Date;

/**
 *
 * @author luzhenwen
 */

@Table(name = "t_authority")
public class Authority {
    @Column(name = "authority_id",save = false)
    private Integer authorityId;
    
    @Column(name = "authority_name")
    private String authorityName;
    
    @Column(name = "authority_key")
    private String authorityKey;
    
    @Column(name = "last_modified_by")
    private Integer lastModifiedUserId;
    
    @Column(name = "create_date")
    private Date    createDate;

    /**
     * @return the authorityId
     */
    public Integer getAuthorityId() {
        return authorityId;
    }

   

    /**
     * @return the authorityName
     */
    public String getAuthorityName() {
        return authorityName;
    }

    /**
     * @param authorityName the authorityName to set
     */
    public void setAuthorityName(String authorityName) {
        this.authorityName = authorityName;
    }

    /**
     * @return the authorityKey
     */
    public String getAuthorityKey() {
        return authorityKey;
    }

    /**
     * @param authorityKey the authorityKey to set
     */
    public void setAuthorityKey(String authorityKey) {
        this.authorityKey = authorityKey;
    }

    /**
     * @return the lastModifiedUserId
     */
    public Integer getLastModifiedUserId() {
        return lastModifiedUserId;
    }

    /**
     * @param lastModifiedUserId the lastModifiedUserId to set
     */
    public void setLastModifiedUserId(Integer lastModifiedUserId) {
        this.lastModifiedUserId = lastModifiedUserId;
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
    
    
}