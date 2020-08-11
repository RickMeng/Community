<%--
  Created by IntelliJ IDEA.
  User: Isaac Newton
  Date: 30/07/2020
  Time: 06:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Item List</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css" type="text/css"  media="screen,projection">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="section container" id="register">
    <div class="row">
            <c:if test="${itemList!=null}">
                <c:forEach items="${itemList}" var="item">
                    <div class="col s12 l4 ">
                        <div class="card">
                            <div class="card-image">
                                <img src="${item.img}">
                                <span class="card-title">${item.itemName}</span>
                            </div>
                            <div class="card-content">
                                <p>$ ${item.price}</p>
                            </div>
                            <div class="card-action">
                                <p>${item.content}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${itemList==null}">
                <h1>noItemList</h1>
            </c:if>


        </div>
    </div>
</section>



<script>
    $(document).ready(function(){
        $(".sidenav").sidenav();
        $('.modal').modal();
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
