<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Activity - TVPSS</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.main-container {
	display: flex;
	min-height: 100vh;
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

/* Sidebar styles */
.sidebar {
	width: 300px; /* Increased width */
	background-color: white;
	padding: 20px;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.05);
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
	text-decoration: none; /* Added for links */
}

.nav-item:hover {
	padding: 10px;
	background-color: #e1bee7; /* Light purple highlight */
	color: #9c27b0; /* Purple text */
}

.nav-item.active {
	background-color: #9c27b0;
	color: white;
}

.nav-item.active:hover {
	color: white;
}

/* Main content styles */
.main-content {
	flex: 1;
	padding: 20px 40px;
	background-color: white;
}

.search-bar {
	width: 100%;
	max-width: 400px;
	padding: 8px 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 2rem;
}

/* Header styles */
.user-section {
	display: flex;
	align-items: center;
	gap: 10px;
	position: absolute;
	top: 20px;
	right: 40px;
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #ddd;
}

/* Form container styles */
.form-container {
	max-width: 600px;
	margin: 0 auto;
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.form-container label {
	display: block;
	font-size: 16px;
	margin-bottom: 5px;
	font-weight: bold;
}

.form-container input, .form-container textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

.form-container button {
	display: inline-block;
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
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<div class="sidebar">
			<a href="${pageContext.request.contextPath}/" class="logo">TVPSS</a>

			<a href="${pageContext.request.contextPath}/crew-resource"
				class="nav-item ${currentPage == 'crew-resource' ? 'active' : ''}">
				<span>👥 Crew & Resource</span>
			</a> <a href="${pageContext.request.contextPath}/video-validation"
				class="nav-item ${currentPage == 'video-validation' ? 'active' : ''}">
				<span>🎥 Video Validation</span>
			</a> <a href="${pageContext.request.contextPath}/deals"
				class="nav-item ${currentPage == 'deals' ? 'active' : ''}"> <span>💼
					Deals</span>
			</a> <a href="${pageContext.request.contextPath}/contacts"
				class="nav-item ${currentPage == 'contacts' ? 'active' : ''}"> <span>📞
					Contacts</span>
			</a> <a href="${pageContext.request.contextPath}/reports"
				class="nav-item ${currentPage == 'reports' ? 'active' : ''}"> <span>📊
					Reports</span>
			</a>
		</div>

		<!-- Main Content -->
		<div class="main-content">
			<!-- User Section -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Katie Pena (Student)</span>
			</div>

			<!-- Search Bar -->
			<input type="text" class="search-bar" placeholder="Search...">

			<h4 class="mb-4">Activity</h4>

			<div class="form-container">
				<!-- Add Image Above Form -->
				<img src="https://one-hbs.com/wp-content/uploads/2021/11/250356943_2021610551339967_5516846616685059832_n.jpg" alt="Activity Banner"
					class="img-fluid mb-3" style="width: 80%; height: auto; margin: 0 auto; display: block;">

				<form action="submitReport.jsp" method="post"
					enctype="multipart/form-data">
					<label for="title">Name (required)</label> <input type="text"
						id="title" name="title" required> <label for="number">Age
						(required)</label> <input type="number" id="age" name="age" required>

					<label for="title">School (required)</label> <input type="text"
						id="title" name="title" required>

					<button type="submit">Join</button>
				</form>
			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
