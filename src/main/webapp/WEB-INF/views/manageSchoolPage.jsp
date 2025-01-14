<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS - Crew & Resource Management</title>
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

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {opacity: 0.2
}

to {
	opacity: 1
}

}
@
keyframes animatetop {
	from {opacity: 0.2
}

to {
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}
</style>
</head>
<body>

	<div class="main-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarAdmin.jsp" />


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

		<!-- The Modal -->
		<div id="viewResourceModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<span class="close">&times;</span>
					<h2>Modal Header</h2>
				</div>
				<div class="modal-body">
					<p>Some text in the Modal Body</p>
					<p>Some other text...</p>
				</div>
				<div class="modal-footer">
					<h3>Modal Footer</h3>
				</div>
			</div>

		</div>

		<script>
			// Get the modal
			var modal = document.getElementById("myModal");

			// Get the button that opens the modal
			var btn = document.getElementById("myBtn");

			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];

			// When the user clicks the button, open the modal 
			btn.onclick = function() {
				modal.style.display = "block";
			}

			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
		</script>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>