package com.dorm.repair.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Decoder;

import com.alibaba.fastjson.JSON;
import com.dorm.common.ExportExcelUtil;
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
	 * ���汨�޼�¼
	 * @param map
	 * @return 
	 */
	
	@RequestMapping(value="saveRepairApplication",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> saveRepairApplication(@RequestBody Map<String,Object> map){
		

		String budno = String.valueOf(map.get("budno"));
		int rtype = Integer.parseInt(String.valueOf(map.get("rtype")));
		String rcause = String.valueOf(map.get("rcause"));
		SimpleDateFormat myfmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24Сʱ��
		String reporttime=myfmt.format(new java.util.Date()).toString();
		String reporter = String.valueOf(map.get("reporter"));
		int handlestatus = Integer.parseInt(String.valueOf(map.get("handlestatus")));
		
		String pictureBase64 = String.valueOf(map.get("rpicture"));
		QiniuCloudUtil qiniucloud = new QiniuCloudUtil();
		String rpicture = null;
        // ͨ��base64��ת��ͼƬ
		String imageBase64 = pictureBase64.substring(pictureBase64.indexOf(",") + 1);//ȥ��ǰ��ı�ʶ
		BASE64Decoder decoder = new BASE64Decoder();
			// Base64����      
			byte[] imageByte = null;
			try {
				imageByte = decoder.decodeBuffer(imageBase64);      
				for (int i = 0; i < imageByte.length; ++i) {      
					if (imageByte[i] < 0) {// �����쳣����      
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
	 * ��ѯָ����������
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
	 * ��ѯ���б��޼�¼
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
	
		String checkedStatusId = String.valueOf(map.get("checkedStatusId"));
		int currentPage = Integer.parseInt(String.valueOf(map.get("currentPage")));
		int pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));
		
		List<Repair> repairApplications = repairService.queryRepairApplication(bid,typeId,startTime,endTime,checkedStatusId,currentPage,pageSize);
		System.out.println("repairApplications:"+repairApplications);
		return JSON.toJSON(repairApplications).toString();
	}
	
	/**
	 * ����������
	 * @param map
	 * @return map
	 */
	@RequestMapping(value="handleRepairApplication",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> handleRepairApplication(@RequestBody Map<String,Object> map){
		
		
		int rid = Integer.parseInt(String.valueOf(map.get("rid")));
		String handler = String.valueOf(map.get("handler"));
		SimpleDateFormat myfmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24Сʱ��
		String handletime=myfmt.format(new java.util.Date()).toString();
		String handleadvice = String.valueOf(map.get("handleAdvice"));
		int handlestatus = Integer.parseInt(String.valueOf(map.get("handleStatus")));
		
		Repair repair = new Repair(rid,handler,handletime,handleadvice,handlestatus);
		repairService.handleRepairApplication(repair);
		return map;
	}
	
	/**
	 * ɾ��ָ�����޼�¼
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

	/**
	 * �����˽������excel
	 * @param map
	 * @return map
	 */
	@RequestMapping(value="exportRepairApplication",method = RequestMethod.POST)
	@ResponseBody
	public String exportRepairApplication(@RequestBody Map<String,Object> map,HttpServletResponse response){
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		int typeId = Integer.parseInt(String.valueOf(map.get("typeId")));
		String startTime = String.valueOf(map.get("startTime"));
		String endTime = String.valueOf(map.get("endTime"));
	
		String checkedStatusId = String.valueOf(map.get("checkedStatusId"));
		int currentPage = Integer.parseInt(String.valueOf(map.get("currentPage")));
		int pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));
		
		String excelName = String.valueOf(map.get("excelName"));
		String[] theadName = String.valueOf(map.get("theadNameArray")).split(",");
		
		
		List<Repair> repairApplications = repairService.queryRepairApplication(bid,typeId,startTime,endTime,checkedStatusId,currentPage,pageSize);
		
		Repair repair = new Repair();
		String[] cloumnsName = new String[11];
		//���ݷ���õ�Repair��ÿһ������
		Field[] fields = repair.getClass().getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {
			fields[i].setAccessible(true);
			cloumnsName[i] = fields[i].getName();
		}
		System.out.println("repairApplications:"+repairApplications);
		System.out.println("theadName:"+Arrays.toString(theadName));	
		System.out.println("cloumnsName:"+Arrays.toString(cloumnsName));	
		
		
		try {
			
			FileOutputStream out=new FileOutputStream("D:/"+excelName+".xlsx");
			ExportExcelUtil.expoortExcelx(excelName,theadName,cloumnsName,repairApplications,out,"yyyy-MM-dd HH:mm:ss");
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return JSON.toJSON(map).toString();
	}
	/**
	 * ������¥��ѯ��������
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
	/**
	 * �޸�δ����ı��޼�¼
	 * @param map
	 * @return 
	 */
	
	@RequestMapping(value="modifyRepairApplication",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> modifyRepairApplication(@RequestBody Map<String,Object> map){
		

		int rid = Integer.parseInt(String.valueOf(map.get("rid")));
		int rtype = Integer.parseInt(String.valueOf(map.get("rtype")));
		String rcause = String.valueOf(map.get("rcause"));
		
		String pictureBase64 = String.valueOf(map.get("rpicture"));
		System.out.println("pictureBase64:"+pictureBase64);
		String cpicture = null;
		
		if(pictureBase64!=null&&pictureBase64!=" "&&pictureBase64!="null"){
			QiniuCloudUtil qiniucloud = new QiniuCloudUtil();
			System.out.println("ͼƬ��Ϊ�ղ�ִ��");
	        // ͨ��base64��ת��ͼƬ
			String imageBase64 = pictureBase64.substring(pictureBase64.indexOf(",") + 1);//ȥ��ǰ��ı�ʶ
			BASE64Decoder decoder = new BASE64Decoder();
				// Base64����      
				byte[] imageByte = null;
				try {
					imageByte = decoder.decodeBuffer(imageBase64);      
					for (int i = 0; i < imageByte.length; ++i) {      
						if (imageByte[i] < 0) {// �����쳣����      
							imageByte[i] += 256;      
						}      
					}  
					cpicture = qiniucloud.put64image(imageByte, "repairApplication-"+System.currentTimeMillis()+".jpg");
					System.out.println("cpicture:"+cpicture);
				} catch (Exception e) {
					 e.printStackTrace(); 
				}					
		}

		Repair repair = new Repair(rid,rtype,rcause,cpicture);
		repairService.modifyRepairApplication(repair);
		return map;
	}
	/**
	 * ������¥��ѯ��������
	 * @param bid
	 * @return int
	 */
	@RequestMapping(value="updateRepairStatus",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateRepairStatus(@RequestBody Map<String,Object> map){
		
		int rid = Integer.parseInt(String.valueOf(map.get("rid")));	
		int handlestatus = Integer.parseInt(String.valueOf(map.get("handleStatus")));	
	    repairService.updateRepairStatus(rid, handlestatus);
	    
		return map;
	}	
	/**
	 * ������¥��ѯ��������
	 * @param bid
	 * @return int
	 */
	@RequestMapping(value="getPieDataByRtype",method = RequestMethod.POST)
	@ResponseBody
	public String getPieDataByRtype(@RequestBody Map<String,Object> map){
		
		List<Map<String, Integer>> rtypeList = repairService.getPieDataByRtype();
		System.out.println(rtypeList);
		return JSON.toJSON(rtypeList).toString();
	}	
}
