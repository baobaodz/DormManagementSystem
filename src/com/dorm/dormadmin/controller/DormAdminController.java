package com.dorm.dormadmin.controller;

import java.io.IOException;
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

import sun.misc.BASE64Decoder;

import com.alibaba.fastjson.JSON;
import com.dorm.common.PwdMD5;
import com.dorm.common.QiniuCloudUtil;
import com.dorm.dormadmin.model.DormAdmin;
import com.dorm.dormadmin.service.DormAdminService;

@Controller
public class DormAdminController {

	@Autowired
	@Qualifier("DormAdminService")
	private DormAdminService dormadminService;
	

	/**
	 * 保存楼宇
	 * @param map
	 * @return 
	 */
	
	@RequestMapping(value="saveDormAdmin",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> saveDormAdmin(@RequestBody Map<String,Object> map){
		

		String daid = String.valueOf(map.get("daid"));
		String dapassword = String.valueOf(map.get("dapassword"));
		String role = String.valueOf(map.get("role"));
		String truename = String.valueOf(map.get("truename"));
		String sex = String.valueOf(map.get("sex"));
		String workphone = String.valueOf(map.get("workphone"));
		String workstate = "在职";
		String introduction = String.valueOf(map.get("introduction"));
		String pictureBase64 = String.valueOf(map.get("picture"));
		
		int building_id = Integer.parseInt(String.valueOf(map.get("building_id")));
		
		QiniuCloudUtil qiniucloud = new QiniuCloudUtil();
		String url = null;
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
				url = qiniucloud.put64image(imageByte, daid+".jpg");
			} catch (Exception e) {
				 e.printStackTrace(); 
			}					


		DormAdmin dormadmin = new DormAdmin(daid,dapassword,role,truename,sex,workphone,workstate,introduction,url,building_id);
		dormadminService.saveDormAdmin(dormadmin);
		return map;
	}
	
	/**
	 * 查询所有楼宇
	 * @param map
	 * @return dormadmins
	 */
	@RequestMapping(value="queryDormAdmin",method = RequestMethod.POST)
	@ResponseBody
	public String queryBuilding(@RequestBody Map<String,Object> map){
		
		List<DormAdmin> dormadmins = dormadminService.queryDormAdmin();
		System.out.println(dormadmins);
		return JSON.toJSON(dormadmins).toString();
	}
	
	/**
	 * 修改楼宇
	 * @param map
	 * @return map
	 */
	@RequestMapping(value="modifyDormAdmin",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> modifyDormAdmin(@RequestBody Map<String,Object> map){
		
		
		String daid = String.valueOf(map.get("daid"));
		String dapassword = String.valueOf(map.get("dapassword"));
		String truename = String.valueOf(map.get("truename"));
		String sex = String.valueOf(map.get("sex"));
		String workphone = String.valueOf(map.get("workphone"));
		String introduction = String.valueOf(map.get("introduction"));
		
		int building_id = Integer.parseInt(String.valueOf(map.get("building_id")));
		
		DormAdmin dormadmin = new DormAdmin(daid,dapassword,truename,sex,workphone,introduction,building_id);
		dormadminService.modifyDormAdmin(dormadmin);
		return map;
	}
	
	/**
	 * 删除指定楼宇
	 * @param bid
	 * @return building
	 */
	@RequestMapping(value="deleteDormAdmin",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteDormAdmin(@RequestBody Map<String,Object> map){
		
		String checkedId = String.valueOf(map.get("checkedId"));
		
		System.out.println(checkedId);
		
		dormadminService.deleteDormAdmin(checkedId);
		
		return map;
	}
	/**
	 * 查询指定楼宇
	 * @param bid
	 * @return 
	 */
	@RequestMapping(value="getDormAdmin",method = RequestMethod.POST)
	@ResponseBody
	public String getDormAdmin(@RequestBody Map<String,Object> map){
		
		String daid = String.valueOf(map.get("daid"));
		DormAdmin  dormadmin = dormadminService.getDormAdmin(daid);
		System.out.println(dormadmin);
		return JSON.toJSON(dormadmin).toString();
	}
	/**
	 * 验证宿舍管理员
	 * @param bid
	 * @return 
	 */
	@RequestMapping(value="verifyUser",method = RequestMethod.POST)
	@ResponseBody
	public String verifyDormAdmin(@RequestBody Map<String,Object> map){
		
		String daid = String.valueOf(map.get("dormAdminID"));
		String dapassword = String.valueOf(map.get("daPassword"));
		DormAdmin dormAdmin = dormadminService.verifyDormAdmin(daid,dapassword);
		System.out.println(dormAdmin);
		return JSON.toJSON(dormAdmin).toString();
	}
	/**
	 * 修改密码
	 * @param bid
	 * @return 
	 */
	@RequestMapping(value="modifyPwd",method = RequestMethod.POST)
	@ResponseBody
	public String modifyPwd(@RequestBody Map<String,Object> map){
		
		String daid = String.valueOf(map.get("dormAdminID"));
		String newPwd = String.valueOf(map.get("newPwd"));
		PwdMD5 pwdMD5 = new PwdMD5();
		String dapassword = pwdMD5.getPwdMD5(newPwd);
		dormadminService.modifyPwd(daid,dapassword);
		return "";
	}
}
