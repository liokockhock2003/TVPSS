<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TVPSS - Video Player</title>
<link
	href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
		Oxygen, Ubuntu, Cantarell, sans-serif;
}

body {
	display: flex;
	min-height: 100vh;
	background-color: #f5f5f5;
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

/* Main Content Styles */
.main-content {
	flex: 1;
	padding: 20px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: white;
	margin-bottom: 20px;
}

.search-bar {
	flex: 1;
	max-width: 600px;
	margin-right: 20px;
}

.search-bar input {
	width: 100%;
	padding: 8px 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.user-info {
	display: flex;
	align-items: center;
	gap: 15px;
}

.user-avatar {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	background-color: #ddd;
}

/* Video Player Styles */
.video-container {
	position: relative;
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	aspect-ratio: 16/9; /* Modern way to handle aspect ratio */
}

.video-container video {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Custom styling for video controls */
video::-webkit-media-controls {
	background-color: rgba(0, 0, 0, 0.5);
}

/* Improve video display on mobile devices */
@media ( max-width : 768px) {
	.video-container {
		aspect-ratio: 4/3;
	}
}

.control-btn {
	background: none;
	border: none;
	color: white;
	cursor: pointer;
	padding: 5px;
}

.progress-bar {
	flex: 1;
	height: 4px;
	background-color: rgba(255, 255, 255, 0.3);
	border-radius: 2px;
	cursor: pointer;
}

/* Video Info Styles */
.video-info {
	max-width: 1200px;
	margin: 20px auto;
	background-color: white;
	padding: 20px;
	border-radius: 12px;
}

.video-title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 15px;
}

.video-stats {
	display: flex;
	align-items: center;
	gap: 20px;
	margin-bottom: 20px;
	color: #666;
}

.action-buttons {
	display: flex;
	gap: 15px;
}

.action-btn {
	display: flex;
	align-items: center;
	gap: 5px;
	padding: 8px 16px;
	border: none;
	border-radius: 20px;
	background-color: #f0f0f0;
	cursor: pointer;
}

/* Channel Info Styles */
.channel-info {
	display: flex;
	align-items: center;
	gap: 15px;
	margin: 20px 0;
	padding-bottom: 20px;
	border-bottom: 1px solid #eee;
}

.channel-avatar {
	width: 48px;
	height: 48px;
	border-radius: 50%;
	background-color: #ddd;
}

.channel-details {
	flex: 1;
}

.channel-name {
	font-weight: bold;
	margin-bottom: 5px;
}

.subscriber-count {
	color: #666;
	font-size: 14px;
}

/* Wrapper for entire comments section */
.comments-section {
	display: flex;
	flex-direction: column;
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 16px; /* Added padding for smaller screens */
}

/* Container for comments */
#comments-container {
	padding: 16px;
	background-color: #ffffff;
	border: 1px solid #e1e4e8;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	overflow-y: auto;
	max-height: 600px;
	min-height: 120px;
	scrollbar-width: thin;
}

#comments-container::-webkit-scrollbar {
	width: 6px;
}

#comments-container::-webkit-scrollbar-thumb {
	background-color: #d1d5db;
	border-radius: 3px;
}

/* Comment styling */
.comment {
	display: flex;
	align-items: flex-start;
	gap: 10px; padding : 16px 0;
	border-bottom: 1px solid #e1e4e8;
	transition: background-color 0.2s ease;
	padding: 16px 0
}

.comment:hover {
	background-color: #f8fafc;
}

.comment:last-child {
	border-bottom: none;
}

/* Comment content */
.comment-content {
	flex-grow: 1;
}

.comment-author {
	font-weight: 600;
	font-size: 15px;
	color: #1a1a1a;
	margin-bottom: 6px;
}

.comment-text {
	font-size: 14px;
	line-height: 1.5;
	color: #4a5568;
	word-wrap: break-word;
	word-break: break-word;
}

/* Comment input section */
.comment-input {
	display: flex;
	align-items: center;
	gap: 10px; padding : 16px; background-color : #ffffff;
	border: 1px solid #e1e4e8;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	background-color: #ffffff;
	padding: 16px;
}

