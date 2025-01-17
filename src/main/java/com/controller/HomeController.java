package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.AccessDeniedException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Video;
import com.service.VideoDao;

@Controller
public class HomeController {

//	@RequestMapping("/school-review")
//	@ResponseBody()
//	public ModelAndView schoolReview() {
//		ModelAndView modelAndView = new ModelAndView("viewAdminReview");
//		modelAndView.addObject("currentPage", "viewSchoolList");
//		return modelAndView;
//	}

//	@RequestMapping("/school-submission")
//	@ResponseBody()
//	public ModelAndView schoolVersionCheck() {
//		ModelAndView modelAndView = new ModelAndView("viewVersionCheck");
//		modelAndView.addObject("currentPage", "viewVersionCheck");
//		return modelAndView;
//	}

	@RequestMapping("/school-profile")
	@ResponseBody()
	public ModelAndView schoolProfile() {
		ModelAndView modelAndView = new ModelAndView("viewSchoolProfile");
		modelAndView.addObject("currentPage", "viewSchoolList");
		return modelAndView;
	}

//	@RequestMapping("/school-list")
//	@ResponseBody()
//	public ModelAndView schoolList() {
//		ModelAndView modelAndView = new ModelAndView("viewSchoolList");
//		modelAndView.addObject("currentPage", "viewSchoolList");
//		return modelAndView;
//	}

	@RequestMapping("/validate-video")
	public ModelAndView validateVideo() {
		ModelAndView modelAndView = new ModelAndView("validateVideo");
		modelAndView.addObject("currentPage", "validateVideo");
		return modelAndView;
	}

	@RequestMapping("/validated-video")
	public ModelAndView validatedVideo() {
		ModelAndView modelAndView = new ModelAndView("validatedVideo");
		modelAndView.addObject("currentPage", "validateVideo");
		return modelAndView;
	}

	@RequestMapping("/upload-video")
	@ResponseBody()
	public ModelAndView uploadVideo() {
		ModelAndView modelAndView = new ModelAndView("uploadVideo");
		modelAndView.addObject("currentPage", "videoLibraryTeacher");
		return modelAndView;
	}

	@RequestMapping("/video-library-student")
	@ResponseBody()
	public ModelAndView videoLibraryStudent() {
		ModelAndView modelAndView = new ModelAndView("videoLibraryStudent");
		modelAndView.addObject("currentPage", "videoLibraryStudent");
		return modelAndView;
	}

	@RequestMapping("/video-library-teacher")
	@ResponseBody()
	public ModelAndView videoLibraryTeacher() {
		ModelAndView modelAndView = new ModelAndView("videoLibraryTeacher");
		modelAndView.addObject("currentPage", "videoLibraryTeacher");
		return modelAndView;
	}

	@RequestMapping("/view-video")
	@ResponseBody()
	public ModelAndView viewVideo(HttpServletRequest request) throws AccessDeniedException {
		ModelAndView modelAndView = new ModelAndView("viewVideo");
		// Get role from session
		String role = (String) request.getSession().getAttribute("role");

		// Set appropriate currentPage based on role
		switch (role) {
		case "TEACHER":
			modelAndView.addObject("currentPage", "videoLibraryTeacher");
			break;
		case "STUDENT":
			modelAndView.addObject("currentPage", "videoLibraryStudent");
			break;
		default:
			throw new AccessDeniedException("Invalid role");
		}
		return modelAndView;
	}

	@RequestMapping("/dashboard")
	@ResponseBody()
	public ModelAndView activityDashboard() {
		ModelAndView modelAndView = new ModelAndView("dashboard");
		modelAndView.addObject("currentPage", "dashboard");
		return modelAndView;
	}

	@RequestMapping("/createreport")
	@ResponseBody()
	public ModelAndView createReport() {
		ModelAndView modelAndView = new ModelAndView("createreport");
		modelAndView.addObject("currentPage", "dashboard");
		return modelAndView;
	}

	@RequestMapping("/AddActivity")
	@ResponseBody()
	public ModelAndView AddActivity() {
		ModelAndView modelAndView = new ModelAndView("AddActivity");
		modelAndView.addObject("currentPage", "dashboard");
		return modelAndView;
	}

	@RequestMapping("/viewReport")
	@ResponseBody()
	public ModelAndView ViewReport() {
		ModelAndView modelAndView = new ModelAndView("ViewReport");
		return modelAndView;
	}

	@RequestMapping("/joinactivity")
	@ResponseBody()
	public ModelAndView joinactivity() {
		ModelAndView modelAndView = new ModelAndView("joinactivity");
		return modelAndView;
	}

	@RequestMapping("/report")
	@ResponseBody()
	public ModelAndView viewReport() {
		ModelAndView modelAndView = new ModelAndView("ViewReport");
		return modelAndView;
	}

	@RequestMapping("/forum")
	@ResponseBody()
	public ModelAndView forum() {
		ModelAndView modelAndView = new ModelAndView("forum");
		modelAndView.addObject("currentPage", "dashboard");
		return modelAndView;
	}

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView("crewResourcePage");
		modelAndView.addObject("message", "Welcome to the TVPSS app!");
		return modelAndView;
	}
}
