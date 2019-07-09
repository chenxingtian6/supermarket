<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <%--    <base href="<%=request.getContextPath()%>/" />--%>
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link type="text/css" rel="stylesheet" href="../static/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../static/css/public.css"/>
    <script type="text/javascript" src="../static/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../static/js/ajax.js"></script>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"><%=session.getAttribute("userName")%></span> , 欢迎你！</p>
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
            <span>用户管理页面 >> 用户添加页面</span>
        </div>

            <form action="/user/addUser.action" method="post">
                <div class="providerAdd">
                    <div>
                        <label>账号：</label>
                        <input type="text" name="userCode" id="Code"/>
                        <span id="spnuserCode">*</span>
                    </div>
                    <div>
                        <label >用户密码：</label>
                        <input type="password" name="userPassword" />
                        <span>*密码长度必须大于6位小于20位</span>

                    </div>
                    <div>
                        <label >确认密码：</label>
                        <input type="password" name="userPassword2" id="Password2"/>
                        <span id="userPasswordspan">*</span>
                    </div>
                    <div>
                        <label >用户名：</label>
                        <input type="text" name="userName"/>
                        <span>*请输入用户编码，且不能重复</span>
                    </div>
                    <div>
                    <label>用户性别：</label>

                    <select name="gender">
                        <option value="2">男</option>
                        <option value="1">女</option>
                    </select>
                    <span></span>
                </div>
                    <div>
                    <label>出生日期：</label>

                    <input type="date" name="birthday"/>
                    <span>*</span>
                </div>
                    <div>
                        <label >用户电话：</label>
                        <input type="text" name="phone" />
                        <span>*</span>
                    </div>
                    <div>
                        <label >用户地址：</label>
                        <input type="text" name="address"/>
                    </div>
                    <div>
                        <label>用户类别：</label>
                        <input type="radio" name="userType" value="1"/>管理员
                        <input type="radio" name="userType" value="2"/>经理
                        <input type="radio" name="userType" value="3"/>普通用户

                    </div>
                    <div class="providerAddBtn">
                        <input type="submit" value="保存" />
                        <input type="button" value="返回" />
                    </div>
                </div>
            </form>



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
