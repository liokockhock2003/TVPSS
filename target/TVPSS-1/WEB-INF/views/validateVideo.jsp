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

        /* Sidebar */
        .sidebar {
            width: 250px;
            background-color: #white;
            color: #black;
            padding: 20px;
        }

        .sidebar h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            padding: 15px;
            cursor: pointer;
            border-radius: 8px;
            transition: background 0.3s;
            margin-bottom: 10px;
        }

        .sidebar ul li:hover,
        .sidebar ul li.active {
            background-color: #bc6fe8;
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
        <aside class="sidebar">
            <h2>TVPSS</h2>
            <ul>
                <li>🛠️ Crew & Resource</li>
                <li class="active">🎬 Video Validation</li>
                <li>💼 Deals</li>
                <li>📇 Contacts</li>
                <li>📊 Reports</li>
            </ul>
        </aside>

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
