<%--
  Created by IntelliJ IDEA.
  User: Isaac Newton
  Date: 16/07/2020
  Time: 03:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sys" uri="/WEB-INF/tld/fns.tld" %>
<html>
<head>
    <title>Post Management</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css" type="text/css"  media="screen,projection">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.js"></script>
    <script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>


</head>
<body>
<jsp:include page="header.jsp"/>


<section class="section container" id="postForm">
    <div class="row">
        <div class="col s12 l4 offset-l3">
            <div class="collection">
                <c:if test="${commentList != null}">
                    <c:forEach items="${commentList}" var="comment">

                        <a href="#!" class="collection-item">${sys:getUser(comment.userId).nickname} SAY ${comment.content} IN ${sys:getPost(comment.postId).title}</a>
                    </c:forEach>
                </c:if>
            </div>


        </div>
    </div>
</section>

<script>
    $(document).ready(function(){
        $(".sidenav").sidenav();
        $('select').formSelect();
        $(".dropdown-trigger").dropdown();
        $('.collapsible').collapsible();
        $('.modal').modal();
    });
</script>

</body>
</html>
