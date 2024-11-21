<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Validation - TVPSS</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            display: flex;
            height: 100vh;
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

        /* Main Content */
        .main-content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-bar {
            padding: 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .user-profile {
            display: flex;
            align-items: center;
        }

        .user-profile img {
            border-radius: 50%;
            margin-right: 10px;
        }

        /* Video Validation Section */
        .video-validation {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .video-validation h2 {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f4f4f4;
        }

        .video-thumbnail {
            width: 120px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            padding-top: 50px;
            padding-bottom: 50px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
        }

        .btn-approve {
            background-color: #8348a5;
        }

        .btn-reject {
            background-color: #8348a5;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
			<a href="${pageContext.request.contextPath}/" class="logo">TVPSS</a>

			<a href="${pageContext.request.contextPath}/crew-resource"
				class="nav-item ${currentPage == 'crew-resource' ? 'active' : ''}">
				<span>👥 Crew & Resource</span>
			</a> <a href="${pageContext.request.contextPath}/video-validation"
				class="nav-item ${currentPage == 'video-validation' ? 'active' : ''}">
				<span>🎥 Video Validation</span>
			</a> <a href="${pageContext.request.contextPath}/deals"
				class="nav-item ${currentPage == 'deals' ? 'active' : ''}"> <span>💼
					Deals</span>
			</a> <a href="${pageContext.request.contextPath}/contacts"
				class="nav-item ${currentPage == 'contacts' ? 'active' : ''}"> <span>📞
					Contacts</span>
			</a> <a href="${pageContext.request.contextPath}/reports"
				class="nav-item ${currentPage == 'reports' ? 'active' : ''}"> <span>📊
					Reports</span>
			</a>
		</div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <header>
                <input type="text" placeholder="Search..." class="search-bar">
                <div class="user-profile">
                    <img src="https://via.placeholder.com/40" alt="User">
                    <span>Katie Pena (Admin)</span>
                </div>
            </header>

            <!-- Video Validation Table -->
            <section class="video-validation">
                <h2>Video Validation</h2>
                <table>
                    <tr>
                        <th>No</th>
                        <th>Video</th>
                        <th>Details</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td><img src="https://via.placeholder.com/200x120" class="video-thumbnail" alt="Video"></td>
                        <td>Build it in Figma: Create a design system — Components<br>SK Taman Bukit Dahlia</td>
                        <td class="action-buttons">
                            <button class="btn btn-approve">Approve</button>
                            <button class="btn btn-reject">Reject</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2.</td>
                        <td><img src="https://via.placeholder.com/200x120" class="video-thumbnail" alt="Video"></td>
                        <td>Build it in Figma: Create a design system — Foundations<br>SK Taman Bukit Dahlia</td>
                        <td class="action-buttons">
                            <button class="btn btn-approve">Approve</button>
                            <button class="btn btn-reject">Reject</button>
                        </td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td><img src="https://via.placeholder.com/200x120" class="video-thumbnail" alt="Video"></td>
                        <td>Amelie Piano Soundtrack<br>SMJK Jit Sa</td>
                        <td class="action-buttons">
                            <button class="btn btn-approve">Approve</button>
                            <button class="btn btn-reject">Reject</button>
                        </td>
                    </tr>
                </table>
            </section>
        </div>
    </div>
</body>
</html>
