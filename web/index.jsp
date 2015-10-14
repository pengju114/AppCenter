<%-- 
    Document   : index
    Created on : 2012-7-14, 0:13:20
    Author     : PENGJU
--%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />   
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />   
        <meta name="apple-mobile-web-app-capable" content="yes" />   
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />   
        <meta name="format-detection" content="telephone=no" />
        <title>${cfg.appName}</title>
    </head>
    <body style="width: auto;">
        ${cfg.debug} <br />
        
        <%
            Enumeration<String> headerNames = request.getHeaderNames();
            while(headerNames.hasMoreElements()){
                String key = headerNames.nextElement();
                Enumeration<String> headers = request.getHeaders(key);
                while(headers.hasMoreElements()){
                    out.println(key+"="+headers.nextElement()+" <br />");
                }
                out.println(" <br />");
            }
        %>  
    </body>
</html>
