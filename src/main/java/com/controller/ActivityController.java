package com.controller;

import com.entity.Activity;
import com.entity.Participant;
import com.service.ActivityDao;
import com.service.ActivityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/activities")
public class ActivityController {
	private static final Logger logger = LoggerFactory.getLogger(ActivityController.class);

	@Autowired
	private ActivityService activityService;

	@GetMapping
	public ModelAndView listActivities() {
		logger.info("Fetching all activities");
		try {
			List<Activity> activities = activityService.getAllActivities();
			ModelAndView modelAndView = new ModelAndView("dashboard");
			modelAndView.addObject("activities", activities);
			modelAndView.addObject("currentPage", "dashboard");
			return modelAndView;
		} catch (Exception e) {
			logger.error("Error fetching activities: ", e);
			ModelAndView errorView = new ModelAndView("error");
			errorView.addObject("error", "Failed to fetch activities");
			return errorView;
		}
	}

	@GetMapping("/add")
	public ModelAndView addActivityPage() {
		ModelAndView modelAndView = new ModelAndView("AddActivity");
		modelAndView.addObject("activity", new Activity());
		return modelAndView;
	}

	@PostMapping
	public String saveActivity(@ModelAttribute Activity activity, RedirectAttributes redirectAttributes) {
		try {
			activityService.saveActivity(activity);
			redirectAttributes.addFlashAttribute("message", "Activity saved successfully!");
			return "redirect:/activities";
		} catch (Exception e) {
			logger.error("Error saving activity: ", e);
			redirectAttributes.addFlashAttribute("error", "Failed to save activity: " + e.getMessage());
			return "redirect:/activities/add";
		}
	}

	@GetMapping("/{id}")
	public ModelAndView viewActivity(@PathVariable Long id) {
		try {
			Activity activity = activityService.getActivityById(id);
			ModelAndView modelAndView = new ModelAndView("viewActivity");
			modelAndView.addObject("activity", activity);
			return modelAndView;
		} catch (Exception e) {
			logger.error("Error viewing activity: ", e);
			ModelAndView errorView = new ModelAndView("error");
			errorView.addObject("error", "Failed to view activity: " + e.getMessage());
			return errorView;
		}
	}

	@GetMapping("/edit/{id}")
	public ModelAndView editActivityPage(@PathVariable Long id) {
		try {
			Activity activity = activityService.getActivityById(id);
			ModelAndView modelAndView = new ModelAndView("editActivity");
			modelAndView.addObject("activity", activity);
			return modelAndView;
		} catch (Exception e) {
			logger.error("Error loading edit page: ", e);
			ModelAndView errorView = new ModelAndView("error");
			errorView.addObject("error", "Failed to load edit page: " + e.getMessage());
			return errorView;
		}
	}

	@PostMapping("/edit/{id}")
	public String editActivity(@PathVariable Long id, @ModelAttribute Activity activity,
			RedirectAttributes redirectAttributes) {
		try {
			activityService.updateActivity(id, activity);
			redirectAttributes.addFlashAttribute("message", "Activity updated successfully!");
			return "redirect:/activities/" + id;
		} catch (Exception e) {
			logger.error("Error updating activity: ", e);
			redirectAttributes.addFlashAttribute("error", "Failed to update activity: " + e.getMessage());
			return "redirect:/activities/edit/" + id;
		}
	}

	@PostMapping("/delete/{id}")
	public String deleteActivity(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		try {
			activityService.deleteActivity(id);
			redirectAttributes.addFlashAttribute("message", "Activity deleted successfully!");
			return "redirect:/activities";
		} catch (Exception e) {
			logger.error("Error deleting activity: ", e);
			redirectAttributes.addFlashAttribute("error", "Failed to delete activity: " + e.getMessage());
			return "redirect:/activities";
		}
	}

	@GetMapping("/join/{id}")
	public ModelAndView joinActivityPage(@PathVariable Long id) {
		Activity activity = activityService.getActivityById(id);
		ModelAndView modelAndView = new ModelAndView("joinactivity");
		modelAndView.addObject("activityId", id);
		modelAndView.addObject("activity", activity); // Add this line
		modelAndView.addObject("participant", new Participant());
		return modelAndView;
	}

	@PostMapping("/join/{id}")
	public String joinActivity(@PathVariable Long id, Participant participant, RedirectAttributes redirectAttributes) {
		try {
			Activity activity = activityService.getActivityById(id);
			activityService.joinActivity(activity, participant);
			redirectAttributes.addFlashAttribute("success", "Successfully joined the activity!");
			return "redirect:/activities";
		} catch (IllegalStateException e) {
			redirectAttributes.addFlashAttribute("error", e.getMessage());
			return "redirect:/activities/join/" + id;
		}
	}

	@GetMapping("/{id}/participants")
	public ModelAndView viewParticipants(@PathVariable Long id) {
		ModelAndView modelAndView = new ModelAndView("viewParticipants");
		List<Participant> participants = activityService.getParticipants(id); // Fetch participants
		modelAndView.addObject("activity", activityService.getActivityById(id));
		modelAndView.addObject("participants", participants);
		return modelAndView;
	}

	@GetMapping("/teacher-dashboard")
	public ModelAndView teacherDashboard() {
		ModelAndView modelAndView = new ModelAndView("dashboard");
		try {
			List<Activity> activities = activityService.getAllActivities();
			modelAndView.addObject("activities", activities);
			modelAndView.addObject("currentPage", "dashboard");
		} catch (Exception e) {
			modelAndView.addObject("error", "Failed to load activities: " + e.getMessage());
		}
		return modelAndView;
	}

	@GetMapping("/student-dashboard")
	public ModelAndView studentDashboard() {
		ModelAndView modelAndView = new ModelAndView("dashboardStudent");
		try {
			List<Activity> activities = activityService.getAllActivities();
			logger.info("Retrieved {} activities for student dashboard", activities.size());
			modelAndView.addObject("activities", activities);
		} catch (Exception e) {
			logger.error("Error loading activities for student dashboard: ", e);
			modelAndView.addObject("error", "Failed to load activities: " + e.getMessage());
		}
		return modelAndView;
	}

	@GetMapping("/{id}/student-view")
	public ModelAndView studentViewActivity(@PathVariable Long id) {
		ModelAndView modelAndView = new ModelAndView("studentViewActivity"); // Use the new JSP file
		Activity activity = activityService.getActivityById(id); // Fetch activity details
		modelAndView.addObject("activity", activity); // Pass activity data to the JSP
		return modelAndView;
	}

}