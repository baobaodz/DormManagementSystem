package com.dorm.student.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.dao.DormitoryMapper;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.student.dao.StudentMapper;
import com.dorm.student.model.Student;

@Service("StudentService")
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;

	@Override
	public DormAdmin isDormAdmin(Map<String, Object> map) {
		
		return studentMapper.isDormAdmin(map);
	}


	@Override
	public List<Student> queryStudent() {
		
		List<Student> student = studentMapper.queryStudent();
		return student;
	}

	@Override
	public void modifyDormitory(Dormitory dormitory) {
		
		studentMapper.modifyDormitory(dormitory);
		
	}


	@Override
	public void deleteDormitory(String checkedId) {
		studentMapper.deleteDormitory(checkedId.split(","));
		
	}

	@Override
	public List<Dormitory> queryDormitoryByBuilding(int bid,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		return studentMapper.queryDormitoryByBuilding(bid,currentPage,pageSize);
	}

	@Override
	public int getDormitoryNumber(int bid) {
		// TODO Auto-generated method stub
		return studentMapper.getDormitoryNumber(bid);
	}

	@Override
	public void saveStudentBatch(List<Student> students) {
		// TODO Auto-generated method stub
		studentMapper.saveStudentBatch(students);
	}


	@Override
	public int getDormitoryId(int buildingId, int dormitoryDno) {
		// TODO Auto-generated method stub
		return studentMapper.getDormitoryId(buildingId, dormitoryDno);
	}


	@Override
	public int isStudent(String sid, String spassword) {
		// TODO Auto-generated method stub
		return studentMapper.isStudent(sid, spassword);
	}


	@Override
	public List<Map<String, String>> getDormitoryOccupied() {
		// TODO Auto-generated method stub
		return studentMapper.getDormitoryOccupied();
	}


	@Override
	public void updateOccupied(List<Map<String, String>> dormitoryOccupied) {
		// TODO Auto-generated method stub
		studentMapper.updateOccupied(dormitoryOccupied);
	}


	@Override
	public List<Student> getDistrStudent(String gender) {
		// TODO Auto-generated method stub
		return studentMapper.getDistrStudent(gender);
	}


	@Override
	public void updateDistr(String checkedSid, int checkedDid) {
		// TODO Auto-generated method stub
		studentMapper.updateDistr(checkedSid.split(","), checkedDid);
	}


	@Override
	public List<Student> getOccupiedByDorm(int did) {
		// TODO Auto-generated method stub
		return studentMapper.getOccupiedByDorm(did);
	}


	@Override
	public Student getStudent(String sid) {
		// TODO Auto-generated method stub
		return studentMapper.getStudent(sid);
	}


	@Override
	public Student verifyStudent(String sid, String spassword) {
		// TODO Auto-generated method stub
		return studentMapper.verifyStudent(sid, spassword);
	}


	@Override
	public void modifyPwd(String sid, String spassword) {
		// TODO Auto-generated method stub
		studentMapper.modifyPwd(sid, spassword);
	}


}
