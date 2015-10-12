/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author PENGJU
 * email:pengju114@163.com
 * 时间:2012-7-16 22:22:31
 */
public class ExecTimeFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        long start=System.currentTimeMillis();
        chain.doFilter(request, response);
        start=System.currentTimeMillis()-start;
        System.err.println("操作执行了"+start+"毫秒");
    }

    @Override
    public void destroy() {
    }

}
