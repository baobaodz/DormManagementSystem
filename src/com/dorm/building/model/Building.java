package com.dorm.building.model;

import java.util.List;

import com.dorm.dormadmin.model.DormAdmin;

public class Building {

	private int bid;
	private String bname;
	private String attribute;
	private String location;
	private String description;
	private String imageinfo;
	private int managernumber;
	
	private List<DormAdmin> dormadmins;
	
	
	public int getBid() {
		return bid;
	}


	public void setBid(int bid) {
		this.bid = bid;
	}


	public String getBname() {
		return bname;
	}


	public void setBname(String bname) {
		this.bname = bname;
	}


	public String getAttribute() {
		return attribute;
	}


	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public String getImageinfo() {
		return imageinfo;
	}


	public void setImageinfo(String imageinfo) {
		this.imageinfo = imageinfo;
	}

	
	public int getManagernumber() {
		return managernumber;
	}


	public void setManagernumber(int managernumber) {
		this.managernumber = managernumber;
	}


	public List<DormAdmin> getDormadmin() {
		return dormadmins;
	}


	public void setDormadmin(List<DormAdmin> dormadmins) {
		this.dormadmins = dormadmins;
	}


	@Override
	public String toString() {
		return "Building [bid=" + bid + ", bname=" + bname + ", attribute="
				+ attribute + ", location=" + location + ", description="
				+ description + ", imageinfo=" + imageinfo + ", managernumber="
				+ managernumber + ", dormadmins=" + dormadmins + "]";
				
	}


	

	
	public Building(int bid, String bname, String attribute, String location,
			String description, String imageinfo, int managernumber
			) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.attribute = attribute;
		this.location = location;
		this.description = description;
		this.imageinfo = imageinfo;
		this.managernumber = managernumber;
	}


	public Building(int bid, String bname, String attribute,
			int managernumber) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.attribute = attribute;
		this.managernumber = managernumber;
	}




	public Building(int bid, String bname, String attribute, String location,
			String description, String imageinfo, int managernumber,
			List<DormAdmin> dormadmins) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.attribute = attribute;
		this.location = location;
		this.description = description;
		this.imageinfo = imageinfo;
		this.managernumber = managernumber;
		this.dormadmins = dormadmins;
	}


	public Building() {
		// TODO Auto-generated constructor stub
	}

}
