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
	width: 100%;
	max-width: 1280px;
	margin: 0 auto;
	background-color: black;
	position: relative;
	aspect-ratio: 16/9;
}

.video-controls {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	background: linear-gradient(transparent, rgba(0, 0, 0, 0.7));
	padding: 20px;
	display: flex;
	align-items: center;
	gap: 15px;
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
			<img src="/api/placeholder/1280/720" alt="Video thumbnail"
				style="width: 100%; height: 100%; object-fit: cover;">
			<div class="video-controls">
				<button class="control-btn">▶️</button>
				<button class="control-btn">⏭️</button>
				<button class="control-btn">🔊</button>
				<div class="progress-bar"></div>
				<button class="control-btn">⚙️</button>
				<button class="control-btn">⛶</button>
			</div>
		</div>

		<div class="video-info">
			<h1 class="video-title">Blind Woodturner: Turning passion into
				fine art</h1>
			<div class="video-stats">
				<span>576,969 views</span> <span>Oct 8, 2021</span>
			</div>
			<div class="action-buttons">
				<button class="action-btn">👍 17K</button>
				<button class="action-btn">532</button>
				<button class="action-btn">SHARE</button>
				<button class="action-btn">SAVE</button>
				<button class="action-btn">•••</button>
			</div>

			<div class="channel-info">
				<div class="channel-avatar"></div>
				<div class="channel-details">
					<div class="channel-name">SK Taman Bukit Dahlia</div>
					<div class="subscriber-count">3.3M subscribers</div>
				</div>
			</div>

			<div class="video-description">
				<p>Chris Fisher, also known as the Blind Woodturner, learned his
					craft by listening to hundreds of hours of YouTube videos and
					experimenting in his workshop. Now he's a YouTube creator himself,
					sells his products worldwide, and does demonstrations all around
					the country.</p>
				<button style="margin-top: 10px; color: #666;">SHOW MORE</button>
			</div>
		</div>

		<div class="comments-section">
			<div class="comments-header">
				<h3>286 Comments</h3>
				<button class="action-btn">SORT BY</button>
			</div>

			<div class="comment-input">
				<div class="user-avatar"></div>
				<input type="text" placeholder="Add a public comment...">
			</div>

			<div class="comment">
				<div class="user-avatar"></div>
				<div class="comment-content">
					<div class="comment-author">James Gouse</div>
					<div class="comment-text">Work world is full of different
						skills</div>
					<div class="comment-actions">
						<span>👍</span> <span>👎</span> <span>REPLY</span>
					</div>
				</div>
			</div>

			<div class="comment">
				<div class="user-avatar"></div>
				<div class="comment-content">
					<div class="comment-author">Alan Cooper</div>
					<div class="comment-text">Can you provide?</div>
					<div class="comment-meta">On January 2, 2022</div>
					<div class="comment-actions">
						<span>👍</span> <span>👎</span> <span>REPLY</span>
					</div>
				</div>
			</div>

			<div class="comment">
				<div class="user-avatar"></div>
				<div class="comment-content">
					<div class="comment-author">Marcus Levin</div>
					<div class="comment-text">Can you work on?</div>
					<div class="comment-text">Conspiracy</div>
					<div class="comment-actions">
						<span>👍</span> <span>👎</span> <span>REPLY</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>