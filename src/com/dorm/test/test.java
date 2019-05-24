package com.dorm.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class test {

	public test() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int checkedDid = 102;
		Map<String, Object> smap = new HashMap<String, Object>();
		List<Map<String,Object>> studentDistr = new ArrayList<Map<String,Object>>();
		String checkedSid = "B15111616,B15111617,B15111618";
		String[] sidArray = checkedSid.split(",");
		
//		for(int i=0;i<sidArray.length;i++){
//			smap.put(sidArray[i],checkedDid);
//		}
		for(int i=0;i<sidArray.length;i++){
			smap.put(new String("sid"), sidArray[i]);
			smap.put("checkedDid", checkedDid);
			
			
		}
		SimpleDateFormat myfmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date=myfmt.format(new java.util.Date()).toString();
		studentDistr.add(smap);
		System.out.println(studentDistr);
		System.out.println(date);
	}

}
