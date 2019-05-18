package com.dorm.dormadmin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dorm.dormadmin.model.DormAdmin;

public interface DormAdminMapper {

	   
		public DormAdmin isDormAdmin(Map<String,Object> map);
		public void saveDormAdmin(DormAdmin dormadmin);
		public List<DormAdmin> queryDormAdmin();
		public void modifyDormAdmin(DormAdmin dormadmin);
		public DormAdmin getDormAdmin(String daid);
		public void deleteDormAdmin(String[] checkedId);
		public int getDormAdminNumber(int bid);
		public int isDormAdmin(@Param("daid") String daid,@Param("dapassword") String dapassword);
		public void modifyPwd(@Param("daid") String daid,@Param("dapassword") String dapassword);
		public void modifyIntroduction(@Param("daid") String daid,@Param("introduction") String introduction);
		public DormAdmin verifyDormAdmin(@Param("daid") String daid,@Param("dapassword") String dapassword);
				
		
}
