package com.service;

import com.entity.Like;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class LikeDao {

	@PersistenceContext
	private EntityManager entityManager;

	public void addLike(int videoId, int userId) {
		// Create a new Like instance
		Like like = new Like();
		like.setVideoId(videoId);
		like.setUserId(userId);

		// Persist the Like instance
		entityManager.persist(like);
	}

	public void removeLikes(int videoId, int userId) {
	    String hql = "DELETE FROM Like l WHERE l.videoId = :videoId AND l.userId = :userId";
	    entityManager.createQuery(hql)
	            .setParameter("videoId", videoId)
	            .setParameter("userId", userId)
	            .executeUpdate();
	}


	// Remove a like
	public void deleteLikeByVideoId(int videoId) {
		String hql = "DELETE FROM Like l WHERE l.videoId = :videoId";
		entityManager.createQuery(hql).setParameter("videoId", videoId).executeUpdate();
	}

	// Check if a user has liked a specific video
	public boolean isLikedByUser(int videoId, int userId) {
		String hql = "SELECT COUNT(l) FROM Like l WHERE l.videoId = :videoId AND l.userId = :userId";
		int count = entityManager.createQuery(hql, int.class).setParameter("videoId", videoId)
				.setParameter("userId", userId).getSingleResult();
		return count > 0;
	}

	// Get the count of likes for a video
	public Long getLikeCountByVideoId(int videoId) {
		String hql = "SELECT COUNT(l) FROM Like l WHERE l.videoId = :videoId";
		return entityManager.createQuery(hql, Long.class).setParameter("videoId", videoId).getSingleResult();
	}

	// Get all likes for a specific video
	public List<Like> getLikesByVideoId(int videoId) {
		String hql = "FROM Like l WHERE l.videoId = :videoId";
		return entityManager.createQuery(hql, Like.class).setParameter("videoId", videoId).getResultList();
	}

	// Get all likes for a specific video
	public List<Like> getSpecificLike(int videoId, int userId) {
		String hql = "FROM Like l WHERE l.videoId = :videoId AND l.userId = :userId";
		return entityManager.createQuery(hql, Like.class).setParameter("videoId", videoId)
				.setParameter("userId", userId).getResultList();
	}
}
