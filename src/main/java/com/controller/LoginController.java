package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    
    @GetMapping("/login")
    public ModelAndView viewLoginPage() {
        ModelAndView modelAndView = new ModelAndView("loginPage");
        return modelAndView;
    }
    
    @GetMapping("/logout")	
    public ModelAndView logout(HttpServletRequest request) {
        // First, get the current authentication object which contains user details
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        // If there is an active authentication, proceed with logout
        if (authentication != null) {
            // Create a SecurityContextLogoutHandler to handle the core logout functionality
            new SecurityContextLogoutHandler().logout(
                request,                // The current request
                null,                   // The response (null is fine here as Spring handles it)
                authentication         // The current authentication
            );
            
            // Get the current session without creating a new one if it doesn't exist
            HttpSession session = request.getSession(false);
            if (session != null) {
                // Remove specific attributes we stored in the session
                session.removeAttribute("userId");
                session.removeAttribute("role");
                
                // Completely invalidate the session
                session.invalidate();
            }
        }
        
        // Create a ModelAndView to redirect to the login page with a logout parameter
        ModelAndView modelAndView = new ModelAndView("redirect:/login?logout");
        return modelAndView;
    }
}