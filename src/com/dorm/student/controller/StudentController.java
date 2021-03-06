package com.dorm.student.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;











import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sun.misc.BASE64Decoder;

import com.alibaba.fastjson.JSON;
import com.dorm.building.model.Building;
import com.dorm.common.PwdMD5;
import com.dorm.common.QiniuCloudUtil;
import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormitory.model.Dormitory;
import com.dorm.dormitory.service.DormitoryService;
import com.dorm.student.model.Student;
import com.dorm.student.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	@Qualifier("StudentService")
	private StudentService studentService;
	

	/**
	 * 保存楼宇
	 * @param map
	 * @return 
	 */
	
	@RequestMapping(value="uploadDormStudent",produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
	@ResponseBody
	public String saveStudentBatch(@RequestParam("file") MultipartFile file){
		
		List<String> errors = new ArrayList<String>();
		List<Student> students = new ArrayList<Student>();
		System.out.println(file.getName());
		try {
			if (!file.isEmpty() && file.getOriginalFilename().indexOf("xls")>=0) {
				// poi--exl解析
				InputStream is = file.getInputStream();
				XSSFWorkbook xssf = new XSSFWorkbook(is);
                //Sheet1-----是Excel表格左下方的名称
				XSSFSheet sheet = xssf.getSheet("sheet1");
				for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                    
					XSSFCell sid = sheet.getRow(i).getCell(0);
					XSSFCell sname = sheet.getRow(i).getCell(1);
					XSSFCell gender = sheet.getRow(i).getCell(2);
					XSSFCell start = sheet.getRow(i).getCell(3);
					XSSFCell sgrade = sheet.getRow(i).getCell(4);
					XSSFCell sclass = sheet.getRow(i).getCell(5);
					XSSFCell statusCell = sheet.getRow(i).getCell(6);
					XSSFCell characterCell = sheet.getRow(i).getCell(7);
					XSSFCell dormnameCell = sheet.getRow(i).getCell(8);
					
					
					
					if (sid == null) {
						errors.add("错误行："+(i+1)+",错误信息:学号----不能为空！");
						continue;
					}
					if (sname == null) {
						errors.add("错误行："+(i+1)+",错误信息:姓名----不能为空");
						continue;
					}
					if (gender == null) {
						errors.add("错误行："+(i+1)+",错误信息:性别----不能为空");
						continue;
					}
					if (start == null ) {
						errors.add("错误行："+(i+1)+",错误信息:入学时间----不能为空并且>0");
						continue;
					}
					if (sgrade == null) {
						errors.add("错误行："+(i+1)+",错误信息:年级----不能为空并且>0");
						return JSON.toJSON(errors).toString();
					}
					if (sclass == null) {
						errors.add("错误行："+(i+1)+",错误信息:班级----不能为空并且>0");
						continue;
					}
					String status="";
					if (statusCell != null) {
						
						status = statusCell.toString()=="已入住"?"0":"1";
					}
					String character = "";
					if (characterCell != null) {
						character = characterCell.toString();
					}
					String startTime = start.toString().replace(".", "");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					java.util.Date startTimeUtil = sdf.parse(startTime); //转换为util.date
					java.sql.Date startTimeSql = new java.sql.Date(startTimeUtil.getTime());//转换为sql.date
					String sclassString = sclass.toString().substring(0, sclass.toString().indexOf("."));
					
					if (dormnameCell == null) {
						int dormitoryId = 0;
						Student student = new Student(sid.toString(),sname.toString(),sid.toString(),gender.toString(),startTimeSql,sgrade.toString(),Integer.parseInt(sclassString),status.toString(),character,dormitoryId);
						students.add(student);
					}else{
						
						String[] str = dormnameCell.toString().split("-");
						int building_id = Integer.parseInt(str[0]);
						int dormitory_dno = Integer.parseInt(str[1]);
						int dormitoryId = studentService.getDormitoryId(building_id,dormitory_dno);
						Student student = new Student(sid.toString(),sname.toString(),sid.toString(),gender.toString(),startTimeSql,sgrade.toString(),Integer.parseInt(sclassString),status.toString(),character,dormitoryId);
						students.add(student);
					}
					
				}
				System.out.println("students:"+students);
				studentService.saveStudentBatch(students);
				
				List<Map<String,String>> dormitoryOccupied = studentService.getDormitoryOccupied();
				System.out.println(dormitoryOccupied);
				studentService.updateOccupied(dormitoryOccupied);
				is.close();
				xssf.close();
			}
		}catch(Exception e){
				
			e.printStackTrace();
		}
		System.out.println("errors:"+errors);
		return JSON.toJSON(students).toString();
	}
	
	/**
	 * 查询所有学生
	 * @param map
	 * @return students
	 */
	@RequestMapping(value="queryStudent",method = RequestMethod.POST)
	@ResponseBody
	public String queryDormitory(@RequestBody Map<String,Object> map){
		
		List<Student> students = studentService.queryStudent();
		System.out.println(students);
		return JSON.toJSON(students).toString();
	}
	
	/**
	 * 按过滤条件来查询学生
	 * @param map
	 * @return students
	 */
	@RequestMapping(value="queryStudentByFilter",method = RequestMethod.POST)
	@ResponseBody
	public String queryStudentByFilter(@RequestBody Map<String,Object> map){
		
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		String sexId = String.valueOf(map.get("sexId"));
		String status = String.valueOf(map.get("status"));
		String queryKey = String.valueOf(map.get("queryKey"));
		int currentPage = Integer.parseInt(String.valueOf(map.get("currentPage")));
		int pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));
		
		List<Student> students = studentService.queryStudentByFilter(bid, sexId, status, queryKey, currentPage, pageSize);
		System.out.println(students);
		return JSON.toJSON(students).toString();
	}
	/**
	 * 查询待分配学生
	 * @param map
	 * @return students
	 */
	@RequestMapping(value="getDistrStudent",method = RequestMethod.POST)
	@ResponseBody
	public String getDistrStudent(@RequestBody Map<String,Object> map){
		
		
		String gender = String.valueOf(map.get("gender"));
		List<Student> students = studentService.getDistrStudent(gender);
		System.out.println(students);
		return JSON.toJSON(students).toString();
	}
	
	/**
	 * 分配学生
	 * @param map
	 * @return 
	 */
	@RequestMapping(value="updateDistr",method = RequestMethod.POST)
	@ResponseBody
	public String updateDistr(@RequestBody Map<String,Object> map){
		
		
		String checkedSid = String.valueOf(map.get("checkedSid"));
		int checkedDid = Integer.parseInt(String.valueOf(map.get("checkedDid")));
		
		studentService.updateDistr(checkedSid, checkedDid);
		
		List<Map<String,String>> dormitoryOccupied = studentService.getDormitoryOccupied();
		System.out.println(dormitoryOccupied);
		studentService.updateOccupied(dormitoryOccupied);
		
		return "";
	}
	
	/**
	 * 根据宿舍查看已分配学生
	 * @param map
	 * @return students
	 */
	@RequestMapping(value="getOccupiedByDorm",method = RequestMethod.POST)
	@ResponseBody
	public String getOccupiedByDorm(@RequestBody Map<String,Object> map){
		
		
		int did = Integer.parseInt(String.valueOf(map.get("did")));
		
		
		List<Student> students = studentService.getOccupiedByDorm(did);
		System.out.println(students);
		
		return JSON.toJSON(students).toString();
	}
	
	/**
	 * 查询学生个数
	 * @param map
	 * @return map
	 */
	@RequestMapping(value="getStudentNumber",method = RequestMethod.POST)
	@ResponseBody
	public String getStudentNumber(@RequestBody Map<String,Object> map){
		
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		String sexId = String.valueOf(map.get("sexId"));
		String status = String.valueOf(map.get("status"));
		String queryKey = String.valueOf(map.get("queryKey"));
		int studentNumber = studentService.getStudentNumber(bid, sexId, status, queryKey);
		System.out.println("studentNumber:"+studentNumber);
		return JSON.toJSON(studentNumber).toString();
	}
	/**
	 * 根据性别查询待分配楼宇
	 * @param map
	 * @return map
	 */
	@RequestMapping(value="getDistrBuildingByGender",method = RequestMethod.POST)
	@ResponseBody
	public String getDistrBuildingByGender(@RequestBody Map<String,Object> map){
		
		
		String gender = String.valueOf(map.get("gender"));
		List<Building> distrBuilding = studentService.getDistrBuildingByGender(gender);
		System.out.println("distrBuilding:"+distrBuilding);
		return JSON.toJSON(distrBuilding).toString();
	}
	/**
	 * 根据性别查询待分配楼宇
	 * @param map
	 * @return map
	 */
	@RequestMapping(value="getDistrDormitoryByBuilding",method = RequestMethod.POST)
	@ResponseBody
	public String getDistrDormitoryByBuilding(@RequestBody Map<String,Object> map){
		
		
		int bid = Integer.parseInt(String.valueOf(map.get("bid")));
		List<Dormitory> distrDormitory = studentService.getDistrDormitoryByBuilding(bid);
		System.out.println("distrDormitory:"+distrDormitory);
		return JSON.toJSON(distrDormitory).toString();
	}
	
