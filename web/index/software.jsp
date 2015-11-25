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
        <script type="text/javascript" src="${contextPath}/scripts/tab.js"></script>
        <link href="${contextPath}/css/tabbed.css"  rel="stylesheet" type="text/css" />
        <title>软件</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"></jsp:include>
            <div style="height: 0.5em; width: 100%;"></div>

            <!-- 精品推荐6款 -->
            <div class="catogery_content">

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div style="clear: both;"></div>
            </div>


        <!-- 最热 -->
        <div>
            <div class="catogery_title">
                <a href="#" class="more">换一批</a>
                <span class="catogery_title_text">最热榜单</span>
                <div style="clear: both;"></div>
            </div>
            <div class="catogery_content">
                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div style="clear: both;"></div>
            </div>
        </div>

        <!-- 必备 -->
        <div>
            <div class="catogery_title">
                <a href="#" class="more">换一批</a>
                <span class="catogery_title_text">装机必备</span>
                <div style="clear: both;"></div>
            </div>
            <div class="catogery_content">
                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div style="clear: both;"></div>
            </div>
        </div>


        <!-- 热门 -->
        <div>
            <div class="catogery_title">
                <a href="#" class="more">换一批</a>
                <span class="catogery_title_text">时下热门</span>
                <div style="clear: both;"></div>
            </div>
            <div class="catogery_content">
                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
                    <div class="app_title">到他传奇</div>
                    <a href="#" target="_self">下载</a>
                </div>

                <div class="app_item_cub">
                    <img src="${contextPath}/images/web/test/test_app_icon.jpg" />
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

                var ViewAppDetail = function (appId) {
                    var url = "${contextPath}/content/appDetail.jsp?appId=" + appId;
                    location.href = url;
                };
                pj(".app_icon,.app_name,.app_abstract,.app_item_cub").click(function () {
                    ViewAppDetail("1");
                }).addClass("clickable");
                pj(".app_item_cub a").click(function (e) {
                    return pj.stopBubble(e);
                });
                var tp = new TabbedPanel("categories");
                for (var i = 0; i < 10; i++) {
                    var t = new Tab("系统软件" + i, pj("div.test_cub").html(), false);
                    tp.add(t);
                    t.afterShow(function () {
                    });
                }

                tp.init();
            })();
        </script>

    </body>
</html>
