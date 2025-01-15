package com.dto;

import com.entity.School;
import com.entity.Crew;

public class ResourceDTO {
	private int id;
	private String name;
	private String type;
	private String status;
	private Boolean availability;
	private Crew crew;
	private School school;

	public ResourceDTO(int id, String name, String type, String status, Boolean availability, Crew crew, School school) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.status = status;
		this.availability = availability;
		this.crew = crew;
		this.school = school;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Boolean getAvailability() {
		return availability;
	}

	public void setAvailability(Boolean availability) {
		this.availability = availability;
	}

	public Crew getCrew() {
		return crew;
	}

	public void setCrew(Crew crew) {
		this.crew = crew;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}
}
