<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Video Preview</title>
    <style>
        /* Base font and styling reset */
        body {
            font-family: Arial, "Helvetica Neue", sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        /* Enhanced video container */
        .video-container {
            max-width: 1200px;  /* Increased from 800px for higher resolution */
            margin: 30px auto;  /* Increased margin for better spacing */
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            background: white;
            border-radius: 16px;  /* Added rounded corners */
        }

        /* Enhanced video player */
        .video-player {
            width: 100%;
            aspect-ratio: 16/9;
            background: #000;
            border-radius: 12px;  /* Rounded corners for video player */
            overflow: hidden;  /* Ensures video respects border radius */
        }

        /* Enhanced title styling */
        .video-title {
            font-size: 1.8rem;  /* Increased from 1.5rem */
            margin: 20px 0;
            color: #333;
            font-weight: 600;
            letter-spacing: 0.3px;
        }

        /* Enhanced back button */
        .back-button {
            display: inline-block;
            padding: 12px 24px;  /* Increased padding */
            background-color: #9c27b0;
            color: white;
            text-decoration: none;
            border-radius: 8px;  /* Increased border radius */
            margin-top: 20px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
        }

        .back-button:hover {
            background-color: #7b1fa2;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(156, 39, 176, 0.3);
        }

        /* Added focus state for accessibility */
        .back-button:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(156, 39, 176, 0.3);
        }

        /* Added responsive design */
        @media (max-width: 1300px) {
            .video-container {
                max-width: 90%;
                margin: 20px auto;
            }
        }
    </style>
</head>
<body>
    <div class="video-container">
        <video class="video-player" controls>
            <source src="../${video.filePath}" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <h2 class="video-title">${video.title}</h2>
        <p>${video.description }</p>
        <a href="javascript:history.back()" class="back-button">Back to List</a>
    </div>
</body>
</html>