<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <meta charset="utf-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Cdac">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Drug Thearpy</title>
        

<link href="<c:url value="/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/bootstrap-4.0.0/css/bootstrap.min.css" />" rel="stylesheet"> 

<script src="<c:url value="/js/jquery-1.11.3.js" />"></script>	
<script src="<c:url value="/jquery-ui-1.12.1/jquery-ui.js" />"></script>	

    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>

  
<script type="text/javascript">

$(document).ready(function() {
	$(function() {
		$("#strEffectiveFrom").datepicker({
		dateFormat: 'dd-mm-yy'
		});
	});
});

$(document).ready(function(){
	
	 $("select#groupId").change(function(){
		$.ajax({
		    type: "GET",
		    url:"subGroupList",
		    data: {groupCode: $(this).val()},
		    async: true,
		    dataType: "text",
		    success: function( data ) 
		    {
			    //alert(data);
		       $("select#subGroupId").html(data);
		       
		    }
		}); 
		 
   
}); 

});
function validate1()
{
	var cpaCode=document.getElementById("cpaCode").value;
	var drugName=document.getElementById("drugName").value;
	
	if(cpaCode==""||cpaCode==null){
		alert("Please Enter Drug Code!!");
		return false;
	}
	
	if(drugName==""||drugName==null){
		alert("Please Enter Drug Name!!");
		return false;
	}
	var rate=document.getElementById("rate").value;
	var rateUnit=document.getElementById("rateUnit").value;
	
	if(rate==""||rate==null){
		alert("Please Enter Drug Rate!!");
		return false;
	}
	
	if(rateUnit=="0"||rateUnit==null){
		alert("Please Select RateUnit!!");
		return false;
	}
	var marketRate=document.getElementById("marketRate").value;
	var marketRateUnit=document.getElementById("marketRateUnit").value;
	
	if(marketRate==""||marketRate==null){
		alert("Please Enter Drug Market Rate!!");
		return false;
	}
	
	if(marketRateUnit=="0"||marketRateUnit==null){
		alert("Please Select Market RateUnit!!");
		return false;
	}
	var drugSpec=document.getElementById("drugSpec").value;
	if(drugSpec==""||drugSpec==null){
		alert("Please Enter Drug Specification !!");
		return false;
	}
	var subgroupCombiName=document.getElementById("subgroupCombiName").value;
	if(subgroupCombiName==""||subgroupCombiName==null){
		alert("Please Enter Drug Sub-Group Combination Name !!");
		return false;
	}
	
	var divisionId=document.getElementById("divisionId").value;
	var groupId=document.getElementById("groupId").value;
	var subGroupId=document.getElementById("subGroupId").value;
	var thearpyId=document.getElementById("thearpyId").value;
	var drugClassCode=document.getElementById("drugClassCode").value;
	var superGroupId=document.getElementById("superGroupId").value;
	var qcType=document.getElementById("qcType").value;
	
	var itemMake=document.getElementById("itemMake").value;
	var vedCatg=document.getElementById("vedCatg").value;
	if(itemMake=="0"||itemMake==null)
	{
		alert("Please Select Drug Make !!");
		return false;
	}
	if(vedCatg=="0"||vedCatg==null)
	{
		alert("Please Select Drug Category !!");
		return false;
	}
	
	if(divisionId=="0"||divisionId==null)
	{
		alert("Please Select Drug Divison !!");
		return false;
	}
	if(groupId=="0"||groupId==null)
	{
		alert("Please Select Drug Group !!");
		return false;
	}
	if(subGroupId=="0"||subGroupId==null)
	{
		alert("Please Select Drug Sub Group !!");
		return false;
	}
	if(thearpyId=="0"||thearpyId==null)
	{
		alert("Please Select Thearpy !!");
		return false;
	}
	if(drugClassCode=="0"||drugClassCode==null)
	{
		alert("Please Select Drug Class !!");
		return false;
	}
	if(superGroupId=="0"||superGroupId==null)
	{
		alert("Please Select Super Group !!");
		return false;
	}
	if(qcType=="0"||qcType==null)
	{
		alert("Please Select QC Type !!");
		return false;
	}
	
	return true;
}

