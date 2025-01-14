package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "resources")
public class Resource {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(nullable = false)
    private String type;
    
    private String brand;
    private String model;
    
    @Column(nullable = false)
    private String status;
    
    @Column(nullable = false)
    private Boolean availability = false;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "crew_id")
    private Crew crew;
    
    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public Crew getCrew() { return crew; }
    public void setCrew(Crew crew) { this.crew = crew; }
}