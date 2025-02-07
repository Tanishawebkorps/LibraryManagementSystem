package com.liberarymanagement.dao;

import java.util.List;
import java.util.Map;

import com.liberarymanagement.entity.Books;
import com.liberarymanagement.entity.Students;

public interface StudentDao {
public boolean registerStudent(Students s);
public String loginStudent(long id , String password);
//public Map<Long,String> generateStudentDetails(String email);
public  Map<String,String> getIssuedBooks(String email);
public List<Books> searchBook(String name);
public boolean issueBook(String name , String studentemail , int days);
public boolean renewBook(String name , String studentemail, int extended_days);
public boolean returnBook(String name , String stuemail);
}
