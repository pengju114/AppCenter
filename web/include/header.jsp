<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 此页面需引进pj.js --%>
        <div id="tool_bar" class="tool_bar">
            <img src="${contextPath}/images/web/icon.ico"  style="float: left;" />
            <div style="float: right; width: auto; height: 100%;">
                <form action="#" name="search_form" style="padding: 0em; margin: 0em; height: 100%; width: auto;">
                    <table border="0" cellspacing="0" height="100%" width="auto">
                        <tr>
                            <td valign="middle">
                                <input type="text" name="searchText" style="width: auto; display: none;" />
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
                <a id="main" href="${contextPath}/index.jsp?page=main" target="_self">首页</a>
            </li>
            <li>
                <a id="software" href="${contextPath}/index/software.jsp?page=software" target="_self">软件</a>
            </li>
            <li>
                <a id="games" href="${contextPath}/index/games.jsp?page=games" target="_self">游戏</a>
            </li>
            <li>
                <a id="recommend" href="${contextPath}/index/recommend.jsp?page=recommend" target="_self">推荐</a>
            </li>
            
        </ul>
            <script type="text/javascript">
                pj(window).addListener({"load":function(){
                        var aID = "${param.page}";
                        if(!aID){
                            aID = "main";
                        }
                        pj("#"+aID).addClass("selected");
                }});
                
                pj("#search_img").click(function(){
                    var field = pj(":forms['search_form']['searchText']");
                    if(field.isVisible()){
                        if(pj.trim(field.value())){
                            // search
                        }else{
                            // hide it
                            field.animate({opacity:0,width:0,left:("+="+field.width())},function(){ this.css({display:"none"}) });
                        }
                    }else{
                        // show it
                        var w = field.width();
                        field.css({display:"block",width:"0px"}).animate({opacity:1,width:w,left:("-="+w)});
                    }
                    
                });
            </script>