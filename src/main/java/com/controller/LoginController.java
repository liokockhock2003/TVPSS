package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.entity.Users;
import com.service.UserDao;

@Controller
public class LoginController {

	@GetMapping("/login")
	public ModelAndView viewLoginPage() {
		ModelAndView modelAndView = new ModelAndView("loginPage");
		return modelAndView;
	}
}
 	