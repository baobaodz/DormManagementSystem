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
	public void modifyDormitory(Dormitory dormitory);
	public List<Repair> getRepairApplication(String budno);
	public void deleteRepairApplication(int rid);
	public int getApplicationNumber(int bid);
	public List<Dormitory> queryDormitoryByBuilding(int bid,int currentPage,int pageSize);
	public List<Repair> queryRepairApplication(int buildingId,
			String startTime,
			String endTime,
			String handleStatus,
			int currentPage,
			int pageSize);	
}
