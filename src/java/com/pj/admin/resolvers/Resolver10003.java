/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pj.admin.resolvers;

import com.pj.client.core.ServiceResolver;
import com.pj.client.core.ServiceResult;
import javax.servlet.http.Cookie;

/**
 *
 * @author PENGJU
 * email:pengju114@163.com
 * 时间:2012-9-20 0:39:17
 */
public class Resolver10003 extends ServiceResolver{

    @Override
    public ServiceResult execute() throws Exception {
        ServiceResult result=new ServiceResult();
        if ("pengju".equals(getRequest().getParameter("name")) && "762354".equals(getRequest().getParameter("password"))) {
            getRequest().getSession(true).setAttribute("user", "pengju");
        }
        Cookie c = new Cookie("tmp", "haha");
        c.setMaxAge(1024);
        getResponse().addCookie(c);
        caculatePageProperties(0,result);
        return result;
    }
}
