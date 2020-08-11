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

<br>
<section class="section container" id="register">
    <div class="row">
        <div class="col s12 l5 offset-l3">
            <h2 class="teal-text text-lighten-3">Registration</h2>
            <a name="hint" id="hint" > </a>
            <form method="post" id="registerform">
                <div class="input-field  ">
                    <input type="text" class="" id="username" name="username" onblur="vaUsername()">
                    <label for="username" >Username</label>
                </div>
                <div class="input-field">
                    <input type="password" id="password" name="password">
                    <label for="password" >Password</label>
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

                <label>
                    <input type="checkbox" />
                    <span></span>
                </label>
                <!-- Modal Trigger -->
                <a class=" modal-trigger" href="#modal1">Privacy Policy</a>

                <!-- Modal Structure -->
                <div id="modal1" class="modal">
                    <div class="modal-content">
                        <h4>Privacy Policy</h4>
                        <p>balabla</p>
                    </div>
                    <div class="modal-footer">
                        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Back</a>
                    </div>
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
        $(".dropdown-trigger").dropdown();
        $('.modal').modal();
    });
    function publish(){
        var user = "${user}";
        if(user==""){
            alert("Please log in!")
        }else {
            window.location.href="${pageContext.request.contextPath}/post/form";
        }
    }

    function addItem(){
        var user = "${user}";
        if(user==""){
            alert("Please log in!")
        }else {
            window.location.href="${pageContext.request.contextPath}/item/form";
        }
    }
</script>

<script>
    function vaUsername(){
        $.post({
            url:"${pageContext.request.contextPath}/user/validateUsername",
            data:{'username':$("#username").val()},
            success:function(message){
                if(message.toString()=="100"){
                    $("#hint").text("")
                }
                else {
                    $("#hint").css("color","red");
                    $("#hint").text("The username has been used")
                    //$("#username").attr("class","orange darken-2");
                }
            }

        })
    }


    function register() {
        var username= $("#username").val();
        var password = $("#password").val();
        var formData =$("#registerform").serialize();

        if(username == ""){
            alert("please enter username")
            return false;
        }
        if (password == "") {
            alert("please enter password");
            return false;
        }
        if(checkPass(password)<3){
            alert("At least 8 letters and contain uppercase and lowercase letters and numbers")
            return false;
        }


        $.post({
            url:"${pageContext.request.contextPath}/user/register",
            data:formData,
            type:"post",
            success:function (sign) {
                if(sign=="100"){
                    alert("Successful Registration");
                    window.location.href="${pageContext.request.contextPath}/index"
                }else {
                    alert("Please register again ");
                    return;
                }
            }
        })
    }


    function checkPass(pass) {
        if (pass.length < 8) {
            return 0;
        }
        var str = 0;
        if (pass.match(/([a-z])+/)) {
            str++;
        }
        if (pass.match(/([0-9])+/)) {
            str++;
        }
        if (pass.match(/([A-Z])+/)) {
            str++;
        }
        if (pass.match(/[^a-zA-Z0-9]+/)) {
            str++;
        }
        return str;
    }

</script>

</body>
</html>