//	/**
//	 * 删除指定楼宇
//	 * @param bid
//	 * @return building
//	 */
//	@RequestMapping(value="deleteDormitory",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String,Object> deleteDormitory(@RequestBody Map<String,Object> map){
//		
//		String checkedId = String.valueOf(map.get("checkedId"));
//		
//		System.out.println(checkedId);
//		
//		studentService.deleteDormitory(checkedId);
//		
//		return map;
//	}
	/**
	 * 查询指定宿舍
	 * @param did
	 * @return 
	 */
	@RequestMapping(value="getStudent",method = RequestMethod.POST)
	@ResponseBody
	public String getStudent(@RequestBody Map<String,Object> map){
		
		String sid = String.valueOf(map.get("sid"));
		Student student = studentService.getStudent(sid);
		System.out.println(student);
		return JSON.toJSON(student).toString();
	}
	/**
	 * 验证住宿学生
	 * @param sid
	 * @param spassword
	 * @return 
	 */
	@RequestMapping(value="verifyStudent",method = RequestMethod.POST)
	@ResponseBody
	public String verifyStudent(@RequestBody Map<String,Object> map){
		
		String sid = String.valueOf(map.get("sid"));
		String spassword = String.valueOf(map.get("spassword"));
		Student student = null;
		if(sid.equals(spassword)){
			student = studentService.verifyStudent(sid,spassword);
		}else{
			
			PwdMD5 pwdMD5 = new PwdMD5();
			String sPwdMD5 = pwdMD5.getPwdMD5(spassword);
			student = studentService.verifyStudent(sid,sPwdMD5);
		}
		System.out.println("verifyStudent:"+student);
		if(student!=null){
			return JSON.toJSON(student).toString();
		}else{
			String msg = "NOT FOUND";
			List<String> msgList = new ArrayList<String>();
			msgList.add(msg);
			return JSON.toJSON(msgList).toString();
		}
		
	}
	/**
	 * 修改密码
	 * @param sid
	 * @return 
	 */
	@RequestMapping(value="modifyStudentPwd",method = RequestMethod.POST)
	@ResponseBody
	public String modifyPwd(@RequestBody Map<String,Object> map){
		
		String sid = String.valueOf(map.get("sid"));
		String newPwd = String.valueOf(map.get("newPwd"));
		PwdMD5 pwdMD5 = new PwdMD5();
		String dapassword = pwdMD5.getPwdMD5(newPwd);
		studentService.modifyPwd(sid,dapassword);
		return "";
	}
