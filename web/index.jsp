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
        <script type="text/javascript" src="${contextPath}/scripts/pjslider.js"></script>
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
        
        <!-- 滑动视图 -->
        <div class="slider_wh" id="slider_container">
            <table cellspacing="0" cellpadding="0" id="slider_wrapper">
                <tr>
                    <td><a href="javascript:void(0)"><img class="slider_wh" src="images/web/test/yellow-fish.jpg" /></a></td>
                    <td><a href="javascript:void(0)"><img class="slider_wh" src="images/web/test/squid.jpg" /></a></td>
                    <td><a href="javascript:void(0)"><img class="slider_wh" src="images/web/test/small-fish.jpg" /></a></td>
                    <td><a href="javascript:void(0)"><img class="slider_wh" src="images/web/test/sea-turtle.jpg" /></a></td>
                </tr>
            </table>
        </div>
        
        <!-- 装机必备 -->
        <div>
            <div class="catogery_title">
                <a href="#" class="more">更多>>></a>
                <span class="catogery_title_text">装机必备</span>
                <div style="clear: both;"></div>
            </div>
            <div class="catogery_content">
                <table border="0" width="100%">
                    <tr>
                        <td class="app_icon" align="left" valign="top"><img class="app_icon" src="images/web/test/test_app_icon.jpg" /></td>
                        <td align="left" valign="top">
                            <span class="app_name">到他传奇</span>
                            <p class="app_abstract">
                                dxcfvgybhxdcfvgbhjcyfvgbhxrctfvugybihunzsextdcyftvugybihunojxdcfvgbhfgvbhnjcfvgbhcfvugbhnxcytvygbiuhnij
                            </p>
                        <td class="download_button" align="right" valign="middle"><a class="download_button" href="#"><img src="images/web/icon_download.png" /></a></td>
                    </tr>
                </table>
                <div class="item_line"></div>
                <ul class="download_info">
                    <li><center>3456M</center></li>
                    <li><center>456789次下载</center></li>
                </ul>
            </div>
        </div>
        
        <!-- 最热榜单 -->
        <div>
            
        </div>
        
        <!-- 精品推荐 -->
        <div>
            
        </div>
        
        <!-- 精选各种分类的前10款 -->
        <div>
            
        </div>
        
        
        <script type="text/javascript">
            (function(){
                //图片滑动
                var borderWidth = parseInt(pj("#slider_container").single().css("borderWidth"));
                if(isNaN(borderWidth)){
                    borderWidth = 0;
                }
                var imgBorder = parseInt(pj("#slider_wrapper img").single().css("borderWidth"));
                if(isNaN(imgBorder)){
                    imgBorder = 0;
                }

                borderWidth += imgBorder;
                borderWidth *= 2;

                var padding = parseInt(pj("#slider_container").css("paddingLeft"));
                if(isNaN(padding)){
                    padding = 0;
                }
                var ptmp = parseInt(pj("#slider_container").css("paddingRight"));
                if(!isNaN(ptmp)){
                    padding += ptmp;
                }

                borderWidth + padding;

                var slider=new Slider("slider_container","slider_wrapper",pj("#slider_wrapper img").css({width:(pj.windowWidth()-borderWidth)+"px"}).click(function(){ this.blur(); }).length);
                slider.speed=400;
                slider.start();
                pj(this).resize(function(){
                    // resize slider show
                    pj("#slider_wrapper img").css({width:(pj.windowWidth()-borderWidth)+"px"});
                    slider.setVertical(false);
                });
            })();
        </script>
    </body>
</html>
