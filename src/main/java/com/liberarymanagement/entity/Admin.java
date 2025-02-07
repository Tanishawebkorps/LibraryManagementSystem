package com.liberarymanagement.entity;

public class Admin {
	private String adminName;
	private String liberaryName;
	private String adminRole;
	private String adminPassword;
	private String adminAddress;
	private String adminEmail;
	

	public Admin() {
		
	}
	public Admin(String adminName, String liberaryName, String adminRole, String adminPassword, String adminAddress,
			String adminEmail) {
		this.adminName = adminName;
		this.liberaryName = liberaryName;
		this.adminRole = adminRole;
		this.adminPassword = adminPassword;
		this.adminAddress = adminAddress;
		this.adminEmail = adminEmail;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getLiberaryName() {
		return liberaryName;
	}
	public void setLiberaryName(String liberaryName) {
		this.liberaryName = liberaryName;
	}
	public String getAdminRole() {
		return adminRole;
	}
	public void setAdminRole(String adminRole) {
		this.adminRole = adminRole;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminAddress() {
		return adminAddress;
	}
	public void setAdminAddress(String adminAddress) {
		this.adminAddress = adminAddress;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	
	
}
