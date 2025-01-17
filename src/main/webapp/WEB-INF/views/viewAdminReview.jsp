<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS School Status Review</title>
<link
	href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/
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

.proof-image {
	max-width: 200px;
	max-height: 200px;
	cursor: pointer;
	border-radius: 8px;
	object-fit: cover;
}

.full-image-preview {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

.full-image-preview img {
	max-width: 90%;
	max-height: 90%;
	object-fit: contain;
}

.review-actions {
	display: flex;
	gap: 10px;
}

.criteria-table {
	width: 100%; /* Full width */
}

.criteria-table table {
	width: 100%; /* Ensure table is full width */
}

.criteria-row {
	background-color: #f8f9fa;
	margin-bottom: 15px;
	padding: 15px;
	border-radius: 8px;
}

.criteria-table td, .criteria-table th {
	vertical-align: middle; /* Vertically center content */
	padding: 15px;
}

.main-content {
	padding: 20px; /* Adjust padding to maximize screen use */
}

.review-comments {
	width: 100%;
	margin-top: 10px;
}

/* Updated styles for buttons beside each other */
.review-actions {
	display: flex;
	gap: 10px;
}

.review-actions button {
	margin: 0; /* Ensure there's no extra margin between buttons */
}

.submit-section {
	display: none; /* Hide the submit button below the table */
}

.status-pill.pending {
	background-color: #ffd700; /* Yellow for Pending */
	color: #333;
}

.status-pill.reviewed {
	background-color: #48bb78; /* Green for Reviewed */
	color: white;
}

.manage-btn {
	background-color: #9c27b0;
	color: white;
	border: none;
	padding: 6px 16px;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.tabs {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar (exactly the same as previous page) -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarAdmin.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<!-- User Section (exactly the same as previous page) -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Mr. Ahmad (Admin)</span>
			</div>

			<!-- School Details Content -->
			<div class="content">
				<div class="breadcrumb">
					<a href="school-status-review">School Status Review</a> > SK TAMAN
					BUKIT DAHLIA
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
			</div>
			
			<!-- Tabs Navigation -->
				<div class="tabs">
					<!-- Button that links to the school profile page based on school ID -->
					<a
						href="${pageContext.request.contextPath}/school-profile/${school.id}"
						class="manage-btn">TVPSS Details</a>
				</div>

			<!-- Admin Review Form -->
			<form id="adminReviewForm" method="POST"
				action="${pageContext.request.contextPath}/updateStatus">
				<div class="row">
					<!-- Criteria Table Section -->
					<div class="col-12 col-md-8">
						<div class="criteria-table">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>No.</th>
										<th>Criteria</th>
										<th>Proof</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="status" items="${tvpssStatuses}">
										<tr>
											<td>${status.criteriaNo}</td>
											<td>${status.criteriaName}</td>
											<td><img class="proof-image" src="${status.proofImage}"
												alt="Proof Image"
												onclick="previewImage('${status.proofImage}')"></td>
											<td><c:choose>
													<c:when test="${status.status eq 'PENDING'}">
														<span class="badge bg-warning">PENDING</span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-success">REVIEWED</span>
													</c:otherwise>
												</c:choose></td>
											<td>
												<!-- Action Buttons (Approve/Reject) -->
												<form method="POST"
													action="${pageContext.request.contextPath}/updateStatus"
													class="d-inline-block">
													<input type="hidden" name="id" value="${status.id}">
													<input type="hidden" name="status" value="APPROVED">
													<input type="hidden" name="schoolId" value="${school.id}">
													<input type="hidden" name="version"
														value="${school.version}"> <input type="hidden"
														id="csrf-token" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
													<button type="submit"
														class="btn btn-success btn-sm btn-block mb-2"
														${status.status ne 'PENDING' ? 'disabled' : ''}>Approve</button>
												</form>
												<form method="POST"
													action="${pageContext.request.contextPath}/updateStatus"
													class="d-inline-block">
													<input type="hidden" name="id" value="${status.id}">
													<input type="hidden" name="status" value="REJECTED">
													<input type="hidden" name="schoolId" value="${school.id}">
													<input type="hidden" name="version"
														value="${school.version}"> <input type="hidden"
														id="csrf-token" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
													<button type="submit"
														class="btn btn-danger btn-sm btn-block mb-2"
														${status.status ne 'PENDING' ? 'disabled' : ''}>Reject</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<!-- Version Selector Section -->
					<div class="col-12 col-md-4">
						<div class="card">
							<div class="card-header">
								<h5>Select Version</h5>
							</div>
							<div class="card-body">
								<div class="form-group">
									<form method="POST"
										action="${pageContext.request.contextPath}/updateVersion">
										<input type="hidden" id="csrf-token"
											name="${_csrf.parameterName}" value="${_csrf.token}" /> <input
											type="hidden" name="schoolId" value="${school.id}"> <label
											for="version">Choose the version</label> <select id="version"
											name="version" class="form-control">
											<option value="1" ${school.version == 1 ? 'selected' : ''}>Version
												1</option>
											<option value="2" ${school.version == 2 ? 'selected' : ''}>Version
												2</option>
											<option value="3" ${school.version == 3 ? 'selected' : ''}>Version
												3</option>
											<option value="4" ${school.version == 4 ? 'selected' : ''}>Version
												4</option>
										</select>
								</div>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-primary btn-block">Update
									Version</button>

							</div>
			</form>
		</div>
		<!-- Separate Instruction/Note Box -->
		<div class="col-12 mt-4">
			<div class="card">
				<div class="card-header">
					<h5>Important Note</h5>
				</div>
				<div class="card-body">
					<p class="text-muted" style="font-size: 0.875rem;">Please
						ensure that all information is accurate before proceeding with the
						update. If you encounter any issues, do not hesitate to reach out
						to the support team for assistance.</p>

					<!-- 9x5 Table inside the Note Box -->
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Criteria</th>
								<th>Version 1</th>
								<th>Version 2</th>
								<th>Version 3</th>
								<th>Version 4</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>/</td>
								<td>/</td>
								<td>/</td>
								<td>/</td>
							</tr>
							<tr>
								<td>2</td>
								<td>/</td>
								<td>/</td>
								<td>/</td>
								<td>/</td>
							</tr>
							<tr>
								<td>3</td>
								<td>/</td>
								<td>/</td>
								<td>/</td>
								<td>/</td>
							</tr>
							<tr>
								<td>4</td>
								<td></td>
								<td>/</td>
								<td>/</td>
								<td>/</td>
							</tr>
							<tr>
								<td>5</td>
								<td></td>
								<td>/</td>
								<td>/</td>
								<td>/</td>
							</tr>
							<tr>
								<td>6</td>
								<td></td>
								<td></td>
								<td>/</td>
								<td>/</td>
							</tr>
							<tr>
								<td>7</td>
								<td></td>
								<td></td>
								<td>/</td>
								<td>/</td>
							</tr>
							<tr>
								<td>8</td>
								<td></td>
								<td></td>
								<td></td>
								<td>/</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		// Function to show image in full preview
		function previewImage(imageUrl) {
			var previewModal = document.getElementById('fullImagePreview');
			var previewImage = document.getElementById('previewImage');
			previewImage.src = imageUrl;
			previewModal.style.display = 'flex';
		}
	</script>
</body>
</html>