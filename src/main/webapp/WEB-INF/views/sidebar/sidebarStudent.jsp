<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar -->
<div class="sidebar">
    <a class="logo">TVPSS</a>
   
   
    <a href="${pageContext.request.contextPath}/video-library-student" 
        class="nav-item ${currentPage == 'videoLibraryStudent' ? 'active' : ''}">
        <span>👥 Video Library</span>
    </a>

</div>