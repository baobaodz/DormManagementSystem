package com.dorm.repair.model;

import java.util.Date;


public class Repair {

	private int rid;
	private String budno;
	private int rtype;
	private String rcause;
	private String rpicture;
	private String reporttime;
	private String reporter;
	private int handlestatus;
	private String handleadvice;
	private String handler;
	private String handletime;
	
	


	public int getRid() {
		return rid;
	}



	public void setRid(int rid) {
		this.rid = rid;
	}



	public int getRtype() {
		return rtype;
	}



	public void setRtype(int rtype) {
		this.rtype = rtype;
	}



	public String getRcause() {
		return rcause;
	}



	public void setRcause(String rcause) {
		this.rcause = rcause;
	}



	public String getRpicture() {
		return rpicture;
	}



	public void setRpicture(String rpicture) {
		this.rpicture = rpicture;
	}



	public String getReporttime() {
		return reporttime;
	}



	public void setReporttime(String reporttime) {
		this.reporttime = reporttime;
	}



	public String getReporter() {
		return reporter;
	}



	public void setReporter(String reporter) {
		this.reporter = reporter;
	}


	public int getHandlestatus() {
		return handlestatus;
	}



	public void setHandlestatus(int handlestatus) {
		this.handlestatus = handlestatus;
	}

	public String getHandleadvice() {
		return handleadvice;
	}



	public void setHandleadvice(String handleadvice) {
		this.handleadvice = handleadvice;
	}



	public String getHandler() {
		return handler;
	}



	public void setHandler(String handler) {
		this.handler = handler;
	}



	public String getHandletime() {
		return handletime;
	}



	public void setHandletime(String handletime) {
		this.handletime = handletime;
	}


	public String getBudno() {
		return budno;
	}


	public void setBudno(String budno) {
		this.budno = budno;
	}


	public Repair(String budno,int rtype, String rcause, String rpicture, String reporttime,
			String reporter, int handlestatus) {
		super();
		this.budno = budno;
		this.rtype = rtype;
		this.rcause = rcause;
		this.rpicture = rpicture;
		this.reporttime = reporttime;
		this.reporter = reporter;
		this.handlestatus = handlestatus;
		
	}




	public Repair(int rid, String handler, String handletime,
			String handleadvice, int handlestatus) {
		super();
		this.rid = rid;
		this.handler = handler;
		this.handletime = handletime;
		this.handleadvice = handleadvice;
		this.handlestatus = handlestatus;
	}



	public Repair(int rid, int rtype, String rcause, String rpicture) {
		super();
		this.rid = rid;
		this.rtype = rtype;
		this.rcause = rcause;
		this.rpicture = rpicture;
	}



	public Repair() {
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "Repair [rid=" + rid + ", budno=" + budno + ", rtype=" + rtype
				+ ", rcause=" + rcause + ", rpicture=" + rpicture
				+ ", reporttime=" + reporttime + ", reporter=" + reporter
				+ ", handler=" + handler + ", handletime=" + handletime
				+ ", handleadvice=" + handleadvice + ", handlestatus="
				+ handlestatus + "]";
	}

}
