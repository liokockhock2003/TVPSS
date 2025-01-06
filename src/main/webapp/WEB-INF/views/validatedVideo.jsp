<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Validation - TVPSS</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
            min-height: 100vh;
            max-width: 180%;
            margin: 0px;
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

.card {
	border: none;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.nav-tabs {
	border-bottom: 2px solid #e0e0e0; /* Thin separator under the tabs */
}

.nav-tabs .nav-item {
	margin-bottom: -1px;
	/* Prevents spacing between active tabs and content */
}

.nav-tabs .nav-link {
	border: 1px solid transparent; /* Clean border styling */
	border-radius: 8px; /* Rounded tabs for modern appearance */
	padding: 8px 16px; /* Adjust padding for a more balanced size */
	font-size: 0.95rem; /* Slightly larger text for readability */
	font-weight: 500; /* Medium font weight for a professional look */
	text-transform: capitalize; /* Ensure consistent casing */
	color: #6c757d; /* Neutral gray text */
	transition: all 0.3s ease; /* Smooth hover effect */
}

.nav-tabs .nav-link:hover {
	background-color: #f8f9fa; /* Light gray hover effect */
	color: #333; /* Darker text color on hover */
	border-color: #ddd; /* Subtle border on hover */
	text-decoration: none; /* Prevent underline */
}

.nav-tabs .nav-link.active {
	background-color: #9c27b0; /* Purple background for the active tab */
	color: white; /* White text for active tab */
	border-color: #9c27b0; /* Match border color with the active tab */
	font-weight: bold; /* Emphasize the active tab */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
	/* Slight shadow for the active tab */
}

        /* Main Content */
        .main-content {
            flex: 1;
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
        .validated-video {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .validated-video h2 {
            margin-bottom: 20px;
        }
        
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
        
        table td span{
            font-weight: 700;
            font-size: 20px;
            
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
        	font-size: 13px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
            transition: 0.4s;
        }

        .btn-approve {
            background-color: #8348a5;
        }

        .btn-reject {
            background-color: #8348a5;
        }
        
        button:disabled {
            background-color: white;
            color: gray;
            cursor: context-menu;
        }

        .btn:hover {
            opacity: 0.8;
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
            
            <div class="card-header">
				<ul class="nav nav-tabs card-header-tabs">
					<li class="nav-item"><a class="nav-link"
						href="validate-video">Pending Validation</a></li>
					<li class="nav-item"><a class="nav-link active" href="validated-video"">Validated Video</a></li>
				</ul>
			</div>


<!-- Video Validation Table -->
            <section class="validated-video">
                <h2>Validated Video</h2>
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
                        <td><span>Build it in Figma: Create a design system — Components</span><br>SK Taman Bukit Dahlia</td>
                        <td class="action-buttons">
                            <button class="btn btn-approve" disabled>Approved</button>
                            <button class="btn btn-approve">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2.</td>
                        <td><img src="https://via.placeholder.com/200x120" class="video-thumbnail" alt="Video"></td>
                        <td><span>Build it in Figma: Create a design system — Foundations</span><br>SK Taman Bukit Dahlia</td>
                        <td class="action-buttons">
                            <button class="btn btn-approve" disabled>Approved</button>
                            <button class="btn btn-approve">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td><img src="https://via.placeholder.com/200x120" class="video-thumbnail" alt="Video"></td>
                        <td><span>Amelie Piano Soundtrack</span><br>SMJK Jit Sa</td>
                        <td class="action-buttons">
                            <button class="btn btn-approve" disabled>Approved</button>
                            <button class="btn btn-approve">Delete</button>
                        </td>
                    </tr>
                </table>
            </section>
        </div>
    </div>
</body>
</html>
