package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "tvpss_status")
public class TvpssStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "school_id", nullable = false)
    private School school;

    @Column(nullable = false)
    private int criteria_no;

    @Column(nullable = false)
    private String criteria_name;

    @Column(nullable = false)
    private boolean availability;

    @Column
    private String proof_image;  // Stores the path to the proof image

    @Column
    private String reviewed_by;  // Stores the admin username who reviewed

    @Column
    private String review_comments;

    @Column
    private java.sql.Timestamp review_date;  // Using java.sql.Timestamp for compatibility with database timestamp

    @Column
    private String status;
    
    @Lob
    private byte[] data;

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public int getCriteriaNo() {
        return criteria_no;
    }

    public void setCriteriaNo(int criteriaNo) {
        this.criteria_no = criteriaNo;
    }

    public String getCriteriaName() {
        return criteria_name;
    }

    public void setCriteriaName(String criteriaName) {
        this.criteria_name = criteriaName;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

    public String getProofImage() {
        return proof_image;
    }

    public void setProofImage(String proofImage) {
        this.proof_image = proofImage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReviewedBy() {
        return reviewed_by;
    }

    public void setReviewedBy(String reviewedBy) {
        this.reviewed_by = reviewedBy;
    }

    public String getReviewComments() {
        return review_comments;
    }

    public void setReviewComments(String reviewComments) {
        this.review_comments = reviewComments;
    }

    public java.sql.Timestamp getReviewDate() {
        return review_date;
    }

    public void setReviewDate(java.sql.Timestamp reviewDate) {
        this.review_date = reviewDate;
    }

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}
}
