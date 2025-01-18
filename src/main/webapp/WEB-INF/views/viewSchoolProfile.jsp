<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS School List</title>
<link
	href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css"
	rel="stylesheet">
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

/* Table styles */
.content-card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	padding: 20px;
}

.manage-btn {
	background-color: #9c27b0;
	color: white;
	border: none;
	padding: 6px 16px;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.manage-btn:hover {
	background-color: #7b1fa2;
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

.table th {
	color: #666;
	font-weight: 500;
	border-bottom: 2px solid #eee;
}

.table td {
	vertical-align: middle;
}

.school-profile-header {
	display: flex;
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.school-logo img {
	width: 150px;
	height: 150px;
	margin-right: 20px;
}

.school-info h1 {
	margin: 0 0 10px 0;
	color: #333;
}

.school-code {
	font-size: 1.2em;
	color: #666;
	margin-bottom: 5px;
}

.tabs {
	margin-bottom: 20px;
}

.tab {
	padding: 10px 20px;
	margin-right: 10px;
	border: none;
	background: #f0f0f0;
	cursor: pointer;
}

.tab.active {
	background: #6c5ce7;
	color: white;
}

.criteria-table table {
	width: 100%;
	border-collapse: collapse;
}

.criteria-table th, .criteria-table td {
	padding: 12px;
	border: 1px solid #ddd;
}

.status {
	padding: 0.5rem 1rem;
	border-radius: 6px;
	font-size: 0.875rem;
	font-weight: 500;
	display: inline-block;
	min-width: 120px; /* Set fixed minimum width */
	text-align: center; /* Center the text */
}

.status.available {
	background: #166534;
	color: #dcfce7;
}

.status.not-available {
	background: #c53030;
	color: #ffe9e9;
}

.breadcrumb {
	margin-bottom: 20px;
	color: #666;
}

.breadcrumb a {
	color: #6c5ce7;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarAdmin.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<jsp:include page="/WEB-INF/views/header/header.jsp"/>

			<!-- School Details Content -->
			<div class="content">
				<div class="breadcrumb">
					<a href="school-list">School List</a> > School Details
				</div>

				<!-- School Profile Header -->
				<div class="school-profile-header">
					<div class="school-logo">
						<img
							src="${pageContext.request.contextPath}/resources/images/tvpss-cess-logo.png"
							alt="School Logo">
					</div>
					<div class="school-info">
						<h1>${school.name}</h1>
						<p class="school-address">${school.address}</p>
					</div>
				</div>

				<!-- Tabs Navigation -->
				<div class="tabs">
					<!-- Button that links to the school profile page based on school ID -->
					<a
						href="${pageContext.request.contextPath}/school-review/${school.id}"
						class="manage-btn"> Application Status </a>
				</div>


				<!-- TVPSS Status Content -->
				<div class="tab-content">
					<div class="criteria-table">
						<table>
							<thead>
								<tr>
									<th>No.</th>
									<th>Criteria</th>
									<th>Availability</th>
								</tr>
							</thead>
							<tbody>
								<!-- Loop through tvpssStatuses and display them dynamically -->
								<c:forEach items="${tvpssStatuses}" var="status">
									<tr>
										<td>${status.criteriaNo}</td>
										<td>${status.criteriaName}</td>
										<td><span
											class="status ${status.availability ? 'available' : 'not-available'}">
												${status.availability ? 'Available' : 'Not Available'} </span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>