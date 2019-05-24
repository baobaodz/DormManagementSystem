package com.dorm.repair.service;


import java.util.List;
import java.util.Map;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.repair.model.Repair;


public interface RepairService {

	public void saveRepairApplication(Repair repair);
	public List<Dormitory> queryDormitory();
	public void modifyDormitory(Dormitory dormitory);
	public List<Repair> getRepairApplication(String budno);
	public void deleteRepairApplication(int rid);
	public int getDormitoryNumber(int bid);
	public List<Dormitory> queryDormitoryByBuilding(int bid,int currentPage,int pageSize);
}
