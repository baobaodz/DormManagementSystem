package com.dorm.student.model;

import java.sql.Date;

import com.dorm.dormitory.model.Dormitory;

public class Student {

	
	private String sid;
	private String sname;
	private String spassword;
	private String gender;
	private Date admission;
	private String sgrade;
	private int sclass;
	private String status;
	private String character;
	private int dormitory_id;
	
	private Dormitory dormitory;


	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getSgrade() {
		return sgrade;
	}

	public void setSgrade(String sgrade) {
		this.sgrade = sgrade;
	}

	public int getSclass() {
		return sclass;
	}

	public void setSclass(int sclass) {
		this.sclass = sclass;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}

	public int getDormitory_id() {
		return dormitory_id;
	}

	public void setDormitory_id(int dormitory_id) {
		this.dormitory_id = dormitory_id;
	}


	public Dormitory getDormitory() {
		return dormitory;
	}

	public void setDormitory(Dormitory dormitory) {
		this.dormitory = dormitory;
	}

	
	
	public String getSpassword() {
		return spassword;
	}

	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}

	public Date getAdmission() {
		return admission;
	}

	public void setAdmission(Date admission) {
		this.admission = admission;
	}

	public Student() {
		super();
	}

	public Student(String sid, String sname, String spassword, String gender,
			Date admission, String sgrade, int sclass, String status,
			String character) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.spassword = spassword;
		this.gender = gender;
		this.admission = admission;
		this.sgrade = sgrade;
		this.sclass = sclass;
		this.status = status;
		this.character = character;
	}


	public Student(String sid, String sname, String spassword, String gender,
			Date admission, String sgrade, int sclass, String status,
			String character, int dormitory_id) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.spassword = spassword;
		this.gender = gender;
		this.admission = admission;
		this.sgrade = sgrade;
		this.sclass = sclass;
		this.status = status;
		this.character = character;
		this.dormitory_id = dormitory_id;
	}

	public Student(String sid, String sname, String gender, Date admission,
			String sgrade, int sclass, String status) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.gender = gender;
		this.admission = admission;
		this.sgrade = sgrade;
		this.sclass = sclass;
		this.status = status;
	}

	@Override
	public String toString() {
		return "Student [sid=" + sid + ", sname=" + sname + ", spassword="
				+ spassword + ", gender=" + gender + ", admission=" + admission
				+ ", sgrade=" + sgrade + ", sclass=" + sclass + ", status="
				+ status + ", character=" + character + ", dormitory_id="
				+ dormitory_id + ", dormitory=" + dormitory + "]";
	}



}
