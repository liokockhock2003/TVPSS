<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

    margin: 0 auto;
    padding-top: 56.25%; /* 16:9 Aspect Ratio */
}

.video-container video {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

/* Custom styling for video controls */
video::-webkit-media-controls {
    background-color: rgba(0, 0, 0, 0.5);
}

/* Improve video display on mobile devices */
@media (max-width: 768px) {
    .video-container {
        padding-top: 75%; /* 4:3 Aspect Ratio for mobile */
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
	max-width: 1280px;
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

/* Comments Section */
.comments-section {
	max-width: 1280px;
	margin: 20px auto;
	background-color: white;
	padding: 20px;
	border-radius: 12px;
}

.comments-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.comment-input {
	display: flex;
	gap: 15px;
	margin-bottom: 30px;
}

.comment-input input {
	flex: 1;
	padding: 12px;
	border: none;
	border-bottom: 1px solid #ddd;
	outline: none;
}

.comment {
	display: flex;
	gap: 15px;
	margin-bottom: 20px;
}

.comment-content {
	flex: 1;
}

.comment-author {
	font-weight: bold;
	margin-bottom: 5px;
}

.comment-text {
	margin-bottom: 10px;
}

.comment-actions {
	display: flex;
	gap: 15px;
	color: #666;
	font-size: 14px;
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
			<video controls>
				<source src="../${video.filePath}" type="video/mp4">
			</video>
		</div>

		<div class="video-info">
			<h1 class="video-title">${video.title}</h1>
			<div class="video-stats">
				<span>${video.views} views</span> <span>${formattedDate}</span>
			</div>
			<div class="action-buttons">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" id="csrf-token" />
				<button class="action-btn" id="like-btn" data-video-id="${video.id}"
					data-user-id="${user.id}">
					👍 <span id="like-count-${video.id}">${video.likes}</span>
				</button>
			</div>


			<div class="channel-info">
				<div class="channel-avatar"></div>
				<div class="channel-details">
					<div class="channel-name">${user.username}</div>
				</div>
			</div>

			<div class="video	-description">
				<p>${video.description}</p>
			</div>
		</div>

		<div class="comments-section">
			<div class="comments-header">
				<h3>${video.comments} Comments</h3>
			</div>


			<div class="comment-input">
				<div class="user-avatar"></div>
				<input type="hidden" id="user-id" value="${user.id}" /> <input
					type="text" id="comment-text" placeholder="Add a public comment..." />
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" id="csrf-token" /> <input type="hidden"
					id="video-id" value="${video.id}" />
				<button id="submit-comment-btn" class="submit-btn">Submit</button>
			</div>




			<div id="comments-container">
				<div class="comment">
					<div class="user-avatar"></div>
					<div class="comment-content">
						
					</div>
				</div>
			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/manageLike.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/manageComment.js"></script>
</body>
</html>