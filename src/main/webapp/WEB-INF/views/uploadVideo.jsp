<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TVPSS - Video Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background-color: #f5f5f5;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: white;
            padding: 20px;
            border-right: 1px solid #eee;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-item {
            padding: 12px;
            margin: 4px 0;
            border-radius: 8px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-item:hover {
            background-color: #f0f0f0;
        }

        .nav-item.active {
            background-color: #f0f0f5;
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
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        input[type="text"], 
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            margin-top: 8px;
        }

        .upload-btn {
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
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <span>📺 TVPSS</span>
        </div>
        <div class="nav-item">👥 Crew & Resource</div>
        <div class="nav-item active">🎥 Video</div>
        <div class="nav-item">💼 Deals</div>
        <div class="nav-item">📞 Contacts</div>
        <div class="nav-item">📊 Reports</div>
    </div>

    <div class="main-content">
        <div class="content-left">
            <div class="header">
                <div class="search">
                    <input type="text" placeholder="Search..." style="padding: 8px; border-radius: 4px; border: 1px solid #ddd;">
                </div>
                <div class="user-info">
                    <span>Admin</span>
                    <div class="user-avatar"></div>
                </div>
            </div>

            <div class="upload-section">
                <div class="upload-title">
                    <h2>📤 Upload Video</h2>
                </div>
                <div class="form-group">
                    <label>Title (required)</label>
                    <input type="text">
                </div>
                <div class="form-group">
                    <label>Description (required)</label>
                    <textarea rows="4"></textarea>
                </div>
                <button class="upload-btn">Upload</button>
            </div>

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
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>
                                <div class="video-preview">
                                    <img src="/api/placeholder/180/100" alt="Video thumbnail" class="thumbnail">
                                    <span>54:48</span>
                                </div>
                            </td>
                            <td>Build it in Figma: Create a design system — Components</td>
                            <td><span class="status-badge status-approved">Approved</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="edit-btn">Edit Title and Description</button>
                                    <button class="delete-btn">Delete</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>
                                <div class="video-preview">
                                    <img src="/api/placeholder/180/100" alt="Video thumbnail" class="thumbnail">
                                    <span>54:48</span>
                                </div>
                            </td>
                            <td>Build it in Figma: Create a design system — Foundations</td>
                            <td><span class="status-badge status-pending">Pending</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="edit-btn">Edit Title and Description</button>
                                    <button class="delete-btn">Delete</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="content-right">
            <div class="file-upload-box">
                <h3>Upload Video File</h3>
                <div class="upload-area" onclick="document.getElementById('fileInput').click()">
                    <div class="upload-icon">📁</div>
                    <p>Drag & drop video file here</p>
                    <p style="color: #666; font-size: 14px; margin-top: 10px;">or</p>
                    <button class="browse-btn">Browse Files</button>
                </div>
                <input type="file" id="fileInput" class="file-input" accept="video/*">
                <p style="color: #666; font-size: 14px; margin-top: 10px;">
                    Supported formats: MP4, MOV, AVI<br>
                    Maximum file size: 2GB
                </p>
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
</body>
</html>