
<%@ page import="com.cxt.entiy.Provider" %>
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
            <span>供应商管理页面 >> 供应商修改页</span>
        </div>
        <div class="providerAdd">
            <form action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <%
                        Provider provider= (Provider) request.getAttribute("proView");
                        request.setAttribute("provider",provider);
                    %>
                    <label for="providerId">供应商编码：</label>
                    <input type="text" name="providerId" id="providerId" value="<%=provider.getProCode()%>"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="providerName">供应商名称：</label>
                    <input type="text" name="providerName" id="providerName" value="<%=provider.getProName()%>"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="people">联系人：</label>
                    <input type="text" name="people" id="people" value="<%=provider.getProContact()%>"/>
                    <span>*</span>

                </div>
                <div>
                    <label for="phone">联系电话：</label>
                    <input type="text" name="phone" id="phone" value="<%=provider.getProPhone()%>"/>
                    <span></span>
                </div>
                <div>
                    <label for="address">联系地址：</label>
                    <input type="text" name="address" id="address" value="<%=provider.getProAddress()%>"/>
                    <span></span>

                </div>
                <div>
                    <label for="fax">传真：</label>
                    <input type="text" name="fax" id="fax" value="<%=provider.getProFax()%>"/>
                    <span></span>

                </div>
                <div>
                    <label for="describe">描述：</label>
                    <input type="text" name="describe" id="describe" value="<%=provider.getProDesc()%>"/>
                    <span></span>

                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="providerList.jsp">返回</a>-->
                    <input type="button" value="保存" id="saveProUp"/>
                    <input type="button" value="返回" />
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
<script src="js/provider.js"></script>

</body>
</html>
