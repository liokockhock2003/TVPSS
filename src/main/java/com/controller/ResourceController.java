package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.service.CrewDao;
import com.service.ResourceDao;
import com.service.SchoolDao;
import com.service.StudentDao;

import com.dto.SchoolDTO;
import com.entity.School;

@Controller
public class ResourceController {
	
	@Autowired
	private SchoolDao schoolDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private CrewDao crewDao;
	@Autowired
	private ResourceDao resourceDao;
	
	@GetMapping("/crew-resource")
	public ModelAndView crewResource() {
		ModelAndView modelAndView = new ModelAndView("crewResourcePage");
		modelAndView.addObject("currentPage", "crewResourcePage");
		modelAndView.addObject("schools", getAllSchoolsDTO(schoolDao.getAllSchools()));
		return modelAndView;
	}
	
	private List<SchoolDTO> getAllSchoolsDTO(List<School> schoolList){
		List<SchoolDTO> schoolDTOList = new ArrayList<SchoolDTO>();
		for(School school : schoolList) {
			int numCrew = crewDao.getTotalCrewCountBySchoolId(school.getId());
			int numResources = resourceDao.getTotalResourceCountBySchoolId(school.getId());
			int numAvailableResources = resourceDao.getAvailableResourceCountBySchoolId(school.getId());
			
			schoolDTOList.add(new SchoolDTO(school.getName(), school.getId(), numCrew, numResources, numAvailableResources));
		}
		
		return schoolDTOList;
	}
	
	@GetMapping("/manage-school/crew-page/{schoolId}")
	public ModelAndView manageSchool(@PathVariable("schoolId") int schoolId) {
		ModelAndView modelAndView = new ModelAndView("manageSchoolPage");
		modelAndView.addObject("currentPage", "crewResourcePage");
		modelAndView.addObject("students", crewDao.getAllCrews());
		return modelAndView;
	}
	
	@GetMapping("/manage-school/resource-page/{schoolId}")
	public ModelAndView resourcePage(@PathVariable("schoolId") int schoolId) {
		ModelAndView modelAndView = new ModelAndView("resourcePage");
		modelAndView.addObject("currentPage", "crewResourcePage");
		return modelAndView;
	}
}