.comments-header {
	padding-bottom: 16px;
	border-bottom: 1px solid #e1e4e8;
	margin-bottom: 16px;
}

#comments-count {
	font-size: 20px;
	font-weight: 700;
	color: #1a1a1a;
}

/* Input field */
#comment-text {
	flex-grow: 1;
	padding: 12px 16px;
	font-size: 14px;
	line-height: 1.5;
	border: 1px solid #e1e4e8;
	border-radius: 6px;
	margin-right: 12px;
	transition: all 0.2s ease;
	background-color: #f8fafc;
}

#comment-text:focus {
	border-color: #3b82f6;
	box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
	background-color: #ffffff;
	outline: none;
}

#comment-text::placeholder {
	color: #94a3b8;
}

/* Submit button */
#submit-comment-btn {
	padding: 10px 20px;
	background-color: #3b82f6;
	color: #ffffff;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
	transition: all 0.2s ease;
	white-space: nowrap;
}

#submit-comment-btn:hover {
	background-color: #2563eb;
	transform: translateY(-1px);
	box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
}

#submit-comment-btn:active {
	transform: translateY(0);
	box-shadow: none;
}

/* Responsive adjustments */
@media ( max-width : 640px) {
	.comment-input {
		flex-direction: column;
		align-items: stretch;
	}
	.user-avatar img {
		width: 36px;
		height: 36px;
	}
	#comment-text {
		margin: 12px 0;
	}
	#submit-comment-btn {
		width: 100%;
	}
}
</style>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<c:choose>
			<c:when test="${role == 'TEACHER'}">
				<jsp:include page="/WEB-INF/views/sidebar/sidebarTeacher.jsp" />
			</c:when>
			<c:when test="${role == 'STUDENT'}">
				<jsp:include page="/WEB-INF/views/sidebar/sidebarStudent.jsp" />
			</c:when>
		</c:choose>
	</sec:authorize>

	<div class="main-content">
		<div class="header">
			<div class="search-bar">
				<input type="text" placeholder="Search...">
			</div>
			<div class="user-info">
				<span>Katie Pena</span>
				<div class="user-avatar"></div>
			</div>
		</div>

		<div class="video-container">
			<div class="video-container">
				<video controls>
					<source src="../${video.filePath}" type="video/mp4">
				</video>
			</div>
		</div>



		<div class="video-info">
			<h1 class="video-title">${video.title}</h1>
			<div class="action-buttons">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" id="csrf-token" />
				<button class="action-btn" id="like-btn" data-video-id="${video.id}"
					data-user-id="${user.id}">
					👍 <span id="like-count-${video.id}">${video.likes}</span>
					<!-- Initial like count from backend -->
				</button>
			</div>

			<div class="video-stats">
				<span>${video.views} views</span> <span>${formattedDate}</span>
			</div>

			<div class="channel-info">
				<div class="channel-avatar"></div>
				<div class="channel-details">
					<div class="channel-name">${teacher.name}</div>
				</div>
			</div>

			<div class="video-description">
				<p>${video.description}</p>
			</div>
		</div>

		<!-- Main Comments Section Wrapper -->
		<div class="comments-section">
			<!-- Comment Input Section -->
			<div class="comment-input">
				<div class="user-avatar">
					<img src="" alt="" />
				</div>
				<input type="hidden" id="video-id" value="${video.id}" /> <input
					type="hidden" id="user-id" value="${user.id}" /> <input
					type="hidden" id="csrf-token" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="text" id="comment-text"
					placeholder="Add a public comment..." />
				<button id="submit-comment-btn">Submit</button>
			</div>

			<!-- Comments Container -->
			<div id="comments-container">
				<div class="comments-header">
					<span id="comments-count">${video.comments} Comments</span>
				</div>
				<div id="comments-list">
					<!-- Comments will be dynamically added here -->
				</div>
			</div>
		</div>

		<script
			src="${pageContext.request.contextPath}/resources/js/manageLike.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/manageComment.js"></script>
</body>
</html>