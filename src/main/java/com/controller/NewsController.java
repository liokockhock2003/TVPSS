package com.controller;

import com.entity.News;
import com.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    private static final String UPLOAD_DIR = "C:/uploaded_images/";

    @GetMapping
    public ModelAndView listNews() {
        List<News> newsList = newsService.getAllNews();
        ModelAndView modelAndView = new ModelAndView("newsList");
        modelAndView.addObject("newsList", newsList);
        return modelAndView;
    }
    
    @GetMapping("/student")
    public ModelAndView listNewsStudent() {
        List<News> newsList = newsService.getAllNews();
        ModelAndView modelAndView = new ModelAndView("viewNewsStudent");
        modelAndView.addObject("newsList", newsList);  // Changed to match JSP
        return modelAndView;
    }
    
    @GetMapping("/add")
    public ModelAndView addNewsPage() {
        
        ModelAndView modelAndView = new ModelAndView("addNews");
        modelAndView.addObject("news", new News());
        
        return modelAndView;
    }

    @PostMapping("/add-news")
    public String saveNews(@ModelAttribute News news,
                           @RequestParam("picture") MultipartFile picture,
                           RedirectAttributes redirectAttributes,
                           HttpServletRequest request) {
        // Log the received CSRF token
        System.out.println("Received CSRF token: " + request.getParameter("_csrf"));

        try {
            if (!picture.isEmpty()) {
                String picturePath = savePicture(picture);
                news.setPicturePath(picturePath);
            }
            news.setDatePublished(LocalDate.now());
            newsService.saveNews(news);
            redirectAttributes.addFlashAttribute("message", "News added successfully!");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "Failed to upload picture!");
            return "redirect:/news/add"; // Redirect to add news page on error
        }

        return "redirect:/news"; // Redirect to the news list on success
    }


    
    @GetMapping("/{id}")
    public ModelAndView viewNews(@PathVariable Long id) {
        News news = newsService.getNews(id);
        if (news == null) {
            throw new RuntimeException("News not found with id: " + id);
        }
        ModelAndView modelAndView = new ModelAndView("viewNews");
        modelAndView.addObject("news", news);
        return modelAndView;
    }

    @GetMapping("/edit/{id}")
    public ModelAndView editNewsPage(@PathVariable Long id) {
        News news = newsService.getNews(id);
        if (news == null) {
            throw new RuntimeException("News not found with id: " + id);
        }
        ModelAndView modelAndView = new ModelAndView("editNews");
        modelAndView.addObject("news", news);
        return modelAndView;
    }

    @PostMapping("/edit/{id}")
    public String editNews(@PathVariable Long id,
                           @ModelAttribute News news,
                           @RequestParam("picture") MultipartFile picture,
                           RedirectAttributes redirectAttributes) {
        try {
            if (!picture.isEmpty()) {
                String picturePath = savePicture(picture);
                news.setPicturePath(picturePath);
            }
            news.setId(id);
            newsService.saveNews(news);
            redirectAttributes.addFlashAttribute("message", "News updated successfully!");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "Failed to upload picture!");
        }
        return "redirect:/news";
    }

    @PostMapping("/delete/{id}")
    public String deleteNews(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        newsService.deleteNews(id);
        redirectAttributes.addFlashAttribute("message", "News deleted successfully!");
        return "redirect:/news";
    }

    private String savePicture(MultipartFile picture) throws IOException {
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        String fileName = picture.getOriginalFilename();
        File destinationFile = new File(uploadDir, fileName);
        picture.transferTo(destinationFile);
        return "uploaded_images/" + fileName;
    }
    
    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", authentication.getName());
            model.addAttribute("currentRoles", authentication.getAuthorities());
        }
    }
}