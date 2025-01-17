<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar -->
<div class="sidebar">
    <a href="${pageContext.request.contextPath}/" class="logo">TVPSS</a>
   
   <a href="${pageContext.request.contextPath}/activities/student-dashboard"
		 class="nav-item ${currentPage == 'dashboardStudent' ? 'active' : ''}">
        <span>💼 Dashboard</span>
    </a>
    
    <a href="${pageContext.request.contextPath}/video-library-student" 
        class="nav-item ${currentPage == 'videoLibraryStudent' ? 'active' : ''}">
        <span>👥 Video Library</span>
    </a>

   <a href="${pageContext.request.contextPath}/news/student"
		 class="nav-item ${currentPage == 'newsList' ? 'active' : ''}">
        <span>👥 News</span>
    </a>
</div>