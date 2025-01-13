package com.controller;

import com.entity.Users;
import com.entity.Video;
import com.service.UserDao;
import com.service.VideoDao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/videos")
public class VideoController {

	@Autowired
	private VideoDao videoService;
	
	@Autowired
	private UserDao userService;
	
	@Autowired
    private HttpSession session;

	@PreAuthorize("hasRole('TEACHER')")
	@PostMapping("/upload")
	public String uploadVideo(
	        @RequestParam("title") String title,
	        @RequestParam("description") String description,
	        @RequestParam("file") MultipartFile file,
	        RedirectAttributes redirectAttributes) {
		
		Integer id = (Integer) session.getAttribute("userId");

	    if (file.isEmpty()) {
	    	return "redirect:/upload-video";
	    }

	    try {
	        // Define directories
	        String uploadDir = "C:/uploaded_videos/";
	        String thumbnailDir = uploadDir + "thumbnails/";

	        // Create directories if they don't exist
	        File videoDirectory = new File(uploadDir);
	        if (!videoDirectory.exists()) {
	            videoDirectory.mkdirs();
	        }
	        File thumbnailDirectory = new File(thumbnailDir);
	        if (!thumbnailDirectory.exists()) {
	            thumbnailDirectory.mkdirs();
	        }

	        // Save video file
	        String videoPath = uploadDir + file.getOriginalFilename();
	        file.transferTo(new File(videoPath));

	        // Generate thumbnail
	        String fileName = file.getOriginalFilename();
	        String thumbnailPath = thumbnailDir + fileName.substring(0, fileName.lastIndexOf(".")) + ".jpg";
	        VideoThumbnailExtractor.extractThumbnail(videoPath, thumbnailPath);
	        String duration = VideoThumbnailExtractor.getVideoDuration(videoPath);
	        // Remove "C:/" from both file paths
	        String videoPathWithoutPrefix = videoPath.replace("C:/", "");
	        String thumbnailPathWithoutPrefix = thumbnailPath.replace("C:/", "");
	        // Save metadata in database
	        Video video = new Video();
	        video.setTitle(title);
	        video.setDescription(description);
	        video.setFilePath(videoPathWithoutPrefix);
	        video.setThumbnailPath(thumbnailPathWithoutPrefix);
	        video.setStatus("Pending");
	        video.setUserId(id);
	        video.setDuration(duration);

	        videoService.saveVideo(video);
	        
	        redirectAttributes.addFlashAttribute("message", "Video uploaded successfully.");
	        return "redirect:/upload-video";
	    } catch (IOException e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("message", "Video uploaded successfully.");
	        return "redirect:/upload-video";
	    } catch (Exception e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("message", "Video uploaded successfully.");
	        return "redirect:/upload-video";
	    }
	}


	@PreAuthorize("hasRole('TEACHER')")
	@GetMapping(value = "/getVideos", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String, String>> getVideos() {
        // Retrieve the user_id from the session
        Integer userId = (Integer) session.getAttribute("userId");
        
        // If user_id is null (not found in session), return an empty list or handle as needed
        if (userId == null) {
            return new ArrayList<>();
        }
        
        System.out.println(userId.intValue());
        // Fetch the list of videos for the given user_id
        List<Video> videos = videoService.getVideosByUserId(userId);
        System.out.println(videos);
        // Convert the Video entities to a simple map (DTO style) for JSON response
        List<Map<String, String>> videoList = new ArrayList<>();
        for (Video video : videos) {
            videoList.add(Map.of(
                "thumbnail", video.getThumbnailPath(),
                "duration", video.getDuration(),
                "title", video.getTitle(),
                "status", video.getStatus()
            ));
        }

        return videoList;
    }
	
	@GetMapping(value = "/getAllVideos", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String, String>> getAllVideos() {
        // Retrieve the user_id from the session
        Integer userId = (Integer) session.getAttribute("userId");
        
        // If user_id is null (not found in session), return an empty list or handle as needed
        if (userId == null) {
            return new ArrayList<>();
        }
        
        System.out.println(userId.intValue());
        // Fetch the list of videos for the given user_id
        List<Video> videos = videoService.getApprovedVideos();
        List<Users> users = userService.findAll();
        
        // Create a map of user IDs to usernames for quick lookup
        Map<Integer, String> userIdToUsernameMap = new HashMap<>();
        for (Users user : users) {
            userIdToUsernameMap.put(user.getId(), user.getUsername());
        }

        // Create the video list with additional user information
        List<Map<String, String>> videoList = new ArrayList<>();
        for (Video video : videos) {
            String username = userIdToUsernameMap.getOrDefault(video.getUserId(), "Unknown User");
            videoList.add(Map.of(
                "thumbnail", video.getThumbnailPath() != null ? video.getThumbnailPath() : "",
                "duration", video.getDuration() != null ? video.getDuration() : "00:00",
                "title", video.getTitle(),
                "username", username,
                "id", String.valueOf(video.getId())
            ));
        }

        return videoList;
    }
	
	@RequestMapping("/viewVideo")
	public String viewVideo(@RequestParam("id") int videoId, Model model) {
	    // Fetch video by ID using the video service
	    Video video = videoService.getVideoById(videoId);

	    // Check if the video is found
	    if (video == null) {
	        // Handle the case where the video is not found (e.g., return an error page or redirect)
	        return "errorPage"; // Or you can handle the error differently
	    }

	    // Add the video object to the model to pass it to the view
	    model.addAttribute("video", video);

	    // Return the view name (viewVideo.jsp)
	    return "viewVideo";
	}
	
	@GetMapping("/pending")
	public ResponseEntity<List<Map<String, String>>> getPendingVideos() {
	    List<Video> pendingVideos = videoService.getVideosByStatus("Pending");
	    List<Map<String, String>> videoMaps = new ArrayList<>();
	    
	    for (Video video : pendingVideos) {
	        videoMaps.add(Map.of(
	        	"id", String.valueOf(video.getId()),
	            "thumbnail", video.getThumbnailPath(),
	            "title", video.getTitle(),
	            "school", video.getDescription(),
	            "status", video.getStatus()
	        ));
	    }
	    
	    return ResponseEntity.ok(videoMaps);
	}

    // Add endpoint for approve/reject actions
	@PostMapping("/{id}/status")
	public ResponseEntity<String> updateVideoStatus(
	        @PathVariable int id, // Assuming id is a Long type in the database
	        @RequestParam String status) {
	    try {
	        // Update the status in the database using the VideoService
	        boolean isUpdated = videoService.updateVideoStatus(id, status);

	        if (isUpdated) {
	            return ResponseEntity.ok("Video status updated successfully");
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                    .body("Video not found or status update failed");
	        }
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body("An error occurred while updating video status");
	    }
	}
	
	// Get videos with status not "Pending"
    @GetMapping("/validated")
    public ResponseEntity<List<Map<String, String>>> getValidatedVideos() {
    	List<Video> validatedVideos = videoService.getValidatedVideos();
	    List<Map<String, String>> videoMaps = new ArrayList<>();
	    
	    for (Video video : validatedVideos) {
	        videoMaps.add(Map.of(
	        	"id", String.valueOf(video.getId()),
	            "thumbnail", video.getThumbnailPath(),
	            "title", video.getTitle(),
	            "school", video.getDescription(),
	            "status", video.getStatus()
	        ));
	    }
	    
	    
        return ResponseEntity.ok(videoMaps);
    }


}