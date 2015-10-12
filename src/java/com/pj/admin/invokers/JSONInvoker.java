/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pj.admin.invokers;

import com.pj.admin.beans.AdminUser;
import com.pj.client.core.ClientException;
import com.pj.web.res.Constans;

/**
 *
 * @author luzhenwen
 */
public class JSONInvoker extends com.pj.client.core.invokers.JSONInvoker{

    @Override
    public void invokePrepare() throws Exception {
        super.invokePrepare(); //To change body of generated methods, choose Tools | Templates.
        AdminUser adminUser = (AdminUser) getRequest().getSession(true).getAttribute(Constans.Key.CURRENT_ADMIN);
        if (adminUser == null) {
            throw new ClientException(ClientException.REQUEST_NOT_LOGIN, "非法访问");
        }
    }
    
}
