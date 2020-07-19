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
    <title>真正的主页面</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css" type="text/css"  media="screen,projection">
    <%--注意这里的JS导入是否要按照上面--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.js"></script>
    <script>

    </script>
</head>
<body>
<jsp:include page="header.jsp"/>

<%--Butten area--%>
<div class="fixed-action-btn ">
    <a class="btn-floating btn-large teal darken-2 ">
        <i class="large material-icons ">mode_edit</i>
    </a>
    <ul>
        <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
        <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
        <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
        <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
    </ul>
</div>

<div class="container">
    <div class="row">
        <div class="col s12 l7 offset-l2">
            <%--tag area--%>
            <div class="container">
                <br>
                <a class="waves-effect waves-light btn">Life</a>
                <a class="waves-effect waves-light btn">Second-hand</a>
                <a class="waves-effect waves-light btn">Food</a>
                <%--href="javascript:;" 这个可以屏蔽a标签的跳转--%>
                <a class="btn-floating btn-large waves-effect waves-light red" href="javascript:;" onclick="publish()"><i class="material-icons">add</i></a>
            </div>
            <br>
            <%--content area--%>
            <div class="collection">
                <a href="#!" class="collection-item"><span class="badge">1</span>Alan</a>
                <a href="#!" class="collection-item"><span class="new badge teal darken-2">4</span>Alan</a>
                <a href="#!" class="collection-item">Alan</a>
                <a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>
                <a href="#!" class="collection-item">Alan</a>
                <a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>
                <a href="#!" class="collection-item">Alan</a>
                <a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>
                <a href="#!" class="collection-item">Alan</a>
                <a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>
            </div>
        </div>
        <%--pagination--%>
        <div class="col s12 l8 offset-l4">
            <ul class="pagination">
                <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
                <li class="active teal darken-2"><a href="#!">1</a></li>
                <li class="waves-effect"><a href="#!">2</a></li>
                <li class="waves-effect"><a href="#!">3</a></li>
                <li class="waves-effect"><a href="#!">4</a></li>
                <li class="waves-effect"><a href="#!">5</a></li>
                <li class="waves-effect"><a href="#!"><i class="material-icons ">chevron_right</i></a></li>
            </ul>
        </div>
    </div>
</div>



<script>
    $(document).ready(function(){
        $(".sidenav").sidenav();
        $('.fixed-action-btn').floatingActionButton();
    });

    function publish(){
        var user = "${user}";
        if(user==null){
            alert("Please log in!")
        }else {
            window.location.href="${pageContext.request.contextPath}/post/form";
        }
    }
</script>

</body>
</html>
