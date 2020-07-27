<%--
  Created by IntelliJ IDEA.
  User: Isaac Newton
  Date: 16/07/2020
  Time: 03:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registraion</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css" type="text/css"  media="screen,projection">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="section container" id="register">
    <div class="row">
        <div class="col s12 l5 offset-l3">
            <h2 class="teal-text text-lighten-3">Registration</h2>
            <form method="post" id="registerform">
                <div class="input-field">
                    <input type="text" id="username" name="username">
                    <label for="username">Username</label>
                </div>
                <div class="input-field">
                    <input type="password" id="password" name="password">
                    <label for="password">Password</label>
                </div>
                <div class="input-field">
                    <select id="gender" name="gender">
                        <option value="" disabled selected>Choose your option</option>
                        <option value="1">Male</option>
                        <option value="2">Female</option>
                        <option value="3">Secret</option>
                    </select>
                    <label>Gender</label>
                </div>
                <div class="input-field">
                    <input type="text" id="nickname" name="nickname">
                    <label for="nickname">Nickname</label>
                </div>
                <div class="input-field">
                    <input type="text" id="profile" name="profile">
                    <label for="profile">Profile</label>
                </div>


                <div class="input-field center">
                    <button class="btn" onclick="register()">Register</button>
                </div>
            </form>
        </div>
    </div>
</section>


<script>
    $(document).ready(function(){
        $(".sidenav").sidenav();
        $('select').formSelect();
    });
</script>

<script>
    function register() {
        var formData =$("#registerform").serialize();
        $.post({
            url:"${pageContext.request.contextPath}/user/register",
            data:formData,
            type:"post",
            success:function (sign) {
                if(sign=="success"){
                    window.location.href="${pageContext.request.contextPath}/index"
                }else {
                    alert("Please register again ");
                    return;
                }
            }
        })
    }
</script>

</body>
</html>
