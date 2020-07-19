<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <nav class="nav-wrapper teal darken-2">
        <div class="container">
            <a href="${pageContext.request.contextPath}/" class="brand-logo">Community</a>
            <a href="#" class="sidenav-trigger" data-target="mobile-menu">
                <i class="material-icons">menu</i>
            </a>
            <ul class="right hide-on-med-and-down">
                <c:if test="${user == null}">
                    <li><a href="${pageContext.request.contextPath}/user/loginpage">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/registerpage">Register</a></li>
                </c:if>
                <c:if test="${user != null}">
                    <li><a href="#">Collection</a></li>
                    <%--如果seesion里key对应的value是一个类，那么可以直接这样获取类中的属性--%>
                    <li><a href="">${user.username}</a></li>
                    <li><a href="">Notification <span class="new badge white-text">4</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/user/logout">Layout</a></li>
                </c:if>
            </ul>
            <ul class="sidenav grey lighten-2" id="mobile-menu">
                <c:if test="${user == null}">
                    <li><a href="${pageContext.request.contextPath}/user/loginpage">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/registerpage">Register</a></li>
                </c:if>
                <c:if test="${user != null}">
                    <li><a href="#">Collection</a></li>
                    <li><a href="">Notification </a></li>
                    <li><a href="${pageContext.request.contextPath}/user/logout">Layout</a></li>
                </c:if>
            </ul>

        </div>
    </nav>
</header>

