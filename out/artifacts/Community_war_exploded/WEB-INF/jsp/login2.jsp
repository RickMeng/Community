<%--
  Created by IntelliJ IDEA.
  User: Isaac Newton
  Date: 13/07/2020
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css" type="text/css"  media="screen,projection">
    <%--注意这里的JS导入是否要按照上面--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.js"></script>
</head>
<body>
<jsp:include page="head.jsp"/>
<br><br><br><br><br><br>
<form id="loginform" method="post">
<div class="row">
    <div class="col s5"></div>
    <div class="input-field col s2">
        <input placeholder="Placeholder" id="username" name="username" type="text" class="validate">
        <label for="username">Username</label>
    </div>
    <div class="col s5"></div>
</div>
<div class="row">
    <div class="col s5"></div>
    <div class="input-field col s2">
        <input placeholder="Placeholder" id="password" name="password" type="text" class="validate">
        <label for="password">Password</label>
        <button class="waves-effect waves-light btn" onclick="login()">login</button>
        <button class="waves-effect waves-light btn" >registerr</button>
    </div>
    <div class="col s5"></div>
</div>
</form>




<script>
    function login() {
        //获取表单信息
        //这个formData获取到的信息是键值对的形式，key是name，name一定要和controller里对应
        var formData =$("#loginform").serialize();

        $.post({
            url:"${pageContext.request.contextPath}/user/login",
            //data:{'username':$('#username').val(),"password":$('#password').val()},
            data:formData,
            type:"post",
            success:function (sign) {
                if(sign=="101"){
                    window.location.href="${pageContext.request.contextPath}/index"
                }else {
                    alert("wrong username or password");
                    return;
                }
            }

        })
    }

</script>

</body>
</html>
