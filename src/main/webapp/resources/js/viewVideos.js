// Function to fetch and display videos dynamically
function loadVideos() {
    fetch('videos/getAllVideos')
        .then(response => response.json()) // Parse the JSON response
        .then(data => {
            const videoContainer = document.getElementById('video-container'); // Get the video grid container

            // Clear the container before adding new videos
            videoContainer.innerHTML = '';

            // Loop through the data and create video cards
            data.forEach(video => {
                // Create video card div
                const videoCard = document.createElement('div');
                videoCard.classList.add('video-card');

                // Create a video card link
                const videoLink = document.createElement('a');
                videoLink.href = `videos/viewVideo?id=${video.id}`; // Use video ID in the URL
                videoLink.classList.add('video-card');
				
                // Create video thumbnail and duration
                const thumbnailDiv = document.createElement('div');
                thumbnailDiv.classList.add('video-thumbnail');

                const thumbnailImg = document.createElement('img');
                thumbnailImg.src = video.thumbnail;
                thumbnailImg.alt = video.title;
                thumbnailDiv.appendChild(thumbnailImg);

                const durationSpan = document.createElement('span');
                durationSpan.classList.add('video-duration');
                durationSpan.innerText = video.duration;
                thumbnailDiv.appendChild(durationSpan);

                // Create video info section
                const videoInfoDiv = document.createElement('div');
                videoInfoDiv.classList.add('video-info');

                const videoTitle = document.createElement('h3');
                videoTitle.classList.add('video-title');
                videoTitle.innerText = video.title;

                const videoMetaDiv = document.createElement('div');
                videoMetaDiv.classList.add('video-meta');

                const userAvatar = document.createElement('img');
                userAvatar.src = '/path/to/avatar'; // Optional: Fetch user's avatar image if available
                userAvatar.alt = video.username;

                const usernameSpan = document.createElement('span');
                usernameSpan.innerText = video.username;

                videoMetaDiv.appendChild(userAvatar);
                videoMetaDiv.appendChild(usernameSpan);

                const videoStatsDiv = document.createElement('div');
                videoStatsDiv.classList.add('video-stats');
                videoStatsDiv.innerText = 'N/A views • N/A ago'; // Adjust this if you have view counts and upload dates

                videoInfoDiv.appendChild(videoTitle);
                videoInfoDiv.appendChild(videoMetaDiv);
                videoInfoDiv.appendChild(videoStatsDiv);

                // Append thumbnail and video info to the video card
				// Now, append all video elements inside the videoLink
				videoLink.appendChild(thumbnailDiv);
				videoLink.appendChild(videoInfoDiv);
				videoLink.appendChild(videoCard);
				
				// Append the video link to the container
				videoContainer.appendChild(videoLink);
				
                // Append the video card to the container
                //videoContainer.appendChild(videoCard);

                // Debugging: Log the video link
                console.log('Video Link:', videoLink.href);
            });
        })
        .catch(error => {
            console.error('Error fetching video data:', error);
        });
}

// Call the loadVideos function when the page loads
window.onload = loadVideos;
