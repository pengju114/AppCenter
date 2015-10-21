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
        <jsp:include page="/include/deviceSupport.jsp"></jsp:include>
        <script src="${contextPath}/scripts/pj-2.4.mini.js" type="text/javascript"></script>
        <link href="${contextPath}/css/default.css"  rel="stylesheet" type="text/css" />
        <link href="${contextPath}/css/base.css"  rel="stylesheet" type="text/css" />
        <title>${cfg.appName}</title>
    </head>
    <body style="width: auto;">
        <div id="tool_bar" class="tool_bar"></div>
            
        </div>
        <div style="width: 100%; text-align: center;">
            <div style="width: 50%; border: 1px solid #cccccc; overflow: hidden;">
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
          
            <script type="text/javascript">
                pj("#tool_bar").click(function(){
                    alert(pj(this).height());
                });
            </script>
    </body>
</html>
