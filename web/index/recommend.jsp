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
        <link href="${contextPath}/css/base.css"  rel="stylesheet" type="text/css" />
        <script src="${contextPath}/scripts/pj-2.4.mini.js" type="text/javascript"></script>
        <title>推荐</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"></jsp:include>
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
