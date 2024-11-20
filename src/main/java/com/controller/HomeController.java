package com.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Controller

public class HomeController {
	
	@RequestMapping("/crew-resource")
	@ResponseBody()
	public ModelAndView crewResource() {
		ModelAndView modelAndView = new ModelAndView("crewResourcePage");
		return modelAndView;
	}
	
	@RequestMapping("/video-validation")
	@ResponseBody()
	public ModelAndView validateVideo() {
		ModelAndView modelAndView = new ModelAndView("validateVideo");
		return modelAndView;
	}
	
	@GetMapping("/") 
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView("crewResourcePage");
		modelAndView.addObject("message", "Welcome to the TVPSS app!");
		return modelAndView;
	}
}