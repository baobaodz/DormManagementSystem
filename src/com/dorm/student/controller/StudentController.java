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
import com.dorm.common.QiniuCloudUtil;
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
	 * ����¥��
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
				// poi--exl����
				InputStream is = file.getInputStream();
				XSSFWorkbook xssf = new XSSFWorkbook(is);
                //Sheet1-----��Excel������·�������
				XSSFSheet sheet = xssf.getSheet("sheet1");
				for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                    
					XSSFCell sid = sheet.getRow(i).getCell(0);
					XSSFCell sname = sheet.getRow(i).getCell(1);
					XSSFCell gender = sheet.getRow(i).getCell(2);
					XSSFCell start = sheet.getRow(i).getCell(3);
					XSSFCell sgrade = sheet.getRow(i).getCell(4);
					XSSFCell sclass = sheet.getRow(i).getCell(5);
					XSSFCell status = sheet.getRow(i).getCell(6);
					XSSFCell characterCell = sheet.getRow(i).getCell(7);
					XSSFCell dormnameCell = sheet.getRow(i).getCell(8);
					
					
					
					if (sid == null) {
						errors.add("�����У�"+(i+1)+",������Ϣ:ѧ��----����Ϊ�գ�");
						continue;
					}
					if (sname == null) {
						errors.add("�����У�"+(i+1)+",������Ϣ:����----����Ϊ��");
						continue;
					}
					if (gender == null) {
						errors.add("�����У�"+(i+1)+",������Ϣ:�Ա�----����Ϊ��");
						continue;
					}
					if (start == null ) {
						errors.add("�����У�"+(i+1)+",������Ϣ:��ѧʱ��----����Ϊ�ղ���>0");
						continue;
					}
					if (sgrade == null) {
						errors.add("�����У�"+(i+1)+",������Ϣ:�꼶----����Ϊ�ղ���>0");
						return JSON.toJSON(errors).toString();
					}
					if (sclass == null) {
						errors.add("�����У�"+(i+1)+",������Ϣ:�༶----����Ϊ�ղ���>0");
						continue;
					}
					String character = "";
					if (characterCell != null) {
						character = characterCell.toString();
					}
					String startTime = start.toString().replace(".", "");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					java.util.Date startTimeUtil = sdf.parse(startTime); //ת��Ϊutil.date
					java.sql.Date startTimeSql = new java.sql.Date(startTimeUtil.getTime());//ת��Ϊsql.date
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
	 * ��ѯ����ѧ��
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
	 * ��ѯ������ѧ��
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
	 * ����ѧ��
	 * @param map
	 * @return students
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
	 * ��������鿴�ѷ���ѧ��
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
	
//	/**
//	 * �޸�¥��
//	 * @param map
//	 * @return map
//	 */
//	@RequestMapping(value="modifyDormitory",method = RequestMethod.POST)
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
//		studentService.modifyDormitory(dormitory);
//		return map;
//	}
//	
//	/**
//	 * ɾ��ָ��¥��
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
//	/**
//	 * ��ѯָ������
//	 * @param did
//	 * @return 
//	 */
//	@RequestMapping(value="getDormitory",method = RequestMethod.POST)
//	@ResponseBody
//	public String getDormitory(@RequestBody Map<String,Object> map){
//		
//		String did = String.valueOf(map.get("daid"));
//		Dormitory  dormitory = studentService.getDormitory(did);
//		System.out.println(dormitory);
//		return JSON.toJSON(dormitory).toString();
//	}
//	/**
//	 * ������¥��ѯ����
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
//	 * ������¥��ѯ����
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
	 * ѧ����¼��֤
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

