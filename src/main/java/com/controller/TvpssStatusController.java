package com.controller;

import com.entity.School;
import com.entity.TvpssStatus;
import com.service.SchoolDao;
import com.service.TvpssStatusDao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.TvpssStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class TvpssStatusController {

	private static final Logger logger = LoggerFactory.getLogger(TvpssStatusController.class);

	@Autowired
	private TvpssStatusDao tvpssStatusDao;

	@Autowired
	private SchoolDao schoolDao;

	@RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
	public String updateStatus(@RequestParam("id") int id, @RequestParam("status") String status,
			@RequestParam("schoolId") int schoolId, @RequestParam("version") int version) {

		TvpssStatus tvstatus = tvpssStatusDao.getTvpssStatus(id);
		School school = schoolDao.getSchoolById(schoolId);

		if (status != null) {
			tvstatus.setStatus(status);
			if (status.equals("APPROVED")) {
				tvstatus.setAvailability(true);
			} else {
				tvstatus.setAvailability(false);
			}
			tvpssStatusDao.updateTvpssStatus(tvstatus);
		}
		// Redirect back to the school status review page

		school.setVersion(version);
		schoolDao.updateSchool(school);

		return "redirect:/school-review/" + schoolId;
	}
	
	@RequestMapping(value = "/updateVersion", method = RequestMethod.POST)
	public String updateVersion(@RequestParam("schoolId") int schoolId, @RequestParam("version") int version) {
		School school = schoolDao.getSchoolById(schoolId);

		school.setVersion(version);
		schoolDao.updateSchool(school);

		return "redirect:/school-review/" + schoolId;
	}

	@PostMapping("/updateSubmission")
	public String updateSubmission(@RequestParam Map<String, String> allParams,
			@RequestParam Map<String, MultipartFile> proofImages, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		// Iterate through each criteria and handle file uploads
		for (String key : allParams.keySet()) {
			if (key.startsWith("id")) {
				// Extract the criteria ID
				String criteriaIdStr = key.substring(2);
				int criteriaId = Integer.parseInt(criteriaIdStr);

				// Get the current TvpssStatus from the database
				TvpssStatus tvpssStatus = tvpssStatusDao.getTvpssStatus(criteriaId);
				logger.info("Processing criteria ID: {}", criteriaId);

				MultipartFile proofImage = proofImages.get("proofImage" + criteriaId);

				if (proofImage != null && !proofImage.isEmpty()) {
					redirectAttributes.addFlashAttribute("file", proofImage);
					try {

						tvpssStatus.setProofImage(proofImage.getOriginalFilename());
						tvpssStatus.setData(proofImage.getBytes());

						tvpssStatus.setStatus("PENDING");

					} catch (IOException e) {
						e.printStackTrace();
//	                    redirectAttributes.addFlashAttribute("message", 
//	                        "Image upload failed. Error: " + e.getMessage() + 
//	                        ". Path attempted: ");
						return "redirect:/school-submission";
					}
				}

				tvpssStatusDao.updateTvpssStatus(tvpssStatus);
			}
		}

		redirectAttributes.addFlashAttribute("message", "Updates saved successfully!");
		return "redirect:/school-submission";
	}

//	@PostMapping("/updateSubmission")
//	public String updateSubmission(@RequestParam Map<String, String> allParams, @RequestParam Map<String, MultipartFile> files, RedirectAttributes redirectAttributes) {
//		
//		
//		
//		for(String key : allParams.keySet()) {
//			if(key.startsWith("id") && files.get("proofImage1") != null) {
//				
//				redirectAttributes.addFlashAttribute("file", files.get("proofImage1"));
//			}
//			else {
//				redirectAttributes.addFlashAttribute("file", "Test");
//			}
//		}
//	    // Redirect to the school status review page after successful update
//	    return "redirect:/school-submission";
//	}

}
