package com.dorm.student.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.student.model.Student;


public interface StudentService {

	public DormAdmin isDormAdmin(Map<String,Object> map);
	public void saveStudentBatch(List<Student> students);
	public List<Student> queryStudent();
	public List<Student> getDistrStudent(String gender);
	public List<Student> getOccupiedByDorm(int did);
	
	public void updateDistr(String checkedSid,int checkedDid);
	public void modifyDormitory(Dormitory dormitory);
	public Dormitory getDormitory(String did);
	public void deleteDormitory(String checkedId);
	public int getDormitoryNumber(int bid);
	public int getDormitoryId(int buildingId,int dormitoryDno);
	public List<Dormitory> queryDormitoryByBuilding(int bid,int currentPage,int pageSize);
	
	public int isStudent(String sid,String spassword);
	
	public List<Map<String,String>> getDormitoryOccupied();
	public void updateOccupied(List<Map<String,String>> dormitoryOccupied);
}
