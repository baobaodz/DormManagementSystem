package com.dorm.dormadmin.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.building.model.Building;
import com.dorm.dormadmin.model.DormAdmin;


public interface DormAdminService {

	public DormAdmin isDormAdmin(Map<String,Object> map);
	public void saveDormAdmin(DormAdmin dormadmin);
	public List<DormAdmin> queryDormAdmin();
	public void modifyDormAdmin(DormAdmin dormadmin);
	public DormAdmin getDormAdmin(String daid);
	public void deleteDormAdmin(String checkedId);
	public int getDormAdminNumber(int bid);
	public int isDormAdmin(String daid,String dapassword);
	public DormAdmin verifyDormAdmin(String daid,String dapassword);
	public void modifyPwd(String daid,String dapassword);
			
}
