package com.dorm.admin.controller;

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

import com.dorm.admin.model.Admin;
import com.dorm.admin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("AdminService")
	private AdminService adminService;
	
	@RequestMapping(value="login",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> login(@RequestBody Map<String,Object> map,HttpSession session){
		
		int i = adminService.getAdmin(map);
		String aname = String.valueOf(map.get("aname"));
		String apassword = String.valueOf(map.get("apassword"));
		Admin admin = new Admin(aname,apassword);
		if(i==1){
			session.setAttribute("admin", admin);;
			return map;
		}else{
			return null;
		}
		
	}
	
	
}
