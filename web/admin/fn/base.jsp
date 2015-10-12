
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="${contextPath}/css/admin/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/scripts/pj-2.4.mini.js"></script>
<script type="text/javascript">
    
    window.onload=function(){
        if(window.top.nav){
            pj("#nav_title").html(window.top.nav.title);
            pj("#nav_cat").html(window.top.nav.category);
        }
    };
</script>
<style type="text/css">
    a:hover{
        text-decoration: underline;
        color: #00cc66;
    }
    #result td{
        padding: 5px;
    }
    #result{
        margin: 10px 0 0 0;
    }
</style>