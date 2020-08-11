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
    <title>Item Form</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css" type="text/css"  media="screen,projection">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.js"></script>
    <script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

</head>
<body>
<jsp:include page="header.jsp"/>

<br><br>
<section class="section container" id="postForm">
    <div class="row">
        <div class="col s12 l6 offset-l3">
            <h2 class="teal-text text-lighten-3">Describle your goods</h2>
            <form method="post"  action="${pageContext.request.contextPath}/item/save" enctype="multipart/form-data">
                <div class="input-field">
                    <input type="text" id="name" name="name">
                    <label for="content">Name</label>
                </div>
                <div class="input-field">
                    <input type="text" id="content" name="content">
                    <label for="content">Description and Contact</label>
                </div>

                <div class="input-field">
                    <input type="number" id="price" name="price"/>
                    <label for="price">Price</label>
                </div>

                <div class="input-field">
                    <input type="File" id="pictureFile "name="pictureFile" />
                </div>

                <div class="input-field center">
                    <button class="btn-large waves-effect waves-light" type="submit">Submit</button>
                </div>

            </form>
        </div>
    </div>
</section>

<script>
    $(document).ready(function(){
        $(".sidenav").sidenav();
        $(".dropdown-trigger").dropdown();
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




</body>
</html>
