<%--
  Created by IntelliJ IDEA.
  User: Isaac Newton
  Date: 16/07/2020
  Time: 03:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/tld/fns.tld" %>
<html>
<head>
    <title>${post.title}</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css" type="text/css"  media="screen,projection">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<%--post content--%>
<section class="section container" id="detail">
    <div class="row ">
        <div class="col s12 l7 offset-l2 z-depth-1">
            <h4 >${post.title}</h4>
            <%--<i class="material-icons">remove_red_eye</i>--%>
            <a class="teal-text darken-2">  ${userOfPost.nickname} · ${post.updateTime} · ${post.viewCount} Views</a>
            <c:if test="${user == null}">
                <a>Please log in and then Collect</a>
            </c:if>
            <c:if test="${user != null}">
                <a class="waves-effect waves-light btn-small teal darken-2" href="${pageContext.request.contextPath}/collect/save?postId=${post.postId}">Collect it</a>
            </c:if>

            <hr>
            <p class="flow-text ">
                ${post.content}
                <br>
                Created and designed by Google, Material Design is a design language that combines the classic principles of successful design along with innovation and technology. Google's goal is to develop a system of design that allows for a unified user experience across all their products on any platform.
            </p>
        </div>
    </div>
</section>

<%--add new comment--%>
<section class="section container" id="comment">
    <div class="row ">
        <div class="col s12 l7 offset-l2 z-depth-1">
            <h5>Say Something</h5>
            <c:if test="${user == null}">
                <a>Please log in and then comment.</a>
            </c:if>
            <c:if test="${user != null}">
                <form method="post" action="${pageContext.request.contextPath}/comment/save" id="commentForm" >
                    <div class="input-field">
                        <input type="hidden" name="postId" value="${post.postId}">
                        <input type="text" id="newComment" name="newComment">
                        <label for="newComment" id="ulabel">New Comment</label>
                    </div>
                    <div class="input-field center">
                        <button class="btn-small waves-effect waves-light" type="submit">
                            <i class="material-icons right">SUBMIT</i>
                        </button>
                    </div>
                </form>
            </c:if>

        </div>
    </div>
</section>

<%--comment list--%>
<section class="section container" id="comment">
    <div class="row ">
        <div class="col s12 l7 offset-l2 z-depth-1">
            <h5>Comments</h5>
            <c:if test="${commentList!=null}">
                <c:forEach items="${commentList}" var="comment">
                    <div class="left">${sys:getUser(comment.userId).nickname}</div>
                    <div class="right"><fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                    <br>
                    <p>${comment.content}</p>
                    <hr>
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
        $(".dropdown-trigger").dropdown();

    })
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
    /*function newComment() {
        //获取表单信息
        //这个formData获取到的信息是键值对的形式，key是name，name一定要和controller里对应
        //var formData =$("#loginform").serialize();

        $.post({
            url:"${pageContext.request.contextPath}/comment/save",
            //data:{'username':$('#username').val(),"password":$('#password').val()},
            data:{'postId':${post.postId},'content':$("#newComment").val()},
            type:"post",
            success:function (sign) {
                if(sign.toString()=="101"){
                    window.location.href="${pageContext.request.contextPath}/post/detail?id=${post.postId}"
                }else {
                    alert("Action failed");
                    return;
                }
            }

        })
    }*/
</script>




</body>
</html>
