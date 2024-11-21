package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping("/crew-resource")
    public ModelAndView crewResource() {
        ModelAndView modelAndView = new ModelAndView("crewResourcePage");
        modelAndView.addObject("currentPage", "crew-resource");
        return modelAndView;
    }
    
    @RequestMapping("manage-school")
    public ModelAndView manageSchool() {
    	ModelAndView modelAndView = new ModelAndView("manageSchoolPage");
    	modelAndView.addObject("currentPage", "crew-resource");
    	return modelAndView;
    }

    @RequestMapping("/video-validation")
    public ModelAndView validateVideo() {
        ModelAndView modelAndView = new ModelAndView("validateVideo");
        modelAndView.addObject("currentPage", "video-validation");
        return modelAndView;
    }
    
    @RequestMapping("/resource-page")
    public ModelAndView resourcePage() {
        ModelAndView modelAndView = new ModelAndView("resourcePage");
        modelAndView.addObject("currentPage", "crew-resource");
        return modelAndView;
    }
	
	@RequestMapping("/video-upload")
	@ResponseBody()
	public ModelAndView uploadVideo() {
		ModelAndView modelAndView = new ModelAndView("uploadVideo");
		return modelAndView;
	}
	
	@RequestMapping("/video-library-student")
	@ResponseBody()
	public ModelAndView videoLibraryStudent() {
		ModelAndView modelAndView = new ModelAndView("videoLibraryStudent");
		return modelAndView;
	}
	
	@RequestMapping("/video-library-teacher")
	@ResponseBody()
	public ModelAndView videoLibraryTeacher() {
		ModelAndView modelAndView = new ModelAndView("videoLibraryTeacher");
		return modelAndView;
	}
	
	@RequestMapping("/view-video")
	@ResponseBody()
	public ModelAndView viewVideo() {
		ModelAndView modelAndView = new ModelAndView("viewVideo");
		return modelAndView;
	}

	@RequestMapping("/dashboard")
	@ResponseBody()
	public ModelAndView activityDashboard() {
		ModelAndView modelAndView = new ModelAndView("dashboard");
		return modelAndView;
	}
	
	@RequestMapping("/createreport")
	@ResponseBody()
	public ModelAndView createReport() {
		ModelAndView modelAndView = new ModelAndView("createreport");
		return modelAndView;
	}
	
	@RequestMapping("/AddActivity")
	@ResponseBody()
	public ModelAndView AddActivity() {
		ModelAndView modelAndView = new ModelAndView("AddActivity");
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
		return modelAndView;
	}
	
	@GetMapping("/") 
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView("crewResourcePage");
		modelAndView.addObject("message", "Welcome to the TVPSS app!");
		return modelAndView;
	}
}

