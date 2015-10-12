/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pj.web.filters;

import com.pj.web.res.Constans;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *后台管理用户权限过滤器
 * @author 陆振文
 */
public class AdminAuthenticationFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest) request;
        HttpSession session=req.getSession(false);
        if (session!=null && session.getAttribute(Constans.Key.CURRENT_ADMIN)!=null) {
            chain.doFilter(request, response);
        }else{
            request.setAttribute("error", "非法访问");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}
