package com.drugs.service;

import java.util.ArrayList;

import javax.sql.rowset.WebRowSet;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.drugs.models.OTAPIObject;

import global.transactionmgnt.HisDAO;

@Service
@ComponentScan("com.config.*")
public class OTAPIService 
{
    
	public ArrayList<OTAPIObject> findOTCount(OTAPIObject object,String strProcedureMode)
	{
			
		        ArrayList<OTAPIObject> messageData = new ArrayList<OTAPIObject>();
				HisDAO dao = null;
				WebRowSet ws =null;
				String strProcName = "";
				String strerr="";
				int nprocIndex = 0;		
				
				try 
				{
										
						   // System.out.println("-------------- OT_COUNT ----[pkg_ot_view.proc_ot_req_api_dtl - "+strProcedureMode+"]");
						    
						   // System.out.println("----["+strProcedureMode+"]--{ 1 - For Current Date Count , 2 - For Till The Date Count }--");
						    
					        dao = new HisDAO("Laundry", "LaundryTransDAO");	
					       
					        strProcName = "{call pkg_ot_view.proc_ot_req_api_dtl(?,?,?,?,?  ,?,?,?)}"; // 8 Variables
					        
							dao = new HisDAO("OT","OTAPIService.findOTCount(ItemTypeObject vo)");						

							nprocIndex = dao.setProcedure(strProcName);				
													
							// set value 	
							dao.setProcInValue(nprocIndex, "modeval", 		strProcedureMode, 1);
							dao.setProcInValue(nprocIndex, "hosp_code", 	object.getHospCode(), 2);
							dao.setProcInValue(nprocIndex, "deptcode",		"0", 3);
							dao.setProcInValue(nprocIndex, "crno",			"0", 4);
							dao.setProcInValue(nprocIndex, "fromDate",		"0", 5);
							dao.setProcInValue(nprocIndex, "toDate",		"0", 6);							
								
							dao.setProcOutValue(nprocIndex, "err", 			1,   7); 		
							dao.setProcOutValue(nprocIndex, "resultset", 	2,   8); 

							// execute procedure

							dao.executeProcedureByPosition(nprocIndex);
							strerr = dao.getString(nprocIndex, "err");
							if (strerr == null) {
								strerr = ""; 
							}
							ws = dao.getWebRowSet(nprocIndex, "resultset");
							
							while(ws.next())
						    {
								OTAPIObject mobRptObject = new OTAPIObject();		
						   					   	 
						   		mobRptObject.setTotalOTCount(ws.getString(1));
						   								
						   		messageData.add(mobRptObject);
						    }
						if (strerr.equals("")) 
						{
											 

						} 
						else 
						{
							throw new Exception(strerr);
						}
				

				} catch (Exception e) {
					
					e.printStackTrace();
					
									

				} 

		      
		    	      				
		
		return messageData;

	}
	
	 	
	
}
