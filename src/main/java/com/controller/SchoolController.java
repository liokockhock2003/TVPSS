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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	@GetMapping("/school-list")
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

}
