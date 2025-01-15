package com.controller;

import com.entity.Like;

import com.service.LikeDao;
import com.service.VideoDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/likes")
public class LikeController {

	@Autowired
	private LikeDao likeService;
	
	@Autowired
	private VideoDao videoService;

	// Add a like
	@PostMapping("/addLike")
	public ResponseEntity<Map<String, Object>> addLike(@RequestParam("videoId") int videoId, @RequestParam("userId") int userId) {
		List<Like> existLike = likeService.getSpecificLike(videoId, userId);
		if (!existLike.isEmpty()) {
			likeService.removeLikes(videoId, userId);
			videoService.decrementLikes(videoId);
		} else {
			likeService.addLike(videoId, userId);
			videoService.incrementLikes(videoId);
		}
		
		
		// Optionally, retrieve the updated like count
		Long likeCountLong = likeService.getLikeCountByVideoId(videoId); // Assume this returns a Long

		Map<String, Object> response = new HashMap<>();
		response.put("newLikeCount", likeCountLong);

		return ResponseEntity.ok(response); // Return the updated like count
	}

	// Remove a like
	@DeleteMapping("/remove")
	public void removeLike(@RequestParam int videoId, @RequestParam int userId) {
		likeService.removeLikes(videoId, userId);
	}

	// Get total likes for a video
	@GetMapping("/count/{videoId}")
	public int getLikeCount(@PathVariable int videoId) {
	    Long likeCount = likeService.getLikeCountByVideoId(videoId);
	    
	    if (likeCount == null) {
	        return 0;  // Handle case where no likes exist for the video
	    }

	    // Safely cast Long to int, ensuring the value fits within the int range
	    return likeCount.intValue();
	}

}
