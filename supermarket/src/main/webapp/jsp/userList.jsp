

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
<%--<base href="<%=request.getContextPath()%>/">--%>
    <link type="text/css" rel="stylesheet" href="../static/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../static/css/public.css"/>
    <script type="text/javascript" src="../static/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".removeUser").click(function () {
                if (confirm("你确定要删除吗？")){
                    // alert("开始删除")
                    var $tr=$(this).parent().parent();
                    var userCode=$tr.find("td:eq(0)").html();
                    //alert("userCode:"+userCode)
                    $.ajax({
                        type:"GET",
                        async:true,
                        url:"/user/delete.action",
                        data:{"userCode":userCode},
                        dataType:"json",
                        success:function (data) {
                            if(data.result=="success"){
                                alert("删除成功！")
                                $tr.remove();
                            }else {
                                alert("删除失败！")
                            }
                        }
                    })
                }
            })
        })
    </script>

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
            <span>用户管理页面</span>
        </div>
        <form name="form1" action="/user/list.action" method="post">
        <div class="search">

            <span>用户名：</span>
            <input type="text" name="userName" value="${users.userName}" placeholder="请输入用户名"/>
            <input type="submit" value="查询" id="searchUser"/>

            <a href="/user/toAdd.action">添加用户</a>
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

            <c:forEach var="user" items="${pageInfo.list}">
                <tr>
                    <td>${user.userCode}</td>
                    <td>${user.userName}</td>
                    <td>${user.gender eq 1?"男":"女"}</td>
                    <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/> </td>
                    <td>${user.phone}</td>
                    <td>${user.userType eq 1?("管理员"):(user.userType eq 2?("经理"):"普通用户")}</td>
                    <td>
                        <a href="/user/userView.action?userCode=${user.userCode}"><img src="../static/img/read.png" alt="查看" title="查看"/></a>
                        <a href="/user/toupdate.action?userCode=${user.userCode}"><img src="../static/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="javascript:void(0);" class="removeUser"><img src="../static/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>
        当前${pageInfo.pageNum}/${pageInfo.pages}&nbsp;
        <a href="javascript:form1.action='/user/list.action?pageNo=1';form1.submit()">首页</a>
        <c:if test="${pageInfo.hasPreviousPage}">
            <a href="javascript:form1.action='/user/list.action?pageNo=${pageInfo.prePage}';form1.submit()">上一页</a>
        </c:if>
        <c:if test="${pageInfo.hasNextPage}">
            <a href="javascript:form1.action='/user/list.action?pageNo=${pageInfo.nextPage}';form1.submit()" style="font-size: larger;">下一页</a>
        </c:if>
            <a href="javascript:form1.action='/user/list.action?pageNo=${pageInfo.pages}';form1.submit()">尾页</a>
        </p>
        </form>
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

<%--<script src="js/jquery.js"></script>--%>
<%--<script src="js/user.js"></script>--%>
<%--<script src="js/time.js"></script>--%>

</body>
</html>
