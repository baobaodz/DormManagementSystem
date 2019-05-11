package com.dorm.building.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.building.model.Building;
import com.dorm.dormadmin.model.DormAdmin;

public interface BuildingMapper {

	    //ªÒ»°admin
		public int getAdmin(Map<String,Object> map);
		public void saveBuilding(Building building);
		public List<Building> queryBuilding();
		public void modifyBuilding(Building building);
		public Building getBuilding(@Param("bid") int bid,@Param("listSize") int listSize);
		public void deleteBuilding(int bid);
		public int getDormAdminNumber(int bid);
		public List<DormAdmin> getDormAdmins(int bid);
}
