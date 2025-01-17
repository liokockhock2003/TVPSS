document.addEventListener("DOMContentLoaded", function() {
    const videoId = document.getElementById("video-id").value;
    const commentsContainer = document.getElementById("comments-container");
    const commentsCountSpan = document.getElementById("comments-count");
    const commentsListDiv = document.getElementById("comments-list");
    const commentInput = document.getElementById("comment-text");
    const submitCommentBtn = document.getElementById("submit-comment-btn");
    const csrfToken = document.getElementById("csrf-token").value;
    const userId = document.getElementById("user-id").value;

    // Update comments count
    function updateCommentsCount(count) {
        commentsCountSpan.textContent = `${count} ${count === 1 ? 'Comment' : 'Comments'}`;
    }

    // Fetch comments from the backend
	function fetchComments() {
		fetch(`../comments/video/${videoId}`)
		       .then(response => response.json())
		       .then(comments => {
		           commentsListDiv.innerHTML = "";
		           updateCommentsCount(comments.length);

		           comments.forEach(comment => {
		               const commentElement = document.createElement("div");
		               commentElement.classList.add("comment");

		               commentElement.innerHTML = `
		                   <div class="comment-content">
		                       <div class="comment-author">${comment.username}</div>
		                       <div class="comment-text">${comment.comment}</div>
		                   </div>
		               `;

		               commentsListDiv.appendChild(commentElement);
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
                    videoId: parseInt(videoId),
                    userId: parseInt(userId),
                    comment: commentText
                })
            })
            .then(response => {
                if (response.ok) {
                    commentInput.value = "";
                    fetchComments();
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