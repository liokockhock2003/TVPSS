package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "schools")
public class School {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false, name = "id")
	private int id;

	@Column(nullable = false, name = "name")
	private String name;

	@Column(columnDefinition = "TEXT", name = "address")
	private String address;

	@Column(name = "logo_path")
	private String logoPath;

	// Getters and setters
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLogoPath() {
		return logoPath;
	}

	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}
}
