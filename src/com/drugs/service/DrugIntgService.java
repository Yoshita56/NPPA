package com.drugs.service;

import java.util.ArrayList;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.drugs.models.DrugIntgObject;

import global.transactionmgnt.HisDAO;

@Service
@ComponentScan("com.config.*")
public class DrugIntgService 
{

	public String drugIntegrationServiceMethod(ArrayList<DrugIntgObject> drugIngArrayList)throws Exception 
	{	
		int nProcIndex1 = 0;
		HisDAO dao = null;
		String result = "";
		try 
		{

			System.out.println("------------------ drugIntegrationServiceMethod---[ eAushadhi_INTGWAR ]----------------------");
		
			dao = new HisDAO("MMS", "IndentOpnDAO");
			
			String strProcName1 = "{call pkg_mms_integration_dml.dml_drugbrand_webservice(?,?,?,?,?,   ?,?,?,?)}"; // 9
			 
			nProcIndex1 = dao.setProcedure(strProcName1);
			dao.setProcInValue(nProcIndex1, "modval", 			"1",1);
			dao.setProcInValue(nProcIndex1, "itemname",         drugIngArrayList.get(0).getItemname(),2);
			dao.setProcInValue(nProcIndex1, "defrate", 			drugIngArrayList.get(0).getDefrate(),3);
			dao.setProcInValue(nProcIndex1, "specification", 	drugIngArrayList.get(0).getSpecification(),4);  // Not in Use
			dao.setProcInValue(nProcIndex1, "itemtype", 		drugIngArrayList.get(0).getItemtype(),5);
			dao.setProcInValue(nProcIndex1, "cpacode", 			drugIngArrayList.get(0).getCpacode(),6);
			dao.setProcInValue(nProcIndex1, "grpid", 			drugIngArrayList.get(0).getGrpid(),7);
			dao.setProcInValue(nProcIndex1, "itembrandid", 		drugIngArrayList.get(0).getItembrandid(),8);			
			dao.setProcOutValue(nProcIndex1, "err", 			1,9);			    
			dao.execute(nProcIndex1,1);
					
			System.out.println("----------------------------END drugIntegrationServiceMethod-----------------------------------");

			dao.fire();
			
			result = "### Name  [ "+drugIngArrayList.get(0).getItemname()+" ] Save Successfully in e-Shushrut !!";

		} 
		catch (Exception e) 
		{
			result = "000000000000";
			e.printStackTrace();

			if (e.getMessage().contains("###")) 
			{

				return e.getMessage().split("###")[1];

			} 
			else 
			{

				throw e;
			}

		} finally {
			if (dao != null) {
				dao.free();
				dao = null;

			}

		}
		
		return result;
	}

}
