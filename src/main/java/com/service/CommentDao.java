package com.service;

import com.entity.Comment;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class CommentDao {

    @PersistenceContext
    private EntityManager entityManager;

    // Add a comment
    public void addComment(Comment comment) {
        entityManager.persist(comment);
    }

    // Delete a comment by ID
    public void deleteCommentById(int commentId) {
        Comment comment = entityManager.find(Comment.class, commentId);
        if (comment != null) {
            entityManager.remove(comment);
        }
    }

    // Get all comments for a specific video
    public List<Comment> getCommentsByVideoId(int videoId) {
        String hql = "FROM Comment c WHERE c.videoId = :videoId";
        return entityManager.createQuery(hql, Comment.class)
                .setParameter("videoId", videoId)
                .getResultList();
    }

    // Get comments made by a specific user
    public List<Comment> getCommentsByUserId(int userId) {
        String hql = "FROM Comment c WHERE c.userId = :userId";
        return entityManager.createQuery(hql, Comment.class)
                .setParameter("userId", userId)
                .getResultList();
    }

    // Get a specific comment by ID
    public Comment getCommentById(int commentId) {
        return entityManager.find(Comment.class, commentId);
    }
}
