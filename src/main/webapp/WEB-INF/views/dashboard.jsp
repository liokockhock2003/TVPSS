<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS - Dashboard</title>
<link href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css" rel="stylesheet">
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

/* Main Content Styles */
.main-content {
	flex: 1;
	padding: 20px 40px; /* Adjusted padding for alignment */
	background-color: #f8f9fa;
}

.search-bar {
	width: 100%;
	max-width: 600px;
	margin: 20px 0;
	display: flex;
	align-items: center;
	gap: 10px;
}

.search-bar input {
	flex: 1;
	padding: 10px 15px;
	border: 1px solid #ccc;
	border-radius: 20px;
	background-color: #fff;
}

.search-bar i {
	color: #666;
	cursor: pointer;
}

.competition-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 20px;
	margin-top: 20px;
}

.competition-card {
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #fff;
	overflow: hidden;
	transition: transform 0.2s, box-shadow 0.2s;
}

.competition-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.competition-card img {
	width: 100%;
	height: auto;
}

.card-link {
	display: block;
	text-align: center;
	padding: 10px;
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
}

.card-link:hover {
	text-decoration: underline;
}

.footer {
	text-align: center;
	margin-top: 20px;
}

.footer .add-actvitiy {
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
}

.footer .add-actvitiy:hover {
	text-decoration: underline;
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
</style>
</head>
<body>
	<div class="main-container">
	
		<jsp:include page="/WEB-INF/views/sidebar/sidebarTeacher.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<!-- User Section -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Katie Pena (Admin)</span>
			</div>

			<div class="search-bar">
				<input type="text" placeholder="Search..."> <i
					class="fas fa-search"></i>
			</div>
			
			<h4 class="mb-4">Activity</h4>

			<div class="competition-grid">
				<div class="competition-card">
					<img
						src="https://one-hbs.com/wp-content/uploads/2021/11/250356943_2021610551339967_5516846616685059832_n.jpg"
						alt="Competition 1"> <a href="createreport" class="card-link">click
						here</a>
				</div>
				<div class="competition-card">
					<img
						src="https://i0.wp.com/one-hbs.com/wp-content/uploads/2024/03/428601140_820585236779392_58070005400799074_n.jpg?resize=1024%2C1024&ssl=1"
						alt="Competition 2"> <a href="#" class="card-link">click
						here</a>
				</div>
				<div class="competition-card">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFHU1mefl-ymb3aRMVYPcfbKngfrOiM_8UPA&s"
						alt="Competition 3"> <a href="#" class="card-link">click
						here</a>
				</div>
				<div class="competition-card">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZBrKIcrR2kF4lHlKFOoRTgbb3MRy4ZfGCJA&s"
						alt="Competition 4"> <a href="#" class="card-link">click
						here</a>
				</div>
			</div>

			<div class="footer">
				<a href="AddActivity" class="add-actvitiy">Add Activity</a>
			</div>
			<div class="footer">
				<a href="forum" class="add-actvitiy">Forum</a>
			</div>
		</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
