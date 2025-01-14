// UserDao.java
package com.service;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Student;
import com.entity.Users;
import java.util.List;

@Service
public class UserDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Users findByUsername(String username) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Users where username = :username", Users.class)
                .setParameter("username", username)
                .uniqueResult();
    }

    @Transactional
    public void save(Users user) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(user);
    }

    @Transactional
    public List<Users> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Users", Users.class).getResultList();
    }
    
    @Transactional
    public List<Users> findByRole(String role) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Users where role = :role", Users.class)
                .setParameter("role", role)
                .getResultList();
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Users user = currentSession.get(Users.class, id);
        if (user != null) {
            currentSession.delete(user);
        }
    }
    
    @Transactional
    public boolean existsByUsername(String username) {
        Session currentSession = sessionFactory.getCurrentSession();
        Long count = currentSession.createQuery(
            "select count(*) from Users where username = :username", Long.class)
            .setParameter("username", username)
            .uniqueResult();
        return count > 0;
    }
    
    @Transactional
    public boolean existsByEmail(String email) {
        Session currentSession = sessionFactory.getCurrentSession();
        Long count = currentSession.createQuery(
            "select count(*) from Users where email = :email", Long.class)
            .setParameter("email", email)
            .uniqueResult();
        return count > 0;
    }
    
    @Transactional
    public void saveStudent(Student student) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(student);
    }
}