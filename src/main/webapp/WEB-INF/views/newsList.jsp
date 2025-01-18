<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">

<meta charset="UTF-8">
<title>TVPSS - News</title>
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

.main-content {
	flex: 1;
	padding: 20px 40px;
	background-color: white;
}

/* Content card with glass effect */
.content-card {
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(10px);
	border-radius: 20px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08), inset 0 0 0 1px
		rgba(255, 255, 255, 0.5);
	padding: 30px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	position: relative;
	overflow: hidden;
}

/* Gradient border effect */
.content-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 2px;
	background: linear-gradient(90deg, rgba(40, 167, 69, 0),
		rgba(40, 167, 69, 0.5), rgba(40, 167, 69, 0));
}

/* Table styles */
.table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0;
	margin-top: 1rem;
}

/* Modern header */
.table thead th {
	background: linear-gradient(145deg, rgba(37, 38, 43, 0.95) 0%,
		rgba(37, 38, 43, 0.85) 100%);
	color: #fff;
	font-weight: 500;
	text-transform: uppercase;
	letter-spacing: 1px;
	padding: 20px;
	font-size: 0.85rem;
	border: none;
	transition: all 0.3s ease;
}

.table thead th:first-child {
	border-top-left-radius: 15px;
}

.table thead th:last-child {
	border-top-right-radius: 15px;
}

/* Table body */
.table tbody td {
	padding: 18px 20px;
	border-bottom: 1px solid rgba(231, 234, 238, 0.7);
	color: #2c3e50;
	font-size: 0.95rem;
	transition: all 0.3s ease;
}

/* Row hover effect */
.table tbody tr {
	transition: all 0.3s ease;
	position: relative;
}

.table tbody tr:hover {
	background: linear-gradient(98deg, rgba(40, 167, 69, 0.03) 0%,
		rgba(40, 167, 69, 0.06) 100%);
	transform: translateY(-2px);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
}

/* Modern view button */
.view-btn {
	background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
	color: white;
	padding: 8px 20px;
	border-radius: 12px;
	font-weight: 500;
	transition: all 0.3s ease;
	text-decoration: none;
	border: none;
	position: relative;
	overflow: hidden;
	box-shadow: 0 4px 15px rgba(40, 167, 69, 0.2);
}

.view-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(40, 167, 69, 0.3);
	color: white;
}

.search-bar {
	width: 100%;
	max-width: 400px;
	padding: 8px 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 2rem;
}

.search-bar {
	width: 100%;
	max-width: 400px;
	padding: 8px 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 2rem;
}

/* Alert styles */
.alert {
	background: rgba(255, 255, 255, 0.9);
	border-radius: 12px;
	padding: 16px 20px;
	border: none;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.alert-info {
	background: linear-gradient(135deg, rgba(13, 202, 240, 0.1) 0%,
		rgba(13, 202, 240, 0.05) 100%);
	border-left: 4px solid #0dcaf0;
	color: #055160;
}

/* Page title */
h4 {
	color: #2c3e50;
	font-weight: 600;
	margin-bottom: 1.5rem;
	font-size: 1.5rem;
	letter-spacing: 0.5px;
}

/* Responsive styles */
@media ( max-width : 768px) {
	.content-card {
		padding: 20px;
	}
	.table thead th, .table tbody td {
		padding: 15px 10px;
		font-size: 0.9rem;
	}
	.view-btn {
		padding: 6px 12px;
		font-size: 0.8rem;
	}
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

/* Modern delete button */
.delete-btn {
	background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
	color: white;
	padding: 8px 20px;
	border-radius: 12px;
	font-weight: 500;
	transition: all 0.3s ease;
	text-decoration: none;
	border: none;
	position: relative;
	overflow: hidden;
	box-shadow: 0 4px 15px rgba(231, 76, 60, 0.2);
}

.delete-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(231, 76, 60, 0.3);
	color: white;
}

/* Add News Button */
.add-news-btn {
	background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
	color: white;
	padding: 12px 16px;
	border-radius: 50%;
	font-size: 1.5rem;
	font-weight: bold;
	text-decoration: none;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 4px 15px rgba(40, 167, 69, 0.2);
	transition: all 0.3s ease;
	border: none;
	width: 50px;
	height: 50px;
}

.add-news-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(40, 167, 69, 0.3);
	color: white;
}
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarTeacher.jsp" />

		<div class="main-content">
			<!-- User Section -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Katie Pena (Admin)</span>
			</div>

			<!-- Search Bar -->
			<input type="text" class="search-bar" placeholder="Search...">

			<div class="d-flex justify-content-between align-items-center mb-4">
				<h4>News List</h4>
				<a href="${pageContext.request.contextPath}/news/add"
					class="add-news-btn"> <i class="fas fa-plus"></i>
				</a>

			</div>

			<div class="content-card">
				<c:if test="${empty newsList}">
					<div class="alert alert-info">No news available.</div>
				</c:if>

				<c:if test="${not empty newsList}">
					<table class="table" id="newsTable">
						<thead>
							<tr>
								<th>No.</th>
								<th>Title</th>
								<th>Author</th>
								<th>Date Published</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${newsList}" var="news" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${news.title}</td>
									<td>${news.author}</td>
									<td>${news.datePublished}</td>
									<td><a
										href="${pageContext.request.contextPath}/news/${news.id}"
										class="view-btn btn-sm">View</a>
										<form
											action="${pageContext.request.contextPath}/news/delete/${news.id}"
											method="post" style="display: inline;">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}">
											<button type="submit" class="delete-btn btn-sm"
												onclick="return confirm('Are you sure?')">Delete</button>
										</form></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</div>
	</div>

	<script>
		function filterTable() {
			let input = document.getElementById("searchInput");
			let filter = input.value.toLowerCase();
			let table = document.getElementById("newsTable");
			let rows = table.getElementsByTagName("tr");

			for (let i = 1; i < rows.length; i++) {
				let titleCell = rows[i].getElementsByTagName("td")[1];
				if (titleCell) {
					let titleText = titleCell.textContent
							|| titleCell.innerText;
					if (titleText.toLowerCase().indexOf(filter) > -1) {
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
