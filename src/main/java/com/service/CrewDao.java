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
    public void deleteCrew(int id) {
        Crew crew = getCrew(id);
        if (crew != null) {
            getCurrentSession().delete(crew);
        }
    }
    
    @Transactional
    public int getTotalCrewCountBySchoolId(int schoolId) {
        return ((Number) getCurrentSession()
            .createQuery("SELECT COUNT(c) FROM Crew c WHERE c.school.id = :schoolId")
            .setParameter("schoolId", schoolId)
            .uniqueResult()).intValue();
    }
    
    @Transactional
    public List<Crew> getCrewsBySchoolId(int schoolId) {
        return getCurrentSession()
                .createQuery("SELECT c FROM Crew c "
                           + "JOIN FETCH c.student s "
                           + "JOIN FETCH c.school sch "
                           + "WHERE c.school.id = :schoolId", Crew.class)
                .setParameter("schoolId", schoolId)
                .getResultList();
    }
    
    @Transactional
    public Crew getCrewByCrewId(int crewId) {
        return getCurrentSession()
                .createQuery("SELECT c FROM Crew c "
                           + "JOIN FETCH c.student s "
                           + "JOIN FETCH c.school sch "
                           + "WHERE c.id = :crewId", Crew.class)
                .setParameter("crewId", crewId)
                .uniqueResult();
    }
}