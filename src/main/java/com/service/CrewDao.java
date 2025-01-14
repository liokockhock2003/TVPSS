package com.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Crew;

import java.util.List;

@Service
public class CrewDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Transactional
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Transactional
    public void saveCrew(Crew crew) {
        getCurrentSession().saveOrUpdate(crew);
    }
    
    @Transactional
    public Crew getCrew(int id) {
        return getCurrentSession().get(Crew.class, id);
    }
    
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Crew> getAllCrews() {
        return getCurrentSession().createQuery("from Crew").list();
    }
    
    @Transactional
    public void deleteStudent(int id) {
        Crew crew = getCrew(id);
        if (crew != null) {
            getCurrentSession().delete(crew);
        }
    }
}