<%-- 
    Document   : main
    Created on : Aug 18, 2013, 4:59:28 PM
    Author     : lzw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${cfg.appName}</title>
        
        <style type="text/css">
            * { margin:0 auto; padding:0; border:0;}
        </style>
    </head>
    <frameset rows="82,*" frameborder="0" border="0" framespacing="0">
        <frame src="top.jsp" name="top" scrolling="No" noresize="noresize" id="top" width="100%" />
        <frame src="body.html" name="center" id="center" width="100%" />
    </frameset>
</html>