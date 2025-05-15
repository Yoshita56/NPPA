package com.drugs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.drugs.models.OTAPIObject;
import com.drugs.service.OTAPIService;

@RestController
@RequestMapping("/OTCount")
public class OTAPIController 
{
	@Autowired
	private OTAPIService otAPIService;
	
		
	@RequestMapping(value="/{strVar1}/{strVar2}/{strVar3}/{strVar4}/{strProcedureMode}/{strWsMode}", method=RequestMethod.GET)
	@CrossOrigin(origins="*")
	public List<OTAPIObject> findDeptList(@PathVariable(value = "strVar1") String strVar1, @PathVariable(value = "strVar2") String strVar2,@PathVariable(value = "strVar3") String strVar3,@PathVariable(value = "strVar4") String strVar4, @PathVariable(value = "strProcedureMode") String strProcedureMode, @PathVariable(value = "strWsMode") String strWsMode) 
	{
		//http://localhost:8085/INV_INTG_SERVICE/OTCount/99912/0/0/0/1/1
		String  gnum_hospital_code  =  strVar1;
        
        OTAPIObject rptObject = new OTAPIObject();	             
        rptObject.setHospCode(strVar1);     // Raiberali	
		//finds all the products
		List<OTAPIObject> products = otAPIService.findOTCount(rptObject,strProcedureMode);
		//returns the product list
		return products;
	}
	
}
