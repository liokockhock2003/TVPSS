<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar -->
<div class="sidebar">
    <a class="logo">TVPSS</a>
    
    <a href="${pageContext.request.contextPath}/dashboard" 
        class="nav-item ${currentPage == 'dashboard' ? 'active' : ''}">
        <span>💼 Dashboard</span>
    </a>
    <a href="${pageContext.request.contextPath}/video-library-teacher" 
        class="nav-item ${currentPage == 'videoLibraryTeacher' ? 'active' : ''}">
        <span>👥 Video Library</span>
    </a>
    <a href="${pageContext.request.contextPath}/school-submission" 
        class="nav-item ${currentPage == 'viewVersionCheck' ? 'active' : ''}">
        <span>🎥 School Submission</span>
    </a>
</div>