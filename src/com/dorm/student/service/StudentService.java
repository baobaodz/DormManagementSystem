package com.dorm.student.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.building.model.Building;
import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.repair.model.Repair;
import com.dorm.student.model.Student;


public interface StudentService {

	public DormAdmin isDormAdmin(Map<String,Object> map);
	public void saveStudentBatch(List<Student> students);
	public List<Student> queryStudent();
	public List<Student> getDistrStudent(String gender);
	public List<Student> getOccupiedByDorm(int did);
	public List<Building> getDistrBuildingByGender(String gender);
	public List<Dormitory> getDistrDormitoryByBuilding(int bid);
	
	public Student getStudent(String sid);
	public Student verifyStudent(String sid,String spassword);
	public void modifyPwd(String sid,String spassword);
	
	public void updateDistr(String checkedSid,int checkedDid);
	public void modifyDormitory(Dormitory dormitory);

	public void deleteDormitory(String checkedId);
	public int getDormitoryNumber(int bid);
	public int getDormitoryId(int buildingId,int dormitoryDno);
	public List<Dormitory> queryDormitoryByBuilding(int bid,int currentPage,int pageSize);
	
	public int isStudent(String sid,String spassword);
	
	public List<Map<String,String>> getDormitoryOccupied();
	public void updateOccupied(List<Map<String,String>> dormitoryOccupied);
	
	public int getStudentNumber(int bid,String sexId,String status,String queryKey);
			
	public List<Student> queryStudentByFilter(int bid,
			String sexId,
			String status,
			String queryKey,
			int currentPage,
			int pageSize);			
			
			
}
