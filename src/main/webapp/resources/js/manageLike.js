document.getElementById("like-btn").addEventListener("click", function() {
	// Get video and user ID from the button's data attributes
	const videoId = this.getAttribute("data-video-id");
	const userId = this.getAttribute("data-user-id");

	// Send the like request to the backend
	const csrfToken = document.getElementById("csrf-token").value;
	fetch(`../likes/addLike?videoId=${videoId}&userId=${userId}`, {
		method: 'POST',
		headers: {
			'X-CSRF-TOKEN': csrfToken
		}
	})
		.then(response => response.json())
		.then(data => {
			// Optionally, update the like count displayed on the button
			const likeCountElement = document.getElementById(`like-count-${videoId}`);
			if (likeCountElement) {
				// Assuming the backend returns the updated like count
				likeCountElement.textContent = `${data.newLikeCount}`;
			}
		})
		.catch(error => {
			console.error("Error liking the video:", error);
		});
});