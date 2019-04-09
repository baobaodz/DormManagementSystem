package com.dorm.building.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dorm.admin.model.Admin;
import com.dorm.building.model.Building;
import com.dorm.building.service.BuildingService;

@Controller
public class BuildingController {

	@Autowired
	@Qualifier("BuildingService")
	private BuildingService buildingService;
	
	
	@RequestMapping(value="saveBuilding",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> saveBuilding(@RequestBody Map<String,Object> map,HttpSession session){
		
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		String bname = String.valueOf(map.get("bname"));
		String attribute = String.valueOf(map.get("attribute"));
		String location = String.valueOf(map.get("location"));
		String description = String.valueOf(map.get("description"));
		String imageinfo = String.valueOf(map.get("imageinfo"));
		
		Building building = new Building(bid,bname,attribute,location,description,imageinfo);
		buildingService.saveBuilding(building);
		return map;
	}
	@RequestMapping(value="queryBuilding",method = RequestMethod.POST)
	@ResponseBody
	public String queryBuilding(@RequestBody Map<String,Object> map,HttpSession session){
		
		List<Building> buildings = buildingService.queryBuilding();
		
		return JSON.toJSON(buildings).toString();
	}
	
	@RequestMapping(value="modifyBuilding",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> modifyBuilding(@RequestBody Map<String,Object> map,HttpSession session){
		
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		String bname = String.valueOf(map.get("bname"));
		String attribute = String.valueOf(map.get("attribute"));
		String location = String.valueOf(map.get("location"));
		String description = String.valueOf(map.get("description"));
		String imageinfo = String.valueOf(map.get("imageinfo"));
		
		Building building = new Building(bid,bname,attribute,location,description,imageinfo);
		buildingService.modifyBuilding(building);
		return map;
	}
	@RequestMapping(value="getBuilding",method = RequestMethod.POST)
	@ResponseBody
	public String getBuilding(@RequestBody Map<String,Object> map,HttpSession session){
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		Building  building = buildingService.getBuilding(bid);
		
		return JSON.toJSON(building).toString();
	}
}
