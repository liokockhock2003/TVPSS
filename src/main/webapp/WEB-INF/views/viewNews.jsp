<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TVPSS - News</title>
    <link href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #9c27b0;
            --secondary-color: #f8f9fa;
            --text-color: #2d3748;
            --accent-color: #6b46c1;
            --border-radius: 16px;
        }

        .main-container {
            display: flex;
            min-height: 100vh;
            background: linear-gradient(135deg, #f6f8fb 0%, #f1f4f9 100%);
        }

        .main-content {
            flex: 1;
            padding: 30px 40px;
            position: relative;
        }

        /* Enhanced article container */
        .article-container {
            max-width: 900px;
            margin: 2rem auto;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        .article-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.15);
        }

        /* Enhanced article header */
        .article-header {
            padding: 3rem;
            background: linear-gradient(to right, #ffffff, #f8f9fa);
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .article-header h1 {
            font-size: 2.8rem;
            color: var(--text-color);
            margin-bottom: 1.8rem;
            font-weight: 800;
            line-height: 1.3;
            letter-spacing: -0.5px;
        }

        /* Enhanced meta information */
        .article-meta {
            display: flex;
            align-items: center;
            gap: 2.5rem;
            color: #64748b;
            font-size: 1.1rem;
            margin-bottom: 1rem;
            flex-wrap: wrap;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            padding: 8px 16px;
            background: rgba(156, 39, 176, 0.05);
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .meta-item:hover {
            background: rgba(156, 39, 176, 0.1);
            transform: translateX(5px);
        }

        .meta-item i {
            color: var(--primary-color);
            font-size: 1.3rem;
        }

        /* Enhanced image section */
        .article-image {
            position: relative;
            width: 100%;
            padding: 2rem;
            background: linear-gradient(to bottom, #f8f9fa, #ffffff);
        }

        .article-image img {
            width: 70%;
            height: auto;
            border-radius: 12px;
            margin: 0 auto;
            display: block;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .article-image img:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        /* Enhanced content section */
        .article-content {
            padding: 3rem;
            color: #4a5568;
            font-size: 1.25rem;
            line-height: 1.9;
            letter-spacing: 0.3px;
        }

        .article-content p {
            margin-bottom: 1.8rem;
        }

        /* Enhanced user section */
        .user-section {
            display: flex;
            align-items: center;
            gap: 15px;
            position: absolute;
            top: 25px;
            right: 40px;
            background: white;
            padding: 12px 24px;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

        .user-section:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.12);
        }

        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            box-shadow: 0 2px 10px rgba(156, 39, 176, 0.2);
        }

        /* Enhanced search bar */
        .search-container {
            position: relative;
            max-width: 450px;
            margin-bottom: 2rem;
        }

        .search-bar {
            width: 100%;
            padding: 15px 25px;
            padding-left: 50px;
            border: 2px solid #e2e8f0;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            transition: all 0.3s ease;
            background-color: white;
        }

        .search-bar:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(156, 39, 176, 0.1);
        }

        .search-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            font-size: 1.2rem;
        }

        /* Enhanced responsive design */
        @media (max-width: 768px) {
            .article-container {
                margin: 1rem;
            }
            
            .article-header {
                padding: 2rem;
            }
            
            .article-header h1 {
                font-size: 2.2rem;
            }
            
            .article-content {
                padding: 2rem;
                font-size: 1.1rem;
            }
            
            .article-meta {
                flex-direction: column;
                gap: 1rem;
            }

            .article-image img {
                width: 90%;
            }

            .user-section {
                position: relative;
                top: 0;
                right: 0;
                margin-bottom: 20px;
            }
        }

        /* Animation for page load */
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

        .article-container {
            animation: fadeInUp 0.6s ease-out;
        }
    </style>
</head>
<body>
    <div class="main-container">
        

            <!-- Article Container -->
            <div class="article-container">
                <div class="article-header">
                    <h1>${news.title}</h1>
                    <div class="article-meta">
                        <div class="meta-item">
                            <i class="fas fa-user-edit"></i>
                            <span><strong>Author:</strong> ${news.author}</span>
                        </div>
                        <div class="meta-item">
                            <i class="fas fa-clock"></i>
                            <span><strong>Published:</strong> ${news.datePublished}</span>
                        </div>
                    </div>
                </div>
                
                <c:if test="${not empty news.picturePath}">
                    <div class="article-image">
                        <img src="../${news.picturePath}" alt="News Picture">
                    </div>
                </c:if>
                
                <div class="article-content">
                    <p>${news.content}</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>