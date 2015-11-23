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
        <link href="${contextPath}/css/default.css"  rel="stylesheet" type="text/css" />
        <link href="${contextPath}/css/base.css"  rel="stylesheet" type="text/css" />
        <link href="${contextPath}/css/content.css"  rel="stylesheet" type="text/css" />
        <title>${cfg.appName}</title>
        <style type="text/css">
            h4{
                margin: 0px;
                padding: 0px 0px 0px 0.125em;
            }
        </style>
    </head>
    <body style="width: auto; background-color: #fff;">
        <jsp:include page="/include/header.jsp"></jsp:include>

        <div id="nav"> <span><a href="#">游戏</a></span> <span>></span> <span><a href="#">修真</a></span> <span>></span> <span><a href="#">到他传奇</a></span></div>
        
        <table border="0" cellspacing="0">
            <tr>
                <td valign="top" style="width: 5em;">
                    <img class="detail-app-icon" src="${contextPath}/images/web/test/test_app_icon.jpg" />
                </td>
                <td class="detail-container" valign="top">
                    <h4>到他传奇</h4>
                    <ul id="star" class="detail-info-list">
                        <li>
                            <div id="star-ctr">
                                <div id="star-rate"></div>
                            </div>
                        </li>
                    </ul>
                    <ul id="tags" class="detail-info-list">
                        <li>官方</li>
                        <li>无广告</li>
                        <li>安全</li>
                        <li>优质</li>
                    </ul>
                    <ul id="info" class="detail-info-list">
                        <li>大小:12M</li>
                        <li>版本:1.4.5</li>
                        <li>下载次数:13万</li>
                        <li>来自:吴明科技</li>
                    </ul>
                </td>
            </tr>
        </table>
                
        <div id="download"><div>马上安装</div></div>
        <div id="app-description" class="app-description">
            <div>
                <span class="info-title">小编评语：</span><span class="info-text">你妹的，垃圾，shit。</span>
                <div class="gray-line"></div>
            </div>
            <div id="info-screenshot">
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td><img src="${contextPath}/images/web/test/sea-turtle.jpg" /></td>
                        <td><img src="${contextPath}/images/web/test/small-fish.jpg" /></td>
                        <td><img src="${contextPath}/images/web/test/squid.jpg" /></td>
                        <td><img src="${contextPath}/images/web/test/yellow-fish.jpg" /></td>
                        <td><img src="${contextPath}/images/web/test/sea-turtle.jpg" /></td>
                        <td><img src="${contextPath}/images/web/test/yellow-fish.jpg" /></td>
                        <td><img src="${contextPath}/images/web/test/sea-turtle.jpg" /></td>
                    </tr>
                </table>
            </div>
                    
            <div>
                <span class="info-title">应用介绍：</span>
                <div style=" position: relative;">
                    <div id="info-text-description" class="info-text info-text-gap">shit你妹的，垃圾，shit你妹的，垃圾，shit你妹的，垃圾，shit你妹的，垃圾，shit你妹的，垃圾，shit你shit你妹的，。</div>
                    <div style=" position: absolute; right: 10px; bottom: 0px;" id="span-collapse">展开</div>
                </div>
                <div class="gray-line"></div>
            </div>
        </div>
        
        <script type="text/javascript">
            var gap = parseInt(pj("#app-description").css("padding-left")) + parseInt(pj("#app-description").css("padding-right")) + parseInt(pj("#app-description").css("margin-left")) + parseInt(pj("#app-description").css("margin-right")) + parseInt(pj("#app-description").css("border-width"))*2;
            if(isNaN(gap)){
                gap = 0;
            }
           pj("#app-description").css({width:(pj.windowWidth()- 8 - gap)+"px",overflow:"hidden"});
           pj(window).resize(function(){
               pj("#app-description").css({width:(pj.windowWidth()- 8 - gap)+"px"});
           });
           
           pj("#download *").click(function(){
               var bgColor = "#ffcccc";//pj(this).css("background-color");
               pj(this).css({"background-color":"#FFAAAA"}).animate({"background-color":bgColor});
           });
           
           
           (function(){
               var getLines = function(obj){
                   var lineHeight = parseInt(pj(obj).css("line-height"));
                    if(isNaN(lineHeight)){
                        lineHeight = 1;
                    }
                    var totalHeight = pj(obj).height();
                    var padding = parseInt(pj(obj).css("padding-top")) + parseInt(pj(obj).css("padding-bottom"));
                    if(isNaN(padding)){
                        padding = 0;
                    }
                    totalHeight -= padding;
                    var lines = Math.round(totalHeight / lineHeight);
                    return lines;
               };
               
               pj("#info-text-description").click(function(){
                    var lines = getLines(this);
                    if(lines > 3){// 超过3行就省略后面的；
                        
                    }
                });
           })();
           
        </script>
    </body>
</html>
