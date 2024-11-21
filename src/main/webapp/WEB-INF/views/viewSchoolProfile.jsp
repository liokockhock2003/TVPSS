<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS School List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.main-container {
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


/* Main content styles */
.main-content {
	flex: 1;
	padding: 20px 40px;
	background-color: white;
}

.search-bar {
	width: 100%;
	max-width: 400px;
	padding: 8px 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 2rem;
}

/* Table styles */
.content-card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	padding: 20px;
}

.manage-btn {
	background-color: #9c27b0;
	color: white;
	border: none;
	padding: 6px 16px;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.manage-btn:hover {
	background-color: #7b1fa2;
}

/* Header styles */
.user-section {
	display: flex;
	align-items: center;
	gap: 10px;
	position: absolute;
	top: 20px;
	right: 40px;
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #ddd;
}

.table th {
	color: #666;
	font-weight: 500;
	border-bottom: 2px solid #eee;
}

.table td {
	vertical-align: middle;
}
.school-profile-header {
            display: flex;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .school-logo img {
            width: 150px;
            height: 150px;
            margin-right: 20px;
        }

        .school-info h1 {
            margin: 0 0 10px 0;
            color: #333;
        }

        .school-code {
            font-size: 1.2em;
            color: #666;
            margin-bottom: 5px;
        }

        .tabs {
            margin-bottom: 20px;
        }

        .tab {
            padding: 10px 20px;
            margin-right: 10px;
            border: none;
            background: #f0f0f0;
            cursor: pointer;
        }

        .tab.active {
            background: #6c5ce7;
            color: white;
        }

        .criteria-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .criteria-table th,
        .criteria-table td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        .status {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 0.9em;
        }

        .status.available {
            background: #a8e6cf;
            color: #2d3436;
        }

        .status.not-available {
            background: #ff8b94;
            color: #fff;
        }

        .breadcrumb {
            margin-bottom: 20px;
            color: #666;
        }

        .breadcrumb a {
            color: #6c5ce7;
            text-decoration: none;
        }

</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<div class="sidebar">
			<a href="${pageContext.request.contextPath}/" class="logo">TVPSS</a>
			
			<a href="${pageContext.request.contextPath}/school-list"
				class="nav-item ${currentPage == 'school-list' ? 'active' : ''}">
				<span>🏫 School TVPSS Management</span>
			</a> <a href="${pageContext.request.contextPath}/crew-resource"
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
            <!-- User Section -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Katie Pena (Admin)</span>
			</div>

			<!-- Search Bar -->
			<input type="text" class="search-bar" placeholder="Search...">

            <!-- School Details Content -->
            <div class="content">
                <div class="breadcrumb">
                    <a href="school-list">School List</a> > School Details
                </div>

                <!-- School Profile Header -->
                <div class="school-profile-header">
                    <div class="school-logo">
                        <img src="${pageContext.request.contextPath}/resources/images/tvpss-cess-logo.png" alt="School Logo">
                    </div>
                    <div class="school-info">
                        <h1>SK TAMAN BUKIT DAHLIA</h1>
                        <p class="school-code">JB 3003</p>
                        <p class="school-address">Persiaran Dahlia 1</p>
                        <p class="school-location">81700 Pasir Gudang</p>
                        <p class="school-state">Johor</p>
                    </div>
                </div>

                <!-- Tabs Navigation -->
                <div class="tabs">
                    <button class="tab active">TVPSS Status</button>
                    <button class="tab">Activity Log</button>
                </div>

                <!-- TVPSS Status Content -->
                <div class="tab-content">
                    <div class="criteria-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Criteria</th>
                                    <th>Check</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>There is a Name (Brand)</td>
                                    <td><span class="status available">Available</span></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Logo</td>
                                    <td><span class="status available">Available</span></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Corner / Mini Studio / TV Studio</td>
                                    <td><span class="status available">Available</span></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>In-School Recording</td>
                                    <td><span class="status available">Available</span></td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Upload on Youtube</td>
                                    <td><span class="status available">Available</span></td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Recording inside and outside the school</td>
                                    <td><span class="status not-available">Not Available</span></td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>Collabirate with external agencies</td>
                                    <td><span class="status not-available">Not Available</span></td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>Using 'Green Screen' Technology</td>
                                    <td><span class="status not-available">Not Available</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
		</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>