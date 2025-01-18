<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add News</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2962ff;
            --secondary-color: #0039cb;
            --background: #f8f9fa;
            --card-bg: #ffffff;
            --text-color: #333;
            --border-radius: 15px;
            --transition: all 0.3s ease;
        }

        body {
            background: var(--background);
            color: var(--text-color);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            min-height: 100vh;
            padding: 2rem 0;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(41, 98, 255, 0.1), rgba(0, 57, 203, 0.1));
            z-index: -1;
        }

        .container {
            max-width: 800px;
        }

        .form-container {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            transition: var(--transition);
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 48px rgba(0, 0, 0, 0.15);
        }

        h1 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 2rem;
            position: relative;
            display: inline-block;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 60%;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), transparent);
        }

        .form-control {
            border-radius: 10px;
            border: 2px solid #e0e0e0;
            padding: 0.75rem;
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(41, 98, 255, 0.25);
        }

        .form-label {
            font-weight: 600;
            color: var(--text-color);
            margin-bottom: 0.5rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 10px;
            font-weight: 600;
            transition: var(--transition);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-primary {
            background: var(--primary-color);
            border: none;
            box-shadow: 0 4px 15px rgba(41, 98, 255, 0.3);
        }

        .btn-primary:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(41, 98, 255, 0.4);
        }

        .btn-secondary {
            background: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-secondary:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }

        .file-upload {
            position: relative;
            overflow: hidden;
        }

        .file-upload input[type=file] {
            cursor: pointer;
        }

        /* Animation for form elements */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .mb-3 {
            animation: fadeInUp 0.5s ease forwards;
            opacity: 0;
        }

        .mb-3:nth-child(1) { animation-delay: 0.1s; }
        .mb-3:nth-child(2) { animation-delay: 0.2s; }
        .mb-3:nth-child(3) { animation-delay: 0.3s; }
        .mb-3:nth-child(4) { animation-delay: 0.4s; }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1><i class="fas fa-newspaper me-2"></i>Add News</h1>
            
            <form action="${pageContext.request.contextPath}/news/add-news" method="post" 
                  enctype="multipart/form-data" modelAttribute="news">
                
                <div class="mb-3">
                    <label for="author" class="form-label">
                        <i class="fas fa-user me-2"></i>Author
                    </label>
                    <input type="text" class="form-control" id="author" name="author" 
                           required placeholder="Enter author name">
                </div>

                <div class="mb-3">
                    <label for="title" class="form-label">
                        <i class="fas fa-heading me-2"></i>Title
                    </label>
                    <input type="text" class="form-control" id="title" name="title" 
                           required placeholder="Enter article title">
                </div>

                <div class="mb-3 file-upload">
                    <label for="picture" class="form-label">
                        <i class="fas fa-image me-2"></i>Picture
                    </label>
                    <input type="file" class="form-control" id="picture" name="picture" 
                           accept="image/*">
                </div>

                <div class="mb-3">
                    <label for="content" class="form-label">
                        <i class="fas fa-pen-fancy me-2"></i>Content
                    </label>
                    <textarea class="form-control" id="content" name="content" 
                              rows="6" required placeholder="Write your article content here..."></textarea>
                </div>

                <div class="d-flex gap-3 mt-4">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-paper-plane me-2"></i>Submit
                    </button>
                    <a href="${pageContext.request.contextPath}/news" class="btn btn-secondary">
                        <i class="fas fa-times me-2"></i>Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>