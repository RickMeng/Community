<%--
  Created by IntelliJ IDEA.
  User: Isaac Newton
  Date: 16/07/2020
  Time: 03:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<section class="section container" id="detail">
    <div class="row ">
        <div class="col s12 l7 offset-l2 z-depth-1">
            <h4 >${post.title}</h4>
            <%--<i class="material-icons">remove_red_eye</i>--%>
            <a class="teal-text darken-2">  ${user.nickname}·${post.updateTime} · ${post.viewCount}Views</a>
            <hr>
            <p class="flow-text ">
                ${post.content}
                <br>
                Created and designed by Google, Material Design is a design language that combines the classic principles of successful design along with innovation and technology. Google's goal is to develop a system of design that allows for a unified user experience across all their products on any platform.
            </p>
        </div>
    </div>
</section>

<section class="section container" id="comment">
    <div class="row ">
        <div class="col s12 l7 offset-l2 z-depth-1">
            <h4 >${post.title}</h4>
            <c:if test="${commentList!=null}">
                <c:forEach items="${commentList}" var="comment">
                    <a>${comment.content}</a>
                </c:forEach>
            </c:if>
            <c:if test="${commentList==null}">
                <a>Nothing</a>
            </c:if>

        </div>
    </div>
</section>


<script>
    $(document).ready(function() {
        $(".sidenav").sidenav();

    })

</script>



</body>
</html>
