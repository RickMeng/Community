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
    <script src="//cdn.ckeditor.com/4.14.1/basic/ckeditor.js"></script>

</head>
<body>
<jsp:include page="header.jsp"/>

<section class="section container" id="postForm">
    <div class="row">
        <div class="col s12 l6 offset-l3">
            <h2 class="teal-text text-lighten-3">Write what you want</h2>
            <form method="post"  action="${pageContext.request.contextPath}/post/save">
                <div class="input-field">
                    <input type="text" id="title" name="title">
                    <label for="title">Title</label>
                </div>
                <div class="input-field">
                    <%--后期要改从数据库获取tag信息--%>
                    <select id="tag" name="tagId">
                        <option value="1">Life</option>
                        <option value="2">Second-hand items</option>
                        <option value="3">Food</option>
                    </select>
                    <label>Tag</label>
                </div>
                <div class="input-field">
                    <textarea id="editor" name="content">
                        Enter whatever you want
                    </textarea>
                </div>
                <div class="input-field center">
                    <button class="btn" type="submit">Submit</button>
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
    CKEDITOR.replace( 'editor' );
</script>









</body>
</html>
