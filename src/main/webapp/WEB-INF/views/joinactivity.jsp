<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Activity - TVPSS</title>
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

/* Form container styles */
.form-container {
	max-width: 600px;
	margin: 0 auto;
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.form-container label {
	display: block;
	font-size: 16px;
	margin-bottom: 5px;
	font-weight: bold;
}

.form-container input, .form-container textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

.form-container button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #6aa84f;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.form-container button:hover {
	background-color: #4f8b37;
}
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarStudent.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<!-- User Section -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Katie Pena (Student)</span>
			</div>

			<!-- Search Bar -->
			<input type="text" class="search-bar" placeholder="Search...">

			<h4 class="mb-4">Activity</h4>

			<div class="form-container">
				<c:if test="${not empty error}">
					<div class="alert alert-danger">${error}</div>
				</c:if>

				<c:if test="${!activity.hasCapacity()}">
					<div class="alert alert-warning">This activity is currently
						full (${activity.maxParticipants}/${activity.maxParticipants}
						participants).</div>
				</c:if>

				<form
					action="${pageContext.request.contextPath}/activities/join/${activityId}"
					method="post"
					<c:if test="${!activity.hasCapacity()}">style="display: none;"</c:if>>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <label for="name">Name:</label> <input
						type="text" id="name" name="name" required> <label
						for="age">Age:</label> <input type="number" id="age" name="age"
						required> <label for="school">School:</label> <input
						type="text" id="school" name="school" required> <label
						for="icNumber">IC Number:</label> <input type="text" id="icNumber"
						name="icNumber" required>

					<button type="submit">Join Activity</button>
				</form>



			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
