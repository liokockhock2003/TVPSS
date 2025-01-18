<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS - Add Resource</title>
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

.main-content {
	flex: 1;
	padding: 20px 40px;
	background-color: white;
	margin: 5px;
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

.card {
	border: none;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 2rem;
}

.form-container {
	max-width: 600px;
	margin: 0 auto;
	padding: 2rem;
}

.form-group {
	margin-bottom: 1.5rem;
}

.form-label {
	font-weight: 500;
	color: #333;
	margin-bottom: 0.5rem;
}

.form-select, .form-control {
	border-radius: 8px;
	border: 1px solid #ddd;
	padding: 0.75rem;
}

.submit-btn {
	background-color: #9c27b0;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	font-weight: 500;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.submit-btn:hover {
	background-color: #7b1fa2;
}

.back-btn {
	color: #6c757d;
	text-decoration: none;
	margin-right: 1rem;
}

.back-btn:hover {
	color: #343a40;
}

.info-text {
	font-size: 0.875rem;
	color: #6c757d;
	margin-top: 0.25rem;
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

			<h3 class="mb-4">Add New Resource</h3>

			<div class="card">
				<div class="form-container">
					<form
						action="${pageContext.request.contextPath}/manage-school/add-resource/${schoolId}"
						method="POST">
						<div class="form-group">
							<label class="form-label">Resource Type*</label> <input
								type="text" name="type" class="form-control" required>
							<div class="info-text">E.g., Camera, Microphone, Tripod</div>
						</div>

						<div class="form-group">
							<label class="form-label">Brand</label> <input type="text"
								name="brand" class="form-control">
						</div>

						<div class="form-group">
							<label class="form-label">Model</label> <input type="text"
								name="model" class="form-control">
						</div>

						<div class="form-group">
							<label class="form-label">Status*</label> <select name="status"
								class="form-select" required>
								<option value="">Select status...</option>
								<option value="Good">Good</option>
								<option value="Require Repair">Require Repair</option>
								<option value="Not Operable">Not Operable</option>
							</select>
						</div>

						<div class="d-flex justify-content-end mt-4">
							<input type="hidden" id="csrf-token"
								name="${_csrf.parameterName}" value="${_csrf.token}" /> <a
								href="${pageContext.request.contextPath}/manage-school/resource-page/${schoolId}"
								class="back-btn">Cancel</a>
							<button type="submit" class="submit-btn">Add Resource</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>