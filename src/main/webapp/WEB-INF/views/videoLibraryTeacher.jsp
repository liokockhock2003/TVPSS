<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TVPSS - Video Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, sans-serif;
        }

        body {
            background-color: #f9f9f9;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
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

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 20px;
        }

        /* Header Styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .search-bar {
            flex: 1;
            max-width: 600px;
            margin: 0 20px;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 12px 40px 12px 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .search-bar::after {
            content: "🔍";
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .user-profile img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
        }
        
        /* Upload Button */
        .upload-section {
            margin-bottom: 24px;
        }

        .upload-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: #333;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
        }

        .upload-button:hover {
            background-color: #f5f5f5;
        }

        /* Video Grid Styles */
        .video-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
            padding: 20px 0;
        }

        .category-title {
            font-size: 1.5rem;
            margin: 20px 0;
            color: #333;
        }

        .video-card {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .video-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        .video-thumbnail {
            position: relative;
            padding-top: 56.25%; /* 16:9 Aspect Ratio */
            background-color: #000;
        }

        .video-thumbnail img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .video-duration {
            position: absolute;
            bottom: 8px;
            right: 8px;
            background: rgba(0,0,0,0.8);
            color: white;
            padding: 3px 6px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        .video-info {
            padding: 16px;
        }

        .video-title {
            font-weight: 500;
            margin-bottom: 8px;
            font-size: 14px;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .video-meta {
            display: flex;
            align-items: center;
            color: #666;
            font-size: 13px;
            margin-bottom: 4px;
        }

        .video-meta img {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            margin-right: 8px;
        }

        .video-stats {
            font-size: 12px;
            color: #666;
        }

        .channel-name {
            margin-bottom: 4px;
        }

        /* Platform Icons */
        .platform-icon {
            width: 20px;
            height: 20px;
            margin-right: 8px;
            vertical-align: middle;
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
            <div class="header">
                <div class="search-bar">
                    <input type="text" placeholder="Search...">
                </div>
                <div class="user-profile">
                    <span>Katie Pena</span>
                    <img src="/api/placeholder/36/36" alt="User Profile">
                </div>
            </div>

			<!-- Upload Section -->
            <div class="upload-section">
                <button class="upload-button">
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8 3v10M3 8h10" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                    </svg>
                    Upload
                </button>
            </div>
            <!-- My Mix Section -->
            <div class="video-grid">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="/api/placeholder/280/157" alt="Hans Zimmer Mix">
                        <span class="video-duration">50:14</span>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Hans Zimmer and more</h3>
                        <div class="video-meta">
                            <img src="/api/placeholder/24/24" alt="Channel Avatar">
                            <span>Epic Music</span>
                        </div>
                        <div class="video-stats">2.1M views • 3 years ago</div>
                    </div>
                </div>

                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="/api/placeholder/280/157" alt="Design System">
                        <span class="video-duration">54:48</span>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Build It in Figma: Create a Design System</h3>
                        <div class="video-meta">
                            <img src="/api/placeholder/24/24" alt="Figma">
                            <span>Figma</span>
                        </div>
                        <div class="video-stats">156K views • 2 months ago</div>
                    </div>
                </div>

                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="/api/placeholder/280/157" alt="Piano Music">
                        <span class="video-duration">10:13</span>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Beautiful Piano Soundtracks | Relaxing Piano</h3>
                        <div class="video-meta">
                            <img src="/api/placeholder/24/24" alt="Jacob's Piano">
                            <span>Jacob's Piano</span>
                        </div>
                        <div class="video-stats">63M views • 4 years ago</div>
                    </div>
                </div>

                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="/api/placeholder/280/157" alt="Design and Code">
                        <span class="video-duration">24:45</span>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Config Europe 2020: Embracing the tension between Design and Code</h3>
                        <div class="video-meta">
                            <img src="/api/placeholder/24/24" alt="Figma">
                            <span>Figma</span>
                        </div>
                        <div class="video-stats">27K views • 1 month ago</div>
                    </div>
                </div>
            </div>

            <!-- Movie Trailers Section -->
            <div class="video-grid">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="/api/placeholder/280/157" alt="Dark Knight">
                        <span class="video-duration">3:03</span>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">The Dark Knight Rises (2012) - Official Trailer</h3>
                        <div class="video-meta">
                            <img src="/api/placeholder/24/24" alt="Movieclips">
                            <span>Movieclips Trailers</span>
                        </div>
                        <div class="video-stats">10M views • 3 years ago</div>
                    </div>
                </div>

                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="/api/placeholder/280/157" alt="Interstellar">
                        <span class="video-duration">16:13</span>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Interstellar Main Theme - Hans Zimmer</h3>
                        <div class="video-meta">
                            <img src="/api/placeholder/24/24" alt="Epic Piano">
                            <span>Epic Piano</span>
                        </div>
                        <div class="video-stats">11M views • 5 years ago</div>
                    </div>
                </div>

                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="/api/placeholder/280/157" alt="Batman">
                        <span class="video-duration">2:33</span>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">The Batman Teaser Trailer (2021)</h3>
                        <div class="video-meta">
                            <img src="/api/placeholder/24/24" alt="Movieclips">
                            <span>Movieclips Trailers</span>
                        </div>
                        <div class="video-stats">10M views • 3 years ago</div>
                    </div>
                </div>

                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="/api/placeholder/280/157" alt="Justice League">
                        <span class="video-duration">2:13</span>
                    </div>
                    <div class="video-info">
                        <h3 class="video-title">Justice League: Dawn of Justice - Official Trailer</h3>
                        <div class="video-meta">
                            <img src="/api/placeholder/24/24" alt="Movieclips">
                            <span>Movieclips Trailers</span>
                        </div>
                        <div class="video-stats">28M views • 6 years ago</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>