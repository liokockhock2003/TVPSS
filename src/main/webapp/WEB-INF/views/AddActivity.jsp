<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Activity - TVPSS</title>
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

.file-upload {
	border: 2px dashed #ccc;
	border-radius: 8px;
	text-align: center;
	padding: 20px;
	margin-bottom: 20px;
	cursor: pointer;
	color: #666;
}

.file-upload:hover {
	border-color: #9c27b0;
	color: #9c27b0;
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

.search-bar {
	width: 100%;
	max-width: 400px;
	padding: 8px 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 2rem;
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

		<div class="main-content">
			<!-- User Section -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Katie Pena (Admin)</span>
			</div>

			<!-- Search Bar -->
			<!-- Search Bar -->
			<input type="text" class="search-bar" placeholder="Search...">

			<h4 class="mb-4">Add Activity</h4>

			<!-- Main Content -->
			<div class="form-container">
				<form action="submitActivity.jsp" method="post"
					enctype="multipart/form-data">
					<!-- Upload Image Section -->
					<label for="file-upload" class="file-upload" id="file-upload-label">
						<input id="file-upload" type="file" name="image"
						style="display: none;" accept="image/*">
						<p>Upload Image</p>
						<p style="font-size: small;">Select File</p>
					</label>

					<!-- Activity Details Section -->
					<h5>Details</h5>

					<label for="title">Title (required)</label> <input type="text"
						id="title" name="title" required> <label for="date">Date
						(required)</label> <input type="date" id="date" name="date" required>

					<label for="description">Description (required)</label>
					<textarea id="description" name="description" rows="4" required></textarea>

					<!-- Save Button -->
					<button type="submit">Save</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		// Add event listener to file upload label for better interaction
		document.getElementById("file-upload-label").addEventListener("click", () => {
			document.getElementById("file-upload").click();
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
