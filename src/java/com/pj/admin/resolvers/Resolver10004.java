/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pj.admin.resolvers;

import com.pj.client.core.ClientException;
import com.pj.client.core.ServiceResolver;
import com.pj.client.core.ServiceResult;
import java.util.HashMap;

/**
 *
 * @author PENGJU
 * email:pengju114@163.com
 * 时间:2012-9-20 0:39:17
 */
public class Resolver10004 extends ServiceResolver{

    @Override
    public ServiceResult execute() throws Exception {
        if (getRequest().getSession(true).getAttribute("user")==null) {
            throw new ClientException(ClientException.REQUEST_NOT_LOGIN);
        }
        ServiceResult result=new ServiceResult();
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("name", getRequest().getSession(true).getAttribute("user"));
        result.getData().add(map);
        caculatePageProperties(1,result);
        return result;
    }
}
