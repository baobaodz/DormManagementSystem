package com.dorm.dormitory.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.dao.DormitoryMapper;
import com.dorm.dormitory.model.Dormitory;

@Service("DormitoryService")
public class DormitoryServiceImpl implements DormitoryService{

	@Autowired
	private DormitoryMapper dormitoryMapper;

	@Override
	public DormAdmin isDormAdmin(Map<String, Object> map) {
		
		return dormitoryMapper.isDormAdmin(map);
	}

	@Override
	public void saveDormitory(List<Dormitory> dormitories) {
		
		dormitoryMapper.saveDormitory(dormitories);
	}

	@Override
	public List<Dormitory> queryDormitory() {
		
		List<Dormitory> dormitories = dormitoryMapper.queryDormitory();
		return dormitories;
	}

	@Override
	public void modifyDormitory(Dormitory dormitory) {
		
		dormitoryMapper.modifyDormitory(dormitory);
		
	}

	@Override
	public Dormitory getDormitory(String did) {
		// TODO Auto-generated method stub
		return dormitoryMapper.getDormitory(did);
	}

	@Override
	public void deleteDormitory(String checkedId) {
		dormitoryMapper.deleteDormitory(checkedId.split(","));
		
	}

	@Override
	public List<Dormitory> queryDormitoryByBuilding(int bid,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		return dormitoryMapper.queryDormitoryByBuilding(bid,currentPage,pageSize);
	}

	@Override
	public int getDormitoryNumber(int bid) {
		// TODO Auto-generated method stub
		return dormitoryMapper.getDormitoryNumber(bid);
	}



}