//	/**
//	 * 按宿舍楼查询宿舍
//	 * @param bid
//	 * @return dormitories
//	 */
//	@RequestMapping(value="queryDormitoryByBuilding",method = RequestMethod.POST)
//	@ResponseBody
//	public String queryDormitoryByBuilding(@RequestBody Map<String,Object> map){
//		
//		int bid = Integer.parseInt(String.valueOf(map.get("bid")));		
//		int currentPage = Integer.parseInt(String.valueOf(map.get("currentPage")));		
//		int pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));		
//		List<Dormitory>  dormitories = studentService.queryDormitoryByBuilding(bid,currentPage,pageSize);
//		System.out.println(dormitories);
//		return JSON.toJSON(dormitories).toString();
//	}
//	/**
//	 * 按宿舍楼查询宿舍
//	 * @param bid
//	 * @return dormitories
//	 */
//	@RequestMapping(value="getDormitoryNumber",method = RequestMethod.POST)
//	@ResponseBody
//	public String getDormitoryNumber(@RequestBody Map<String,Object> map){
//		
//		int bid = Integer.parseInt(String.valueOf(map.get("bid")));		
//		int dormitoryNumber = studentService.getDormitoryNumber(bid);
//		System.out.println(dormitoryNumber);
//		return JSON.toJSON(dormitoryNumber).toString();
//	}
	/**
	 * 学生登录验证
	 * @param sid
	 * @param spassword
	 * @return int
	 */
	@RequestMapping(value="loginStudent",method = RequestMethod.POST)
	@ResponseBody
	public String isStudent(@RequestBody Map<String,Object> map){
		
		String sid = String.valueOf(map.get("sid"));		
		String spassword = String.valueOf(map.get("spassword"));
		
		int num = studentService.isStudent(sid,spassword);
		System.out.println(num);
		return JSON.toJSON(num).toString();
	}
}

