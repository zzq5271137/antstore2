<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎注册</title>
    <link rel="stylesheet" href="style/common.css">
    <link rel="stylesheet" href="style/regStyle.css">
    <!--设置标签图标-->
    <link href="favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="style/footerStyle.css">
</head>
<body>

<!--注册头部-->
<div id="reg_header">
    <div class="reg_h_center">

            <img src="images/logo.png" alt="">
            <h3>欢迎注册</h3>

            <div class="reg_h_right">
                <span>已有账户</span><a href="login.jsp">请登录</a>
            </div>
    </div>
</div>

<div id="reg_main">
        <div class="main_left">
            <form action="/AntStore2/RegistServlet" id="reg_form" method="post">
                <div>
                    <label>用户名</label>
                    <input id="username" type="text" placeholder="请输入用户名" name="username">
                </div>
                <div>
                    <label>密码</label>
                    <input id="pwd" type="text" placeholder="请输入密码" name="password">
                </div>
                <div>
                    <label>确认密码</label>
                    <input id="pwd2" type="text" placeholder="请再次输入密码">
                </div>
                <div>
                    <label>电话</label>
                    <input type="text" placeholder="请输入电话" name="phone">
                </div>
                <div class="check_box">
                    <label>验证码</label>
                    <input type="text" placeholder="请输入验证码" name="code">
                    <img src="/AntStore2/CheckCodeServlet" alt="" onclick="change(this)">
                </div>
                <div class="submit_button">
                    <input type="button" value="立即注册" onclick="checkData()">
                </div>
            </form>
        </div>
        <div class="main_right">
             <img src="images/reg_right.png" alt="">
        </div>
</div>
<!--尾部-->
<%@ include file="/footer.jsp" %>

<script type="text/javascript">
    function change(obj) {
        obj.src = "/AntStore2/CheckCodeServlet?time=" + new Date().getTime();
    }
    
    function checkData() {
    	// 1. 获取用户名和密码, 确认密码
    	var username = document.getElementById("username");
    	var pwd = document.getElementById("pwd");
    	var pwd2 = document.getElementById("pwd2");
    	
    	// 2. 判断输入的内容不能为空
    	if (username.value === "") {
    		alert("请输入用户名");
    		return;
    	}
    	if (pwd.value === "") {
            alert("请输入密码");
            return;
        }
    	if (pwd2.value === "") {
            alert("请再次输入密码");
            return;
        }
    	
    	// 3. 判断两次密码是否一致
    	if (pwd.value === pwd2.value) {
    		// 发送请求
            var form = document.getElementById("reg_form");
            form.submit(); // 通过js提交表单,相当于执行了form里面的action
    	} else {
    		alert("两次输入的密码不一样");
    	}
	}
</script>

</body>
</html>


