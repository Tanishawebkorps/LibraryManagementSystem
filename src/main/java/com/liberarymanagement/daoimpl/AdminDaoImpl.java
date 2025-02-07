package com.liberarymanagement.daoimpl;

import java.io.Console;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Map.Entry;

import com.liberarymanagement.connection.ConnectionGain;
import com.liberarymanagement.dao.AdminDao;
import com.liberarymanagement.entity.Admin;
import com.liberarymanagement.entity.Books;

public class AdminDaoImpl implements AdminDao {

	public static boolean selectBook(String bookName) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement preparestatement = connection.prepareStatement("select * from books where name=?");
			preparestatement.setString(1, bookName);
			ResultSet rs = preparestatement.executeQuery();
			boolean bookSelected = (rs.next()) ? true : false;
			return bookSelected;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;

		}
	}

	@Override
	public boolean registerAdmin(Admin admin) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement selectAdmin = connection
					.prepareStatement("select * from Admin where adminName=? and adminPassword=? ");
			selectAdmin.setString(1, admin.getAdminName());
			selectAdmin.setString(2, admin.getAdminPassword());
			ResultSet rs1 = selectAdmin.executeQuery();
			if (!rs1.next()) {
				PreparedStatement insertAdmin = connection.prepareStatement("INSERT INTO Admin " + "VALUES(?,?,?,?,?,?)");

				insertAdmin.setString(1, admin.getAdminName());
				insertAdmin.setString(2, admin.getLiberaryName());
				insertAdmin.setString(3, admin.getAdminAddress());
				insertAdmin.setString(4, admin.getAdminEmail());
				insertAdmin.setString(5, admin.getAdminRole());
				insertAdmin.setString(6, admin.getAdminPassword());
				int count = insertAdmin.executeUpdate();

				if (count > 0)
					return true;
			}
			return false;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;

		}
	}

	@Override
	public boolean addBook(Books book) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement insertBook = connection.prepareStatement(
					"insert into books(name,author,edition,description,quantity,remaining) values(?,?,?,?,?,?)");
			insertBook.setString(1, book.getName());
			insertBook.setString(2, book.getAuthor());
			insertBook.setString(3, book.getEdition());
			insertBook.setString(4, book.getDescription());
			insertBook.setInt(5, book.getQuantity());
			insertBook.setInt(6, book.getQuantity());
			int count = insertBook.executeUpdate();
			boolean result = (count > 0) ? true : false;
			return result;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}
	}


	@Override
	public Map<String, String> getIssuedBooks() {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			Map<String, String> issuedBooks = new HashMap<>();
			PreparedStatement selectIssuedBooks = connection
					.prepareStatement("SELECT bookname, GROUP_CONCAT(stuemail) AS studentIssuedBook "
							+ "FROM BookIssued " + "GROUP BY bookname");
			ResultSet rs = selectIssuedBooks.executeQuery();
			while (rs.next()) {
				String bookName = rs.getString("bookname");
				String studentEmail = rs.getString("studentIssuedBook");
				issuedBooks.put(bookName, studentEmail);
			}
			return issuedBooks;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean deleteBook(String name) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			if (selectBook(name)) {
				PreparedStatement deleteIssueBook = connection.prepareStatement("delete from BookIssued where bookname=?");
				deleteIssueBook.setString(1, name);
				int count1 = deleteIssueBook.executeUpdate();
				PreparedStatement deleteBook = connection.prepareStatement("delete from books where name=?");
				deleteBook.setString(1, name);
				int count = deleteBook.executeUpdate();
				if (count > 0)
					return true;
			}
			return false;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}
	}
    public static boolean updateRemaining(String name, int quantity) {
    	try (Connection connection = ConnectionGain.getDbConnection()) {
    		PreparedStatement pst1=connection.prepareStatement("select quantity , remaining from books where name=?");
    		pst1.setString(1, name);
    		ResultSet rs=pst1.executeQuery();
    		rs.next();
    		int presentQuantity=rs.getInt("quantity");
    		int presentRemaining=rs.getInt("remaining");
    		int difference=presentQuantity-presentRemaining;
    		PreparedStatement pst=connection.prepareStatement("update books set remaining=? where name=?");
    		pst.setInt(1,(quantity-difference));
    		pst.setString(2, name);
    		int count=pst.executeUpdate();
            boolean update=(count>0)?true:false;
            return update;
    	}
    	catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}
    	
    }
	@Override
	public boolean editBookDescriptions(String name, String description, String author, String edition, int quantity) {
		if (!selectBook(name)) {
			return false;
		}
		StringBuilder query = new StringBuilder("UPDATE books SET ");
		List<Object> params = new ArrayList<>();
		if (isValid(description)) {
			query.append("description = ?, ");
			params.add(description);
		}
		if (isValid(author)) {
			query.append("author = ?, ");
			params.add(author);
		}
		if (isValid(edition)) {
			query.append("edition = ?, ");
			params.add(edition);
		}
		if (quantity > 0) {
			if(updateRemaining(name,quantity)) {
			query.append("quantity = ?, ");
			params.add(quantity);
			}
		}
		query.setLength(query.length() - 2);
		query.append(" WHERE name = ?");
		params.add(name);
		try (Connection connection = ConnectionGain.getDbConnection()) {
			try (PreparedStatement editBook = connection.prepareStatement(query.toString())) {
				for (int i = 0; i < params.size(); i++) {
					editBook.setObject(i + 1, params.get(i));
				}
				int rowsAffected = editBook.executeUpdate();
				return rowsAffected > 0;
			}
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}
	}
	private boolean isValid(String value) {
		return value != null && !value.isEmpty();
	}


	@Override
	public boolean loginAdmin(long adminId, String adminPassword) {
		try (Connection connection = ConnectionGain.getDbConnection()) {
			PreparedStatement selectAdminId = connection
					.prepareStatement("select MemberId from admindetails where MemberId=? And password=?");
			selectAdminId.setLong(1, adminId);
			selectAdminId.setString(2, adminPassword);
			ResultSet rs =selectAdminId.executeQuery();
			boolean adminLogin = (rs.next()) ? true : false;
			return adminLogin;
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
			return false;
		}
	}

}
