package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.service.CrewDao;
import com.service.ResourceDao;
import com.service.SchoolDao;
import com.service.StudentDao;

import com.dto.SchoolDTO;
import com.dto.CrewDTO;
import com.dto.ResourceDTO;

import com.entity.School;
import com.entity.Crew;
import com.entity.Student;
import com.entity.Resource;

@Controller
public class CrewController {

	@Autowired
	private SchoolDao schoolDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private CrewDao crewDao;
	@Autowired
	private ResourceDao resourceDao;

	@GetMapping("/manage-school/add-crew/{schoolId}")
	public ModelAndView viewAddCrew(@PathVariable("schoolId") int schoolId) {
		ModelAndView modelAndView = new ModelAndView("addCrew");
		List<Student> studentList = getAvailableStudents(studentDao.getStudentsBySchoolId(schoolId),
				crewDao.getCrewsBySchoolId(schoolId));
		modelAndView.addObject("students", studentList);
		return modelAndView;
	}

	private List<Student> getAvailableStudents(List<Student> studentList, List<Crew> crewList) {
		List<Student> availableStudents = new ArrayList<Student>();

		for (Student student : studentList) {
			boolean isAlreadyCrew = false;

			for (Crew crew : crewList) {
				if (crew.getStudent().getId() == student.getId()) {
					isAlreadyCrew = true;
					break;
				}
			}

			if (!isAlreadyCrew) {
				availableStudents.add(student);
			}
		}

		return availableStudents;
	}

	@PostMapping("/manage-school/add-crew/{schoolId}")
	public String addCrew(@PathVariable("schoolId") int schoolId, @RequestParam("studentId") int studentId,
			@RequestParam("role") String role) {

		Crew newCrew = new Crew();
		newCrew.setStudent(studentDao.getStudent(studentId));
		newCrew.setSchool(schoolDao.getSchoolById(schoolId));
		newCrew.setRole(role);

		crewDao.saveCrew(newCrew);
		return "redirect:/manage-school/" + "crew-page/" + schoolId;
	}
	
	@GetMapping("/manage-school/manage-crew-resource/{crewId}")
	public ModelAndView viewCrewResources(@PathVariable("crewId") int crewId) {
		ModelAndView modelAndView = new ModelAndView("allocatedResourcePage");
	    Crew crew = crewDao.getCrewByCrewId(crewId);
	    School school = crew.getSchool();
	    
	    modelAndView.addObject("crew", crew);
	    modelAndView.addObject("schoolId", school.getId());
	    modelAndView.addObject("allocatedCount", resourceDao.getResourcesCountByCrewId(crewId));
	    modelAndView.addObject("resources", resourceDao.getResourcesByCrewId(crewId));
	    
	    return modelAndView;
	}

	@GetMapping("/manage-school/remove-resource/{crewId}/{resourceId}/{schoolId}")
	public String removeResourceFromCrew(@PathVariable int crewId, 
	                                   @PathVariable int resourceId,
	                                   @PathVariable int schoolId) {
	    Resource resource = resourceDao.getResource(resourceId);
	    resource.setCrew(null);
	    resource.setAvailability(true);
	    resourceDao.updateResource(resource);
	    
	    return "redirect:/manage-school/" + "crew-page/" + schoolId;
	}
	
	@GetMapping("/manage-school/allocate-resource/{crewId}")
	public ModelAndView viewAllocateResources(@PathVariable("crewId") int crewId) {
		ModelAndView modelAndView = new ModelAndView("addResourceToCrewPage");
	    Crew crew = crewDao.getCrewByCrewId(crewId);
	    School school = crew.getSchool();
	    
	    modelAndView.addObject("crew", crew);
	    modelAndView.addObject("schoolId", school.getId());
	    modelAndView.addObject("allocatedCount", resourceDao.getResourcesCountByCrewId(crewId));
	    modelAndView.addObject("resources", resourceDao.getAvailableResourcesBySchoolId(school.getId()));
	    
	    
	    return modelAndView;
	}
	
	@GetMapping("/manage-school/allocate-resource/{crewId}/{resourceId}/{schoolId}")
	public String allocateResources(@PathVariable("crewId") int crewId, 
									@PathVariable("resourceId") int resourceId, 
									@PathVariable("schoolId") int schoolId) {
	    Crew crew = crewDao.getCrewByCrewId(crewId);
	    Resource resource = resourceDao.getAvailableResourceById(resourceId);
	    
	    resource.setAvailability(false);
	    resource.setCrew(crew);
	    resourceDao.updateResource(resource);
	    
	    return "redirect:/manage-school/" + "allocate-resource/" + crewId;
	}
}
