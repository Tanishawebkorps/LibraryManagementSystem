package com.liberarymanagement.entity;

public class Books {
private String name;
private String author;
private String edition ;
private String description;
private int quantity;
private int remaining;
public Books() {
	
}
public Books(String name, String author, String edition , String description, int quantity,int remaining) {
	this.name = name;
	this.author = author;
	this.edition = edition;
	this.description=description;
	this.quantity = quantity;
	this.remaining=remaining;

}

public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public int getRemaining() {
	return remaining;
}
public void setRemaining(int remaining) {
	this.remaining = remaining;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getEdition() {
	return edition;
}
public void setEdition(String edition) {
	this.edition = edition;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
@Override
public String toString() {
	return "Books [name=" + name + ", author=" + author + ", edition=" + edition + ", description=" + description
			+ ", quantity=" + quantity + ", remaining=" + remaining + "]";
}


}
