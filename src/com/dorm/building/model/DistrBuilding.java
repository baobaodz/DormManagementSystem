package com.dorm.building.model;

import java.util.List;

import com.dorm.dormadmin.model.DormAdmin;

public class DistrBuilding {

	private int bid;
	private String bname;
	private String attribute;
	private int existing;
	private int managernumber;
	
	
	
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


	public int getExisting() {
		return existing;
	}


	public void setExisting(int existing) {
		this.existing = existing;
	}

	
	public int getManagernumber() {
		return managernumber;
	}


	public void setManagernumber(int managernumber) {
		this.managernumber = managernumber;
	}



	@Override
	public String toString() {
		return "DistrBuilding [bid=" + bid + ", bname=" + bname
				+ ", attribute=" + attribute + ", existing=" + existing
				+ ", managernumber=" + managernumber + "]";
	}


	public DistrBuilding(int bid, String bname, String attribute, int existing,
			int managernumber) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.attribute = attribute;
		this.existing = existing;
		this.managernumber = managernumber;
	}


	public DistrBuilding() {
		// TODO Auto-generated constructor stub
	}

}
