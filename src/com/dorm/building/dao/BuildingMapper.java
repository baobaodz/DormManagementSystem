package com.dorm.building.dao;

import java.util.Map;

import com.dorm.building.model.Building;

public interface BuildingMapper {

	    //��ȡadmin
		public int getAdmin(Map<String,Object> map);
		public void saveBuilding(Building building);
}
