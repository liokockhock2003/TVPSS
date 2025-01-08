<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS School Status Review</title>
<link href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css" rel="stylesheet">
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

				<!-- School Profile Header (same as previous version) -->
				<div class="school-profile-header">
					<div class="school-logo">
						<img
							src="${pageContext.request.contextPath}/resources/images/tvpss-cess-logo.png"
							alt="School Logo">
					</div>
					<div class="school-info">
						<h1>SK TAMAN BUKIT DAHLIA</h1>
						<p class="school-code">JB 3003</p>
						<p class="school-address">Persiaran Dahlia 1</p>
						<p class="school-location">81700 Pasir Gudang</p>
						<p class="school-state">Johor</p>
					</div>
				</div>

				<!-- Admin Review Form -->
				<form id="adminReviewForm">
					<div class="criteria-table">
						<table>
							<thead>
								<tr>
									<th>No.</th>
									<th>Criteria</th>
									<th>Proof</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<!-- Criteria 1: Name (Brand) -->
								<tr class="criteria-row">
									<td>1</td>
									<td>There is a Name (Brand)</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="1">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="1">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>

								<!-- Criteria 2: Logo -->
								<tr class="criteria-row">
									<td>2</td>
									<td>Logo</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="2">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="2">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>

								<!-- Repeat for other criteria (3-8) -->
								<tr class="criteria-row">
									<td>3</td>
									<td>Corner / Mini Studio / TV Studio</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="3">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="3">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>

								<!-- Criteria 3: Corner / Mini Studio / TV Studio -->
								<tr class="criteria-row">
									<td>3</td>
									<td>Corner / Mini Studio / TV Studio</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="3">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="3">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>

								<!-- Criteria 4: In-School Recording -->
								<tr class="criteria-row">
									<td>4</td>
									<td>In-School Recording</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="4">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="4">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>

								<!-- Criteria 5: Upload on Youtube -->
								<tr class="criteria-row">
									<td>5</td>
									<td>Upload on Youtube</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="5">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="5">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>

								<!-- Criteria 6: Recording inside and outside the school -->
								<tr class="criteria-row">
									<td>6</td>
									<td>Recording inside and outside the school</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="6">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="6">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>

								<!-- Criteria 7: Collaborate with external agencies -->
								<tr class="criteria-row">
									<td>7</td>
									<td>Collaborate with external agencies</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="7">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="7">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>

								<!-- Criteria 8: Using 'Green Screen' Technology -->
								<tr class="criteria-row">
									<td>8</td>
									<td>Using 'Green Screen' Technology</td>
									<td><img class="proof-image"
										src="${pageContext.request.contextPath}/resources/proof-placeholder.jpg"
										alt="Proof Image"></td>
									<td>
										<div class="review-actions">
											<button type="button" class="btn btn-success btn-approve"
												data-criteria="8">Approve</button>
											<button type="button" class="btn btn-danger btn-reject"
												data-criteria="8">Reject</button>
										</div> <textarea class="form-control review-comments" rows="3"
											placeholder="Comments (optional)"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="submit-section">
						<button type="submit" class="btn btn-primary">Submit
							Final Review</button>
					</div>
				</form>
			</div>
		</div>

		<!-- Full Image Preview Modal -->
		<div class="full-image-preview">
			<img src="" alt="Full Image Preview">
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>