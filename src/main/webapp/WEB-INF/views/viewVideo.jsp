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
/* Main Video Info Container */
.video-info {
    max-width: 1280px;
    margin: 24px auto;
    padding: 24px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    border: 1px solid #e5e7eb;
}

/* Video Title */
.video-title {
   font-size: 24px;
   font-weight: 600;
   color: #0f172a;
   margin-bottom: 12px;
   line-height: 1.3;
}

/* Action Buttons Container */
.action-buttons {
   display: flex;
   gap: 8px;
   margin: 16px 0;
}

/* Like Button Styling */
.action-btn {
   display: flex;
   align-items: center;
   gap: 8px;
   padding: 8px 16px;
   background-color: #f8fafc;
   border: 1px solid #e2e8f0;
   border-radius: 24px;
   font-size: 14px;
   font-weight: 500;
   color: #475569;
   cursor: pointer;
   transition: all 0.2s ease;
}

.action-btn:hover {
   background-color: #f1f5f9;
   transform: translateY(-1px);
}

.action-btn:active {
   transform: translateY(0);
}

/* Video Stats */
.video-stats {
   display: flex;
   gap: 16px;
   color: #64748b;
   font-size: 14px;
   margin-bottom: 16px;
}

/* Channel Section */
.channel-info {
   display: flex;
   align-items: center;
   gap: 16px;
   padding: 16px 0;
   border-top: 1px solid #e2e8f0;
   border-bottom: 1px solid #e2e8f0;
   margin: 16px 0;
}

.channel-avatar {
   width: 48px;
   height: 48px;
   border-radius: 50%;
   background-color: #e2e8f0;
   flex-shrink: 0;
}

.channel-details {
   flex-grow: 1;
}

.channel-name {
   font-size: 16px;
   font-weight: 500;
   color: #0f172a;
   margin-bottom: 4px;
}

/* Video Description */
.video-description {
   margin-top: 20px;
   color: #334155;
   line-height: 1.6;
}

.video-description p {
   margin: 0;
   white-space: pre-wrap;
   font-size: 15px;
}

/* Responsive Design */
@media (max-width: 768px) {
   .video-info {
       padding: 0 16px;
   }

   .video-title {
       font-size: 20px;
   }

   .action-buttons {
       flex-wrap: wrap;
   }

   .video-stats {
       flex-direction: column;
       gap: 8px;
   }

   .channel-info {
       padding: 12px 0;
   }
}

/* Like Count Animation */
@keyframes likePopup {
   0% { transform: scale(1); }
   50% { transform: scale(1.2); }
   100% { transform: scale(1); }
}

.like-animation {
   animation: likePopup 0.3s ease;
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

/* Main Comments Section */
.comments-section {
    max-width: 1280px;
    margin: 24px auto;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    border: 1px solid #e5e7eb;
    padding: 15px;
}

/* Comments Header */
.comments-header {
   padding: 16px;
   margin-bottom: 24px;
   border-bottom: 1px solid #e2e8f0;
}

#comments-count {
   font-size: 16px;
   font-weight: 600;
   color: #0f172a;
}

/* Comment Input Section */
.comment-input {
   display: flex;
   align-items: center;
   gap: 16px;
   margin-bottom: 32px;
   padding-bottom: 24px;
   border-bottom: 1px solid #e2e8f0;
}

.comment-input h3 {
   margin: 0;
   font-size: 16px;
   font-weight: 600;
   color: #1f2937;
}

.user-avatar img {
   width: 100%;
   height: 100%;
   object-fit: cover;
}

#comment-text {
   flex-grow: 1;
   padding: 12px 16px;
   border: none;
   border-bottom: 2px solid #e2e8f0;
   font-size: 14px;
   background: transparent;
   transition: all 0.2s ease;
}

#comment-text:focus {
   outline: none;
   border-bottom-color: #3b82f6;
}

#comment-text::placeholder {
   color: #94a3b8;
}

#submit-comment-btn {
   padding: 8px 20px;
   background-color: #3b82f6;
   color: white;
   border: none;
   border-radius: 20px;
   font-size: 14px;
   font-weight: 500;
   cursor: pointer;
   transition: all 0.2s ease;
}

#submit-comment-btn:hover {
   background-color: #2563eb;
   transform: translateY(-1px);
}

#submit-comment-btn:active {
   transform: translateY(0);
}

/* Comments List */
#comments-list {
   display: flex;
   flex-direction: column;
   gap: 24px;
}

.comment {
   padding: 16px;
   border-bottom: 1px solid #e5e7eb;
   transition: background-color 0.2s ease;
}

.comment:hover {
   background-color: #f8fafc;
}

.comment:last-child {
   border-bottom: none;
}

.comment-content {
   display: flex;
   flex-direction: column;
   gap: 6px;
}

.comment-author {
   font-weight: 600;
   font-size: 14px;
   color: #1f2937;
}

.comment-text {
   font-size: 14px;
   line-height: 1.5;
   color: #4b5563;
   word-wrap: break-word;
}

/* Responsive adjustments */
@media (max-width: 640px) {
   .comment {
       padding: 12px;
   }
   
   .comment-author {
       font-size: 13px;
   }
   
   .comment-text {
       font-size: 13px;
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
		<jsp:include page="/WEB-INF/views/header/header.jsp" />

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
				<div class="channel-details">
					<div class="channel-name">${teacher.name}</div>
				</div>
			</div>

			<div class="video-description">
				<h2>Description</h2>
				<p>${video.description}</p>
			</div>
		</div>

		<!-- Main Comments Section Wrapper -->
		<div class="comments-section">
			<!-- Comment Input Section -->
			<div class="comment-input">
				<h3>${sessionUser.name}</h3>
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