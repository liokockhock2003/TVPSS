package com.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class StaticResourceConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String pathThumbnails = "file:C:/uploaded_videos/thumbnails/";
        String pathVideos = "file:C:/uploaded_videos/";
        String path_images = "file:C:/Users/DANIAL/Pictures/Camera Roll/uploaded_images/";
        
        registry.addResourceHandler("/uploaded_videos/thumbnails/**")
               .addResourceLocations(pathThumbnails);
        
        registry.addResourceHandler("/uploaded_videos/**")
        .addResourceLocations(pathVideos);
        
        registry.addResourceHandler("/uploaded_images/**")
        .addResourceLocations(path_images);
    }
}