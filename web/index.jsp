<%-- 
    Document   : index
    Created on : 2012-7-14, 0:13:20
    Author     : PENGJU
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/include/globalSetting.jsp"></jsp:include>
        <script src="${contextPath}/scripts/pj-2.4.mini.js" type="text/javascript"></script>
        <link href="${contextPath}/css/base.css"  rel="stylesheet" type="text/css" />
        <title>${cfg.appName}</title>
        
        <style type="text/css">
            iframe{
                border: none;
                margin: 0em;
                padding: 0em;
            }
        </style>
    </head>
    <body style="width: auto;">
        
        <jsp:include page="/include/header.jsp"></jsp:include>
    </body>
</html>
