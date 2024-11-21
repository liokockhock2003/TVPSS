<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS - View Reports</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.main-container {
	display: flex;
	min-height: 100vh;
}

.logo {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 2rem;
	text-decoration: none;
	padding: 1rem;
	color: #333;
}

.logo:hover {
	color: #9c27b0;
}

.sidebar {
	width: 300px;
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
	text-decoration: none;
}

.nav-item:hover {
	background-color: #e1bee7;
	color: #9c27b0;
}

.nav-item.active {
	background-color: #9c27b0;
	color: white;
}

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

.content-card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	padding: 20px;
}

.manage-btn, .edit-btn, .delete-btn {
	border: none;
	padding: 6px 16px;
	border-radius: 4px;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.manage-btn {
	background-color: #9c27b0;
}

.manage-btn:hover {
	background-color: #7b1fa2;
}

.edit-btn {
	background-color: #28a745;
}

.edit-btn:hover {
	background-color: #218838;
}

.delete-btn {
	background-color: #dc3545;
}

.delete-btn:hover {
	background-color: #c82333;
}
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<div class="sidebar">
			<a href="${pageContext.request.contextPath}/" class="logo">TVPSS</a>

			<a href="${pageContext.request.contextPath}/crew-resource" class="nav-item">
				<span>👥 Crew & Resource</span>
			</a>
			<a href="${pageContext.request.contextPath}/video-validation" class="nav-item">
				<span>🎥 Video Validation</span>
			</a>
			<a href="${pageContext.request.contextPath}/deals" class="nav-item">
				<span>💼 Deals</span>
			</a>
			<a href="${pageContext.request.contextPath}/contacts" class="nav-item">
				<span>📞 Contacts</span>
			</a>
			<a href="${pageContext.request.contextPath}/reports" class="nav-item active">
				<span>📊 Reports</span>
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
			<input type="text" class="search-bar" placeholder="Search reports...">

			<h4 class="mb-4">View Reports</h4>

			<div class="content-card">
				<h6 class="mb-4">List of Reports</h6>

				<table class="table">
					<thead>
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>Date</th>
							<th>Description</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reports}" var="report" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${report.title}</td>
								<td>${report.date}</td>
								<td>${report.description}</td>
								<td>
									<button class="edit-btn" onclick="editReport(${report.id})">Edit</button>
									<button class="delete-btn" onclick="deleteReport(${report.id})">Delete</button>
								</td>
							</tr>
						</c:forEach>

						<!-- Example static row (remove when using real data) -->
						<tr>
							<td>1</td>
							<td>Annual School Report</td>
							<td>2024-11-01</td>
							<td>A summary of the year's activities and achievements.</td>
							<td>
								<button class="edit-btn">Edit</button>
								<button class="delete-btn">Delete</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
		function editReport(id) {
			// Redirect to the edit report page
			window.location.href = `${pageContext.request.contextPath}/edit-report?id=` + id;
		}

		function deleteReport(id) {
			// Confirm delete action
			if (confirm("Are you sure you want to delete this report?")) {
				window.location.href = `${pageContext.request.contextPath}/delete-report?id=` + id;
			}
		}
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
