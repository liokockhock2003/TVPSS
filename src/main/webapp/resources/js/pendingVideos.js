// pendingVideos.js
document.addEventListener("DOMContentLoaded", () => {
	const videoTable = document.querySelector(".video-validation table");
	const tableBody = videoTable.querySelector("tbody") || videoTable;

	// Function to handle approve/reject actions
	const handleStatusUpdate = async (videoId, status) => {
		try {
			// Get CSRF token from hidden input field
			const csrfToken = document.getElementById("csrf-token").value;
			const response = await fetch(`videos/${videoId}/status?status=${status}`, {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
					'X-CSRF-TOKEN': csrfToken  // Add CSRF token to header
				}
			});

			if (!response.ok) {
				throw new Error(`HTTP error! status: ${response.status}`);
			}

			// Refresh the video list after successful update
			loadPendingVideos();
		} catch (error) {
			console.error('Error updating video status:', error);
			alert('Failed to update video status. Please try again.');
		}
	};

	// Function to create a table row for a video
	const createVideoRow = (video, index) => {
		const row = document.createElement("tr");
		row.innerHTML = `
            <td>${index + 1}.</td>
            <td>
                <img src="${video.thumbnail}" 
                     class="video-thumbnail" 
                     alt="Video"
                     onerror="this.src='https://via.placeholder.com/200x120'">
            </td>
            <td>
                <span>${video.title}</span><br>
                ${video.school}
            </td>
            <td class="action-buttons">
                <button class="btn btn-approve">Approve</button>
                <button class="btn btn-reject">Reject</button>
            </td>`;

		// Add event listeners for approve/reject buttons
		const approveBtn = row.querySelector('.btn-approve');
		const rejectBtn = row.querySelector('.btn-reject');

		approveBtn.addEventListener('click', () => handleStatusUpdate(video.id, 'Approved'));
		rejectBtn.addEventListener('click', () => handleStatusUpdate(video.id, 'Rejected'));

		return row;
	};

	// Function to load pending videos
	const loadPendingVideos = async () => {
		try {
			const response = await fetch('videos/pending', {
				headers: {
					'Accept': 'application/json'
				}
			});

			if (!response.ok) {
				throw new Error(`HTTP error! status: ${response.status}`);
			}

			const videos = await response.json();

			// Clear existing rows except header
			const rows = tableBody.getElementsByTagName('tr');
			for (let i = rows.length - 1; i > 0; i--) {
				tableBody.removeChild(rows[i]);
			}

			// Add new rows
			videos.forEach((video, index) => {
				const row = createVideoRow(video, index);
				tableBody.appendChild(row);
			});

		} catch (error) {
			console.error('Error fetching pending videos:', error);
			tableBody.innerHTML += `
                <tr>
                    <td colspan="4" style="text-align: center; color: red;">
                        Failed to load videos. Please refresh the page.
                    </td>
                </tr>
            `;
		}
	};

	// Initial load
	loadPendingVideos();
});