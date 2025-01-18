<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TVPSS - Video Management</title>
<link
	href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
		Oxygen, sans-serif;
}

body {
	display: flex;
	min-height: 100vh;
	background-color: #f5f5f5;
}

.container {
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

/* Sidebar styles */
.sidebar {
	width: 300px; /* Increased width */
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
	text-decoration: none; /* Added for links */
}

.nav-item:hover {
	padding: 10px;
	background-color: #e1bee7; /* Light purple highlight */
	color: #9c27b0; /* Purple text */
}

.nav-item.active {
	background-color: #9c27b0;
	color: white;
}

.nav-item.active:hover {
	color: white;
}

.main-content {
	flex: 1;
	padding: 20px;
}

/* Header Styles */
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
	padding: 10px;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.search-bar {
	flex: 1;
	max-width: 600px;
	margin: 0 20px;
	position: relative;
}

.search-bar input {
	width: 100%;
	padding: 12px 40px 12px 16px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
}

.search-bar::after {
	content: "🔍";
	position: absolute;
	right: 12px;
	top: 50%;
	transform: translateY(-50%);
}

.user-profile {
	display: flex;
	align-items: center;
	gap: 12px;
}

.user-profile img {
	width: 36px;
	height: 36px;
	border-radius: 50%;
}

/* Video Grid Layout */
.video-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 24px;
	padding: 24px;
	max-width: 1920px;
	margin: 0 auto;
}

/* Video Card Styling */
.video-card {
	text-decoration: none;
	color: inherit;
	display: flex;
	flex-direction: column;
	transition: transform 0.2s ease;
}

.video-card:hover {
	transform: translateY(-2px);
}

/* Thumbnail Container */
.video-thumbnail {
	position: relative;
	width: 100%;
	aspect-ratio: 16/9;
	border-radius: 12px;
	overflow: hidden;
	background-color: #f0f0f0;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.video-thumbnail img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.video-card:hover .video-thumbnail img {
	transform: scale(1.05);
}

/* Duration Badge */
.video-duration {
	position: absolute;
	bottom: 8px;
	right: 8px;
	background-color: rgba(0, 0, 0, 0.8);
	color: white;
	padding: 3px 6px;
	border-radius: 4px;
	font-size: 12px;
	font-weight: 500;
}

/* Video Info Section */
.video-info {
	padding: 12px 4px;
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.video-title {
	font-size: 16px;
	font-weight: 600;
	margin: 0;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
	color: #0f172a;
}

/* Meta Information */
.video-meta {
	display: flex;
	align-items: center;
	gap: 8px;
}

.video-meta img {
	width: 24px;
	height: 24px;
	border-radius: 50%;
	object-fit: cover;
}

.video-meta span {
	font-size: 14px;
	color: #64748b;
}

/* Video Statistics */
.video-stats {
	font-size: 14px;
	color: #64748b;
}

/* Responsive Adjustments */
@media ( max-width : 768px) {
	.video-grid {
		grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
		gap: 16px;
		padding: 16px;
	}
	.video-title {
		font-size: 14px;
	}
	.video-meta span, .video-stats {
		font-size: 12px;
	}
}

/* Loading Placeholder Animation */
@
keyframes shimmer { 0% {
	background-position: -1000px 0;
}

100


%
{
background-position


:


1000px


0
;


}
}
.video-card.loading .video-thumbnail, .video-card.loading .video-title,
	.video-card.loading .video-meta img, .video-card.loading .video-stats {
	background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
	background-size: 1000px 100%;
	animation: shimmer 2s infinite linear;
}
</style>
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarStudent.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<jsp:include page="/WEB-INF/views/header/header.jsp"/>
			
			<!-- CSRF Token -->
			<input type="hidden" id="csrf-token" name="${_csrf.parameterName}" value="${_csrf.token}" />		

			<div class="video-grid" id="video-container">
				<!-- Video cards will be dynamically added here -->
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/viewVideos.js"></script>
</body>
</html>