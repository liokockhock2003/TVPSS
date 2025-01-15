package com.service;

import com.entity.Video;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
@Transactional
public class VideoDao {

	@PersistenceContext
	private EntityManager entityManager;

	// Save a new video
	public void saveVideo(Video video) {
		entityManager.persist(video);
	}
	
	public Video updateVideo(Video video) {
        return entityManager.merge(video);
    }

	// Fetch a video by its ID
	public Video getVideoById(int id) {
		return entityManager.find(Video.class, id);
	}

	// Fetch videos by user_id
	public List<Video> getVideosByUserId(int userId) {
		String hql = "SELECT v FROM Video v WHERE v.userId = :userId";
		return entityManager.createQuery(hql, Video.class).setParameter("userId", userId).getResultList();
	}

	// Fetch all videos
	public List<Video> getAllVideos() {
		TypedQuery<Video> query = entityManager.createQuery("SELECT v FROM Video v", Video.class);
		return query.getResultList();
	}

	// Fetch videos by status (e.g., Pending, Approved)
	public List<Video> getVideosByStatus(String status) {
		TypedQuery<Video> query = entityManager.createQuery("SELECT v FROM Video v WHERE v.status = :status",
				Video.class);
		query.setParameter("status", status);
		return query.getResultList();
	}

	// Update the status of a video by its ID
	public boolean updateVideoStatus(int videoId, String status) {
		// Find the video by its ID
		Video video = getVideoById(videoId);

		if (video != null) {
			// Update the status if the video exists
			video.setStatus(status);
			entityManager.merge(video); // Persist the updated entity
			return true;
		}
		return false; // Return false if the video doesn't exist
	}

	// Fetch videos with status not "Pending"
	public List<Video> getValidatedVideos() {
		String hql = "SELECT v FROM Video v WHERE v.status <> :pendingStatus";
		return entityManager.createQuery(hql, Video.class).setParameter("pendingStatus", "Pending").getResultList();
	}

	public List<Video> getApprovedVideos() {
		String hql = "SELECT v FROM Video v WHERE v.status = :approvedStatus";
		return entityManager.createQuery(hql, Video.class).setParameter("approvedStatus", "Approved").getResultList();
	}

	// Function to increment views count for a video
	public void incrementViews(int videoId) {
		String hql = "UPDATE Video v SET v.views = v.views + 1 WHERE v.id = :videoId";
		entityManager.createQuery(hql).setParameter("videoId", videoId).executeUpdate();
	}
	
	public void incrementLikes(int videoId) {
		String hql = "UPDATE Video v SET v.likes = v.likes + 1 WHERE v.id = :videoId";
		entityManager.createQuery(hql).setParameter("videoId", videoId).executeUpdate();
	}
	
	public void incrementComments(int videoId) {
		String hql = "UPDATE Video v SET v.comments = v.comments + 1 WHERE v.id = :videoId";
		entityManager.createQuery(hql).setParameter("videoId", videoId).executeUpdate();
	}
	
	public void decrementLikes(int videoId) {
	    String hql = "UPDATE Video v SET v.likes = v.likes - 1 WHERE v.id = :videoId";
	    entityManager.createQuery(hql).setParameter("videoId", videoId).executeUpdate();
	}

	// Delete a video
	public void deleteVideo(int id) {
		Video video = getVideoById(id);
		if (video != null) {
			entityManager.remove(video);
		}
	}
}
