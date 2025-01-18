package com.service;

import com.entity.TvpssStatus;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.awt.Image;
import java.io.IOException;
import java.util.List;

@Service
public class TvpssStatusDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public void saveTvpssStatus(TvpssStatus tvpssStatus) {
        getCurrentSession().saveOrUpdate(tvpssStatus);
    }

    @Transactional
    public TvpssStatus getTvpssStatus(int id) {
        return getCurrentSession().get(TvpssStatus.class, id);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<TvpssStatus> getAllTvpssStatus() {
        return getCurrentSession().createQuery("from TvpssStatus").list();
    }

    @Transactional
    public void deleteTvpssStatus(int id) {
        TvpssStatus tvpssStatus = getTvpssStatus(id);
        if (tvpssStatus != null) {
            getCurrentSession().delete(tvpssStatus);
        }
    }
    
    @Transactional
    @SuppressWarnings("unchecked")
    public List<TvpssStatus> getBySchoolId(int schoolId) {
        return getCurrentSession()
                .createQuery("FROM TvpssStatus WHERE school.id = :schoolId")
                .setParameter("schoolId", schoolId)
                .list();
    }
    
    @Transactional
    public void updateTvpssStatus(TvpssStatus tvpssStatus) {
        // Fetch the existing TvpssStatus from the database by its ID
        TvpssStatus existingTvpssStatus = getCurrentSession().get(TvpssStatus.class, tvpssStatus.getId());

        if (existingTvpssStatus != null) {
            // Update only the fields that have been changed in the tvpssStatus object
            existingTvpssStatus.setSchool(tvpssStatus.getSchool());
            existingTvpssStatus.setCriteriaNo(tvpssStatus.getCriteriaNo());
            existingTvpssStatus.setCriteriaName(tvpssStatus.getCriteriaName());
            existingTvpssStatus.setAvailability(tvpssStatus.isAvailability());
            existingTvpssStatus.setProofImage(tvpssStatus.getProofImage());
            existingTvpssStatus.setStatus(tvpssStatus.getStatus());
            existingTvpssStatus.setReviewedBy(tvpssStatus.getReviewedBy());
            existingTvpssStatus.setReviewComments(tvpssStatus.getReviewComments());
            existingTvpssStatus.setReviewDate(tvpssStatus.getReviewDate());

            // Save the updated entity back to the database
            getCurrentSession().update(existingTvpssStatus);
        }
    }

    // Additional methods based on your business logic can be added
}
