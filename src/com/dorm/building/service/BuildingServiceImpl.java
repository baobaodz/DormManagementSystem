package com.dorm.building.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dorm.building.dao.BuildingMapper;
import com.dorm.building.model.Building;

@Service("BuildingService")
public class BuildingServiceImpl implements BuildingService{

	@Autowired
	private BuildingMapper buildingMapper;
	
	public int getAdmin(Map<String,Object> map){
		
		int i = buildingMapper.getAdmin(map);
		
		return i;
	}

	@Override
	public void saveBuilding(Building building) {
		
		buildingMapper.saveBuilding(building);
	}

	@Override
	public List<Building> queryBuilding() {
		List<Building> buildings = buildingMapper.queryBuilding();
		return buildings;
	}
		
		
	

}
