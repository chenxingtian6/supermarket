
<%@ page import="com.cxt.entiy.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> <%=session.getAttribute("userName")%></span> , 欢迎你！</p>
        <a href="out.user">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="billList.bill">账单管理</a></li>
                <li><a href="proList.pro">供应商管理</a></li>
                <li id="active"><a href="userList.user">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="out.user">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <div class="providerView">
            <%
                User user = (User) request.getAttribute("userView");
                request.setAttribute("user",user);
            %>
            <p><strong>用户编号：</strong><span><%=user.getUserCode()%></span></p>
            <p><strong>用户名称：</strong><span><%=user.getUserName()%></span></p>
            <p><strong>用户性别：</strong><span><%=user.getGender()%></span></p>
            <p><strong>出生日期：</strong><span><%=user.getBirthday()%></span></p>
            <p><strong>用户电话：</strong><span><%=user.getPhone()%></span></p>
            <p><strong>用户地址：</strong><span><%=user.getAddress()%></span></p>
            <p><strong>用户类别：</strong><span><%=user.getUserType()%></span></p>

            <a href="userList.user">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>

</body>
</html>
