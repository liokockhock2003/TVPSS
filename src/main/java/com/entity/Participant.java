package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "activity_participants")
public class Participant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "activity_id", nullable = false)
    private Activity activity;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private int age;

    @Column(nullable = false)
    private String school;

    @Column(nullable = false)
    private String icNumber;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Activity getActivity() { return activity; }
    public void setActivity(Activity activity) { this.activity = activity; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getSchool() { return school; }
    public void setSchool(String school) { this.school = school; }

    public String getIcNumber() { return icNumber; }
    public void setIcNumber(String icNumber) { this.icNumber = icNumber; }
}