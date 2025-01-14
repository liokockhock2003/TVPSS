package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.service.CrewDao;
import com.service.SchoolDao;
import com.service.StudentDao;

@Controller
public class ResourceController {
	
	@Autowired
	private SchoolDao schoolDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private CrewDao crewDao;
	
	@GetMapping("/crew-resource")
	public ModelAndView crewResource() {
		ModelAndView modelAndView = new ModelAndView("crewResourcePage");
		modelAndView.addObject("currentPage", "crewResourcePage");
		modelAndView.addObject("schools", schoolDao.getAllSchools());
		return modelAndView;
	}
	
	@GetMapping("manage-school")
	public ModelAndView manageSchool() {
		ModelAndView modelAndView = new ModelAndView("manageSchoolPage");
		modelAndView.addObject("currentPage", "crewResourcePage");
		modelAndView.addObject("students", crewDao.getAllCrews());
		return modelAndView;
	}
	
	@GetMapping("/resource-page")
	public ModelAndView resourcePage() {
		ModelAndView modelAndView = new ModelAndView("resourcePage");
		modelAndView.addObject("currentPage", "crewResourcePage");
		return modelAndView;
	}
}
