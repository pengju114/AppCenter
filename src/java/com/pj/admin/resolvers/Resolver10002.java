/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pj.admin.resolvers;

import com.pj.client.core.ServiceResolver;
import com.pj.client.core.ServiceResult;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author PENGJU
 * email:pengju114@163.com
 * 时间:2012-9-20 9:25:02
 */
public class Resolver10002 extends ServiceResolver{

    @Override
    public ServiceResult execute() throws Exception {
        Resolver10001 resolver10001=new Resolver10001();
        
        ServiceResult rs=resolver10001.execute();
        Map<String,Object> map=new HashMap<String, Object>();
        Enumeration<String> enumeration=getRequest().getParameterNames();
        while (enumeration.hasMoreElements()) {
            String key=enumeration.nextElement();
            map.put(key, getRequest().getParameter(key));
        }
        rs.getData().add(map);
        return rs;
    }

}
