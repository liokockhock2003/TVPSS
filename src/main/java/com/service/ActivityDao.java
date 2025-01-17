package com.service;

import com.entity.Activity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ActivityDao {
    private static final Logger logger = LoggerFactory.getLogger(ActivityDao.class);
    
    @Autowired
    private SessionFactory sessionFactory;
    
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Transactional
    public void saveActivity(Activity activity) {
        logger.info("Saving activity: {}", activity);
        getCurrentSession().saveOrUpdate(activity);
    }
    
    @Transactional(readOnly = true)
    public Activity getActivity(Long id) {
        logger.info("Fetching activity with id: {}", id);
        return getCurrentSession().get(Activity.class, id);
    }
    
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
    public List<Activity> getAllActivities() {
        logger.info("Fetching all activities");
        return getCurrentSession()
            .createQuery("from Activity order by date desc")
            .list();
    }
    
    @Transactional
    public void deleteActivity(Long id) {
        logger.info("Deleting activity with id: {}", id);
        Activity activity = getActivity(id);
        if (activity != null) {
            getCurrentSession().delete(activity);
        }
    }
}
