package com.dorm.building.service;


import java.util.Map;

import com.dorm.building.model.Building;


public interface BuildingService {

	public int getAdmin(Map<String,Object> map);
	public void saveBuilding(Building building);
}
