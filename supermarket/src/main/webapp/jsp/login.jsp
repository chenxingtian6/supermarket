
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
<%--    <base href="<%=request.getContextPath()%>/">--%>
    <meta charset="UTF-8">
    <title>系统登录 - 超市账单管理系统</title>
    <link type="text/css" rel="stylesheet" href="../static/css/style.css"/>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>超市账单管理系统</h1>
    </header>
    <section class="loginCont" >
        <div style="color:red">${message}</div>
        <form class="loginForm" action="/user/login.action" method="post" >
            <div class="inputbox">
                <label for="user">用户名：</label>
                <input id="user" type="text" name="userCode" placeholder="请输入用户名" required value="102"/>
            </div>
            <div class="inputbox">
                <label for="mima">密码：</label>
                <input id="mima" type="password" name="userPassword" placeholder="请输入密码" required value="102"/>
            </div>
            <div class="subBtn">
                <input type="submit" value="登录" />
                <input type="reset" value="重置"/>
            </div>
        </form>
    </section>
</section>
<%--<script src="js/jquery.js"></script>--%>
<%--<script src="js/js.js"></script>--%>

</body>
</html>
