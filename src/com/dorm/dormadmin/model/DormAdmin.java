package com.dorm.dormadmin.model;

import com.dorm.building.model.Building;

public class DormAdmin {

	
	private String daid;
	private String dapassword;
	private String role;
	private String truename;
	private String sex;
	private String workphone;
	private String workstate;
	private String introduction;
	private String picture;
	private int building_id;
	
	private Building building;
	
	public String getDaid() {
		return daid;
	}


	public void setDaid(String daid) {
		this.daid = daid;
	}


	public String getDapassword() {
		return dapassword;
	}


	public void setDapassword(String dapassword) {
		this.dapassword = dapassword;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getTruename() {
		return truename;
	}


	public void setTruename(String truename) {
		this.truename = truename;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getWorkphone() {
		return workphone;
	}


	public void setWorkphone(String workphone) {
		this.workphone = workphone;
	}

	
	public String getIntroduction() {
		return introduction;
	}


	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	
	public String getWorkstate() {
		return workstate;
	}


	public void setWorkstate(String workstate) {
		this.workstate = workstate;
	}

	
	public Building getBuilding() {
		return building;
	}


	public void setBuilding(Building building) {
		this.building = building;
	}


	

	public int getBuilding_id() {
		return building_id;
	}


	public void setBuilding_id(int building_id) {
		this.building_id = building_id;
	}


	@Override
	public String toString() {
		return "DormAdmin [daid=" + daid + ", dapassword=" + dapassword
				+ ", role=" + role + ", truename=" + truename + ", sex=" + sex
				+ ", workphone=" + workphone + ", workstate=" + workstate
				+ ", introduction=" + introduction + ", picture=" + picture
				+ ", building=" + building + "]";
	}


	public DormAdmin() {
		// TODO Auto-generated constructor stub
	}
	
	
	public DormAdmin(String daid, String dapassword, String role,
			String truename, String sex, String workphone, 
			String workstate,String introduction, String picture) {
		super();
		this.daid = daid;
		this.dapassword = dapassword;
		this.role = role;
		this.truename = truename;
		this.sex = sex;
		this.workphone = workphone;
		this.workstate = workstate;
		this.introduction = introduction;
		this.picture = picture;
	}


	public DormAdmin(String daid, String dapassword, String role) {
		super();
		this.daid = daid;
		this.dapassword = dapassword;
		this.role = role;
	}


	public DormAdmin(String daid, String truename, String sex,
			String workphone, String workstate, String introduction,
			String picture, Building building) {
		super();
		this.daid = daid;
		this.truename = truename;
		this.sex = sex;
		this.workphone = workphone;
		this.workstate = workstate;
		this.introduction = introduction;
		this.picture = picture;
		this.building = building;
	}


	public DormAdmin(String daid, String dapassword, String role,
			String truename, String sex, String workphone, String workstate,
			String introduction, String picture, int building_id) {
		super();
		this.daid = daid;
		this.dapassword = dapassword;
		this.role = role;
		this.truename = truename;
		this.sex = sex;
		this.workphone = workphone;
		this.workstate = workstate;
		this.introduction = introduction;
		this.picture = picture;
		this.building_id = building_id;
	}


	public DormAdmin(String daid, String dapassword, String truename,
			String sex, String workphone, String introduction, int building_id) {
		super();
		this.daid = daid;
		this.dapassword = dapassword;
		this.truename = truename;
		this.sex = sex;
		this.workphone = workphone;
		this.introduction = introduction;
		this.building_id = building_id;
	}


	public DormAdmin(String daid, String truename, String sex,
			String workstate) {
		super();
		this.daid = daid;
		this.truename = truename;
		this.sex = sex;
		this.workstate = workstate;
	}

	

}
