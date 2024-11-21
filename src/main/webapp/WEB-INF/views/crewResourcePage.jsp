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

/* Table styles */
.content-card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	padding: 20px;
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

			<h3 class="mb-4">Crew & Resource Management</h3>

			<div class="content-card">
				<h5 class="mb-4">List of School</h5>

				<table class="table table-hover table-striped align-middle">
					<thead class="table-light">
						<tr>
							<th class="text-center">No.</th>
							<th>School Name</th>
							<th>Total Crew</th>
							<th>Total Resources</th>
							<th>Available Resources</th>
							<th class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${schools}" var="school" varStatus="status">
							<tr>
								<td class="text-center">${status.count}</td>
								<td>${school.name}</td>
								<td>${school.totalCrew}</td>
								<td>${school.totalResources}</td>
								<td>${school.availableResources}</td>
								<td class="text-center">
									<button class="manage-btn">Manage</button>
								</td>
							</tr>
						</c:forEach>

						<!-- Sample data (remove when using real data) -->
						<tr>
							<td class="text-center">1.</td>
							<td>Sekolah Kebangsaan Taman Bukit Dahlia</td>
							<td>2</td>
							<td>5</td>
							<td>2</td>
							<td class="text-center"><a
								href="${pageContext.request.contextPath}/manage-school?id=1"
								class="manage-btn">Manage</a></td>
							</td>
						</tr>
						<tr>
							<td class="text-center">2.</td>
							<td>Sekolah Kebangsaan Taman Cendana</td>
							<td>7</td>
							<td>6</td>
							<td>0</td>
							<td class="text-center">
								<button class="manage-btn">Manage</button>
							</td>
						</tr>
						<tr>
							<td class="text-center">3.</td>
							<td>Sekolah Kebangsaan Taman Mawar</td>
							<td>12</td>
							<td>9</td>
							<td>2</td>
							<td class="text-center">
								<button class="manage-btn">Manage</button>
							</td>
						</tr>
						<tr>
							<td class="text-center">4.</td>
							<td>Sekolah Kebangsaan Taman Mesra</td>
							<td>19</td>
							<td>9</td>
							<td>1</td>
							<td class="text-center">
								<button class="manage-btn">Manage</button>
							</td>
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