function SaveRecord(){
	 if(validate1()){
		  var retVal=confirm("You Are Going To Save Drug Records!!");
		   if(retVal){
			 var retVal1=confirm("Are You Sure!!");
			  if(retVal1){
			document.drugAddForm.action="save";
			document.drugAddForm.method="post";
			document.drugAddForm.submit();
			return true;
		  }
	   }
  }  
}	

</script> 
    
</head>
<body class="container">
<spring:url value="/drugMst/drugList"     var="urlListPage" />
    <div class="container myrow-container">        
            <div class="panel panel-success">
			    <div class="panel-heading">
			         <h3 class="panel-title pull-left">
			                    DRUG  >> ADD
			         </h3>
			
			        <div class="pull-right"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			        <div class="clearfix"></div>
			    </div>
		       <div class="panel-body">	
            
                <form:form cssClass="form-horizontal"  name="drugAddForm" id="drugAddForm" modelAttribute="drugMstBean" method="post" action="save" onsubmit="return validate1();">                
                     
                  <table>
                    <tr>
                      <td> 
                     
	                      <div class="form-group">
	                        <div class="control-label col-xs-3"> <form:label path="cpaCode" >Drug CODE</form:label> </div>
	                        <div class="col-xs-6">                         
	                            <form:input cssClass="form-control" path="cpaCode"/>
	                        </div>
	                    </div>
                    
                      </td>
                    
                    <td>
                    
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"> <form:label path="drugName" label = "Enter Drug Name">Drug Name</form:label> </div>
	                        <div class="col-xs-6">
	                            <form:hidden path="brandId" value="${drugMstBean.brandId}"/>
	                            <form:input cssClass="form-control" path="drugName"/>
	                        </div>
	                    </div>
                    
                    </td>
                    
                   </tr>
                    
                   <tr>
                    
                     <td>
                    
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="drugItemType">Type</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "drugItemType">
				                     <form:option value = "NONE" label = "Select Type"/>
				                     <form:options items = "${drugTypeList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                     </td>
                    
                     <td>
                    
                    <div class="form-group">
                        <div class="control-label col-xs-3"> <form:label path="drugStrength" >Strength</form:label> </div>
                        <div class="col-xs-6">                           
                            <form:input cssClass="form-control" path="drugStrength" label = "Enter Drug Strength"/>
                        </div>
                    </div>
                    
                     </td>
                     
                    </tr>
                    
                    <tr>
                    
                    <td>
                    
                    <div class="form-group">
                        <div class="control-label col-xs-3"> <form:label path="drugPacking" >Packing</form:label> </div>
                        <div class="col-xs-6">                          
                            <form:input cssClass="form-control" path="drugPacking" label = "Enter Packing"/>
                        </div>
                    </div>
    
                    </td>
                   
                     <td>
    
	                    <div class="form-group">
	                        <form:label path="rate" cssClass="control-label col-xs-3">Rate</form:label>
	                        <div class="col-xs-6">
	                            <form:input cssClass="form-control" path="rate" label = "Enter Rate"/>
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                     <td>
                    
                     <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="rateUnit">Unit</form:label></div>
                        <div class="col-xs-6">
                           <form:select cssClass="form-control"  path = "rateUnit">
			                     <form:option value = "NONE" label = "Select Unit"/>
			                     <form:options items = "${rateUnitList}" />
                          </form:select>         
                        </div>
                    </div>
                    
                    </td>
                    
                    <td>
                    
	                    <div class="form-group">
	                        <form:label path="marketRate" cssClass="control-label col-xs-3">Marklet Rate</form:label>
	                        <div class="col-xs-6">
	                           <%--  <form:input cssClass="form-control" path="marketRate" value="${drugMstBean.marketRate}"/> --%>
	                             <form:input cssClass="form-control" path="marketRate" label = "Enter Market Rate"/>
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                  
                    <td>
                    
	                     <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="marketRateUnit">Unit</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "marketRateUnit">
				                     <form:option value = "NONE" label = "Select Unit"/>
				                     <form:options items = "${rateUnitList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td>
    
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="drugSpec">Specification</form:label></div>
	                        <div class="col-xs-6">
	                            <form:input cssClass="form-control" row="5" path="drugSpec" label = "Enter Specification"/>
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                  
                  <tr>
                     
                     <td>
                    
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"> <form:label path="subgroupCombiName" >Sub-Group Combination</form:label> </div>
	                        <div class="col-xs-6">                           
	                            <form:input cssClass="form-control" path="subgroupCombiName" />
	                        </div>
	                    </div>
                    
                     </td>
                     
                     <td>
                    
                                 
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="divisionId">Divison</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "divisionId">
				                     <form:option value = "NONE" label = "Select Divison"/>
				                     <form:options items = "${divisonList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td>
                    
	                   <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="groupId">Group</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "groupId">
				                     <form:option value = "NONE" label = "Select Group"/>
				                     <form:options items = "${groupList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td>
                    
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="subGroupId">Sub - Group</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "subGroupId">
				                     <form:option value = "NONE" label = "Select Sub-Group"/>
				                     <form:options items = "${subGrpList}" />
	                          </form:select>         
	                        </div>
	                    </div>  
                    
                    </td>
                    
                  </tr>
                  
                  <tr>
                  
                    <td> 
                     
	                     <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="thearpyId">Thearpy</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "thearpyId">
				                     <form:option value = "NONE" label = "Select Thearpy"/>
				                     <form:options items = "${thearpyList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td>
                    
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="drugClassCode">Class</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "drugClassCode">
				                     <form:option value = "NONE" label = "Select Class"/>
				                     <form:options items = "${classList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                     </td>
                     
                  </tr>
                  
                  <tr>
                  
                    <td> 
                     
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="superGroupId">Super Group</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "superGroupId">
				                     <form:option value = "NONE" label = "Select Super Group Name"/>
				                     <form:options items = "${superGroupList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td>
                    
	                     <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="qcType">QC Type</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "qcType">
				                     <form:option value = "NONE" label = "Select QC Type"/>
				                     <form:options items = "${qcTypeList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                  
                  <tr>
                  
                   <td> 
                    
	                    <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="itemMake">Make</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "itemMake">
				                     <form:option value = "NONE" label = "Select Make"/>
				                     <form:options items = "${itemMakeList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td>
                    
	                     <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="vedCatg">VED</form:label></div>
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path = "vedCatg">
				                     <form:option value = "NONE" label = "Select V,E,D"/>
				                     <form:options items = "${vedCatgList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                                             
					</td>
					
					</tr>
					
					<tr>
					
					  <td>	
					                    
	                     <div class="form-group">
	                        <div class="control-label col-xs-3"><form:label path="remarks">Remarks</form:label></div>
	                        <div class="col-xs-6">
	                            <form:input cssClass="form-control" row="5" path="remarks" />
	                        </div>
	                    </div>
                                     
                      </td>
                     
                   </tr>
                     
                </table>
    
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-2">
                            </div>
                            <div class="col-xs-2">
                                <input type="submit" id="saveEmployee" class="btn btn-primary" value="Save" onclick="return SaveRecord();"/>
                            </div>
                            
                        </div>
                    </div>
    
                   
                </form:form>
                
                 <!-- <div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button class="btn btn-primary" onclick="return SaveRecord();">Save</button>
						<button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>					
					</div>
			    </div>  -->
			   
            </div>
        </div>
    </div>

	

</body>
</html>