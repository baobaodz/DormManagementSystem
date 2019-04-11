package com.dorm.building.dao;

import java.util.List;
import java.util.Map;

import com.dorm.building.model.Building;

public interface BuildingMapper {

	    //ªÒ»°admin
		public int getAdmin(Map<String,Object> map);
		public void saveBuilding(Building building);
		public List<Building> queryBuilding();
		public void modifyBuilding(Building building);
		public Building getBuilding(int bid);
		public void deleteBuilding(int bid);
}
