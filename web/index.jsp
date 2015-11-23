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
        <script type="text/javascript" src="${contextPath}/scripts/ajax.js"></script>
        <script type="text/javascript" src="${contextPath}/scripts/tab.js"></script>
        <link href="${contextPath}/css/base.css"  rel="stylesheet" type="text/css" />
        <link href="${contextPath}/css/tabbed.css"  rel="stylesheet" type="text/css" />
        <title>${cfg.appName}</title>
        
    </head>
    <body style="width: auto; background-color: #EEE;">
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
                    <div style="clear: both;"></div>
                </ul>
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
                    <div style="clear: both;"></div>
                </ul>
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
                    <div style="clear: both;"></div>
                </ul>

            </div>
        </div>

        <!-- 最热榜单 -->
        <div>
            <div class="catogery_title">
                <a href="#" class="more">更多>>></a>
                <span class="catogery_title_text">最热榜单</span>
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
                    <div style="clear: both;"></div>
                </ul>
                <div style="clear: both;"></div>
            </div>
        </div>

        <!-- 精品推荐 -->
        <div>
            <div class="catogery_title">
                <a href="#" class="more">更多>>></a>
                <span class="catogery_title_text">精品推荐</span>
                <div style="clear: both;"></div>
            </div>
            <div class="catogery_content test_cub">
                <div class="app_item_cub">
                    <img src="images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>
                
                <div class="app_item_cub">
                    <img src="images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>
                
                <div class="app_item_cub">
                    <img src="images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>
                
                <div class="app_item_cub">
                    <img src="images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>
                
                <div class="app_item_cub">
                    <img src="images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>
                
                <div style="clear: both;"></div>
            </div>
        </div>

        <!-- 精选各种分类的前10款 -->
        <div id="categories">

        </div>


        <script type="text/javascript">
            (function () {
                //图片滑动
                var borderWidth = parseInt(pj("#slider_container").single().css("borderWidth"));
                if (isNaN(borderWidth)) {
                    borderWidth = 0;
                }
                var imgBorder = parseInt(pj("#slider_wrapper img").single().css("borderWidth"));
                if (isNaN(imgBorder)) {
                    imgBorder = 0;
                }

                borderWidth += imgBorder;
                borderWidth *= 2;

                var padding = parseInt(pj("#slider_container").css("paddingLeft"));
                if (isNaN(padding)) {
                    padding = 0;
                }
                var ptmp = parseInt(pj("#slider_container").css("paddingRight"));
                if (!isNaN(ptmp)) {
                    padding += ptmp;
                }

                borderWidth + padding;

                var slider = new Slider("slider_container", "slider_wrapper", pj("#slider_wrapper img").css({width: (pj.windowWidth() - borderWidth) + "px"}).click(function () {
                    this.blur();
                }).length);
                slider.speed = 400;
                slider.start();
                pj(this).resize(function () {
                    // resize slider show
                    pj("#slider_wrapper img").css({width: (pj.windowWidth() - borderWidth) + "px"});
                    slider.setVertical(false);
                });
            })();
            var ViewAppDetail = function(appId){
                var url = "${contextPath}/content/appDetail.jsp?appId="+appId;
                location.href = url;
            };
            
            pj(".app_icon,.app_name,.app_abstract,.app_item_cub").click(function(){
                ViewAppDetail("1");
            }).addClass("clickable");
            
            pj(".app_item_cub a").click(function(e){
                return pj.stopBubble(e);
            });
            
            var tp = new TabbedPanel("categories");
            for(var i = 0; i< 10; i++){
                var t = new Tab("系统软件"+i,pj("div.test_cub").html(),false);
                tp.add(t);
                t.afterShow(function(){
//                    if(t.getId() === "1"){
//                        this.loadHTML("${contextPath}/admin.jsp",false);
//                    }else{
//                        this.loadHTML("${contextPath}/xml.jsp",false);
//                    }
                });
            }
            
            tp.init();
        </script>
    </body>
</html>
