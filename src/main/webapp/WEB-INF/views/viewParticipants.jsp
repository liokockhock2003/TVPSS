<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Participants - TVPSS</title>
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

.main-container {
	display: flex;
	min-height: 100vh;
}

.main-content {
	flex: 1;
	padding: 20px 40px;
	background-color: white;
}

/* Table container styles */
.table {
	margin-top: 24px;
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(10px);
	border: 1px solid rgba(255, 255, 255, 0.2);
	border-radius: 16px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08), inset 0 0 0 1px
		rgba(255, 255, 255, 0.5);
	overflow: hidden;
}

/* Table header styles */
.table th {
	background: linear-gradient(145deg, #007bff 0%, #0056b3 100%);
	color: white;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	font-size: 0.9rem;
	padding: 16px;
	border: none;
	text-align: left;
}

/* Table cell styles */
.table td {
	padding: 16px;
	border-bottom: 1px solid rgba(0, 123, 255, 0.1);
	color: #2c3e50;
	font-size: 0.95rem;
	text-align: left;
	transition: all 0.2s ease;
}

/* Row hover effect */
.table tbody tr {
	transition: all 0.3s ease;
}

.table tbody tr:hover {
	background: linear-gradient(98deg, rgba(0, 123, 255, 0.03) 0%,
		rgba(0, 123, 255, 0.06) 100%);
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
}

/* Search bar styling */
.search-bar {
	background: rgba(255, 255, 255, 0.9);
	border: 2px solid rgba(0, 123, 255, 0.2);
	border-radius: 12px;
	padding: 12px 20px;
	font-size: 0.95rem;
	transition: all 0.3s ease;
	box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
	width: 100%;
	max-width: 400px;
}

.search-bar:focus {
	outline: none;
	border-color: rgba(0, 123, 255, 0.4);
	box-shadow: 0 4px 16px rgba(0, 123, 255, 0.1);
}

/* Capacity badge styles */
.badge {
	padding: 8px 16px;
	font-size: 0.85rem;
	font-weight: 600;
	border-radius: 20px;
	letter-spacing: 0.3px;
	text-transform: uppercase;
}

.bg-success {
	background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
	box-shadow: 0 4px 12px rgba(40, 167, 69, 0.2);
}

.bg-danger {
	background: linear-gradient(135deg, #dc3545 0%, #ff4757 100%);
	box-shadow: 0 4px 12px rgba(220, 53, 69, 0.2);
}

/* Back button styles */
.back-btn {
	background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
	color: white;
	padding: 10px 24px;
	border-radius: 12px;
	font-weight: 500;
	letter-spacing: 0.5px;
	text-decoration: none;
	transition: all 0.3s ease;
	box-shadow: 0 4px 12px rgba(108, 117, 125, 0.2);
	display: inline-block;
	margin-top: 24px;
}

.back-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(108, 117, 125, 0.3);
	background: linear-gradient(135deg, #5a6268 0%, #3d4246 100%);
	color: white;
}

/* Page title styles */
h4 {
	color: #2c3e50;
	font-weight: 600;
	margin-bottom: 1.5rem;
}

h4 strong {
	color: #007bff;
}

/* Responsive styles */
@media ( max-width : 768px) {
	.table th, .table td {
		padding: 12px;
		font-size: 0.9rem;
	}
	.search-bar {
		padding: 10px 16px;
		font-size: 0.9rem;
	}
	.badge {
		padding: 6px 12px;
		font-size: 0.8rem;
	}
}

.back-btn {
	background-color: #6c757d;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	font-size: 14px;
	text-decoration: none;
	margin-bottom: 1rem;
}

.back-btn:hover {
	background-color: #5a6268;
	text-decoration: none;
	color: white;
}

.capacity-status {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 8px 16px;
	border-radius: 20px;
	font-weight: 500;
	margin-top: 10px;
}

.capacity-status.available {
	background-color: rgba(46, 204, 113, 0.1);
	color: var(--success-color);
}

.capacity-status.full {
	background-color: rgba(231, 76, 60, 0.1);
	color: var(--warning-color);
}
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarTeacher.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<!-- User Section -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Katie Pena (Admin)</span>
			</div>

			<!-- Search Bar -->
			<input id="searchInput" type="text" class="search-bar"
				placeholder="Search participants..." onkeyup="filterTable()">

			<!-- Participants Table -->
			<h4 class="mb-4">Participants List</h4>
			<h4 class="mb-4">
				<div class="d-flex align-items-center">
					<strong class="me-2" style="color: #007bff;">Capacity:</strong> <span
						class="badge bg-info text-dark me-2">
						${activity.currentParticipants}/${activity.maxParticipants} </span>
					<c:if
						test="${activity.currentParticipants < activity.maxParticipants}">
						<span class="badge bg-success"> ${activity.maxParticipants - activity.currentParticipants}
							spots remaining </span>
					</c:if>
					<c:if
						test="${activity.maxParticipants == activity.currentParticipants}">
						<span class="badge bg-danger"> Full </span>
					</c:if>
				</div>
			</h4>

			<table class="table">
				<thead>
					<tr>
						<th>Name</th>
						<th>Age</th>
						<th>School</th>
						<th>IC Number</th>
					</tr>
				</thead>
				<tbody id="participantsTable">
					<c:forEach items="${participants}" var="participant">
						<tr>
							<td>${participant.name}</td>
							<td>${participant.age}</td>
							<td>${participant.school}</td>
							<td>${participant.icNumber}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<a href="${pageContext.request.contextPath}/activities"
				class="back-btn">Back to Activities</a>
		</div>
	</div>

	<script>
		function filterTable() {
			let input = document.getElementById("searchInput");
			let filter = input.value.toLowerCase();
			let table = document.getElementById("participantsTable");
			let rows = table.getElementsByTagName("tr");

			for (let i = 0; i < rows.length; i++) {
				let nameCell = rows[i].getElementsByTagName("td")[0];
				let schoolCell = rows[i].getElementsByTagName("td")[2];
				if (nameCell || schoolCell) {
					let nameText = nameCell.textContent || nameCell.innerText;
					let schoolText = schoolCell.textContent
							|| schoolCell.innerText;
					if (nameText.toLowerCase().indexOf(filter) > -1
							|| schoolText.toLowerCase().indexOf(filter) > -1) {
						rows[i].style.display = "";
					} else {
						rows[i].style.display = "none";
					}
				}
			}
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>