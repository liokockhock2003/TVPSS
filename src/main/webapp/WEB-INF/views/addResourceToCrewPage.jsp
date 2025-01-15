<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TVPSS - View Crew Resources</title>
    <link href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Reusing your existing styles */
        body {
            background-color: #f8f9fa;
        }

        .main-container {
            display: flex;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
            padding: 20px 40px;
            background-color: white;
            margin: 5px;
        }

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

        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .card {
            border: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .table {
            border-radius: 8px;
            overflow: hidden;
            border-collapse: separate;
            margin-top: 20px;
        }

        .table th {
            color: #123;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        .table-hover tbody tr:hover {
            background-color: #f5f5f5;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .table td {
            vertical-align: middle;
            font-size: 0.95rem;
        }

        .manage-btn {
            display: inline-block;
            background-color: #9c27b0;
            color: white;
            text-align: center;
            text-decoration: none;
            border: none;
            padding: 6px 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            font-size: 0.85rem;
        }

        .manage-btn:hover {
            color: #ffffff;
            background-color: #7b1fa2;
            text-decoration: none;
        }

        .crew-info {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .crew-info h5 {
            color: #333;
            margin-bottom: 10px;
        }

        .crew-info p {
            margin-bottom: 5px;
            color: #666;
        }

        .back-btn {
            margin-bottom: 20px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Sidebar -->
        <jsp:include page="/WEB-INF/views/sidebar/sidebarAdmin.jsp" />

        <!-- Main Content -->
        <div class="main-content">
            <!-- User Section -->
            <div class="user-section">
                <div class="user-avatar"></div>
                <span>Katie Pena (Admin)</span>
            </div>

            <div class="back-btn">
                <a href="${pageContext.request.contextPath}/manage-school/crew-page/${schoolId}" class="manage-btn">
                    Back to Crew List
                </a>
            </div>

            <h3 class="mb-4">Allocate Resource To Crew</h3>

            <!-- Crew Information -->
            <div class="crew-info">
                <h5>Crew Details</h5>
                <p><strong>Name:</strong> ${crew.student.name}</p>
                <p><strong>Role:</strong> ${crew.role}</p>
                <p><strong>Total Resources:</strong> ${allocatedCount}</p>
            </div>

            <div class="card">
                <div class="card-body">
                    <table class="table table-hover table-striped align-middle">
                        <thead class="table-light">
                            <tr>
                                <th class="text-center">No.</th>
                                <th>Type</th>
                                <th>Brand</th>
                                <th>Model</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${resources}" var="resource" varStatus="status">
                                <tr>
                                    <td class="text-center">${status.count}</td>
                                    <td>${resource.type}</td>
                                    <td>${resource.brand}</td>
                                    <td>${resource.model}</td>
                                    <td class="text-center">${resource.status}</td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/manage-school/allocate-resource/${crew.id}/${resource.id}/${schoolId}" 
                                           class="manage-btn" 
                                           onclick="return confirmAdd();">
                                            Add
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmAdd() {
            return confirm("Are you sure you want to allocate this resource to the crew member?");
        }
    </script>
</body>
</html>