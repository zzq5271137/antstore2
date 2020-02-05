<%@page import="com.mycomp.domain.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${1 == 1 }">
		<h1>c:if标签</h1>
	</c:if>
	<br>

	<h1>-----------------------------------------</h1>
    
    <%
        request.setAttribute("count", 100);
    %>
    
    <!-- 它没有else -->
    <c:if test="${count > 50 }">
        <h1>大于50</h1>
    </c:if>
    <c:if test="${count <= 50 }">
        <h1>小于等于50</h1>
    </c:if>
    
    <h1>-----------------------------------------</h1>    
    
    <!-- 普通for循环 -->
    <!-- i是自动得被存到pageScope中的 -->
    <c:forEach begin="0" end="5" var="i">
        ${i }<br> <!-- 等价于: ${pageScope.i } -->
    </c:forEach>
    
    <h1>-----------------------------------------</h1>
    
    <!-- 增强for循环(遍历的是一个集合) -->
    <%
        List<String> strList = new ArrayList<String>();
        strList.add("aaa");
        strList.add("bbb");
        strList.add("ccc");
        request.setAttribute("strList", strList);
    %>
    <c:forEach items="${strList }" var="str">
        ${str }<br>
    </c:forEach>
    
    <h1>-----------------------------------------</h1>
    
    <!-- el表达式中,可以省略get方法 -->
    <%
        List<User> userList = new ArrayList<User>();
        User user1 = new User();
        user1.setUsername("user1");
        userList.add(user1);
        User user2 = new User();
        user2.setUsername("user2");
        userList.add(user2);
        User user3 = new User();
        user3.setUsername("user3");
        userList.add(user3);
        request.setAttribute("userList", userList);
    %>
    <c:forEach items="${userList }" var="user">
        ${user.username }<br>
    </c:forEach>
    
</body>
</html>