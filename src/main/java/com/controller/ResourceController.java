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

	private List<SchoolDTO> getAllSchoolsDTO(List<School> schoolList) {
		List<SchoolDTO> schoolDTOList = new ArrayList<SchoolDTO>();
		for (School school : schoolList) {
			int numCrew = crewDao.getTotalCrewCountBySchoolId(school.getId());
			int numResources = resourceDao.getTotalResourceCountBySchoolId(school.getId());
			int numAvailableResources = resourceDao.getAvailableResourceCountBySchoolId(school.getId());

			schoolDTOList
					.add(new SchoolDTO(school.getName(), school.getId(), numCrew, numResources, numAvailableResources));
		}

		return schoolDTOList;
	}

	@GetMapping("/manage-school/crew-page/{schoolId}")
	public ModelAndView manageSchool(@PathVariable("schoolId") int schoolId) {
		ModelAndView modelAndView = new ModelAndView("manageSchoolPage");
		modelAndView.addObject("currentPage", "crewResourcePage");
		modelAndView.addObject("students", crewDao.getAllCrews());
		modelAndView.addObject("schoolId", schoolId);
		modelAndView.addObject("school", schoolDao.getSchoolById(schoolId));
		modelAndView.addObject("crews", getAllCrewsDTO(crewDao.getCrewsBySchoolId(schoolId)));
		return modelAndView;
	}

	@GetMapping("/manage-school/resource-page/{schoolId}")
	public ModelAndView resourcePage(@PathVariable("schoolId") int schoolId) {
		ModelAndView modelAndView = new ModelAndView("resourcePage");
		modelAndView.addObject("currentPage", "crewResourcePage");
		modelAndView.addObject("schoolId", schoolId);
		modelAndView.addObject("school", schoolDao.getSchoolById(schoolId));
		modelAndView.addObject("crews", getAllCrewsDTO(crewDao.getCrewsBySchoolId(schoolId)));
		modelAndView.addObject("resources", getAllResourcesDTO(resourceDao.getResourcesBySchoolId(schoolId)));
		return modelAndView;
	}

	private List<CrewDTO> getAllCrewsDTO(List<Crew> crewList) {
		List<CrewDTO> crews = new ArrayList<CrewDTO>();
		for (Crew crew : crewList) {
			int id = crew.getId();
			String role = crew.getRole();

			Student student = crew.getStudent();
			int studentId = student.getId();
			String name = student.getName();

			School school = crew.getSchool();
			int schoolId = school.getId();

			int allocatedResourcesCount = resourceDao.getResourcesCountByCrewId(id);

			crews.add(new CrewDTO(id, studentId, schoolId, name, role, allocatedResourcesCount));
		}
		return crews;
	}

	private List<ResourceDTO> getAllResourcesDTO(List<Resource> resourceList) {
		List<ResourceDTO> resources = new ArrayList<ResourceDTO>();
		for (Resource resource : resourceList) {
			int id = resource.getId();
			String name = resource.getBrand() + " " + resource.getModel();
			String type = resource.getType();
			String status = resource.getStatus();
			Boolean availability = resource.getAvailability();
			Crew crew = resource.getCrew();
			School school = resource.getSchool();

			resources.add(new ResourceDTO(id, name, type, status, availability, crew, school));
		}
		return resources;
	}

	@GetMapping("/manage-school/add-resource/{schoolId}")
	public ModelAndView viewAddResource(@PathVariable int schoolId) {
		ModelAndView modelAndView = new ModelAndView("addResource");
		return modelAndView;
	}

	@PostMapping("/manage-school/add-resource/{schoolId}")
	public String addResource(@PathVariable int schoolId, @RequestParam("type") String type, @RequestParam("brand") String brand, @RequestParam("model") String model,
									@RequestParam("status") String status) {
	    Resource resource = new Resource();
	    resource.setType(type);
	    resource.setBrand(brand);
	    resource.setModel(model);
	    resource.setStatus(status);
	    resource.setAvailability(true);
	    resource.setSchool(schoolDao.getSchoolById(schoolId));
	    
	    resourceDao.saveResource(resource);
	    
		return "redirect:/manage-school/resource-page/" + schoolId;
	}
	
	@GetMapping("/manage-school/edit-resource/{resourceId}/{schoolId}")
	public ModelAndView viewEditResource(@PathVariable int resourceId, @PathVariable int schoolId) {
		ModelAndView modelAndView = new ModelAndView("editResource");
		modelAndView.addObject("resource", resourceDao.getResource(resourceId));
		return modelAndView;
	}
	
	@PostMapping("/manage-school/edit-resource/{resourceId}/{schoolId}")
	public String editResource(@PathVariable int resourceId, @PathVariable int schoolId, @RequestParam("type") String type, @RequestParam("brand") String brand, @RequestParam("model") String model,
									@RequestParam("status") String status) {
	    Resource resource = resourceDao.getResource(resourceId);
	    resource.setType(type);
	    resource.setBrand(brand);
	    resource.setModel(model);
	    resource.setStatus(status);
	    
	    resourceDao.updateResource(resource);
	    
		return "redirect:/manage-school/resource-page/" + schoolId;
	}

	@GetMapping("/manage-school/delete-resource/{resourceId}/{schoolId}")
	public String deleteResource(@PathVariable int resourceId, @PathVariable int schoolId) {
		resourceDao.deleteResource(resourceId);
		return "redirect:/manage-school/resource-page/" + schoolId;
	}
}
