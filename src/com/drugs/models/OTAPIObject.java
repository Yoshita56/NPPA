package com.drugs.models;

public class OTAPIObject 
{
	private String fromDate  ="";
	private String hospCode  ="";
	private String toDate  ="";	
	private String totalOTCount  ="";	
	
	public String getTotalOTCount() {
		return totalOTCount;
	}
	public void setTotalOTCount(String totalOTCount) {
		this.totalOTCount = totalOTCount;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getHospCode() {
		return hospCode;
	}
	public void setHospCode(String hospCode) {
		this.hospCode = hospCode;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	
	
	
}
