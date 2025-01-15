function loadVideos() {
    const videoContainer = document.getElementById('video-container');
    
    // Clear the container before adding new videos
    videoContainer.innerHTML = '';

    fetch('videos/getAllVideos')
        .then(response => response.json())
        .then(data => {
            data.forEach(video => {
                // Create video card link (main container)
                const videoLink = document.createElement('a');
                videoLink.href = `videos/viewVideo?id=${video.id}`;
                videoLink.classList.add('video-card');

                // Create thumbnail section
                const thumbnailDiv = document.createElement('div');
                thumbnailDiv.classList.add('video-thumbnail');

                const thumbnailImg = document.createElement('img');
                thumbnailImg.src = video.thumbnail;
                thumbnailImg.alt = video.title;
                thumbnailImg.loading = "lazy"; // Add lazy loading

                const durationSpan = document.createElement('span');
                durationSpan.classList.add('video-duration');
                durationSpan.textContent = video.duration;

                thumbnailDiv.appendChild(thumbnailImg);
                thumbnailDiv.appendChild(durationSpan);

                // Create video info section
                const videoInfoDiv = document.createElement('div');
                videoInfoDiv.classList.add('video-info');

                const videoTitle = document.createElement('h3');
                videoTitle.classList.add('video-title');
                videoTitle.textContent = video.title;

                const videoMetaDiv = document.createElement('div');
                videoMetaDiv.classList.add('video-meta');


                const usernameSpan = document.createElement('span');
                usernameSpan.textContent = video.username;

                videoMetaDiv.appendChild(usernameSpan);

                const videoStatsDiv = document.createElement('div');
                videoStatsDiv.classList.add('video-stats');
                videoStatsDiv.textContent = `${formatViews(video.views)} views • ${video.uploadDuration}`;

                // Assemble the card
                videoInfoDiv.appendChild(videoTitle);
                videoInfoDiv.appendChild(videoMetaDiv);
                videoInfoDiv.appendChild(videoStatsDiv);

                videoLink.appendChild(thumbnailDiv);
                videoLink.appendChild(videoInfoDiv);

                videoContainer.appendChild(videoLink);
            });
        })
        .catch(error => {
            console.error('Error fetching video data:', error);
            videoContainer.innerHTML = '<div class="error-message">Failed to load videos. Please try again later.</div>';
        });
}

// Helper functions for formatting
function formatViews(views) {
    if (views >= 1000000) {
        return (views / 1000000).toFixed(1) + 'M';
    } else if (views >= 1000) {
        return (views / 1000).toFixed(1) + 'K';
    }
    return views;
}

// Initialize
window.addEventListener('load', loadVideos);