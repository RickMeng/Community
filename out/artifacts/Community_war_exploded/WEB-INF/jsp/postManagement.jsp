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
            <h4 class="teal-text text-lighten-3">Here is your posts</h4>
            <c:if test="${postList!=null}">
                <c:forEach items="${postList}" var="post">
                    <ul class="collapsible">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">content_paste</i>${post.title}</div>
                            <div class="collapsible-body"><a class=”btn“ href="${pageContext.request.contextPath}/post/delete?postId=${post.postId}">Delete</a> <div>${post.content} </div> </div>

                        </li>

                    </ul>
                    <%--<!-- Modal Trigger -->
                    <div class="collection">
                        <a href="#modal1" class="collection-item modal-trigger">${post.title}  </a>
                    </div>

                    <!-- Modal Structure -->
                    <div id="modal1" class="modal">
                        <div class="modal-content">
                            <h4>${post.title}</h4>
                            <p>${post.content}</p>
                        </div>
                        <div class="modal-footer">
                            <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
                        </div>
                    </div>--%>
                </c:forEach>
            </c:if>



            <c:if test="${postList=null}">
                <div class="collection">
                    <a class="collection-item">Nothing</a>
                </div>
            </c:if>
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
