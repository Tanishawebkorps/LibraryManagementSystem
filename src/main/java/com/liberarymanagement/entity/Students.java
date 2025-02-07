package com.liberarymanagement.entity;

import java.util.List;

public class Students {
       
	private String studentName;
	private String studentRole;
	private String studentPassword;
	private String studentEmail;
	private List<Books> booksIssued;
	public Students() {
		
	}
	public Students(String studentName , String studentEmail,String studentPassword , String studentRole) {
		this.studentName = studentName;
		this.studentPassword = studentPassword;
		this.studentEmail = studentEmail;
		this.studentRole=studentRole;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentRole() {
		return studentRole;
	}
	public void setStudentRole(String studentRole) {
		this.studentRole = studentRole;
	}
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public List<Books> getBooks() {
		return booksIssued;
	}
	public void setBooks(List<Books> booksIssued) {
		this.booksIssued = booksIssued;
	}
	@Override
	public String toString() {
		return "Student [studentName=" + studentName + ", studentRole=" + studentRole + ", studentPassword="
				+ studentPassword + ", studentEmail=" + studentEmail + ", books=" + booksIssued + "]";
	}
	
	
}
