<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    pageContext.setAttribute("name", "pageContextValue");
	    request.setAttribute("name", "requestValue");
	    session.setAttribute("name", "sessionValue");
	    application.setAttribute("name", "applicationValue");
	%>

	${pageScope.name }
	<br> 
	${requestScope.name }
	<br>
	${sessionScope.name }
    <br>
    ${applicationScope.name }
    
    <h1>------------------------------------</h1>
    
    <!-- 如果简写,则它会从范围由小到大进行查找(page -> request -> session -> application) -->
    <!-- 找到之后就不会再找了 -->
    ${name }
    
    <h1>------------------------------------</h1>
    
    ${pageContext.request.contextPath }
    
    <h1>------------------------------------</h1>
    
    ${1 + 1 }<br>
    ${empty name }<br>
    ${name==null?"name为空":"name有值" }
    
</body>
</html>