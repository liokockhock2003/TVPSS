<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard - TVPSS</title>
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

/* Modern futuristic table container */
.table-container {
  max-width: 1200px;
  margin: 0 auto;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  border-radius: 16px;
  box-shadow: 
    0 4px 24px -1px rgba(0, 0, 0, 0.1),
    0 0 1px 0 rgba(0, 0, 0, 0.05),
    inset 0 0 0 1px rgba(255, 255, 255, 0.2);
  padding: 25px;
  margin-top: 20px;
  border: 1px solid rgba(255, 255, 255, 0.18);
}

/* Modern table styles */
.table-container table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin: 1rem 0;
}

/* Futuristic header */
.table-container th {
  background: linear-gradient(
    135deg,
    rgba(37, 38, 43, 0.95) 0%,
    rgba(37, 38, 43, 0.85) 100%
  );
  color: #ffffff;
  font-weight: 600;
  text-transform: uppercase;
  font-size: 0.875rem;
  letter-spacing: 1px;
  padding: 20px 16px;
  position: relative;
}

.table-container th:first-child {
  border-top-left-radius: 12px;
}

.table-container th:last-child {
  border-top-right-radius: 12px;
}

/* Modern cell styles */
.table-container td {
  padding: 16px;
  vertical-align: middle;
  border-bottom: 1px solid rgba(231, 234, 238, 0.7);
  color: #2c3e50;
  font-size: 0.95rem;
  transition: all 0.3s ease;
}

/* Futuristic row hover effect */
.table-container tbody tr {
  transition: all 0.3s ease;
  position: relative;
}

.table-container tbody tr:hover {
  background: linear-gradient(
    98deg,
    rgba(244, 245, 247, 0.5) 0%,
    rgba(255, 255, 255, 0.8) 100%
  );
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

/* Modern badge styles */
.badge {
  padding: 0.5em 1em;
  font-size: 0.75rem;
  font-weight: 600;
  border-radius: 20px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  background: linear-gradient(135deg, #ff4757 0%, #ff6b81 100%);
  border: none;
  box-shadow: 0 2px 4px rgba(255, 71, 87, 0.3);
}

/* Futuristic button styles */
.btn {
  padding: 8px 20px;
  border-radius: 8px;
  font-weight: 500;
  transition: all 0.3s ease;
  margin: 0 4px;
  border: none;
  position: relative;
  overflow: hidden;
  font-size: 0.9rem;
}

.btn::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(
    90deg,
    rgba(255, 255, 255, 0) 0%,
    rgba(255, 255, 255, 0.1) 50%,
    rgba(255, 255, 255, 0) 100%
  );
  transform: translateX(-100%);
  transition: transform 0.6s ease;
}

.btn:hover::after {
  transform: translateX(100%);
}

.btn-primary {
  background: linear-gradient(135deg, #0d6efd 0%, #4e95ff 100%);
  box-shadow: 0 4px 12px rgba(13, 110, 253, 0.2);
}

.btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(13, 110, 253, 0.3);
}

.btn-success {
  background: linear-gradient(135deg, #198754 0%, #28a745 100%);
  box-shadow: 0 4px 12px rgba(25, 135, 84, 0.2);
}

.btn-success:hover {
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarStudent.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<jsp:include page="/WEB-INF/views/header/header.jsp"/>

			<div class="table-container">
				<h4 class="mb-4">Student Dashboard</h4>

				<!-- Display error message if present -->
				<c:if test="${not empty error}">
					<div class="alert alert-danger">${error}</div>
				</c:if>

				<!-- Display info if no activities are available -->
				<c:if test="${empty activities}">
					<div class="alert alert-info">No activities are currently
						available.</div>
				</c:if>

				<!-- Display activities if available -->
				<c:if test="${not empty activities}">
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>Title</th>
								<th>Date</th>
								<th>Capacity</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${activities}" var="activity"
								varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${activity.title}</td>
									<td>${activity.date}</td>
									<td>
										${activity.currentParticipants}/${activity.maxParticipants}
										<c:if test="${activity.currentParticipants >= activity.maxParticipants}">
											<span class="badge bg-danger">Full</span>
										</c:if>
									</td>
									<td>
										<form
											action="${pageContext.request.contextPath}/activities/${activity.id}/student-view"
											method="get" style="display: inline;">
											<button type="submit" class="btn btn-primary">View</button>
										</form>
										<c:if test="${activity.currentParticipants < activity.maxParticipants}">
											<form
												action="${pageContext.request.contextPath}/activities/join/${activity.id}"
												method="get" style="display: inline;">
												<button type="submit" class="btn btn-success">Join</button>
											</form>
										</c:if>
										<c:if test="${activity.currentParticipants >= activity.maxParticipants}">
											<button class="btn btn-secondary" disabled>Full</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
