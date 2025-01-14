document.addEventListener("DOMContentLoaded", () => {
	// Retrieve the CSRF token from the hidden input
	const csrfToken = document.getElementById("csrf-token").value;
	const videoList = document.getElementById("video-list");

	// Function to load videos
	function loadVideos() {
		fetch("videos/getVideos", {
			headers: {
				"Accept": "application/json"
			}
		})
			.then(response => {
				if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
				return response.json();
			})
			.then(videos => {
				videoList.innerHTML = "";
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
                    <td>
                        <span class="video-title">${video.title}</span>
                        <div class="edit-form" style="display: none;">
                            <input type="text" class="title-input" value="${video.title}">
                            <textarea class="description-input">${video.description}</textarea>
                            <button class="save-btn">Save</button>
                            <button class="cancel-btn">Cancel</button>
                        </div>
                    </td>
                    <td><span class="status-badge status-${video.status.toLowerCase()}">${video.status}</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="edit-btn" data-video-id="${video.id}">Edit Title and Description</button>
                            <button class="delete-btn" data-video-id="${video.id}">Delete</button>
                        </div>
                    </td>
                `;

					// Add event listeners
					const editBtn = row.querySelector('.edit-btn');
					const deleteBtn = row.querySelector('.delete-btn');
					const editForm = row.querySelector('.edit-form');
					const saveBtn = row.querySelector('.save-btn');
					const cancelBtn = row.querySelector('.cancel-btn');
					const videoTitle = row.querySelector('.video-title');

					// Edit button click handler
					editBtn.addEventListener('click', () => {
						videoTitle.style.display = 'none';
						editForm.style.display = 'block';
					});

					// Cancel button click handler
					cancelBtn.addEventListener('click', () => {
						videoTitle.style.display = 'block';
						editForm.style.display = 'none';
					});

					// Save button click handler
					saveBtn.addEventListener('click', () => {
						const videoId = editBtn.dataset.videoId;
						const newTitle = row.querySelector('.title-input').value;
						const newDescription = row.querySelector('.description-input').value;

						updateVideo(videoId, newTitle, newDescription, row);
					});

					// Delete button click handler
					deleteBtn.addEventListener('click', () => {
						const videoId = deleteBtn.dataset.videoId;
						if (confirm('Are you sure you want to delete this video?')) {
							deleteVideo(videoId, row);
						}
					});

					videoList.appendChild(row);
				});
			})
			.catch(error => {
				console.error("Error fetching videos:", error);
				videoList.innerHTML = `<tr><td colspan="5">Failed to load videos. Please try again later.</td></tr>`;
			});
	}

	// Function to update video
	function updateVideo(videoId, title, description, row) {
		fetch(`videos/update/${videoId}`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				"X-CSRF-TOKEN": csrfToken
			},
			body: JSON.stringify({
				title: title,
				description: description
			})
		})
			.then(response => {
				if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
				return response.json();
			})
			.then(updatedVideo => {
				// Update the UI
				row.querySelector('.video-title').textContent = updatedVideo.title;
				row.querySelector('.edit-form').style.display = 'none';
				row.querySelector('.video-title').style.display = 'block';

				// Show success message
				showNotification('Video updated successfully');
			})
			.catch(error => {
				console.error('Error updating video:', error);
				showNotification('Failed to update video', 'error');
			});
	}

	// Function to delete video
	function deleteVideo(videoId, row) {
		fetch(`videos/delete/${videoId}`, {
			method: 'DELETE',
			headers: {
				"X-CSRF-TOKEN": csrfToken
			},
		})
			.then(response => {
				if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
				return response.text();
			})
			.then(() => {
				// Remove the row from the table
				row.remove();
				showNotification('Video deleted successfully');
			})
			.catch(error => {
				console.error('Error deleting video:', error);
				showNotification('Failed to delete video', 'error');
			});
	}

	// Function to show notifications
	function showNotification(message, type = 'success') {
		// You can implement your own notification system here
		alert(message);
	}

	// Initial load
	loadVideos();
});