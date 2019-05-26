package com.dorm.repair.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.dormitory.service.DormitoryService;
import com.dorm.repair.model.Repair;
import com.dorm.repair.service.RepairService;

@Controller
public class RepairController {

	@Autowired
	@Qualifier("RepairService")
	private RepairService repairService;
	

	/**
	 * 保存楼宇
	 * @param map
	 * @return 
	 */
	
	@RequestMapping(value="saveRepairApplication",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> saveRepairApplication(@RequestBody Map<String,Object> map){
		

		String budno = String.valueOf(map.get("budno"));
		int rtype = Integer.parseInt(String.valueOf(map.get("rtype")));
		String rcause = String.valueOf(map.get("rcause"));
		SimpleDateFormat myfmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制
		String reporttime=myfmt.format(new java.util.Date()).toString();
		String reporter = String.valueOf(map.get("reporter"));
		int handlestatus = Integer.parseInt(String.valueOf(map.get("handlestatus")));
		
		String pictureBase64 = String.valueOf(map.get("rpicture"));
		QiniuCloudUtil qiniucloud = new QiniuCloudUtil();
		String rpicture = null;
        // 通过base64来转化图片
		String imageBase64 = pictureBase64.substring(pictureBase64.indexOf(",") + 1);//去掉前面的标识
		BASE64Decoder decoder = new BASE64Decoder();
			// Base64解码      
			byte[] imageByte = null;
			try {
				imageByte = decoder.decodeBuffer(imageBase64);      
				for (int i = 0; i < imageByte.length; ++i) {      
					if (imageByte[i] < 0) {// 调整异常数据      
						imageByte[i] += 256;      
					}      
				}  
				rpicture = qiniucloud.put64image(imageByte, "repairApplication-"+System.currentTimeMillis()+".jpg");
			} catch (Exception e) {
				 e.printStackTrace(); 
			}					


		Repair repair = new Repair(budno,rtype,rcause,rpicture,reporttime,reporter,handlestatus);
		repairService.saveRepairApplication(repair);
		return map;
	}
	
	/**
	 * 查询指定报修申请
	 * @param did
	 * @return 
	 */
	@RequestMapping(value="getRepairApplication",method = RequestMethod.POST)
	@ResponseBody
	public String getRepairApplication(@RequestBody Map<String,Object> map){
		
		String budno = String.valueOf(map.get("budno"));
		
		List<Repair> repairs = repairService.getRepairApplication(budno);
		System.out.println(repairs);
		return JSON.toJSON(repairs).toString();
	}
	/**
	 * 查询所有楼宇
	 * @param map
	 * @return dormadmins
	 */
	@RequestMapping(value="queryRepairApplication",method = RequestMethod.POST)
	@ResponseBody
	public String queryRepairApplication(@RequestBody Map<String,Object> map){
		

		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		int typeId = Integer.parseInt(String.valueOf(map.get("typeId")));
		String startTime = String.valueOf(map.get("startTime"));
		String endTime = String.valueOf(map.get("endTime"));
		SimpleDateFormat myfmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制
		String reporttime=myfmt.format(new java.util.Date()).toString();
		String checkedStatusId = String.valueOf(map.get("checkedStatusId"));
		int currentPage = Integer.parseInt(String.valueOf(map.get("currentPage")));
		int pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));
		
		List<Repair> repairApplications = repairService.queryRepairApplication(bid,typeId,startTime,endTime,checkedStatusId,currentPage,pageSize);
		System.out.println("repairApplications:"+repairApplications);
		return JSON.toJSON(repairApplications).toString();
	}
	
//	/**
//	 * 修改楼宇
//	 * @param map
//	 * @return map
//	 */
//	@RequestMapping(value="modifyRepairApplication",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String,Object> modifyDormitory(@RequestBody Map<String,Object> map){
//		
//		
//		String daid = String.valueOf(map.get("daid"));
//		String dapassword = String.valueOf(map.get("dapassword"));
//		String truename = String.valueOf(map.get("truename"));
//		String sex = String.valueOf(map.get("sex"));
//		String workphone = String.valueOf(map.get("workphone"));
//		String introduction = String.valueOf(map.get("introduction"));
//		
//		int building_id = Integer.parseInt(String.valueOf(map.get("building_id")));
//		
//		Dormitory dormitory = new Dormitory();
//		repairService.modifyDormitory(dormitory);
//		return map;
//	}
//	
	/**
	 * 删除指定报修记录
	 * @param rid
	 * @return map
	 */
	@RequestMapping(value="deleteRepairApplication",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteRepairApplication(@RequestBody Map<String,Object> map){
		
		int rid = Integer.parseInt(String.valueOf(map.get("rid")));
		
		repairService.deleteRepairApplication(rid);
		
		return map;
	}

//	/**
//	 * 按宿舍楼查询宿舍
//	 * @param bid
//	 * @return dormitories
//	 */
//	@RequestMapping(value="queryRepairApplication",method = RequestMethod.POST)
//	@ResponseBody
//	public String queryDormitoryByBuilding(@RequestBody Map<String,Object> map){
//		
//		int bid = Integer.parseInt(String.valueOf(map.get("bid")));		
//		int currentPage = Integer.parseInt(String.valueOf(map.get("currentPage")));		
//		int pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));		
//		List<Dormitory>  dormitories = repairService.queryDormitoryByBuilding(bid,currentPage,pageSize);
//		System.out.println(dormitories);
//		return JSON.toJSON(dormitories).toString();
//	}
	/**
	 * 按宿舍楼查询报修申请
	 * @param bid
	 * @return int
	 */
	@RequestMapping(value="getApplicationNumber",method = RequestMethod.POST)
	@ResponseBody
	public String getApplicationNumber(@RequestBody Map<String,Object> map){
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));	
		int typeId = Integer.parseInt(String.valueOf(map.get("typeId")));	
		String startTime = String.valueOf(map.get("startTime"));
		String endTime = String.valueOf(map.get("endTime"));
		String checkedStatusId = String.valueOf(map.get("checkedStatusId"));
		int applicationNumber = repairService.getApplicationNumber(bid,typeId,startTime,endTime,checkedStatusId);
		System.out.println("applicationNumber:"+applicationNumber);
		return JSON.toJSON(applicationNumber).toString();
	}
}
