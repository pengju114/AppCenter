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
                    <div id="info-text-description" class="info-text info-text-gap">
                        1、爱奇艺视频全网独播：奔跑吧兄弟3！
                        2、跑男3全网独播：七兄弟挑战吉尼斯，有点意思；
                    </div>
                    <div style=" position: absolute; right: 10px; bottom: 0px; cursor: pointer;" id="span-collapse">展开</div>
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
               
               var cacheContentKey = "cache-content";
               var spanStateKey = "cache-state";
               var stateSpan = 1;
               var stateCollapse = 0;
               
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
               
               var addHTMLNewlinesAndSpaces = function(string){
                   if(string && pj.isString(string)){
                       var breakRegexp = /\n|\r/ig;
                       var whiteSpaceRegexp = /\s/g;
                       string = string.replace(breakRegexp,"<br/>");
                       string = string.replace(whiteSpaceRegexp,"&nbsp;");
                       
                       return string;
                   }
                   return string;
               };
               
               var collapseContent = function(obj){
                   var lines = getLines(obj);
//                    if(lines > 3){// 超过3行就省略后面的；
                        // 先缓存原始文本
                        var target = pj(obj);
                        if(!target.attr(cacheContentKey)){
                            target.attr(cacheContentKey,target.html());
                        }
                        
                        // 先去掉内容中的标签
                        var content = target.html();
                        var breakLineRegexp = /<[^\s>]+\s*\/?>/ig;
                        var whiteSpaceRegexp = /&nbsp;/ig;
                        content = content.replace(breakLineRegexp,'\n');
                        content = content.replace(whiteSpaceRegexp," ");
                        
                        target.html(content);
                        
                        lines = getLines(obj);
                        var w = target.width();
                        var p = parseInt(target.css("padding-left") + target.css("padding-right") + target.css("border-width"));
                        if(isNaN(p)){
                            p=0;
                        }
                        w -= p;
                        var fontWidth = (lines * w) / content.length;
                        // 保留2.5行
                        var leftChar = Math.floor((2.5 * w) / fontWidth);
                        if(content.length > leftChar){
                            target.html(content.substr(0,leftChar)+"...");
                            target.attr(spanStateKey,stateCollapse+"");
                            onSpanStateChange(obj,stateCollapse);
                        }else{
                            target.html(content);
                            target.attr(spanStateKey,stateCollapse+"");
                            onSpanStateChange(obj,stateCollapse);
                        }
//                    }
               }
               
               var spanContent = function(obj){
                   var target = pj(obj);
                   var originContent = target.attr(cacheContentKey);
                   if(originContent){
                       originContent = addHTMLNewlinesAndSpaces(originContent);
                       
                       target.html(originContent);
                       target.attr(spanStateKey,stateSpan+"");
                       onSpanStateChange(obj,stateSpan);
                   }
               };
               
               var onSpanStateChange = function(obj,state){
                   var button = "";
                   if(state === stateCollapse){
                       button = "展开";
                   }else{
                       button = "收起";
                   }
                   pj("#span-collapse").html(button);
               };
               
               var toggleSpan = function(obj){
                   if(parseInt(pj(obj).attr(spanStateKey)) === stateSpan){
                        collapseContent(obj);
                    }else{
                        spanContent(obj);
                    }
               };
               
               var initSpanObj = pj("#info-text-description").click(function(){
                    toggleSpan(pj.id("info-text-description"));
                }).html(addHTMLNewlinesAndSpaces(pj("#info-text-description").html())).get();
                pj("#span-collapse").click(function(){
                    toggleSpan(pj.id("info-text-description"));
                });
                
                collapseContent(initSpanObj);
           })();
           
        </script>
    </body>
</html>
