package com.liberarymanagement.dao;

import java.util.List;
import java.util.Map;

import com.liberarymanagement.entity.Admin;
import com.liberarymanagement.entity.Books;

public interface AdminDao {
public boolean addBook(Books b);
public boolean registerAdmin(Admin a);
public boolean loginAdmin(long id , String password);
public Map<String,String> getIssuedBooks();
public boolean deleteBook(String name);
public boolean editBookDescriptions(String name , String description , String author, String edition , int quantity);
}
