package com.dorm.admin.model;


public class Admin {

	public Admin() {
		// TODO Auto-generated constructor stub
	}
	private String aname;
	private String apassword;
	private String role;
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApassword() {
		return apassword;
	}
	public void setApassword(String apassword) {
		this.apassword = apassword;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Admin(String aname, String apassword) {
		super();
		this.aname = aname;
		this.apassword = apassword;
	}
	
	public Admin(String aname, String apassword, String role) {
		super();
		this.aname = aname;
		this.apassword = apassword;
		this.role = role;
	}
	@Override
	public String toString() {
		return "Admin [aname=" + aname + ", apassword=" + apassword + ", role="
				+ role + "]";
	}
	
	
	
}

