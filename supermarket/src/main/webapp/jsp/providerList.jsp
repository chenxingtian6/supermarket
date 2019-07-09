
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li id="active"><a href="proList.pro">供应商管理</a></li>
                <li><a href="userList.user">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="out.user">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面</span>
        </div>
        <div class="search">
            <span>供应商名称：</span>
            <input type="text" placeholder="请输入供应商的名称" id="searchPro"/>
            <input type="button" value="查询"/>
            <a href="providerAdd.jsp">添加供应商</a>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>

            <c:forEach var="provider" items="${list}">
                <tr>
                    <td>${provider.proCode}</td>
                    <td>${provider.proName}</td>
                    <td>${provider.proContact}</td>
                    <td>${provider.proPhone}</td>
                    <td>${provider.proFax}</td>
                    <td>${provider.creationDate}</td>
                    <td>
                        <a href="proView.pro?proID=${provider.id}"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="proUp.pro?proID=${provider.id}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="#?proID=${provider.id}" class="removeProvider"><img src="img/schu.png" alt="删除" title="删除"/></a>
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
<div class="remove" id="removeProv">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该供应商吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>


<footer class="footer">
    版权归北大青鸟
</footer>

<script src="js/jquery.js"></script>
<script src="js/provider.js"></script>
<script src="js/time.js"></script>

</body>
</html>
