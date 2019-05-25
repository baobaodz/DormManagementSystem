package com.dorm.repair.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.dao.DormitoryMapper;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.repair.dao.RepairMapper;
import com.dorm.repair.model.Repair;

@Service("RepairService")
public class RepairServiceImpl implements RepairService{

	@Autowired
	private RepairMapper repairMapper;


	@Override
	public void saveRepairApplication(Repair repair) {
		// TODO Auto-generated method stub
		repairMapper.saveRepairApplication(repair);
	}

	@Override
	public List<Dormitory> queryDormitory() {
		
		List<Dormitory> dormitories = repairMapper.queryDormitory();
		return dormitories;
	}

	@Override
	public void modifyDormitory(Dormitory dormitory) {
		
		repairMapper.modifyDormitory(dormitory);
		
	}

	@Override
	public List<Dormitory> queryDormitoryByBuilding(int bid,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		return repairMapper.queryDormitoryByBuilding(bid,currentPage,pageSize);
	}

	@Override
	public int getApplicationNumber(int bid) {
		// TODO Auto-generated method stub
		return repairMapper.getApplicationNumber(bid);
	}

	@Override
	public List<Repair> getRepairApplication(String budno) {
		// TODO Auto-generated method stub
		return repairMapper.getRepairApplication(budno);
	}

	@Override
	public void deleteRepairApplication(int rid) {
		// TODO Auto-generated method stub
		repairMapper.deleteRepairApplication(rid);
	}

	@Override
	public List<Repair> queryRepairApplication(int buildingId,
			String startTime, String endTime, String handleStatus,
			int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return repairMapper.queryRepairApplication(buildingId, startTime, endTime, handleStatus.split(","), currentPage, pageSize);
	}




}
