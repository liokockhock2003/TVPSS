package com.service;

import com.entity.Participant;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ParticipantDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public void saveParticipant(Participant participant) {
        getCurrentSession().saveOrUpdate(participant);
    }

    @Transactional(readOnly = true)
    public List<Participant> getParticipantsByActivity(Long activityId) {
        return getCurrentSession()
                .createQuery("from Participant where activity.id = :activityId", Participant.class)
                .setParameter("activityId", activityId)
                .list();
    }
}