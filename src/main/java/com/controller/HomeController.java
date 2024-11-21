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

    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("loginPage");
        modelAndView.addObject("message", "Welcome to the TVPSS app!");
        modelAndView.addObject("currentPage", "home");
        return modelAndView;
    }
}
