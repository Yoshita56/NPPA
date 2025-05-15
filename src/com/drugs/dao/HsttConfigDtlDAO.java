package com.drugs.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class HsttConfigDtlDAO 
{

	//@Autowired
	//private HibernateUtil hibernateUtil;

	public String getConfigValue(Integer hospCode, String paramName, String defaultValue) 
	{

		String query = "select coalesce(hststrParamValue,:defaultValue) from HsttConfigDtl "
				+ " where gnumHospitalCode = :gnumHospitalCode " + " and hststrParamName = :hststrParamName ";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("defaultValue", defaultValue);
		params.put("gnumHospitalCode", hospCode);
		params.put("hststrParamName", paramName);
////System.out.println("defaultValue"+defaultValue);
///System.out.println("paramName"+paramName);
		//return (String) hibernateUtil.fetchSingleHQL(query, params);
         return "";
	}
	
	public Long getTax(Integer hospCode, String paramName) {

	String	query = " select coalesce(sum(cast(hststrParamValue as integer)), 100) from HsttConfigDtl "
				+ "where gnumIsvalid = 1  and gnumHospitalCode = :gnumHospitalCode "
				+ "and hststrParamName = :hststrParamName";

		Map<String, Object> params = new HashMap<String, Object>();
	
		params.put("gnumHospitalCode", hospCode);
		params.put("hststrParamName", paramName);
		return null;

		//return (Long) hibernateUtil.fetchSingleHQL(query, params);
	

	}

}
