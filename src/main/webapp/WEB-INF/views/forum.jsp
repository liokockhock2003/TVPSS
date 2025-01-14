<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Forum - TVPSS</title>
<link
	href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}
/* Sidebar styles */
.sidebar {
	width: 300px;
	background-color: white;
	padding: 20px;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.05);
	position: fixed;
	height: 100%;
}

.nav-item {
	padding: 15px 16px;
	margin: 4px 0;
	border-radius: 8px;
	color: #666;
	cursor: pointer;
	display: flex;
	align-items: center;
	transition: all 0.3s ease;
	font-size: 22px;
	text-decoration: none;
}

.nav-item:hover {
	padding: 10px;
	background-color: #e1bee7;
	color: #9c27b0;
}

.nav-item.active {
	background-color: #9c27b0;
	color: white;
}

.nav-item.active:hover {
	color: white;
}

.content {
	margin-left: 320px;
	padding: 20px;
}

.content h1 {
	font-size: 28px;
	color: #333;
	margin-bottom: 20px;
}

/* Logo styles */
.logo {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 2rem;
	text-decoration: none;
	padding: 1rem;
	color: #333;
}

.logo:hover {
	color: #9c27b0; /* Optional hover effect for logo */
}

.form-container {
	margin-bottom: 30px;
}

.form-container textarea, .form-container input {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

.form-container button {
	padding: 10px 20px;
	background-color: #6aa84f;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.form-container button:hover {
	background-color: #4f8b37;
}

.forum-post {
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 15px;
	border-radius: 8px;
	margin-bottom: 10px;
}

.forum-post h3 {
	margin: 0 0 5px;
	color: #333;
}

.forum-post p {
	margin: 0 0 10px;
	color: #555;
}

.forum-post .reply {
	text-align: right;
	font-size: 14px;
	color: #007bff;
	cursor: pointer;
}

/* Header styles */
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	position: sticky;
	top: 0;
	background-color: #f9f9f9;
	z-index: 10;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.search-bar {
	width: 100%;
	max-width: 400px;
	padding: 8px 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.user-section {
	display: flex;
	align-items: center;
	gap: 10px;
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #ddd;
}
</style>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<c:choose>
			<c:when test="${role == 'TEACHER'}">
				<jsp:include page="/WEB-INF/views/sidebar/sidebarTeacher.jsp" />
			</c:when>
			<c:when test="${role == 'STUDENT'}">
				<jsp:include page="/WEB-INF/views/sidebar/sidebarStudent.jsp" />
			</c:when>
		</c:choose>
	</sec:authorize>

	<!-- Main Content -->
	<div class="content">
		<!-- Header with Search and User Section -->
		<div class="header">
			<input type="text" class="search-bar" placeholder="Search...">
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Katie Pena</span>
			</div>
		</div>

		<!-- Forum Section -->
		<h4 class="mb-4">Forum</h4>
		<div class="form-container">
			<form action="submitPost.jsp" method="post">
				<input type="text" name="title" placeholder="Title (required)"
					required>
				<textarea name="description" placeholder="Description (required)"
					rows="4" required></textarea>
				<button type="submit">Upload</button>
			</form>
		</div>
		<div class="forum-posts">
			<div class="forum-post">
				<h3>How to become a good reporter?</h3>
				<p>Hello, does anyone can give some tips on how to become a good
					reporter?</p>
				<div class="reply">Reply</div>
			</div>
			<div class="forum-post">
				<h3>Pertandingan Video Pendek 2020</h3>
				<p>Saya mengalami isu untuk upload video semasa pertandingan,
					pihak berkuasa sila ambil tindakan!!!</p>
				<div class="reply">Reply</div>
			</div>
			<div class="forum-post">
				<h3>IDK???</h3>
				<p>I don't know man</p>
				<div class="reply">Reply</div>
			</div>
		</div>
	</div>
</body>
</html>
