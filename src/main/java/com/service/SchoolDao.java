package com.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.School;
import java.util.List;

@Service
public class SchoolDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Transactional
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Transactional
    public void saveSchool(School school) {
        getCurrentSession().saveOrUpdate(school);
    }
    
    @Transactional
    public School getSchool(int id) {
        return getCurrentSession().get(School.class, id);
    }
    
    @Transactional
    @SuppressWarnings("unchecked")
    public List<School> getAllSchools() {
        return getCurrentSession().createQuery("from School").list();
    }
    
    @Transactional
    public void deleteSchool(int id) {
        School school = getSchool(id);
        if (school != null) {
            getCurrentSession().delete(school);
        }
    }
}