package com.dorm.repair.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.repair.model.Repair;

public interface RepairMapper {

	   
		public void saveRepairApplication(Repair repair);
		public List<Dormitory> queryDormitory();
		public void modifyDormitory(Dormitory dormitory);
		public void handleRepairApplication(Repair repair);
		public List<Repair> getRepairApplication(String budno);
		public void deleteRepairApplication(int rid);
		public List<Dormitory> queryDormitoryByBuilding(@Param("bid") int bid,
							@Param("currentPage") int currentPage,
							@Param("pageSize") int pageSize);
		public List<Repair> queryRepairApplication(@Param("bid") int bid,
				@Param("typeId") int typeId,
				@Param("startTime") String startTime,
				@Param("endTime") String endTime,
				@Param("checkedStatusId") String[] checkedStatusId,
				@Param("currentPage") int currentPage,
				@Param("pageSize") int pageSize);		
		public int getApplicationNumber(@Param("bid") int bid,
				@Param("typeId") int typeId,
				@Param("startTime") String startTime,
				@Param("endTime") String endTime,
				@Param("checkedStatusId") String[] checkedStatusId);	
					
}
