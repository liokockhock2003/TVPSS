package com.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Teacher;

import java.util.List;

@Service
public class TeacherDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public void saveTeacher(Teacher teacher) {
		getCurrentSession().saveOrUpdate(teacher);
	}

	@Transactional
	public Teacher getTeacher(int id) {
		return getCurrentSession().get(Teacher.class, id);
	}
	
	@Transactional
	public Teacher getTeacherByUserId(int userId) {
	    String hql = "FROM Teacher WHERE user_id = :userId";
	    return getCurrentSession()
	            .createQuery(hql, Teacher.class)
	            .setParameter("userId", userId)
	            .uniqueResult();
	}


	@Transactional
	@SuppressWarnings("unchecked")
	public List<Teacher> getAllTeachers() {
		return getCurrentSession().createQuery("from Teacher").list();
	}

	@Transactional
	public void deleteTeacher(int id) {
		Teacher teacher = getTeacher(id);
		if (teacher != null) {
			getCurrentSession().delete(teacher);
		}
	}
}