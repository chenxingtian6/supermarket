<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link type="text/css" rel="stylesheet" href="../static/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../static/css/public.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${loginedUser.userName}</span> , 欢迎你！</p>
        <a href="/user/logout.action">退出</a>
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
                <li><a href="/user/list.action">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="/user/logout.action">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="/user/update.action" method="post">
                <input type="hidden" name="userCode" value="${user.userCode}">
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="${user.userName}"/>
                </div>

                <div>
                    <label>用户性别：</label>
                    <select name="gender">

                        <option value="2" <c:if test="${user.gender eq 2}">selected="selected"</c:if>>男</option>
                        <option value="1" <c:if test="${user.gender eq 1}">selected="selected"</c:if>>女</option>


                    </select>
                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="date" name="birthday" id="data"
                    <fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="phone" id="userphone" value="${user.phone}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="address" id="userAddress" value="${user.address}"/>
                </div>
                <div>
                    <label>用户类别：</label>

                    <input type="radio" name="userType" checked value="1"
                           <c:if test="${user.userType eq 1}">checked="checked"</c:if>/>管理员
                    <input type="radio" name="userType" value="2"
                           <c:if test="${user.userType eq 2}">checked="checked"</c:if>/>经理
                    <input type="radio" name="userType" value="3"
                           <c:if test="${user.userType eq 3}">checked="checked"</c:if>/>普通用户

                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.jsp">返回</a>-->
                    <input type="submit" value="保存">
                    <a href="/user/list.action">返回</a>

                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<%--<script src="js/time.js"></script>--%>
<%--<script src="js/jquery.js"></script>--%>
<%--<script src="js/user.js"></script>--%>
<%--<script src="js/My97DatePicker/WdatePicker.js"></script>--%>

</body>
</html>
