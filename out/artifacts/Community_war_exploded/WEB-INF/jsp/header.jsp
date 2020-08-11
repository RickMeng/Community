<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<header>

    <nav class="nav-wrapper teal darken-2">
        <div class="container">
            <a href="${pageContext.request.contextPath}/" class="brand-logo center">Community</a>
            <a href="#" class="sidenav-trigger" data-target="mobile-menu">
                <i class="material-icons">menu</i>
            </a>
            <!-- Dropdown Structure -->
            <ul id="dropdown1" name="dropdown1" class="dropdown-content">
                <li><a href="javascript:;" onclick="publish()">Post</a></li>
                <li><a href="javascript:;" onclick="addItem()">Item</a></li>
                <li class="divider"></li>
            </ul>
            <ul id="nav-mobile" class="left hide-on-med-and-down offset-l5">
                <li><a href="/index">Life</a></li>
                <li><a href="/item/list">Second-hand</a></li>
                <c:if test="${user != null}">
                    <!-- Dropdown Trigger -->
                    <li><a class="dropdown-trigger" href="" data-target="dropdown1">ADD<i class="material-icons right">arrow_drop_down</i></a></li>
                </c:if>
            </ul>
            <ul class="right hide-on-med-and-down">
                <c:if test="${user == null}">
                    <li><a href="${pageContext.request.contextPath}/user/loginpage">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/registerpage">Register</a></li>
                </c:if>
                <c:if test="${user != null}">
                    <ul id="dropdown2" name="dropdown2" class="dropdown-content">
                        <li><a href="${pageContext.request.contextPath}/collect/list">Collection</a></li>
                        <li><a href="${pageContext.request.contextPath}/post/management">Your Post</a></li>
                        <li><a href="">Your Item</a></li>
                        <li class="divider"></li>
                    </ul>
                    <li><a href="${pageContext.request.contextPath}/user/notification">Notification<span class="new badge teal ">4</span></a></li>
                    <li><a class="dropdown-trigger" href="" data-target="dropdown2">Management<i class="material-icons right">arrow_drop_down</i></a></li>
                    <%--如果seesion里key对应的value是一个类，那么可以直接这样获取类中的属性--%>
                    <li><a href="">${user.username}</a></li>
                    <%--<li><a href="">Notification <span class="new badge white-text">4</span></a></li>--%>
                    <li><a href="${pageContext.request.contextPath}/user/logout">Layout</a></li>
                </c:if>

<%--                    <shiro:guest>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/user/loginpage">Login</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/user/registerpage">Register</a></li>--%>
<%--                    </shiro:guest>--%>
<%--                    <shiro:user>--%>
<%--                        <li><shiro:principal property="username"/> </li>--%>
<%--                    </shiro:user>--%>
            </ul>
            <ul class="sidenav grey lighten-2" id="mobile-menu">
                <c:if test="${user == null}">
                    <li><a href="${pageContext.request.contextPath}/user/loginpage">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/registerpage">Register</a></li>
                </c:if>
                <c:if test="${user != null}">
                    <li><a href="${pageContext.request.contextPath}/collect/list">Collection</a></li>
                    <li><a href="">Notification </a></li>
                    <li><a href="${pageContext.request.contextPath}/user/logout">Layout</a></li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>

