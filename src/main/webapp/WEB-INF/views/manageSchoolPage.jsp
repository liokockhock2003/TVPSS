<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS - Crew & Resource Management</title>
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

.main-content {
	margin: 5px;
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
	background-color: #e1bee7; /* Light purple highlight */
	color: #9c27b0; /* Purple text */
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

.profile-header {
	display: flex;
	align-items: center;
	gap: 20px;
	background: white;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.profile-header img {
	width: 120px;
	height: 120px;
	border-radius: 8px;
}

.profile-header h4 {
	margin-bottom: 0;
}

.card {
	border: none;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.nav-tabs {
	border-bottom: 2px solid #e0e0e0; /* Thin separator under the tabs */
}

.nav-tabs .nav-item {
	margin-bottom: -1px;
	/* Prevents spacing between active tabs and content */
}

.nav-tabs .nav-link {
	border: 1px solid transparent; /* Clean border styling */
	border-radius: 8px; /* Rounded tabs for modern appearance */
	padding: 8px 16px; /* Adjust padding for a more balanced size */
	font-size: 0.95rem; /* Slightly larger text for readability */
	font-weight: 500; /* Medium font weight for a professional look */
	text-transform: capitalize; /* Ensure consistent casing */
	color: #6c757d; /* Neutral gray text */
	transition: all 0.3s ease; /* Smooth hover effect */
}

.nav-tabs .nav-link:hover {
	background-color: #f8f9fa; /* Light gray hover effect */
	color: #333; /* Darker text color on hover */
	border-color: #ddd; /* Subtle border on hover */
	text-decoration: none; /* Prevent underline */
}

.nav-tabs .nav-link.active {
	background-color: #9c27b0; /* Purple background for the active tab */
	color: white; /* White text for active tab */
	border-color: #9c27b0; /* Match border color with the active tab */
	font-weight: bold; /* Emphasize the active tab */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
	/* Slight shadow for the active tab */
}

.status-check {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.status-check span {
	font-weight: bold;
}

.status-check .badge {
	font-size: 0.9rem;
	padding: 5px 10px;
	border-radius: 20px;
}

.badge-success {
	background-color: #28a745;
	color: white;
}

.badge-danger {
	background-color: #dc3545;
	color: white;
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

/* Table styles */
.table {
	border-radius: 8px; /* Rounded corners for the table */
	overflow: hidden;
	border-collapse: separate; /* Prevent border from being clipped */
	margin-top: 20px;
}

.table th {
	color: #123;
	font-weight: bold;
	text-transform: uppercase;
	font-size: 0.9rem;
}

.table-hover tbody tr:hover {
	background-color: #f5f5f5; /* Light hover effect */
}

.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f9f9f9; /* Alternating row colors */
}

.table td {
	vertical-align: middle;
	font-size: 0.95rem;
}

.table .manage-btn {
	padding: 8px 12px;
	font-size: 0.85rem;
}

.manage-btn {
	display: inline-block; /* Ensures it behaves like a button */
	background-color: #9c27b0; /* Purple background */
	color: white; /* White text */
	text-align: center; /* Center text */
	text-decoration: none; /* Remove underline */
	border: none; /* No border */
	padding: 6px 16px; /* Adjust padding */
	border-radius: 4px; /* Rounded corners */
	transition: background-color 0.3s ease; /* Smooth hover effect */
	font-size: 0.85rem; /* Adjust font size */
}

.manage-btn:hover {
	color: #ffffff;
	background-color: #7b1fa2; /* Darker purple on hover */
	text-decoration: none; /* Ensure no underline appears on hover */
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
				<span>Katie Pena (Admin)</span>
			</div>

			<!-- Search Bar -->
			<input type="text" class="search-bar" placeholder="Search...">

			<h3 class="mb-4">Manage School</h3>

			<div class="profile-header mb-4">
				<img src="https://via.placeholder.com/120" alt="School Logo">
				<div>
					<h4>SK TAMAN BUKIT DAHLIA</h4>
					<p class="mb-0">
						JB 3003<br>Jalan Permas Dalam<br>Johor Bahru
					</p>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active"
							href="manage-school">List of Crew</a></li>
						<li class="nav-item"><a class="nav-link" href="resource-page"">List
								of Resource</a></li>
					</ul>
				</div>
				<div class="card-body">
					<table class="table table-hover table-striped align-middle">
						<thead class="table-light">
							<tr>
								<th class="text-center">No.</th>
								<th>Name</th>
								<th>Role</th>
								<th class="text-center">Allocated Resources</th>
								<th class="text-center">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${crewList}" var="crew" varStatus="status">
								<tr>
									<td class="text-center">${status.count}</td>
									<td>${crew.name}</td>
									<td>${crew.role}</td>
									<td class="text-center">${crew.allocatedResources}</td>
									<td class="text-center"><a
										href="${pageContext.request.contextPath}/view-resource?id=${crew.id}"
										class="manage-btn">View Resource</a> <a
										href="${pageContext.request.contextPath}/add-resource?id=${crew.id}"
										class="manage-btn">Add Resource</a></td>
								</tr>
							</c:forEach>

							<!-- Sample static rows (remove when using real data) -->
							<tr>
								<td class="text-center">1.</td>
								<td>Daniel Syafiq</td>
								<td>Cameraman</td>
								<td class="text-center">1</td>
								<td class="text-center"><a href="#" class="manage-btn">View
										Resource</a> <a href="#" class="manage-btn">Add Resource</a></td>
							</tr>
							<tr>
								<td class="text-center">2.</td>
								<td>Daniel Hakim</td>
								<td>Cameraman</td>
								<td class="text-center">2</td>
								<td class="text-center"><a href="#" class="manage-btn">View
										Resource</a> <a href="#" class="manage-btn">Add Resource</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>