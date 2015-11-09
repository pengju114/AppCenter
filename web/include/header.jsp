<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 此页面需引进pj.js --%>
        <div id="tool_bar" class="tool_bar">
            <img src="${contextPath}/images/web/icon.ico"  style="float: left;" />
            <div style="float: right; width: auto; height: 100%;">
                <form action="#" name="search_form" style="padding: 0em; margin: 0em; height: 100%; width: auto;">
                    <table border="0" cellspacing="0" height="100%" width="auto">
                        <tr>
                            <td valign="middle">
                                <input type="text" name="searchText" style="width: auto; display: none; position: relative;" />
                            </td>
                            <td>
                                <img class="tool_bar_img_item" src="http://www.aguo.com/source/images/search_black.png" id="search_img" />
                            </td>
                            <td>
                                <img class="tool_bar_img_item" id="more" src="http://www.aguo.com/source/images/menu_more.png" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            
            <div style="width: 100%; clear: both;"></div>
        </div>
        
        <ul id="nav_items">
            <li>
                <a href="${contextPath}/index.jsp" target="_self">首页</a>
            </li>
            <li>
                <a href="${contextPath}/index/software.jsp" target="_self">软件</a>
            </li>
            <li>
                <a href="${contextPath}/index/games.jsp" target="_self">游戏</a>
            </li>
            <li>
                <a href="${contextPath}/index/recommend.jsp" target="_self">推荐</a>
            </li>
            
        </ul>
        <div style="clear: both;"></div>
            <script type="text/javascript">
                pj(window).addListener({"load":function(){
                        var path = location.pathname;
                        var isMain = true;
                        var main = pj("#nav_items a").each(function(){
                            var href = pj(this).attr("href");
                            var index = path.lastIndexOf("/");
                            if((index !== -1) && href.lastIndexOf(path.substring(index)) !== -1){
                                isMain = false;
                                pj(this).addClass("selected");
                                return false; // stop iterate
                            }
                        }).get(0);
                        if(isMain){
                            pj(main).addClass("selected");
                        }
                }});
                
                var field = pj(":forms['search_form']['searchText']");
                var searchFieldWidth = pj.windowWidth() * 0.3;
                
                pj("#search_img").click(function(){
                    
                    var border = parseInt(field.css("borderWidth"));
                    if(isNaN(border)){
                        border = 0;
                    }
                    var w = searchFieldWidth + border * 2;

                    if(field.isVisible()){
                        var text = pj.trim(field.value());
                        
                        if(text && text.length > 0){
                            // search
                        }else{
                            // hide it
                            field.animate({opacity:0,width:0},300,function(){ this.css({display:"none"}) });
                        }
                    }else{
                        // show it
                        
                        field.css({display:"block",width:"0px"}).animate({opacity:1,width:w});
                    }
                    
                });
            </script>