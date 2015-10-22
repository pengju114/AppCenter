<%-- 
    Document   : main
    Created on : 2015-10-22, 23:17:50
    Author     : luzhenwen
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/include/globalSetting.jsp"></jsp:include>
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 100%; text-align: center; clear: both; height: 100%; background-color: #cccccc;">
            <div style="width: 50%; border: 1px solid #000; overflow: hidden;">
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
            </div>
        </div>
    </body>
</html>
