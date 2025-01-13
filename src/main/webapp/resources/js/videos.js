document.addEventListener("DOMContentLoaded", () => {
	const videoList = document.getElementById("video-list");

	// Fetch video data from the backend
	fetch("videos/getVideos", {
		headers: {
			"Accept": "application/json"
		}
	}) // Adjust URL as needed
		.then(response => {
			if (!response.ok) {
				throw new Error(`HTTP error! status: ${response.status}`);
			}
			return response.json();
		})
		.then(videos => {
			// Clear existing content
			videoList.innerHTML = "";

			// Populate table rows dynamically
			videos.forEach((video, index) => {
				const row = document.createElement("tr");

				row.innerHTML = `
                    <td>${index + 1}</td>
                    <td>
                        <div class="video-preview">
                            <img src="${video.thumbnail}" alt="Video thumbnail" class="thumbnail" />
                            <span>${video.duration}</span>
                        </div>
                    </td>
                    <td>${video.title}</td>
                    <td><span class="status-badge status-${video.status.toLowerCase()}">${video.status}</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="edit-btn">Edit Title and Description</button>
                            <button class="delete-btn">Delete</button>
                        </div>
                    </td>
                `;

				videoList.appendChild(row);
			});
		})
		.catch(error => {
			console.error("Error fetching videos:", error);
			videoList.innerHTML = `<tr><td colspan="5">Failed to load videos. Please try again later.</td></tr>`;
		});
});
