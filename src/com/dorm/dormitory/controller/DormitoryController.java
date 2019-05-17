package com.dorm.dormitory.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Decoder;

import com.alibaba.fastjson.JSON;
import com.dorm.common.QiniuCloudUtil;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.dormitory.service.DormitoryService;

@Controller
public class DormitoryController {

	@Autowired
	@Qualifier("DormitoryService")
	private DormitoryService dormitoryService;
	

	/**
	 * ±£¥Ê¬•”Ó
	 * @param map
	 * @return 
	 */
	
	@RequestMapping(value="saveDormitory",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> saveDormitory(@RequestBody Map<String,Object> map){
		

		String category = String.valueOf(map.get("category"));
		int building_id = Integer.parseInt(String.valueOf(map.get("building_id")));
		System.out.println(category+building_id);
		List<Dormitory> dormitories = new ArrayList<Dormitory>();
		for(int j=1;j<=3;j++){
			for(int i=100*j+1;i<=100*j+20;i++){
				
				
				Dormitory dormitory = new Dormitory(i,category,5,0,building_id);
				dormitories.add(dormitory);
			}
			
		}
		System.out.println(dormitories);
		dormitoryService.saveDormitory(dormitories);
		return map;
	}
	
	/**
	 * ≤È—ØÀ˘”–¬•”Ó
	 * @param map
	 * @return dormadmins
	 */
	@RequestMapping(value="queryDormitory",method = RequestMethod.POST)
	@ResponseBody
	public String queryDormitory(@RequestBody Map<String,Object> map){
		
		List<Dormitory> dormitories = dormitoryService.queryDormitory();
		System.out.println(dormitories);
		return JSON.toJSON(dormitories).toString();
	}
	
	/**
	 * –ﬁ∏ƒ¬•”Ó
	 * @param map
	 * @return map
	 */
	@RequestMapping(value="modifyDormitory",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> modifyDormitory(@RequestBody Map<String,Object> map){
		
		
		String daid = String.valueOf(map.get("daid"));
		String dapassword = String.valueOf(map.get("dapassword"));
		String truename = String.valueOf(map.get("truename"));
		String sex = String.valueOf(map.get("sex"));
		String workphone = String.valueOf(map.get("workphone"));
		String introduction = String.valueOf(map.get("introduction"));
		
		int building_id = Integer.parseInt(String.valueOf(map.get("building_id")));
		
		Dormitory dormitory = new Dormitory();
		dormitoryService.modifyDormitory(dormitory);
		return map;
	}
	
	/**
	 * …æ≥˝÷∏∂®¬•”Ó
	 * @param bid
	 * @return building
	 */
	@RequestMapping(value="deleteDormitory",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteDormitory(@RequestBody Map<String,Object> map){
		
		String checkedId = String.valueOf(map.get("checkedId"));
		
		System.out.println(checkedId);
		
		dormitoryService.deleteDormitory(checkedId);
		
		return map;
	}
	/**
	 * ≤È—Ø÷∏∂®Àﬁ…·
	 * @param did
	 * @return 
	 */
	@RequestMapping(value="getDormitory",method = RequestMethod.POST)
	@ResponseBody
	public String getDormitory(@RequestBody Map<String,Object> map){
		
		String did = String.valueOf(map.get("daid"));
		Dormitory  dormitory = dormitoryService.getDormitory(did);
		System.out.println(dormitory);
		return JSON.toJSON(dormitory).toString();
	}
	/**
	 * ∞¥Àﬁ…·¬•≤È—ØÀﬁ…·
	 * @param bid
	 * @return dormitories
	 */
	@RequestMapping(value="queryDormitoryByBuilding",method = RequestMethod.POST)
	@ResponseBody
	public String queryDormitoryByBuilding(@RequestBody Map<String,Object> map){
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));		
		int currentPage = Integer.parseInt(String.valueOf(map.get("currentPage")));		
		int pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));		
		List<Dormitory>  dormitories = dormitoryService.queryDormitoryByBuilding(bid,currentPage,pageSize);
		System.out.println(dormitories);
		return JSON.toJSON(dormitories).toString();
	}
	/**
	 * ∞¥Àﬁ…·¬•≤È—ØÀﬁ…·
	 * @param bid
	 * @return dormitories
	 */
	@RequestMapping(value="getDormitoryNumber",method = RequestMethod.POST)
	@ResponseBody
	public String getDormitoryNumber(@RequestBody Map<String,Object> map){
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));		
		int dormitoryNumber = dormitoryService.getDormitoryNumber(bid);
		System.out.println(dormitoryNumber);
		return JSON.toJSON(dormitoryNumber).toString();
	}
}
