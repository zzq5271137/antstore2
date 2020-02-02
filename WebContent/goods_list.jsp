<%@page import="com.mycomp.domain.Goods"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>码蚁商城</title>
    <link rel="stylesheet" href="style/index.css">
    <link rel="stylesheet" href="style/pageStyle.css">
</head>
<body>
<!--头部-->
<%@ include file="/header.jsp" %>

<!--热买商品-->
<div id="hot_goods">
    <h3 class="hot_goods_title">热卖商品</h3>
    <div class="hot_goods_body">
        <ul>
	        <%
	            // 从request域中取数据
	            List<Goods> allGoods = (List<Goods>) request.getAttribute("allGoods");
	            if (allGoods != null) {
	                for (Goods goods : allGoods) {
	                    out.write("<li>");
	                    out.write("<a href=''>");
	                    out.write("<img src='images/goods/good1.png' alt=''>");
	                    out.write("<p>" + goods.getName() + "</p>");
	                    out.write("<i class='yuan'>￥</i><span class='price'>" + goods.getPrice() + "</span>");
	                    out.write("</a>");
	                    out.write("</li>");
	                }
	            } else {
	                out.write("<h1>没有商品</h1>");
	            }
	        %>
        </ul>
    </div>
    <!--分页-->
    <div id="page" class="page_div"></div>
</div>

<!--尾部-->
<%@ include file="/footer.jsp" %>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script>
    //分页
    $("#page").paging({
        pageNo:5,
        totalPage: 10,
        totalSize: 300,
        callback: function(num) {
            alert(num);
        }
    })
</script>

</body>
</html>


