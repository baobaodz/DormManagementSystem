package com.dorm.student.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.building.model.Building;
import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.repair.model.Repair;
import com.dorm.student.model.Student;

public interface StudentMapper {

	   
		public DormAdmin isDormAdmin(Map<String,Object> map);
		public void saveStudentBatch(List<Student> students);
		public List<Student> queryStudent();
		public List<Student> getDistrStudent(String gender);
		public List<Student> getOccupiedByDorm(int did);
		public List<Building> getDistrBuildingByGender(@Param("gender") String gender);
		public List<Dormitory> getDistrDormitoryByBuilding(int bid);
		
		public Student getStudent(String sid);
		public Student verifyStudent(@Param("sid") String sid,@Param("spassword") String spassword);
		public void modifyPwd(@Param("sid") String sid,@Param("spassword") String spassword);

		
		public void modifyDormitory(Dormitory dormitory);
		public void deleteDormitory(String[] checkedId);
		
		public int getDormitoryId(@Param("buildingId") int buildingId,@Param("dormitoryDno") int dormitoryDno);
		public int isStudent(@Param("sid") String sid,@Param("spassword") String spassword);
		public List<Map<String,String>> getDormitoryOccupied();
		public void updateOccupied(List<Map<String,String>> dormitoryOccupied);
		
		public void updateDistr(@Param("checkedSid") String[] checkedSid,@Param("checkedDid") int checkedDid);

		public List<Student> queryStudentByFilter(@Param("bid") int bid,
				@Param("sexId") String sexId,
				@Param("status") String status,
				@Param("queryKey") String queryKey,
				@Param("currentPage") int currentPage,
				@Param("pageSize") int pageSize);		
		public int getStudentNumber(@Param("bid") int bid,
				@Param("sexId") String sexId,
				@Param("status") String status,	
				@Param("queryKey") String queryKey);


}
