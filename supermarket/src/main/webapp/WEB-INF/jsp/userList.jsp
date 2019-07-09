

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <span>用户管理页面</span>
        </div>
        <div class="search">
            <span>用户名：</span>
            <input type="text" placeholder="请输入用户名"/>
            <input type="button" value="查询" id="searchUser"/>
            <a href="userAdd.jsp">添加用户</a>
        </div>
        <!--用户-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">用户编码</th>
                <th width="20%">用户名称</th>
                <th width="10%">性别</th>
                <th width="10%">年龄</th>
                <th width="10%">电话</th>
                <th width="10%">用户类型</th>
                <th width="30%">操作</th>
            </tr>

            <c:forEach var="user" items="${list}">
                <tr>
                    <td>${user.userCode}</td>
                    <td>${user.userName}</td>
                    <td>${user.gender}</td>
                    <td>${user.age}</td>
                    <td>${user.phone}</td>
                    <td>${user.userType}</td>
                    <td>
                        <a href="userView.user?usercode=${user.userCode}"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="userUpdate.user?usercode=${user.userCode}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="#?userCode=${user.userCode}" class="removeUser"><img src="img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <button type="button" >当前${pageLimit.currentPage}/${pageLimit.totalPageCount}</button>&nbsp&nbsp&nbsp
        <button type="button" onclick="pageGo(1)">首页</button>&nbsp&nbsp&nbsp
        <c:if test="${pageLimit.currentPage!=1}">
            <button type="button" onclick="pageGo(${pageLimit.currentPage-1})">上一页</button>&nbsp&nbsp&nbsp
        </c:if>
        <c:if test="${pageLimit.currentPage!=pageLimit.totalPageCount}">
            <button type="button" onclick="pageGo(${pageLimit.currentPage+1})">下一页</button>&nbsp&nbsp&nbsp
        </c:if>
        <button type="button" onclick="pageGo(${pageLimit.totalPageCount})">尾页</button>&nbsp&nbsp&nbsp
    </div>

</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<footer class="footer">
    版权归北大青鸟
</footer>

<script src="js/jquery.js"></script>
<script src="js/user.js"></script>
<script src="js/time.js"></script>

</body>
</html>
