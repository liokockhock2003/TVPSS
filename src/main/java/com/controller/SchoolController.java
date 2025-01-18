package com.controller;

import com.entity.School;
import com.service.SchoolDao;
import com.entity.TvpssStatus;
import com.service.TvpssStatusDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SchoolController {

	@Autowired
	private SchoolDao schoolService; // Service to fetch school data from the database

	@Autowired
	private TvpssStatusDao tvpssService; // Service to fetch TVPSS status data from the database

	@RequestMapping(value = "/school-list", method = { RequestMethod.GET, RequestMethod.POST })
	public String listSchools(Model model) {
		List<School> schools = schoolService.getAllSchools(); // Fetch all schools from DB
		model.addAttribute("schools", schools); // Add the list to the model
		return "viewSchoolList"; // Return the name of the JSP page (schoolList.jsp)
	}

	@GetMapping("/school-profile/{id}")
	public String viewSchoolProfile(@PathVariable int id, Model model) {
		// Fetch the school by ID
		School school = schoolService.getSchoolById(id);

		// Fetch TVPSS statuses that match the school_id
		List<TvpssStatus> tvpssStatuses = tvpssService.getBySchoolId(id);

		// Add school and tvpssStatuses to the model
		model.addAttribute("school", school);
		model.addAttribute("tvpssStatuses", tvpssStatuses);

		return "viewSchoolProfile"; // Return the profile page view
	}

	@GetMapping("/school-review/{id}")
	public String viewSchoolReview(@PathVariable int id, Model model) {
		// Fetch the school by ID
		School school = schoolService.getSchoolById(id);

		// Fetch TVPSS statuses that match the school_id
		List<TvpssStatus> tvpssStatuses = tvpssService.getBySchoolId(id);

		// Add school and tvpssStatuses to the model
		model.addAttribute("school", school);
		model.addAttribute("tvpssStatuses", tvpssStatuses);

		return "viewAdminReview"; // Return the profile page view
	}
	
	@GetMapping("/school-submission")
	public String viewVersionCheck(Model model) {
		// Fetch the school by ID
				School school = schoolService.getSchoolById(1);

				// Fetch TVPSS statuses that match the school_id
				List<TvpssStatus> tvpssStatuses = tvpssService.getBySchoolId(1);

				// Add school and tvpssStatuses to the model
				model.addAttribute("school", school);
				model.addAttribute("tvpssStatuses", tvpssStatuses);

				return "viewVersionCheck"; // Return the profile page view
	}
	
	@PostMapping("/add-school")
	public String addSchool(@RequestParam("schoolName") String schoolName,
	                       @RequestParam("schoolAddress") String schoolAddress,
	                       RedirectAttributes redirectAttributes) {
	    try {
	        // Create a new School object to save to the database
	        School newSchool = new School();
	        
	        // Set the basic properties provided through the form
	        newSchool.setName(schoolName);
	        newSchool.setAddress(schoolAddress);
	        
	        // Set default values for a new school
	        newSchool.setStatus(false);  // Active by default
	        newSchool.setVersion(0); // Initial version
	        
	        // Use the saveSchool method from your SchoolDao
	        schoolService.saveSchool(newSchool);
	        
	        // Add success message for the user interface
	        redirectAttributes.addFlashAttribute("message", 
	            "School '" + schoolName + "' has been successfully added.");
	        redirectAttributes.addFlashAttribute("messageType", "success");
	        
	    } catch (Exception e) {
	        // Handle any errors that might occur during the save process
	        redirectAttributes.addFlashAttribute("message", 
	            "Failed to add school: " + e.getMessage());
	        redirectAttributes.addFlashAttribute("messageType", "error");
	    }
	    
	    // Redirect to the school list page after the operation
	    return "redirect:/school-list";
	}
	
	@PostMapping("/delete-school/{id}")
	public String deleteSchool(@PathVariable int id, RedirectAttributes redirectAttributes) {
	    try {
	        // Get school name before deletion for the message
	        School school = schoolService.getSchoolById(id);
	        String schoolName = school != null ? school.getName() : "School";
	        
	        // Delete the school
	        schoolService.deleteSchool(id);
	        	
	        // Add success message
	        redirectAttributes.addFlashAttribute("message", 
	            "School '" + schoolName + "' has been successfully deleted.");
	        redirectAttributes.addFlashAttribute("messageType", "success");
	        
	    } catch (Exception e) {
	        // Add error message
	        redirectAttributes.addFlashAttribute("message", 
	            "Failed to delete school: " + e.getMessage());
	        redirectAttributes.addFlashAttribute("messageType", "error");
	    }
	    
	    return "redirect:/school-list";
	}

}
