<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set scope="request" value="${contextPath}/images/admin" var="imgPath" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${cfg.managementSystemName}</title>
        <style type="text/css">
            * { margin:0 auto; padding:0; border:0;}
            body { font:12px "宋体"; color:#FFF;}
            .lable { background:url(${imgPath}/top_lable.jpg) no-repeat; width:126px; height:28px; float:left;}
            .lable p { margin-top:8px;}
            .menu { background:url(${imgPath}/top_menu.jpg) no-repeat; width:348px; height:28px; float:right;}
            .menu ul { margin:8px 0 0 45px; list-style:none;}
            .menu li { display:inline;}
            .menu a { float:left; text-decoration:none; padding-left:2px;}
            .menu a:hover {text-decoration:none;}
            .menu a span { display:block; padding:0 10px 0 0; }
            .menu_left { background:url(${imgPath}/menu_left.jpg) no-repeat; width:155px; height:22px; float:left; margin:3px 0 0 6px; text-align:center;}
            .menu_left p { margin-top:5px;}
            .menu_list { width:100%; height:25px;}
            .menu_list ul { margin:0; padding:4px 0 0 70px; list-style:none; }
            .menu_list li { display:inline; }
            .menu_list a { float:left; text-decoration:none; }
            .menu_list a span { display:block; padding:4px 10px 0 10px; color:#004c7e; }
            .menu_list a:hover span { color:#FFF; border:1px solid #004c7e;}
            .menu_list a:hover { background:url(${imgPath}/menu_list.jpg) repeat-x; }
        </style>
        <script type="text/javascript" src="${contextPath}/scripts/pj-2.4.mini.js"></script>
    </head>
    <body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td background="${imgPath}/top_bg.jpg" width="289" height="57">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td><img src="${imgPath}/top_lf.jpg" /></td>
                        </tr>
                    </table>
                </td>
                <td background="${imgPath}/top_bg.jpg">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td height="29"><span id="timebar"></span></td>
                        </tr>
                        <tr>
                            <td width="50%" height="28">
                                <div class="lable">
                                    <p>${cfg.managementSystemName}</p>
                                </div>
                            </td>
                            <td>
                                <div id="right_menu" class="menu">
                                    <ul>
                                        <li><a href="javascript:void(0)" target="_self" onclick="top.location.href='<s:url action="AdminLogout" />'"><span>退出重新登录</span></a></li>
                                        <li><a href="javascript:void(0)" target="_self" onclick="top.location.href='/index.jsp'"><span>首页</span></a></li>
                                        <li><a href="javascript:void(0)" target="_self" onclick="top.history.go(-1)"><span>后退</span></a></li>
                                        <li><a href="javascript:void(0)" target="_self" onclick="top.history.go(1)"><span>前进</span></a></li>
                                        <li><a href="javascript:void(0)" target="_self" onclick="top.location.reload()"><span>刷新</span></a></li>
                                        <li><a href="javascript:void(0)" target="_self" onclick="top.location.href='<s:url action="AdminLogout" />'"><span>退出</span></a></li>
                                    </ul>
                                </div>
                            </td>
                            <td width="18"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%" height="25" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td background="${imgPath}/menu_bg.jpg" width="165">
                    <div class="menu_left">
                        <p>欢迎：${empty admin.adminRealName?admin.adminName:admin.adminRealName}</p>
                    </div>
                </td>
                <td background="${imgPath}/menu_bg.jpg">
                    <!--<div class="menu_list">
                      <ul>
                        <li><a href="#"><span>查询业务</span></a></li>
                        <li><a href="#"><span>出口业务</span></a></li>
                        <li><a href="#"><span>打印管理</span></a></li>
                        <li><a href="#"><span>公共管理</span></a></li>
                        <li><a href="#"><span>静态数据</span></a></li>
                        <li><a href="#"><span>收单行业务</span></a></li>
                      </ul>
                    </div>-->
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            pj("#right_menu span").css({color:"#FFF"}).hover({color:"#004c7e"}).step(function(){pj.id("timebar").innerHTML=new Date().toLocaleString()});
        </script>
    </body>
</html>
