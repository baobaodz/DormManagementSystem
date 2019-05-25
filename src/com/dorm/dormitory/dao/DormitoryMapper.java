package com.dorm.dormitory.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;

public interface DormitoryMapper {

	   
		public DormAdmin isDormAdmin(Map<String,Object> map);
		public void saveDormitory(List<Dormitory> dormitories);
		public List<Dormitory> queryDormitory();
		public void modifyDormitory(Dormitory dormitory);
		public Dormitory getDormitory(String did);
		public void deleteDormitory(String[] checkedId);
		public int getDormitoryNumber(int bid);
		public List<Dormitory> queryDormitoryByBuilding(@Param("bid") int bid,
							@Param("currentPage") int currentPage,
							@Param("pageSize") int pageSize);

		
}
