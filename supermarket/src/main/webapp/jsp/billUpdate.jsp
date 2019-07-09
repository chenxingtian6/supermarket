
<%@ page import="java.util.Set" %>

<%@ page import="java.util.List" %>
<%@ page import="com.cxt.entiy.Bill" %>
<%@ page import="com.cxt.biz.ProviderBiz" %>
<%@ page import="com.cxt.entiy.Provider" %>
<%@ page import="com.cxt.biz.imp.ImpProviderBiz" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
head lang="en">
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
                <li id="active"><a href="billList.bill">账单管理</a></li>
                <li><a href="proList.pro">供应商管理</a></li>
                <li><a href="userList.user">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="out.user">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面 >> 订单添加页面</span>
        </div>
        <%
            Bill bill= (Bill) request.getAttribute("bill");
            request.setAttribute("bill",bill);
            ProviderBiz providerBiz=new ImpProviderBiz();
            List<Provider> list=providerBiz.proNameList();
            request.setAttribute("list",list);
        %>
        <div class="providerAdd">
            <form >
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="providerId">订单编码：</label>
                    <input type="text" name="providerId" id="providerId" value="<%=bill.getBillCode()%>"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="providerName">商品名称：</label>
                    <input type="text" name="providerName" id="providerName" value="<%=bill.getProductName()%>"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="people">商品单位：</label>
                    <input type="text" name="productUnit" id="people" value="<%=bill.getProductUnit()%>"/>
                    <span>*</span>

                </div>
                <div>
                    <label for="phone">商品数量：</label>
                    <input type="text" name="productCount" id="phone" value="<%=bill.getProductCount()%>"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="address">总金额：</label>
                    <input type="text" name="totalPrice" id="address" value="<%=bill.getTotalPrice()%>"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="fax">供应商：</label>
                    <select name="productDesc" id="fax">
                        <c:forEach items="${list}" var="pro">
                            <option value="${pro.id}">${pro.proName}</option>
                        </c:forEach>
                    </select>
                    <span>*</span>
                </div>
                <div>
                    <label >是否付款：</label>
                    <%
                        if(bill.getIsPayment().equals("未支付")){
                    %>
                    <input type="radio" name="zhifu"checked value="0"/>未支付
                    <input type="radio" name="zhifu" value="1"/>已支付
                    <%}else{%>
                    <input type="radio" name="zhifu" value="0"/>未支付
                    <input type="radio" name="zhifu" checked value="1"/>已支付
                    <%}%>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.jsp">返回</a>-->
                    <a href="#?billID=<%=bill.getId()%>" id="saveBillUpdate"><input type="button" value="保存"/></a>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bill.js"></script>

</body>
</html>
