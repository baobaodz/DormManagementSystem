package com.dorm.building.model;

public class Building {

	private int bid;
	private String bname;
	private String attribute;
	private String location;
	private String description;
	private String imageinfo;
	
	
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


	@Override
	public String toString() {
		return "Building [bid=" + bid + ", bname=" + bname + ", attribute="
				+ attribute + ", location=" + location + ", description="
				+ description + ", imageinfo=" + imageinfo + "]";
	}

	
	public Building(int bid, String bname, String attribute, String location,
			String description) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.attribute = attribute;
		this.location = location;
		this.description = description;
	}
	

	public Building(int bid, String bname, String attribute, String location,
			String description, String imageinfo) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.attribute = attribute;
		this.location = location;
		this.description = description;
		this.imageinfo = imageinfo;
	}


	public Building() {
		// TODO Auto-generated constructor stub
	}

}
