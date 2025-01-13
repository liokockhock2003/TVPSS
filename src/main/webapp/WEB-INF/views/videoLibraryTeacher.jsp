<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css"
	rel="stylesheet">
<title>TVPSS - Video Management</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
		Oxygen, sans-serif;
}

body {
	background-color: #f9f9f9;
}

.container {
	display: flex;
	min-height: 100vh;
}

/* Sidebar Styles */
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

/* Main Content Styles */
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

/* Upload Button */
.upload-section {
	margin-bottom: 24px;
}

.upload-button {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 8px 16px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	color: #333;
	font-size: 14px;
	font-weight: 500;
	cursor: pointer;
}

.upload-button:hover {
	background-color: #f5f5f5;
}

/* Video Grid Styles */
.video-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
	gap: 24px;
	padding: 20px 0;
}

.category-title {
	font-size: 1.5rem;
	margin: 20px 0;
	color: #333;
}

.video-card {
	background: #fff;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s, box-shadow 0.2s;
}

.video-card:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.video-thumbnail {
	position: relative;
	padding-top: 56.25%; /* 16:9 Aspect Ratio */
	background-color: #000;
}

.video-thumbnail img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.video-duration {
	position: absolute;
	bottom: 8px;
	right: 8px;
	background: rgba(0, 0, 0, 0.8);
	color: white;
	padding: 3px 6px;
	border-radius: 4px;
	font-size: 12px;
	font-weight: 500;
}

.video-info {
	padding: 16px;
}

.video-title {
	font-weight: 500;
	margin-bottom: 8px;
	font-size: 14px;
	line-height: 1.4;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.video-meta {
	display: flex;
	align-items: center;
	color: #666;
	font-size: 13px;
	margin-bottom: 4px;
}

.video-meta img {
	width: 24px;
	height: 24px;
	border-radius: 50%;
	margin-right: 8px;
}

.video-stats {
	font-size: 12px;
	color: #666;
}

.channel-name {
	margin-bottom: 4px;
}

/* Platform Icons */
.platform-icon {
	width: 20px;
	height: 20px;
	margin-right: 8px;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/sidebar/sidebarTeacher.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<jsp:include page="/WEB-INF/views/header/headerTeacher.jsp" />

			<!-- Upload Section -->
			<div class="upload-section">
				<form action="/TVPSS-1/upload-video" method="get">
					<button type="submit" class="upload-button">
						<svg width="16" height="16" viewBox="0 0 16 16" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                <path d="M8 3v10M3 8h10" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" />
            </svg>
						Upload
					</button>
				</form>
			</div>

			<div class="video-grid" id="video-container">
				<!-- Video cards will be dynamically added here -->
			</div>	
		</div>
	</div>
	
	 <script src="${pageContext.request.contextPath}/resources/js/viewVideos.js"></script>
</body>
</html>