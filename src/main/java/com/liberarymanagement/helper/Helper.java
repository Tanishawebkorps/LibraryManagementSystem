package com.liberarymanagement.helper;

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
import java.util.Map.Entry;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.liberarymanagement.connection.ConnectionGain;
import com.liberarymanagement.daoimpl.AdminDaoImpl;
import com.liberarymanagement.daoimpl.StudentDaoImpl;
import com.liberarymanagement.entity.Books;

public class Helper {
	public static boolean sendEmail(  String email, String role,String table) {
		String host = "smtp.gmail.com";
		String from="librarymanagementsystem22@gmail.com";

		Properties properties = System.getProperties();
		System.out.println("Properties:" + properties);
		Long id=0l;
		String password="";
		if(role.equals("admin") && table.equals("admindetails")) {
			Map<Long, String> map=generateDetails();
			Set <Entry<Long,String>> mp = map.entrySet();
			for(Entry<Long,String> e : mp) { 
				 password =e.getValue();
				 id=e.getKey();
			}
			storeDetails( id, password ,email , table);
		}
		if(role.equals("student") && table.equals("studentdetails")) {
			Map<Long, String> map=generateDetails();
			Set <Entry<Long,String>> mp = map.entrySet();
			for(Entry<Long,String> e : mp) { 
				 password =e.getValue();
				 id=e.getKey();
			}	
			storeDetails(id,password ,email , table);
		}

		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.starttls.enable","true");
		properties.put("mail.smtp.auth", "true");
		properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(from, "eglx bbaj rkdk mqfa");
			}
			
			
		} );
		session.setDebug(true);
		MimeMessage m = new MimeMessage(session);
		try {
		
	
		m.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		m.setFrom(new InternetAddress(from));
			
		String subject = "Confirmation Email";
		m.setSubject(subject);
		
		String msg = "This is Confirnation message for you \n you are successfully registered to our Library Application your id is    "+id+"  and password is  "+password;
		
		m.setText(msg);
		
		Transport.send(m);
	
		System.out.println("sent...");
		
		return true;
		
		
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	public static List<Books> getAllBooks() {
		try(Connection con=ConnectionGain.getDbConnection()){
			PreparedStatement pst=con.prepareStatement("select * from books");
			ResultSet rs=pst.executeQuery();
			List<Books> books=new ArrayList<Books>();
			while(rs.next()) {
				Books b=new Books(rs.getString("name"),rs.getString("author"),rs.getString("edition"),rs.getString("description"),rs.getInt("quantity"),rs.getInt("remaining"));
		                  books.add(b);
			}
			return books;
			}
		catch(Exception exc) {
			System.out.println(exc.getMessage());
			return null;
		}
	}
	
	public static Map<Long, String> generateDetails() {
		Random random = new Random();
		Map<Long, String> data = new HashMap<>();
		long min = 1000;
		long max = 999999;
		long id = min + (Math.abs(random.nextLong()) % (max - min + 1));
		String alphabet = "@!#$%^&*ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

		StringBuilder sb = new StringBuilder();

		int length = 7;
		for (int i = 0; i < length; i++) {

			int index = random.nextInt(alphabet.length());

			char randomChar = alphabet.charAt(index);

			sb.append(randomChar);
		}
		String randomString = sb.toString();
		data.put(id, randomString);
		return data;

}
	public static boolean storeDetails(Long id,String password , String email , String table) {
		try (Connection con = ConnectionGain.getDbConnection()) {
			PreparedStatement insertDetails = con.prepareStatement("insert into " +table+" value(?,?,?)");
			insertDetails.setLong(1, id);
			insertDetails.setString(2, password);
			insertDetails.setString(3, email);
			int count = insertDetails.executeUpdate();
			if (count > 0)
				System.out.println("save successfully");
		} catch (SQLException | NullPointerException exc) {
			exc.printStackTrace();
		}
		return true;
	}


}





