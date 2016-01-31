<%-- 
    Document   : role
    Created on : Mar 30, 2014, 10:35:16 PM
    Author     : lzw
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${cfg.appName}</title>
         <jsp:include page="base.jsp" flush="true" />
         <link href="${contextPath}/css/tabbed.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="${contextPath}/scripts/tab.js"></script>
         <script type="text/javascript" src="${contextPath}/scripts/ajax.js"></script>
         
         <style type="text/css">
             .star{
                 font-size: 12px;
                 color: #F3F;
             }
         </style>
    </head>
    <body>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table width="100%" height="auto" cellpadding="0" cellspacing="0" class="table">
                        <tr>
                            <td valign="top">
                                <table width="100%" class="top" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            当前位置:&nbsp;<a id="nav_title" href="javascript:void(0)"></a>&nbsp;>>&nbsp;
                                            <a id="nav_cat" href="javascript:void(0)"></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                                <form action="<s:url namespace="/admin" action="AddNewAdmin" />" target="I2" method="post" name="add_admin">
                                    <table width="100%" border="0">
                                        <tr>
                                            <td class="btd" width="100">用户名：</td>
                                            <td class="btd"><input class="text" type="text" maxlength="20" size="20" name="admin.adminName" /> 
                                                <span class="star">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="btd" width="100">真实姓名：</td>
                                            <td class="btd"><input class="text" type="text" maxlength="20" size="20" name="admin.adminRealName" /> 
                                            <span class="star">*</span></td>
                                        </tr>
                                        <tr>
                                            <td class="btd" width="100">性别：</td>
                                            <td class="btd">
                                                <select name="admin.sex">
                                                    <option value="1"  selected="selected" >男</option>
                                                    <option value="0" >女</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="btd">密码：</td>
                                            <td class="btd"><input class="text" type="password" maxlength="20" size="20" name="admin.password" /> 
                                            <span class="star">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="btd" valign="top">角色：</td>
                                            <td class="btd">
                                                <c:forEach var="r" items="${roles}">
                                                    <input type="checkbox" name="roleList" value="${r.roleId}_${r.rolekey}" />${r.roleName} &nbsp;
                                                </c:forEach>
                                                <%--
                                                <span id="roles" style="float: left;">
                                                </span>
                                                <span>
                                                    <select id="role_set">
                                                        <option value="-1">选择角色</option>
                                                        <c:forEach var="r" items="${roles}">
                                                            <option value="${r.roleId}">${r.roleName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </span>
                                                <span> <a id="add_a_role" href="#">添加</a> </span>
                                                <span style="float: none;" ></span>
                                                --%>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="btd" width="100">电话：</td>
                                            <td class="btd"><input class="text" type="text" maxlength="20" size="20" name="admin.phoneNumber" /> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="btd" width="100">手机：</td>
                                            <td class="btd"><input class="text" type="text" maxlength="20" size="20" name="admin.mobileNumber" /> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="btd" width="100">邮箱：</td>
                                            <td class="btd"><input class="text" type="text" maxlength="20" size="20" name="admin.email" /> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td align="center" colspan="2">
                                                <input type="submit" value="确定" />
                                                <input type="reset" value="清空" />
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
    <script type="text/javascript">
        
        var tp=new TabbedPanel("roles");
        
        pj("#add_a_role").click(function(){
            var sel = pj.id("role_set");
            var id  = sel.options[sel.selectedIndex].value;
            var txt = sel.options[sel.selectedIndex].innerHTML;
            
            if(parseInt(id)<0){
                return;
            }
            
            var array = tp.getTabIds();
            for(var i=0;i<array.length;i++){
                if(tp.getTab(array[i]).roleId === id){
                    return;
                }
            }
            
            var item  = new Tab(txt,"",true);
            item.roleId = id;
            tp.add(item);
        });
        
//        pj(":forms[add_admin]").submit(function(){
//            var ids = [];
//            var array = tp.getTabIds();
//            for(var i=0;i<array.length;i++){
//                if(tp.getTab(array[i]).roleId){
//                    ids.pusp(tp.getTab(array[i]).roleId);
//                }
//            }
//            
//            if(ids.length<1){
//                alert("请选择角色");
//                return false;
//            }else{
//                pj("#field_roles").value(ids.join(","));
//            }
//            return true;
//        });
    </script>
</html>