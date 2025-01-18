<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS School Status Submission</title>
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

/* Professional Content Styling */
.main-content {
	background-color: #f4f6f9;
	padding: 40px;
}

.breadcrumb {
	margin-bottom: 25px;
	font-size: 0.9rem;
	color: #6c757d;
}

.breadcrumb a {
	color: #6c5ce7;
	text-decoration: none;
	transition: color 0.3s ease;
}

.breadcrumb a:hover {
	color: #4a3db3;
	text-decoration: underline;
}

.school-profile-header {
	background: white;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	padding: 25px;
	margin-bottom: 30px;
	display: flex;
	align-items: center;
}

.school-logo img {
	width: 150px;
	height: 150px;
	border-radius: 8px;
	object-fit: cover;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin-right: 25px;
}

.school-info h1 {
	color: #333;
	margin-bottom: 10px;
	font-size: 1.8rem;
}

.school-info p {
	color: #666;
	margin: 5px 0;
}

.criteria-table {
	background: white;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	overflow: hidden;
}

.criteria-table table {
	width: 100%;
	border-collapse: collapse;
}

.criteria-table th {
	background-color: #f8f9fa;
	color: #495057;
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #e9ecef;
	font-weight: 600;
}

.criteria-table td {
	padding: 15px;
	border-bottom: 1px solid #e9ecef;
	vertical-align: middle;
}

.check-column {
	text-align: center;
}

.proof-upload {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.proof-preview {
	max-width: 200px;
	max-height: 200px;
	margin-top: 10px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.submit-section {
	display: flex;
	justify-content: flex-end;
	margin-top: 25px;
}

.submit-section button {
	padding: 10px 20px;
	border-radius: 6px;
	transition: all 0.3s ease;
}

.submit-section button:hover {
	opacity: 0.9;
}

.status-pill {
	display: inline-block;
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 0.8rem;
	font-weight: 500;
	margin-left: 10px;
}

.status-pill.pending {
	background-color: #ffd700;
	color: #333;
}

.status-pill.approved {
	background-color: #48bb78;
	color: white;
}

.status-pill.rejected {
	background-color: #f56565;
	color: white;
}

/* Responsive Adjustments */
@media ( max-width : 768px) {
	.school-profile-header {
		flex-direction: column;
		text-align: center;
	}
	.school-logo {
		margin-bottom: 15px;
	}
	.school-logo img {
		margin-right: 0;
	}
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
				<span>Mr. Ahmad (Teacher)</span>
			</div>

			<!-- School Details Content -->
			<div class="content">
				<div class="breadcrumb">
					<a href="school-status">School Status</a> > SK TAMAN BUKIT DAHLIA
				</div>

				<!-- School Profile Header (same as previous version) -->
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

				<!-- TVPSS Status Form -->
				<form action="${pageContext.request.contextPath}/updateSubmission"
					method="POST" enctype="multipart/form-data">
					<div class="criteria-table">
						<table>
							<thead>
								<tr>
									<th>No.</th>
									<th>Criteria</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="criteriaStatus" items="${tvpssStatuses}">
									<tr>
										<!-- Hidden Input for id -->
										<input type="hidden" name="id${criteriaStatus.id}"
											value="${criteriaStatus.id}" />

										<td>${criteriaStatus.id}</td>
										<td>${criteriaStatus.criteriaName}</td>

										<!-- Status Info Column -->
										<td><span
											class="status-pill ${criteriaStatus.status.toLowerCase()}">
												${criteriaStatus.status} </span></td>

										<!-- Upload Image Column -->
										<td class="upload-column"><input type="file"
											name="proofImage${criteriaStatus.id}"></td>


									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<input type="hidden" id="csrf-token" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<!-- Single Submit Button -->
					<div class="submit-section">
						<button type="submit" class="btn btn-primary">Submit for
							Approval</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>