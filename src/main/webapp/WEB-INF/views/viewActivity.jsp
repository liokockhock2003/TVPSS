<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Activity Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #f8f9fa;
            --accent-color: #e74c3c;
            --success-color: #27ae60;
            --border-radius: 10px;
        }

        body {
            background-color: var(--secondary-color);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            color: #2c3e50;
            line-height: 1.6;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .admin-header {
            background: var(--primary-color);
            color: white;
            padding: 20px;
            border-radius: var(--border-radius);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-title {
            font-size: 1.8rem;
            margin: 0;
        }

        .card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: none;
            margin-bottom: 30px;
        }

        .detail-section {
            padding: 25px;
            border-bottom: 1px solid #eee;
        }

        .detail-section:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 8px;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .detail-value {
            font-size: 1.1rem;
            color: #34495e;
        }

        .description-box {
            background: #f8f9fa;
            padding: 20px;
            border-radius: var(--border-radius);
            margin-top: 10px;
        }

        .action-bar {
            background: #f8f9fa;
            padding: 20px;
            border-radius: var(--border-radius);
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background-color: #3498db;
            color: white;
            border: none;
        }

        .btn-delete {
            background-color: var(--accent-color);
            color: white;
            border: none;
        }

        .btn-back {
            background-color: #95a5a6;
            color: white;
            border: none;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            color: white;
        }

        .alert {
            border-radius: var(--border-radius);
            padding: 16px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            border: none;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Messages -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle"></i>
                ${error}
            </div>
        </c:if>
        <c:if test="${not empty message}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i>
                ${message}
            </div>
        </c:if>

        <div class="admin-header">
            <h1 class="admin-title">
                <i class="fas fa-clipboard-list"></i>
                Activity Management
            </h1>
        </div>

        <div class="card">
            <div class="detail-section">
                <div class="detail-label">Title</div>
                <div class="detail-value">${activity.title}</div>
            </div>

            <div class="detail-section">
                <div class="detail-label">Date & Time</div>
                <div class="detail-value">
                    <i class="far fa-calendar-alt me-2"></i>
                    ${activity.date}
                </div>
            </div>

            <div class="detail-section">
                <div class="detail-label">Location</div>
                <div class="detail-value">
                    <i class="fas fa-map-marker-alt me-2"></i>
                    ${activity.place}
                </div>
            </div>

            <div class="detail-section">
                <div class="detail-label">Capacity</div>
                <div class="detail-value">
                    <i class="fas fa-users me-2"></i>
                    ${activity.maxParticipants} participants maximum
                </div>
            </div>

            <div class="detail-section">
                <div class="detail-label">Description</div>
                <div class="detail-value description-box">
                    ${activity.description}
                </div>
            </div>
        </div>

        <div class="action-bar">
            <c:url var="editUrl" value="/activities/edit/${activity.id}" />
            <c:url var="deleteUrl" value="/activities/delete/${activity.id}" />
            <c:url var="backUrl" value="/activities" />

            <a href="${editUrl}" class="btn btn-edit">
                <i class="fas fa-edit"></i>
                Edit Activity
            </a>

            <form action="${deleteUrl}" method="post" style="display: inline;" id="deleteForm">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit" class="btn btn-delete">
                    <i class="fas fa-trash-alt"></i>
                    Delete
                </button>
            </form>

            <a href="${backUrl}" class="btn btn-back">
                <i class="fas fa-arrow-left"></i>
                Back
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('deleteForm').onsubmit = function(e) {
            if (!confirm('Are you sure you want to delete this activity?')) {
                e.preventDefault();
                return false;
            }
            return true;
        };
    </script>
</body>
</html>