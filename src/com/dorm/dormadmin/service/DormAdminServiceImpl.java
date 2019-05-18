package com.dorm.dormadmin.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dorm.dormadmin.dao.DormAdminMapper;
import com.dorm.dormadmin.model.DormAdmin;

@Service("DormAdminService")
public class DormAdminServiceImpl implements DormAdminService{

	@Autowired
	private DormAdminMapper dormadminMapper;

	@Override
	public DormAdmin isDormAdmin(Map<String, Object> map) {
		
		return dormadminMapper.isDormAdmin(map);
	}

	@Override
	public void saveDormAdmin(DormAdmin dormadmin) {
		
		dormadminMapper.saveDormAdmin(dormadmin);
	}

	@Override
	public List<DormAdmin> queryDormAdmin() {
		
		List<DormAdmin> dormadmins = dormadminMapper.queryDormAdmin();
		return dormadmins;
	}

	@Override
	public void modifyDormAdmin(DormAdmin dormadmin) {
		
		dormadminMapper.modifyDormAdmin(dormadmin);
		
	}

	@Override
	public DormAdmin getDormAdmin(String daid) {
		
		return dormadminMapper.getDormAdmin(daid);
	}

	@Override
	public void deleteDormAdmin(String checkedId) {

		dormadminMapper.deleteDormAdmin(checkedId.split(","));
		
	}

	@Override
	public int getDormAdminNumber(int bid) {
		
		return dormadminMapper.getDormAdminNumber(bid);
	}

	@Override
	public int isDormAdmin(String daid, String dapassword) {
		// TODO Auto-generated method stub
		return dormadminMapper.isDormAdmin(daid, dapassword);
	}
	
	@Override
	public DormAdmin verifyDormAdmin(String daid, String dapassword) {
		// TODO Auto-generated method stub
		return dormadminMapper.verifyDormAdmin(daid,dapassword);
	}

	@Override
	public void modifyPwd(String daid, String dapassword) {
		// TODO Auto-generated method stub
		dormadminMapper.modifyPwd(daid, dapassword);
	}

	@Override
	public void modifyIntroduction(String daid, String introduction) {
		// TODO Auto-generated method stub
		dormadminMapper.modifyIntroduction(daid, introduction);
	}
	

		
		
	

}
