package com.dto;

public class CrewDTO {
	private int id;
	private int studentId;
	private int schoolId;
	private String name;
	private String role;
	private int allocatedResourcesCount = 0;

	public CrewDTO(int id, int studentId, int schoolId, String name, String role, int allocatedResourcesCount) {
		this.id = id;
		this.studentId = studentId;
		this.schoolId = schoolId;
		this.name = name;
		this.role = role;
		this.allocatedResourcesCount = allocatedResourcesCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public int getAllocatedResourcesCount() {
		return allocatedResourcesCount;
	}

	public void setAllocatedResourcesCount(int allocatedResourcesCount) {
		this.allocatedResourcesCount = allocatedResourcesCount;
	}
}
