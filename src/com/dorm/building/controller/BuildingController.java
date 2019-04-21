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
import com.dorm.dormadmin.service.DormAdminService;

@Controller
public class BuildingController {

	@Autowired
	@Qualifier("BuildingService")
	private BuildingService buildingService;
	private DormAdminService dormadminService;
	

	/**
	 * 保存楼宇
	 * @param map
	 * @return 
	 */
	@RequestMapping(value="saveBuilding",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> saveBuilding(@RequestBody Map<String,Object> map,HttpSession session){
		
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		String bname = String.valueOf(map.get("bname"));
		String attribute = String.valueOf(map.get("attribute"));
		String location = String.valueOf(map.get("location"));
		String description = String.valueOf(map.get("description"));
		String imageinfo = String.valueOf(map.get("imageinfo"));
		int managernumber = Integer.parseInt(String.valueOf(map.get("managernumber")));
		int availablenumber = Integer.parseInt(String.valueOf(map.get("managernumber")));

		Building building = new Building(bid,bname,attribute,location,description,imageinfo,managernumber,availablenumber);
		buildingService.saveBuilding(building);
		return map;
	}
	
	/**
	 * 查询所有楼宇
	 * @param map
	 * @return buildings
	 */
	@RequestMapping(value="queryBuilding",method = RequestMethod.POST)
	@ResponseBody
	public String queryBuilding(@RequestBody Map<String,Object> map,HttpSession session){
		
		List<Building> buildings = buildingService.queryBuilding();
		
		return JSON.toJSON(buildings).toString();
	}
	
	/**
	 * 修改楼宇
	 * @param map
	 * @return map
	 */
	@RequestMapping(value="modifyBuilding",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> modifyBuilding(@RequestBody Map<String,Object> map){
		
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		String bname = String.valueOf(map.get("bname"));
		String attribute = String.valueOf(map.get("attribute"));
		String location = String.valueOf(map.get("location"));
		String description = String.valueOf(map.get("description"));
		String imageinfo = String.valueOf(map.get("imageinfo"));
		int managernumber = Integer.parseInt(String.valueOf(map.get("managernumber")));
		
		int availablenumber = Integer.parseInt(String.valueOf(map.get("managernumber")));
		
		int num = dormadminService.getDormAdminNumber(bid);
		
		if(managernumber>=num){
			
			availablenumber = managernumber - num;
		}
		Building building = new Building(bid,bname,attribute,location,description,imageinfo,managernumber,availablenumber);
		buildingService.modifyBuilding(building);
		return map;
	}
	
	/**
	 * 查询指定楼宇
	 * @param bid
	 * @return building
	 */
	@RequestMapping(value="deleteBuilding",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteBuilding(@RequestBody Map<String,Object> map){
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		
		buildingService.deleteBuilding(bid);
		
		return map;
	}
	/**
	 * 删除指定楼宇
	 * @param bid
	 * @return 
	 */
	@RequestMapping(value="getBuilding",method = RequestMethod.POST)
	@ResponseBody
	public String getBuilding(@RequestBody Map<String,Object> map){
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		Building  building = buildingService.getBuilding(bid);
		
		return JSON.toJSON(building).toString();
	}
}
