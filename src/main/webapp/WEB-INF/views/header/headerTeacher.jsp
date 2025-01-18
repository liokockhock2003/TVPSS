<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/resources/css/HeaderStyles.css" rel="stylesheet">

<!-- Header -->
<div class="header-container">
    <div class="user-section">
        <c:if test="${not empty sessionScope.userId}">
            <div class="user-info">
                <span class="user-name">${sessionScope.name}</span>
                <span class="user-role">(${sessionScope.role})</span>
            </div>
        </c:if>
        <a href="${pageContext.request.contextPath}/logout" class="logout-button">Logout</a>
    </div>
</div>