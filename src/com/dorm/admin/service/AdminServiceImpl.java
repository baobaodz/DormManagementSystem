package com.dorm.admin.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dorm.admin.dao.AdminMapper;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	
	public int getAdmin(Map<String,Object> map){
		
		int i = adminMapper.getAdmin(map);
		
		return i;
	}
		
		
	

}
