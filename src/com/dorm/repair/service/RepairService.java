package com.dorm.repair.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.repair.model.Repair;


public interface RepairService {

	public void saveRepairApplication(Repair repair);
	public List<Dormitory> queryDormitory();
	public void handleRepairApplication(Repair repair);
	public void modifyRepairApplication(Repair repair);
	public void updateRepairStatus(int rid,int handlestatus);
	public List<Repair> getRepairApplication(String budno);
	public void deleteRepairApplication(int rid);
	public List<Dormitory> queryDormitoryByBuilding(int bid,int currentPage,int pageSize);
	public List<Repair> queryRepairApplication(int bid,
			int typeId,
			String startTime,
			String endTime,
			String checkedStatusId,
			int currentPage,
			int pageSize);	
	public int getApplicationNumber(int bid,
			int typeId,
			String startTime,
			String endTime,
			String checkedStatusId);
	public List<Map<String,Integer>> getPieDataByRtype();
}
