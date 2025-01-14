document.addEventListener("DOMContentLoaded", function() {
	const videoId = document.getElementById("video-id").value;
	const commentsContainer = document.getElementById("comments-container");
	const commentInput = document.getElementById("comment-text");
	const submitCommentBtn = document.getElementById("submit-comment-btn");
	const csrfToken = document.getElementById("csrf-token").value;
	const userId = document.getElementById("user-id").value;

	// Fetch comments from the backend
	function fetchComments() {
		fetch(`../comments/video/${videoId}`)
			.then(response => response.json())
			.then(comments => {
				commentsContainer.innerHTML = ""; // Clear the container

				comments.forEach(comment => {
					const commentElement = document.createElement("div");
					commentElement.classList.add("comment");

					const userAvatarDiv = document.createElement("div");
					userAvatarDiv.classList.add("user-avatar");
					commentElement.appendChild(userAvatarDiv);

					const commentContentDiv = document.createElement("div");
					commentContentDiv.classList.add("comment-content");

					const commentAuthorDiv = document.createElement("div");
					commentAuthorDiv.classList.add("comment-author");
					commentAuthorDiv.textContent = comment.username; // Assuming comment contains 'username'
					commentContentDiv.appendChild(commentAuthorDiv);

					const commentTextDiv = document.createElement("div");
					commentTextDiv.classList.add("comment-text");
					commentTextDiv.textContent = comment.comment; // Assuming comment contains 'comment'
					commentContentDiv.appendChild(commentTextDiv);

					commentElement.appendChild(commentContentDiv);
					commentsContainer.appendChild(commentElement);
				});
			})
			.catch(error => console.error("Error fetching comments:", error));
	}

	// Submit a new comment
	submitCommentBtn.addEventListener("click", function() {
		const commentText = commentInput.value.trim();

		if (commentText !== "") {
			fetch("../comments/add", {
				method: "POST",
				headers: {
					"Content-Type": "application/json",
					"X-CSRF-TOKEN": csrfToken
				},
				body: JSON.stringify({
					videoId: parseInt(videoId), // Ensure these are integers
					userId: parseInt(userId),
					comment: commentText
				})
			})
				.then(response => {
					if (response.ok) {
						commentInput.value = ""; // Clear the input field
						fetchComments(); // Refresh the comments section
					} else {
						console.error("Error adding comment:", response.statusText);
					}
				})
				.catch(error => console.error("Error adding comment:", error));
		}
	});

	// Initial fetch of comments
	fetchComments();
});
