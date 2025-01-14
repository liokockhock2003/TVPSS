package com.dto;

public class SchoolDTO {
	private String name;
	private int schoolId;
	private int totalCrew;
	private int totalResources;
	private int availableResources;
	
	public SchoolDTO(String name, int schoolId, int totalCrew, int totalResources, int availableResources) {
		this.name = name;
		this.schoolId = schoolId;
		this.totalCrew = totalCrew;
		this.totalResources = totalResources;
		this.availableResources = availableResources;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int getSchoolId() {
		return schoolId;
	}
	
	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	public int getTotalCrew() {
		return totalCrew;
	}

	public void setTotalCrew(int totalCrew) {
		this.totalCrew = totalCrew;
	}

	public int getTotalResources() {
		return totalResources;
	}

	public void setTotalResources(int totalResources) {
		this.totalResources = totalResources;
	}

	public int getAvailableResources() {
		return availableResources;
	}

	public void setAvailableResources(int availableResources) {
		this.availableResources = availableResources;
	}

}
