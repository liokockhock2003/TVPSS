package com.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Resource;

import java.util.List;

@Service
public class ResourceDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Transactional
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Transactional
    public void saveResource(Resource resource) {
        getCurrentSession().saveOrUpdate(resource);
    }
    
    @Transactional
    public Resource getResource(int id) {
        return getCurrentSession().get(Resource.class, id);
    }
    
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Resource> getAllResources() {
        return getCurrentSession().createQuery("from Resource").list();
    }
    
    @Transactional
    public void deleteResource(int id) {
        Resource resource = getResource(id);
        if (resource != null) {
            getCurrentSession().delete(resource);
        }
    }
    
    @Transactional
    public int getTotalResourceCountBySchoolId(int schoolId) {
        return ((Number) getCurrentSession()
            .createQuery("SELECT COUNT(r) FROM Resource r WHERE r.school.id = :schoolId")
            .setParameter("schoolId", schoolId)
            .uniqueResult()).intValue();
    }
    
    @Transactional
    public int getAvailableResourceCountBySchoolId(int schoolId) {
        return ((Number) getCurrentSession()
            .createQuery("SELECT COUNT(r) FROM Resource r " +
                        "WHERE r.school.id = :schoolId " +
                        "AND r.availability = true")
            .setParameter("schoolId", schoolId)
            .uniqueResult()).intValue();
    }
}