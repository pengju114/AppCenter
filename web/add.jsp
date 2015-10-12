<%-- 
    Document   : add
    Created on : 2012-7-22, 18:51:56
    Author     : PENGJU
--%>

<%@page import="com.pj.jdbc.core.ResultRow"%>
<%@page import="com.pj.jdbc.core.ResultList"%>
<%@page import="com.pj.jdbc.services.DebugService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="<s:url action="User" namespace="/user" method="addUser" /> " method="POST">
            Id:<input type="text" name="user.id" value="" />
            Name:<input type="text" name="user.name" value="" />
            Age:<input type="text" name="user.age" value="" />
            Birth:<input type="text" name="user.birth" value="" />
            <input type="submit" value="submit" />
        </form>
        <s:iterator value="#request.users">
            <s:property value="id"></s:property>,<s:property value="name"></s:property><a href="<s:url action="User" namespace="/user" method="remove" />?id=<s:property value="id"></s:property> ">删除</a>
            <br />
        </s:iterator>
        <%
        DebugService debugService=new DebugService();
        ResultList<ResultRow> list=debugService.listDetail();
        for(ResultRow resultRow:list){
            out.write(resultRow.toMap().toString());
            out.write("<br />");
        }
        %>
    </body>
</html>
