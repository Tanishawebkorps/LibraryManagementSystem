package com.liberarymanagement.daoimpl;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.liberarymanagement.connection.ConnectionGain;
import com.liberarymanagement.dao.StudentDao;
import com.liberarymanagement.entity.Books;
import com.liberarymanagement.entity.Students;
import javax.mail.*;
import java.util.*;
 import java.util.Map.Entry;
 import javax.mail.internet.*;


public class StudentDaoImpl implements StudentDao {

	@Override
	public Map<String, String> getIssuedBooks(String email) {
	    String query = "SELECT b.name, b.author, b.edition, b.description, bi.issuedate, bi.tilldate "
	                  + "FROM books b JOIN BookIssued bi ON b.name = bi.bookname " 
	                  + "WHERE bi.stuemail = ?";

	    try (Connection connection = ConnectionGain.getDbConnection();
	         PreparedStatement selectAllIssuedBookQuery = connection.prepareStatement(query)) {

	    	selectAllIssuedBookQuery.setString(1, email);
	        ResultSet rs = selectAllIssuedBookQuery.executeQuery();

	        Map<String, String> issuedBooks = new HashMap<>();

	        while (rs.next()) {
	            String book = rs.getString("name");
	            String details = "Author : " + rs.getString("author") +
	                             " , Edition : " + rs.getString("edition") +
	                             " , Description : " + rs.getString("description")+
	                              " , IssueDate : " + rs.getString("issuedate")+
	                              " , ReturnDate : " + rs.getString("tilldate");
	            issuedBooks.put(book, details);
	        }

	        return issuedBooks;

	    } catch (SQLException | NullPointerException exc) {
	    	exc.printStackTrace();
	        return new HashMap<>(); 
	    }
	}

	@Override
	public List<Books> searchBook(String author) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement selectBookQuery = connection.prepareStatement("select * from books where author=?");
			selectBookQuery.setString(1,author);
			ResultSet rs = selectBookQuery.executeQuery();
			List<Books> lst=new ArrayList<>();
			while(rs.next()) {
				lst.add (new Books(rs.getString("name"), rs.getString("author"), rs.getString("edition"),
						rs.getString("description"), rs.getInt("quantity"),rs.getInt("remaining")));
			}
			return lst;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean issueBook(String bookName, String studentemail, int days) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement selectBookIssuedDetailsQuery = connection.prepareStatement("select * from  BookIssued where bookname=? and stuemail=?");
			selectBookIssuedDetailsQuery.setString(1, bookName);
			selectBookIssuedDetailsQuery.setString(2, studentemail);
			ResultSet rs3 = selectBookIssuedDetailsQuery.executeQuery();
			if (rs3.next()) {
				return false;
			}
			PreparedStatement selectRemainingBookQuery = connection.prepareStatement("select remaining from books where name=? ");
			selectRemainingBookQuery.setString(1, bookName);
			ResultSet rs = selectRemainingBookQuery.executeQuery();
			rs.next();
			int q = rs.getInt("remaining");
			PreparedStatement pst3 = connection.prepareStatement("select stuemail, bookname from BookIssued");
			ResultSet rs1 = pst3.executeQuery();
			if (q > 0 && !rs.next()) {
				PreparedStatement insertInToBookIssuedQuery = connection.prepareStatement(
			  "insert into BookIssued (bookname , stuemail,issuedate,tilldate) values(?,?,?,?)");
				insertInToBookIssuedQuery.setString(1, bookName);
				insertInToBookIssuedQuery.setString(2, studentemail);
				java.util.Date utilDate = new java.util.Date(); // Current date
				java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
				insertInToBookIssuedQuery.setDate(3, sqlDate);
				LocalDate currentDate = LocalDate.now();
				LocalDate futureDate = currentDate.plusDays(days);
				Date tilDate = Date.valueOf(futureDate);
				insertInToBookIssuedQuery.setDate(4, tilDate);
				int count = insertInToBookIssuedQuery.executeUpdate();
				PreparedStatement updateBooksQuery = connection.prepareStatement("update books set remaining=? where name=? ");
				updateBooksQuery.setInt(1, (q - 1));
				updateBooksQuery.setString(2,bookName);
				int count1 = updateBooksQuery.executeUpdate();
				if (count > 1 && count1 > 1)
					System.out.println("in");
				return true;
			}
			return false;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean renewBook(String name, String studentemail, int extended_days) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement selectStudentEmailAndBookQuery = connection.prepareStatement("select stuemail, bookname from BookIssued");
			ResultSet rs = selectStudentEmailAndBookQuery.executeQuery();
			if (rs.next()) {
				PreparedStatement updateBookIssued = connection.prepareStatement(
						"UPDATE BookIssued SET tilldate = DATE_ADD(tilldate, INTERVAL ? DAY) WHERE stuemail = ? and bookname= ? ");
				updateBookIssued.setInt(1, extended_days);
				updateBookIssued.setString(2, studentemail);
				updateBookIssued.setString(3, name);
				int count = updateBookIssued.executeUpdate();
				if (count > 0) {
					return true;
				}
			}
			return false;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean returnBook(String bookName, String studentEmail) {
		try (Connection connection = ConnectionGain.getDbConnection()) {

			PreparedStatement deleteBookFromIssuedBookQuery = connection.prepareStatement("DELETE FROM BookIssued WHERE bookname=? AND stuemail=?");
			deleteBookFromIssuedBookQuery.setString(1, bookName);
			deleteBookFromIssuedBookQuery.setString(2, studentEmail);
			int count = deleteBookFromIssuedBookQuery.executeUpdate();

			if (count > 0) {
				
				PreparedStatement selectRemainingColumnQuery = connection.prepareStatement("SELECT remaining FROM books WHERE name=?");
				selectRemainingColumnQuery.setString(1, bookName);
				ResultSet rs1 = selectRemainingColumnQuery.executeQuery();

				if (rs1.next()) {
					int q = rs1.getInt(1);

					
					PreparedStatement pst3 = connection.prepareStatement("UPDATE books SET remaining=? WHERE name=?");
					pst3.setInt(1, q + 1);
					pst3.setString(2, bookName);
					int count1 = pst3.executeUpdate();
                       
					if (count1 > 0) {
						return true;
					}
				}
			}
			return false;

		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}

	}

	@Override
	public boolean registerStudent(Students student) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement insertStudentQuery = connection.prepareStatement("INSERT INTO student VALUES(?,?,?,?)");
			insertStudentQuery.setString(1, student.getStudentName());
			insertStudentQuery.setString(2, student.getStudentEmail());
			insertStudentQuery.setString(3, student.getStudentPassword());
			insertStudentQuery.setString(4, student.getStudentRole());
			int count = insertStudentQuery.executeUpdate();
            boolean isStudentRegister=(count>0)?true:false;
			return isStudentRegister;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}
	}

	@Override
	public String loginStudent(long studentId, String studentPassword) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement selectStudentEmailQuery = connection.prepareStatement("select email from studentdetails where smemberId=? And spassword =?  ");
			selectStudentEmailQuery.setLong(1, studentId);
			selectStudentEmailQuery.setString(2, studentPassword);
			ResultSet rs = selectStudentEmailQuery.executeQuery();
			if (rs.next()) {
				return rs.getString("email");
			} 
				return null;
		} 
		catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return null;
		}
	}

}