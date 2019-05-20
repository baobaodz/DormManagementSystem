package com.dorm.student.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.student.model.Student;

public interface StudentMapper {

	   
		public DormAdmin isDormAdmin(Map<String,Object> map);
		public void saveStudentBatch(List<Student> students);
		public List<Student> queryStudent();
		public List<Student> getDistrStudent(String gender);
		public List<Student> getOccupiedByDorm(int did);
		
		public void modifyDormitory(Dormitory dormitory);
		public Dormitory getDormitory(String did);
		public void deleteDormitory(String[] checkedId);
		public int getDormitoryNumber(int bid);
		
		public int getDormitoryId(@Param("buildingId") int buildingId,@Param("dormitoryDno") int dormitoryDno);
		public int isStudent(@Param("sid") String sid,@Param("spassword") String spassword);
		public List<Dormitory> queryDormitoryByBuilding(@Param("bid") int bid,
							@Param("currentPage") int currentPage,
							@Param("pageSize") int pageSize);
		public List<Map<String,String>> getDormitoryOccupied();
		public void updateOccupied(List<Map<String,String>> dormitoryOccupied);
		public void updateDistr(@Param("checkedSid") String[] checkedSid,@Param("checkedDid") int checkedDid);
}
