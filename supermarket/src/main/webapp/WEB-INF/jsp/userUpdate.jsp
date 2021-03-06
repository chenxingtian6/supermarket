<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form>
                <!--div的class 为error是验证错误，ok是验证成功-->
             >
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="<%=user.getUserName()%>"/>
                    <span>*</span>
                </div>

                <div>
                    <label>用户性别：</label>
                    <select name="gender">
                        <%
                            if (user.getGender().equals("男")) {
                        %>
                        <option value="2" selected>男</option>
                        <option value="1">女</option>
                        <%} else {%>
                        <option value="2">男</option>
                        <option value="1" selected>女</option>
                        <%}%>
                    </select>
                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="text" name="data" id="data" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                           value="<%=user.getBirthday()%>"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="userphone" id="userphone" value="<%=user.getPhone()%>"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="userAddress" id="userAddress" value="<%=user.getAddress()%>"/>
                </div>
                <div>
                    <label>用户类别：</label>
                    <%
                        if (user.getUserType().equals("系统管理员")) {
                    %>
                    <input type="radio" name="userlei" checked value="1"/>管理员
                    <input type="radio" name="userlei" value="2"/>经理
                    <input type="radio" name="userlei" value="3"/>普通用户
                    <%} else if (user.getUserType().equals("经理")) {%>
                    <input type="radio" name="userlei" value="1"/>管理员
                    <input type="radio" name="userlei" checked value="2"/>经理
                    <input type="radio" name="userlei" value="3"/>普通用户
                    <%} else {%>
                    <input type="radio" name="userlei" value="1"/>管理员
                    <input type="radio" name="userlei" value="2"/>经理
                    <input type="radio" name="userlei" checked value="3"/>普通用户
                    <%}%>

                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.jsp">返回</a>-->
                    <input type="button" value="保存" id="saveUserUp"/>
                    <input type="button" value="返回"  id="saveUserUpBack"/>
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
<script src="js/user.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>

</body>
</html>
