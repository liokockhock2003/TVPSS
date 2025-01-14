package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Map;

import com.service.CommentDao;
import com.service.VideoDao;
import com.entity.Comment;




@RestController
@RequestMapping("/comments")
public class CommentController {

	@Autowired
	private CommentDao commentService;
	
	@Autowired
	private VideoDao videoService;

	// Fetch all comments for a specific video
	@GetMapping("/video/{videoId}")
	public List<Comment> getCommentsByVideoId(@PathVariable int videoId) {
		return commentService.getCommentsByVideoId(videoId);
	}

	//Add comment for a specific video
	@PostMapping("/add")
	public ResponseEntity<String> addComment(@RequestBody Map<String, Object> payload) {
	    try {
	        // Extract data from the payload
	        int videoId = (int) payload.get("videoId");
	        int userId = (int) payload.get("userId");
	        String commentText = (String) payload.get("comment");

	        // Create a new Comment object
	        Comment comment = new Comment();
	        comment.setVideoId(videoId);
	        comment.setUserId(userId);
	        comment.setComment(commentText);

	        // Save the comment
	        commentService.addComment(comment);
	        videoService.incrementComments(videoId);

	        return ResponseEntity.ok("Comment added successfully.");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Failed to add comment.");
	    }
	}

}
