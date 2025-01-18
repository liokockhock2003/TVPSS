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
	padding: 30px;
	display: flex;
	gap: 30px;
}

.content-left {
	flex: 1;
}

.content-right {
	width: 300px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.user-info {
	display: flex;
	align-items: center;
	gap: 10px;
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #ddd;
}

/* Upload Section Styles */
.upload-section {
	background-color: white;
	padding: 24px;
	border-radius: 12px;
	margin-bottom: 30px;
}

.upload-title {
	font-size: 20px;
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 20px;
	font-size: 17px;
	font-weight: 600;
}

input[type="text"], textarea {
	font-size: 14px;
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 6px;
	margin-top: 8px;
}

.upload-btn {
	font-size: 14px;
	font-weight: 500;
	background-color: #7c3aed;
	color: white;
	padding: 12px 24px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

/* File Upload Box Styles */
.file-upload-box {
	background-color: white;
	padding: 24px;
	border-radius: 12px;
	text-align: center;
	height: fit-content;
}

.upload-area {
	border: 2px dashed #ddd;
	border-radius: 12px;
	padding: 40px 20px;
	margin: 20px 0;
	cursor: pointer;
	transition: all 0.3s ease;
}

.upload-area:hover {
	border-color: #7c3aed;
	background-color: #f9f7ff;
}

.upload-icon {
	font-size: 40px;
	margin-bottom: 10px;
	color: #7c3aed;
}

.browse-btn {
	background-color: #7c3aed;
	color: white;
	padding: 12px 24px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	margin-top: 10px;
}

/* Channel Content Styles */
.channel-content {
	background-color: white;
	padding: 24px;
	border-radius: 12px;
}

.content-table {
	width: 100%;
	border-collapse: collapse;
}

.content-table th {
	text-align: left;
	padding: 12px;
	border-bottom: 1px solid #eee;
	color: #666;
}

.content-table td {
	padding: 12px;
	border-bottom: 1px solid #eee;
}

.video-preview {
	display: flex;
	align-items: center;
	gap: 15px;
}

.thumbnail {
	width: 180px;
	height: 100px;
	object-fit: cover;
	border-radius: 6px;
}

.action-buttons {
	display: flex;
	gap: 10px;
}

.edit-btn {
	background-color: #7c3aed;
	color: white;
	padding: 8px 16px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

.delete-btn {
	background-color: #7c3aed;
	color: white;
	padding: 8px 16px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

.status-badge {
	padding: 4px 12px;
	border-radius: 12px;
	font-size: 14px;
}

.status-approved {
	background-color: #e2e8f0;
}

.status-pending {
	background-color: #e2e8f0;
}

/* Hide default file input */
.file-input {
	display: none;
}

/* Table Row Styles */
tr {
    border-bottom: 1px solid #e5e7eb;
    transition: background-color 0.2s ease;
}

tr:hover {
    background-color: #f8fafc;
}

td {
    padding: 16px;
    vertical-align: middle;
}

/* Video Preview Styles */
.video-preview {
    position: relative;
    width: 160px;
    aspect-ratio: 16/9;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.video-preview img.thumbnail {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.video-preview span {
    position: absolute;
    bottom: 8px;
    right: 8px;
    background-color: rgba(0, 0, 0, 0.75);
    color: white;
    padding: 2px 6px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 500;
}

/* Title and Edit Form Styles */
.video-title {
    font-weight: 500;
    color: #1f2937;
    display: block;
    margin-bottom: 4px;
}

.edit-form {
    margin-top: 12px;
    padding: 16px;
    background-color: #f8fafc;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.title-input {
    width: 100%;
    padding: 8px 12px;
    border: 1px solid #e5e7eb;
    border-radius: 6px;
    margin-bottom: 8px;
    font-size: 14px;
}

.description-input {
    width: 100%;
    padding: 8px 12px;
    border: 1px solid #e5e7eb;
    border-radius: 6px;
    margin-bottom: 12px;
    min-height: 80px;
    resize: vertical;
    font-size: 14px;
}

.title-input:focus,
.description-input:focus {
    outline: none;
    border-color: #3b82f6;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

/* Status Badge Styles */
.status-badge {
    padding: 6px 12px;
    border-radius: 9999px;
    font-size: 12px;
    font-weight: 500;
    text-transform: uppercase;
}

.status-published {
    background-color: #dcfce7;
    color: #166534;
}

.status-draft {
    background-color: #f3f4f6;
    color: #4b5563;
}

.status-processing {
    background-color: #fef9c3;
    color: #854d0e;
}

.status-error {
    background-color: #fee2e2;
    color: #991b1b;
}

/* Button Styles */
.action-buttons {
    display: flex;
    gap: 8px;
}

.edit-btn,
.delete-btn,
.save-btn,
.cancel-btn {
    padding: 8px 16px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s ease;
}

.edit-btn {
    background-color: #eff6ff;
    color: #1d4ed8;
    border: 1px solid #bfdbfe;
}

.edit-btn:hover {
    background-color: #dbeafe;
}

.delete-btn {
    background-color: #fef2f2;
    color: #dc2626;
    border: 1px solid #fecaca;
}

.delete-btn:hover {
    background-color: #fee2e2;
}

.save-btn {
    background-color: #166534;
    color: white;
    border: none;
}

.save-btn:hover {
    background-color: #15803d;
}

.cancel-btn {
    background-color: #f3f4f6;
    color: #4b5563;
    border: 1px solid #e5e7eb;
}

.cancel-btn:hover {
   	background-color: #e5e7eb;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .video-preview {
        width: 120px;
    }
    
    .action-buttons {
        flex-direction: column;
    }
    
    .edit-btn,
    .delete-btn {
        width: 100%;
        text-align: center;
    }
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/sidebar/sidebarTeacher.jsp" />

	<div class="main-content">
		<div class="content-left">
			<div class="header">
				<div class="search">
					<input type="text" placeholder="Search..."
						style="padding: 8px; border-radius: 4px; border: 1px solid #ddd;">
				</div>
				<div class="user-info">
					<span>Admin</span>
					<div class="user-avatar"></div>
				</div>
			</div>

			<form method="post"
				action="${pageContext.request.contextPath}/videos/upload"
				enctype="multipart/form-data">
				<div class="upload-section">
					<div class="upload-title">
						<h2>📤 Upload Video</h2>
					</div>
					<div class="form-group">
						<label>Title (required)</label> <input type="text" name="title"
							required>
					</div>
					<div class="form-group">
						<label>Description (required)</label>
						<textarea rows="4" name="description"></textarea>
					</div>

					<div class="content-right">
						<div class="file-upload-box">
							<h3>Upload Video File</h3>
							<div class="upload-area"
								onclick="document.getElementById('fileInput').click()">
								<div class="upload-icon">📁</div>
								<p>Drag & drop video file here</p>
							</div>
							<input type="file" name="file" id="fileInput" class="file-input"
								accept="video/*">
							<p style="color: #666; font-size: 14px; margin-top: 10px;">
								Supported formats: MP4, MOV, AVI<br> Maximum file size: 2GB
							</p>
						</div>
					</div>
					<input type="hidden" id="csrf-token" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="submit" class="upload-btn">Upload</button>
				</div>
			</form>

			<input type="hidden" id="csrf-token" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="channel-content">
				<h2 style="margin-bottom: 20px;">Channel Content</h2>
				<table class="content-table">
					<thead>
						<tr>
							<th>No</th>
							<th>Video</th>
							<th>Title</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody id="video-list">
						<!-- Dynamic rows will be added here -->
					</tbody>
				</table>
			</div>
		</div>


	</div>

	<script>
        // Add drag and drop functionality
        const uploadArea = document.querySelector('.upload-area');
        
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            uploadArea.addEventListener(eventName, preventDefaults, false);
        });

        function preventDefaults (e) {
            e.preventDefault();
            e.stopPropagation();
        }

        ['dragenter', 'dragover'].forEach(eventName => {
            uploadArea.addEventListener(eventName, highlight, false);
        });

        ['dragleave', 'drop'].forEach(eventName => {
            uploadArea.addEventListener(eventName, unhighlight, false);
        });

        function highlight(e) {
            uploadArea.style.borderColor = '#7c3aed';
            uploadArea.style.backgroundColor = '#f9f7ff';
        }

        function unhighlight(e) {
            uploadArea.style.borderColor = '#ddd';
            uploadArea.style.backgroundColor = 'white';
        }

        uploadArea.addEventListener('drop', handleDrop, false);

        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;
            handleFiles(files);
        }

        function handleFiles(files) {
            // Handle the uploaded files here
            console.log(files);
        }
    </script>

	<script src="${pageContext.request.contextPath}/resources/js/videos.js"></script>

</body>
</html>