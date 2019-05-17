package com.dorm.dormitory.model;

import java.util.List;

import com.dorm.building.model.Building;
import com.dorm.student.model.Student;

public class Dormitory {

	
	private int did;
	private int dno;
	private String category;
	private int capacity;
	private int occupied;
	private String honor;
	private String picdescription;
	private String textdescription;
	private int building_id;
	
	private Building building;
	private List<Student> students;

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getOccupied() {
		return occupied;
	}

	public void setOccupied(int occupied) {
		this.occupied = occupied;
	}

	public String getHonor() {
		return honor;
	}

	public void setHonor(String honor) {
		this.honor = honor;
	}

	public String getPicdescription() {
		return picdescription;
	}

	public void setPicdescription(String picdescription) {
		this.picdescription = picdescription;
	}

	public String getTextdescription() {
		return textdescription;
	}

	public void setTextdescription(String textdescription) {
		this.textdescription = textdescription;
	}

	public int getBuilding_id() {
		return building_id;
	}

	public void setBuilding_id(int building_id) {
		this.building_id = building_id;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Dormitory(int did, int dno, String category, int capacity,
			int occupied, String honor, String picdescription,
			String textdescription, int building_id) {
		super();
		this.did = did;
		this.dno = dno;
		this.category = category;
		this.capacity = capacity;
		this.occupied = occupied;
		this.honor = honor;
		this.picdescription = picdescription;
		this.textdescription = textdescription;
		this.building_id = building_id;
	}

	public Dormitory(int dno, String category, int capacity, int occupied,
			String honor, String picdescription, String textdescription,
			int building_id) {
		super();
		this.dno = dno;
		this.category = category;
		this.capacity = capacity;
		this.occupied = occupied;
		this.honor = honor;
		this.picdescription = picdescription;
		this.textdescription = textdescription;
		this.building_id = building_id;
	}

	public Dormitory(int dno, String category, int capacity, int occupied,
			int building_id) {
		super();
		this.dno = dno;
		this.category = category;
		this.capacity = capacity;
		this.occupied = occupied;
		this.building_id = building_id;
	}

	public Dormitory() {
		super();
	}

	@Override
	public String toString() {
		return "Dormitory [did=" + did + ", dno=" + dno + ", category="
				+ category + ", capacity=" + capacity + ", occupied="
				+ occupied + ", honor=" + honor + ", picdescription="
				+ picdescription + ", textdescription=" + textdescription
				+ ", building_id=" + building_id + ", building=" + building
				+ ", students=" + students + "]";
	}
	


}
