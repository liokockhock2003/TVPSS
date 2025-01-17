<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar -->
<div class="sidebar">
    <a class="logo">TVPSS</a>
    
    <a href="${pageContext.request.contextPath}/crew-resource" 
        class="nav-item ${currentPage == 'crewResourcePage' ? 'active' : ''}">
        <span>💼 Crew & Resources</span>
    </a>
    <a href="${pageContext.request.contextPath}/validate-video" 
        class="nav-item ${currentPage == 'validateVideo' ? 'active' : ''}">
        <span>👥 Video Validation</span>
    </a>
    <a href="${pageContext.request.contextPath}/school-list" 
        class="nav-item ${currentPage == 'viewSchoolList' ? 'active' : ''}">
        <span>🎥 School List</span>
    </a>
</div>