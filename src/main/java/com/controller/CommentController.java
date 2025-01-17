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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.service.CommentDao;
import com.service.StudentDao;
import com.service.TeacherDao;
import com.service.UserDao;
import com.service.VideoDao;
import com.entity.Comment;
import com.entity.Student;
import com.entity.Teacher;
import com.entity.Users;




@RestController
@RequestMapping("/comments")
public class CommentController {

	@Autowired
	private CommentDao commentService;
	
	@Autowired
	private UserDao userService;
	
	@Autowired
	private VideoDao videoService;
	
	@Autowired
	private TeacherDao teacherService;
	
	@Autowired
	private StudentDao studentService;

	// Fetch all comments for a specific video
	@GetMapping("/video/{videoId}")
	public List<Map<String, Object>> getCommentsByVideoId(@PathVariable int videoId) {
	    List<Comment> comments = commentService.getCommentsByVideoId(videoId);
	    List<Map<String, Object>> commentsWithNames = new ArrayList<>();
	    
	    for (Comment comment : comments) {
	        Map<String, Object> commentMap = new HashMap<>();
	        Users user = userService.findById(comment.getUserId());
	        
	        String name = null;
	        if (user != null) {
	            if ("TEACHER".equals(user.getRole())) {
	                Teacher teacher = teacherService.getTeacherByUserId(user.getId());
	                name = teacher != null ? teacher.getName() : "Unknown Teacher";
	            } else if ("STUDENT".equals(user.getRole())) {
	                Student student = studentService.getStudentByUserId(user.getId());
	                name = student != null ? student.getName() : "Unknown Student";
	            }
	        }
	        
	        commentMap.put("id", comment.getId());
	        commentMap.put("comment", comment.getComment());
	        commentMap.put("userId", comment.getUserId());
	        commentMap.put("username", name);
	        commentMap.put("videoId", comment.getVideoId());
	        
	        commentsWithNames.add(commentMap);
	    }
	    
	    return commentsWithNames;
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
