package model;

import java.time.LocalDateTime;

public class User {
	
//instance variables
	private int userId;
	private String name;
	private String username;
	private String passWord;
	private String email;
	private String phone;
	private String address;
	private String role;
	private LocalDateTime createdDate;
	private String lastLogin;
	
	

//Constructors for the class	
	
	public User() {
		
	}
	
	public User(int userId, String name, String username, String passWord, String email, String phone, String address,
			String role, LocalDateTime createdDate, String lastLogin) {
		super();
		this.userId = userId;
		this.name = name;
		this.username = username;
		this.passWord = passWord;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.createdDate = createdDate;
		this.lastLogin = lastLogin;
	}
	
	
	
	
//Setters and Getters
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public LocalDateTime getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(LocalDateTime createdDate2) {
		this.createdDate = createdDate2;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
		
	//Extract method
	public String toString() {
		
		return "UserId: "+userId+" Name: "+name+" UserName: "+username;
	}
}
