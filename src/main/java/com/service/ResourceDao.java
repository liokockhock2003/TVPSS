package com.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Crew;
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
	public void updateResource(Resource resource) {
		getCurrentSession().update(resource);
	}

	@Transactional
	public int getTotalResourceCountBySchoolId(int schoolId) {
		return ((Number) getCurrentSession()
				.createQuery("SELECT COUNT(r) FROM Resource r WHERE r.school.id = :schoolId")
				.setParameter("schoolId", schoolId).uniqueResult()).intValue();
	}

	@Transactional
	public int getAvailableResourceCountBySchoolId(int schoolId) {
		return ((Number) getCurrentSession().createQuery(
				"SELECT COUNT(r) FROM Resource r " + "WHERE r.school.id = :schoolId " + "AND r.availability = true")
				.setParameter("schoolId", schoolId).uniqueResult()).intValue();
	}

	@Transactional
	public List<Resource> getAvailableResourcesBySchoolId(int schoolId) {
		return	getCurrentSession().createQuery(
				"SELECT r FROM Resource r " + "LEFT JOIN FETCH r.crew c " + "JOIN FETCH r.school sch "
				+ "WHERE r.school.id = :schoolId " + "AND r.availability = true", Resource.class)
				.setParameter("schoolId", schoolId).getResultList();
	}

	@Transactional
	public List<Resource> getResourcesBySchoolId(int schoolId) {
		return getCurrentSession()
				.createQuery("SELECT s FROM Resource s " + "LEFT JOIN FETCH s.crew c " + "JOIN FETCH s.school sch "
						+ "WHERE s.school.id = :schoolId", Resource.class)
				.setParameter("schoolId", schoolId).getResultList();
	}

	@Transactional
	public List<Resource> getResourcesByCrewId(int crewId) {
		return getCurrentSession().createQuery("SELECT s FROM Resource s " + "JOIN FETCH s.crew c "
				+ "JOIN FETCH s.school sch " + "WHERE s.crew.id = :crewId", Resource.class)
				.setParameter("crewId", crewId).getResultList();
	}

	@Transactional
	public int getResourcesCountByCrewId(int crewId) {
		return ((Number) getCurrentSession()
				.createQuery("SELECT COUNT(s) FROM Resource s " + "WHERE s.crew.id = :crewId")
				.setParameter("crewId", crewId).uniqueResult()).intValue();
	}
	
	@Transactional
	public Resource getAvailableResourceById(int id) {
		return	getCurrentSession().createQuery(
				"SELECT r FROM Resource r " + "LEFT JOIN FETCH r.crew c " + "JOIN FETCH r.school sch "
				+ "WHERE r.id = :id ", Resource.class)
				.setParameter("id", id).uniqueResult();
	}

}