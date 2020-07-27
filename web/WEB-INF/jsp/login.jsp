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
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="section container" id="register">
    <div class="row">
        <div class="col s12 l5 offset-l3">
            <h2 class="teal-text text-lighten-3">Login</h2>
<%--            <form   method="post" id="loginform" action="${pageContext.request.contextPath}/user/login">--%>
            <form   method="post" id="loginform" >
                <div class="input-field">
                    <input type="text" id="username" name="username">
                    <label for="username" id="ulabel">Username</label>
                </div>
                <div class="input-field">
                    <input type="password" id="password" name="password">
                    <label for="password"id="plabel">Password</label>
                </div>
                <div class="input-field center">
<%--                    <input class="btn" type="submit" value="Login">--%>
                    <button class="btn-large waves-effect waves-light" type="submit" onclick="login()">
                        <i class="material-icons right">Submit</i>
                    </button>
                </div>

            </form>
        </div>
    </div>
</section>

<script>
    $(document).ready(function(){
        $(".sidenav").sidenav();
    });
</script>



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


<%--<script>--%>
<%--    document.addEventListener('DOMContentLoaded', function(e) {--%>
<%--        FormValidation.formValidation(--%>
<%--            document.getElementById('loginform'),--%>
<%--            {--%>
<%--                fields: {--%>
<%--                    username: {--%>
<%--                        validators: {--%>
<%--                            notEmpty: {--%>
<%--                                message: 'The name is required'--%>
<%--                            },--%>
<%--                            stringLength: {--%>
<%--                                min: 6,--%>
<%--                                max: 30,--%>
<%--                                message: 'The name must be more than 6 and less than 30 characters long'--%>
<%--                            },--%>
<%--                            regexp: {--%>
<%--                                regexp: /^[a-zA-Z0-9_]+$/,--%>
<%--                                message: 'The name can only consist of alphabetical, number and underscore'--%>
<%--                            }--%>
<%--                        }--%>
<%--                    },--%>
<%--                    password: {--%>
<%--                        validators: {--%>
<%--                            notEmpty: {--%>
<%--                                message: 'The password is required'--%>
<%--                            },--%>
<%--                            numeric: {--%>
<%--                                message: 'The password must be a number'--%>
<%--                            }--%>
<%--                        }--%>
<%--                    },--%>

<%--                },--%>
<%--                plugins: {--%>
<%--                    trigger: new FormValidation.plugins.Trigger(),--%>
<%--                    materialize: new FormValidation.plugins.Materialize(),--%>
<%--                    submitButton: new FormValidation.plugins.SubmitButton(),--%>
<%--                    icon: new FormValidation.plugins.Icon({--%>
<%--                        valid: 'fa fa-check',--%>
<%--                        invalid: 'fa fa-times',--%>
<%--                        validating: 'fa fa-refresh',--%>
<%--                    }),--%>
<%--                },--%>
<%--            }--%>
<%--        );--%>
<%--    });--%>
<%--</script>--%>






</body>
</html>
