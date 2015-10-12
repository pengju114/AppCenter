<%@page pageEncoding="UTF-8" contentType="text/html" %>

<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>无标题文档</title>
        <script type="text/javascript" src="${ pageContext.request.contextPath }/scripts/pj-2.4.mini.js"></script>
        <script type="text/javascript" src="${ pageContext.request.contextPath }/scripts/validator.js"></script>
        <script type="text/javascript" src="${ pageContext.request.contextPath }/scripts/cookie.js"></script>
        <style type="text/css">
            .m-text{
                color:#FFF;
                font-size:14px;
            }
            .s-text{
                color:#FFF;
                font-size:12px;
            }

            input{
                border:none;
                color:#333 !important;
                vertical-align: middle !important;
            }

            body{
                background:url(${ pageContext.request.contextPath }/images/admin/login_page_bg.png) no-repeat center top;
                margin:0px;
                padding:0px;
                background-color:#809CCE;
            }
            form{
                margin-top:auto;
                margin-bottom:auto;
            }
        </style>
    </head>

    <body>
        <center>
            <div style="height:100%; vertical-align:middle;">
                <form action="<s:url action="AdminLogin" namespace="/admin" />" name="login_form" method="post">
                    <table style="background:url(${ pageContext.request.contextPath }/images/admin/login_form_bg.png) no-repeat center; text-align:left; margin-top:100px;" width="446" height="383" border="0">
                        <tr>
                            <td width="25%">&nbsp;</td>
                            <td width="60%">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="color:#C06; font-size:12px;" align="center">&nbsp;${error}&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="m-text" align="right">用户名：</td>
                            <td>
                                <input validate="true" alt="用户名" min-len="3" style="width:100%; height:28px;" type="text" name="userName" value="<s:property value="userName" />" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="m-text" align="right">密码：</td>
                            <td>
                                <input validate="true" alt="密码" min-len="6" style="width:100%; height:28px;" type="password" name="password" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" class="m-text">验证码：</td>
                            <td>
                                <div>
                                    <div style="float:left; width:170px;">
                                        <input class="m-text" style="width:170px; height:20px;" name="validationCode" type="text" value="" />
                                    </div>
                                    <div style="float:right;"><img onclick="changeValidationCode.call(this)" id="random_image" style="cursor:pointer;" src="${pageContext.request.contextPath}/random.jpg?t=1&" width="60" height="24" /></div>
                                </div>
                                <div style="clear:both;"></div>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        
                        <tr>
                            <td>&nbsp;</td>
                            <td valign="top">
                                <div>
                                    <div style="float:left; width:123px;">
                                        <input id="login_btn" class="m-text" style="width:123px; height:53px; background:url(${ pageContext.request.contextPath }/images/admin/login_btn_bg.png) no-repeat center; color:#8A7363; font-weight:bold; cursor: pointer;" type="submit" value="确定" />
                                    </div>
                                    <div style="float:right; width:123px;">
                                        <input id="reset_btn" class="m-text" style="width:123px; height:53px; background:url(${ pageContext.request.contextPath }/images/admin/login_btn_bg.png) no-repeat center; color:#8A7363; font-weight:bold; cursor: pointer;" type="reset" value="重置" />
                                    </div>
                                </div>
                                <div style="clear:both;"></div>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </form>
            </div>
        </center>
                                
                                <script type="text/javascript">
                                    function changeValidationCode(){
                                        pj(this).attr("src",pj(this).attr("src")+"time="+(new Date().getTime())+"&");
                                    }
                                    window.onload=function(){ 
                                        var f=document.forms["login_form"];
                                        var n=Cookie.findCookie("name");
                                        if(n){
                                            f.userName.value=n.getValue();
                                        }
                                        changeValidationCode.call(pj("#random_image")[0]);
                                    };
                                    
                                    FormValidator.validate("login_form",{onSubmit:function(form){
                                        var now=new Date();
                                        now.setMonth(now.getMonth()+1);
                                        var name=form.userName.value;
                                        var nameCookie=new Cookie("name",name);
                                        nameCookie.setExpires(now);
                                        Cookie.store(nameCookie);
                                        return true;    
                                    }});
                                    pj("#login_btn,#reset_btn").hover({"background":"url(${ pageContext.request.contextPath }/images/admin/login_btn_hover_bg.png) no-repeat center"});
                                </script>
    </body>
</html>
                                
