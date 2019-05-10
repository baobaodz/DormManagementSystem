package com.dorm.building.service;


import java.util.List;
import java.util.Map;

import com.dorm.building.model.Building;


public interface BuildingService {

	public int getAdmin(Map<String,Object> map);
	public void saveBuilding(Building building);
	public void modifyBuilding(Building building);
	public List<Building> queryBuilding();
	public Building getBuilding(int bid);
	public void deleteBuilding(int bid);
	public int getDormAdminNumber(int bid);
}
