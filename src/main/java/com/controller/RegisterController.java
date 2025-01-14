package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.School;
import com.entity.Student;
import com.entity.Users;
import com.service.SchoolDao;
import com.service.UserDao;
import com.dto.RegistrationDTO;

@Controller
public class RegisterController {

	@Autowired
	UserDao userDao;
	
    @Autowired
    private SchoolDao schoolDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/register")
	public ModelAndView viewRegisterPage() {
		ModelAndView modelAndView = new ModelAndView("registerPage");
		modelAndView.addObject("registrationDTO", new RegistrationDTO());
		modelAndView.addObject("schools", schoolDao.getAllSchools());
		return modelAndView;
	}

	@PostMapping("/register")
    public String registerUser(@ModelAttribute("registrationDTO") RegistrationDTO registrationDto,
                             RedirectAttributes redirectAttributes) {
        try {
            // Validate username
            if (userDao.existsByUsername(registrationDto.getUsername())) {
                redirectAttributes.addFlashAttribute("error", "Username already exists");
                return "redirect:/register";
            }

            // Validate email
            if (userDao.existsByEmail(registrationDto.getEmail())) {
                redirectAttributes.addFlashAttribute("error", "Email already exists");
                return "redirect:/register";
            }

            // Create and save user
            Users user = new Users();
            user.setUsername(registrationDto.getUsername());
            user.setPassword(passwordEncoder.encode(registrationDto.getPassword()));
            user.setEmail(registrationDto.getEmail());
            user.setRole(registrationDto.getUserType());
            
            userDao.save(user);

            // If registering as a student, create student record
            if ("STUDENT".equals(registrationDto.getUserType())) {
                if (registrationDto.getYear() < 1 || registrationDto.getYear() > 6) {
                    redirectAttributes.addFlashAttribute("error", "Invalid year for student");
                    return "redirect:/register";
                }

                // Get school entity
                School school = schoolDao.getSchoolById(registrationDto.getSchoolId());
                if (school == null) {
                    redirectAttributes.addFlashAttribute("error", "Invalid school selected");
                    return "redirect:/register";
                }

                Student student = new Student();
                student.setName(registrationDto.getFirstName() + " " + registrationDto.getLastName());
                student.setYear(registrationDto.getYear());
                student.setAge(registrationDto.getAge());
                student.setUser(user);
                student.setSchool(school);
                
                userDao.saveStudent(student);
            }

            redirectAttributes.addFlashAttribute("msg", "Registration successful. Please login.");
            return "redirect:/login";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "An error occurred during registration: " + e.getMessage());
            return "redirect:/register";
        }
    }
}
