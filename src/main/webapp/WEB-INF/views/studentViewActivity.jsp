<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Activity Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #f8f9fa;
            --text-color: #2c3e50;
            --success-color: #2ecc71;
            --warning-color: #e74c3c;
            --border-radius: 12px;
        }

        body {
            background-color: var(--secondary-color);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .activity-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            margin-bottom: 30px;
        }

        .activity-header {
            background: linear-gradient(135deg, var(--primary-color), #74b9ff);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .activity-title {
            font-size: 2rem;
            margin: 0;
            font-weight: 600;
        }

        .activity-content {
            padding: 30px;
        }

        .info-item {
            margin-bottom: 25px;
            padding: 15px;
            border-radius: var(--border-radius);
            background: rgba(52, 152, 219, 0.05);
            transition: transform 0.2s ease;
        }

        .info-item:hover {
            transform: translateX(5px);
        }

        .info-label {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }

        .info-value {
            font-size: 1.1rem;
            color: var(--text-color);
        }

        .capacity-status {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 500;
            margin-top: 10px;
        }

        .capacity-status.available {
            background-color: rgba(46, 204, 113, 0.1);
            color: var(--success-color);
        }

        .capacity-status.full {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--warning-color);
        }

        .description-box {
            background: #f8f9fa;
            padding: 20px;
            border-radius: var(--border-radius);
            margin-top: 15px;
            border-left: 4px solid var(--primary-color);
        }

        .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            background-color: var(--primary-color);
            color: white;
            border-radius: 25px;
            text-decoration: none;
            transition: all 0.3s ease;
            border: none;
            font-weight: 500;
        }

        .btn-back:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            color: white;
        }

        .icon {
            width: 20px;
            height: 20px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="activity-card">
            <div class="activity-header">
                <h1 class="activity-title">${activity.title}</h1>
            </div>
            
            <div class="activity-content">
                <div class="info-item">
                    <div class="info-label">
                        <i class="far fa-calendar-alt icon"></i>
                        Date & Time
                    </div>
                    <div class="info-value">${activity.date}</div>
                </div>

                <div class="info-item">
                    <div class="info-label">
                        <i class="fas fa-map-marker-alt icon"></i>
                        Location
                    </div>
                    <div class="info-value">${activity.place}</div>
                </div>

                <div class="info-item">
                    <div class="info-label">
                        <i class="fas fa-users icon"></i>
                        Capacity
                    </div>
                    <div class="info-value">
                        ${activity.currentParticipants}/${activity.maxParticipants}
                        <c:if test="${activity.hasCapacity()}">
                            <div class="capacity-status available">
                                <i class="fas fa-check-circle"></i>
                                ${activity.remainingCapacity} spots remaining
                            </div>
                        </c:if>
                        <c:if test="${!activity.hasCapacity()}">
                            <div class="capacity-status full">
                                <i class="fas fa-exclamation-circle"></i>
                                Activity Full
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-label">
                        <i class="fas fa-info-circle icon"></i>
                        Description
                    </div>
                    <div class="info-value description-box">
                        ${activity.description}
                    </div>
                </div>

                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/activities/student-dashboard" 
                       class="btn-back">
                        <i class="fas fa-arrow-left"></i>
                        Back to Activities
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>