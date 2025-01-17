package com.entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "news")
public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String author;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private LocalDate datePublished;

    @Column(nullable = true)
    private String picturePath; // Path to the picture file

    @Column(nullable = false, columnDefinition = "TEXT")
    private String content;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public LocalDate getDatePublished() { return datePublished; }
    public void setDatePublished(LocalDate datePublished) { this.datePublished = datePublished; }

    public String getPicturePath() { return picturePath; }
    public void setPicturePath(String picturePath) { this.picturePath = picturePath; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    
    
}
