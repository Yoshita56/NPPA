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
    <title>Product Source Details</title>
        

<link href="<c:url value="/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet"> 
<%-- <link href="<c:url value="/css/bootstrap-4.0.0/css/bootstrap.min.css" />" rel="stylesheet">  --%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> -->
<script src="<c:url value="/js/jquery-1.11.3.js" />"></script>
<script src="<c:url value="/jquery-ui-1.12.1/jquery-ui.js" />"></script>
<script src="<c:url value="/js/mycaptcha.js" />"></script>	


    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>

<script>
$(function() {
	 $("#strDateOfReg").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   });
});
</script>
  
<script type="text/javascript">


function validate(){
	
	
	
	var strProductName=document.getElementById("strProductName").value;
	var strProductAddress=document.getElementById("strProductAddress").value;
	var strProductCity=document.getElementById("strProductCity").value;
	var strProductState=document.getElementById("strProductState").value;
	var strProductDistrict=document.getElementById("strProductDistrict").value;
	var strProductPinCode=document.getElementById("strProductPinCode").value;
	var strProductCountry=document.getElementById("strProductCountry").value;
	
	var strProductOfficePhoneNo=document.getElementById("strProductOfficePhoneNo").value;
	var strProductEmail=document.getElementById("strProductEmail").value;
	var strProductTypeManufactured=document.getElementsByName("strProductTypeManufactured");
	var strProductSourceType=document.getElementsByName("strProductSourceType");
	
	
	
	var count=0;
	
	
	
	
	if(strProductName==""||strProductName==null){
		alert("Please Enter Product Name!!");
		document.getElementById("strProductName").focus();
		return false;
	}
	
	if(strProductAddress==""||strProductAddress==null){
		alert("Please Enter Product Address!!");
		document.getElementById("strProductAddress").focus();
		return false;
	}
	
	if(strProductCity==""||strProductCity==null){
		alert("Please Enter Product City!!");
		document.getElementById("strProductCity").focus();
		return false;
	}
	
	if(strProductState=="0"||strProductState==null){
		alert("Please Select State!!");
		document.getElementById("strProductState").focus();
		return false;
	}
	
	if(strProductDistrict=="0"||strProductDistrict==null){
		alert("Please Select District!!");
		document.getElementById("strProductDistrict").focus();
		return false;
	}
	
	if(strProductPinCode==""||strProductPinCode==null){
		alert("Please Enter pin Code!!");
		document.getElementById("strProductPinCode").focus();
		return false;
	}
	if(isNaN(strProductPinCode))
	{
		alert("Please Enter pin Code in numeric value!!");
		document.getElementById("strProductPinCode").focus();
		
		return false;
	}
	
	if(strProductCountry==""||strProductCountry==null){
		alert("Please Enter Product Country!!");
		document.getElementById("strProductCountry").focus();
		return false;
	}
	
	if(strProductOfficePhoneNo==""||strProductOfficePhoneNo==null){
		alert("Please Enter Office Phone No.!!");
		document.getElementById("strProductOfficePhoneNo").focus();
		return false;
	}
	
	if(isNaN(strProductOfficePhoneNo))
	{
		alert("Please Enter Office Phone NO. in numeric value!!");
		document.getElementById("strProductOfficePhoneNo").focus();
		
		return false;
	}
	
	if(strProductEmail==""||strProductEmail==null){
		alert("Please Enter Product mail id !!");
		document.getElementById("strProductEmail").focus();
		return false;
	}
	
	
	for (var i=0;i<strProductTypeManufactured.length;i++) 
	{
		if (strProductTypeManufactured[i].checked == true )
	    {
			count++;
	    }	
	}
	if( count==0)
	{
		alert("Please Select Product Type Manufacture!!");
		document.getElementById("strProductTypeManufactured").focus();
		return false;
	}
	count=0;
	
	for (var i=0;i<strProductSourceType.length;i++) 
	{
		if (strProductSourceType[i].checked == true )
	    {
			count++;
	    }	
	}
	
	if( count==0)
	{
		alert("Please Select Source Type!!");
		document.getElementById("strProductSourceType").focus();
		return false;
	}

	 var r =document.getElementById("strCaptchaCode").value;
	 
	 $.ajax({
			type : "POST",
			url : "isCaptchaValidate",
			data : {"captcha" : r,"flag":1},			
			success : function(response) {
					
				if (response=="No") 
				{						
					alert('Invalid captcha');
					
					return false;
				}
				else
				{
					
					
					
					var retVal=confirm("You Are Going To Save Records!!");
					   if(retVal){
						 var retVal1=confirm("Are You Sure!!");
						  if(retVal1){
							document.addForm.action="saveProductSourceDtls";
							document.addForm.method="post";
							document.addForm.submit();
							return true;
						  }
					   } 
				} 
			}
	 });
	
	
	
}

function addProductDetails()
{


}

	
function cancelAdd(){
	document.addForm.action="cancelDrugCertificate";
	document.addForm.method="get";
	document.addForm.submit();
	return true;
}

function mobForOTP()
{
	
	if($('#strIsOtpReq').is(":checked"))
	{
		$("#mobforOTP").show();
		
	}  
    else
    {
    	$("#mobforOTP").hide();
    	
    }
        
}

$(document).ready(function()
{
	var comRefNo=document.getElementById("strComNo").value;
	//alert(comRefNo);
	 
		$.ajax({
		    type: "POST",
		    url:"sourceUnitDtlHLP",
		    data: {"ComRefNo": comRefNo},
		    async: true,
		    dataType: "text",
		    success: function( data ) 
		    {
			    /* alert(data); */
		       $("#strProductSourceDtl").html(data);
		       
		    }
		}); 
		
		$("select#strProductState").change(function(){
			
			$.ajax({
			    type: "GET",
			    url:"districtList",
			    data: {stateCode: $(this).val()},
			    async: true,
			    dataType: "text",
			    success: function( data ) 
			    {
				    //alert(data);
			       $("select#strProductDistrict").html(data);
			       
			    }
			}); 
			 
	  });
 

});


</script> 
    
</head>
<body class="container" style="width:100%">
<%-- <spring:url value="/UnitMst/UnitMasterList"     var="urlListPage" /> --%>
<spring:url value="/CompanyDtl/CompanyDtlList"     var="urlListPage" />
    <div class="container myrow-container" style="width:100%">        
            			    
			           
        <form:form cssClass="form-horizontal" name="addForm" id="addForm" action="" modelAttribute="addSourceUnit" onsubmit="return validate();">                
           <form:hidden path="dispCompRefNo" value="${addSourceUnit.dispCompRefNo}"/>
           <form:hidden path="strComNo"      value="${addSourceUnit.strComNo}"/>
          <div class="panel panel-success">
			    <div class="panel-heading">
			         <div class="row">
						<label class="col-sm-2">Company Name :</label>
						<div class="col-sm-10">${addSourceUnit.strCompanyName}</div>
					 </div>
					 <div class="row">
						<label class="col-sm-2">Company Reference No :</label>
						<div class="col-sm-10">${addSourceUnit.dispCompRefNo}</div>
					 </div>
			         <div class="row">
						<label class="col-sm-12">List Of Product Source Details(1.Own Manufacturing / 2.Import / 3.Purchase / 4.OutSource Contractual / 5.OutSource Loan License)</label>
						
					 </div>
					 
			         <div class="pull-right"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			         
			        <div class="clearfix"></div>
			    </div>
		  <div class="panel-body">         
         
          <div class="panel panel-primary">
              <div class="panel-heading">Product Source Details</div>
         	  
         	  <!-- in this div we show sourceUnitDtlHLP -->
         	  <div class="panel-body" id="strProductSourceDtl">
         		
         		
         	  
         	  </div>
         </div> 
         
          <div class="panel panel-primary">
             <div class="panel-heading">Product Source Detail Form</div>
         	  <div class="panel-body">
         	  		<table class="table table-bordered col-sm-12">
         	  			<tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Name:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strProductName" type="text" class="form-control " id="strProductName" placeholder="Enter Product Name" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Sr.No.:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strOfficePhoneNo" type="text" class="form-control " id="strOfficePhoneNo" placeholder="Enter Office Phone No." />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  			</tr>
         	  			
         	  			<tr>
         	  			
         	  				<td class="col-sm-6">
	         	  				<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Address:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:textarea path="strProductAddress" rows="2" class="form-control" id="strProductAddress" placeholder="Enter Product Address" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-sm-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Town/City:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strProductCity" type="text" class="form-control " id="strProductCity" placeholder="Enter Product city" />
		         	  				</div>
	         	  				</div>
         	  				
         	  				</td>
         	  			</tr>
         	  			<tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">State:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:select cssClass="form-control"  path = "strProductState">
					                     <form:option value = "0" label = "Select State"/>
					                     <form:options items = "${StateList}" />
		                    			</form:select>
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">District:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:select cssClass="form-control"  path = "strProductDistrict">
					                     <form:option value = "0" label = "Select District"/>
					                     <form:options items = "${DistrictList}" />
		                          		</form:select>
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  			</tr>
         	  			
         	  			<tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Pin Code:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strProductPinCode" type="text" class="form-control " id="strProductPinCode" placeholder="Enter Pin Code" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Country:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strProductCountry" type="text" class="form-control " id="strProductCountry" placeholder="Enter Product Country" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				
         	  			</tr>
         	  			
         	  			<tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Email ID:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strProductEmail" type="text" class="form-control " id="strProductEmail" placeholder="Enter Email Id" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Office Phone No. (With Std Code):</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strProductOfficePhoneNo" type="text" class="form-control " id="strProductOfficePhoneNo" placeholder="Enter Office Phone No." />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  			</tr>
         	  			
         	  			<tr>
         	  				<td class="col-sm-6">
                    
	                       <div class="form-group">
		                      <div class="col-sm-4">
		                      		<label class="control-label">Product Type Manufacture:<font color="red">*</font></label>
		                      </div>
		                      <div class="col-sm-8">  
		                        <div class="row">
										
									<div class="col-sm-1">
									<form:checkbox path="strProductTypeManufactured" id="strProductTypeManufactured"  value="1" />
									</div>	
									<div class="col-sm-8">
										<label class=" control-label">API/Bulk Drug:</label>
									</div>
									
								</div>
								 
								<div class="row">
								 	
								 	<div class="col-sm-1">
									<form:checkbox path="strProductTypeManufactured" id="strProductTypeManufactured"  value="2" />
									</div>	
									<div class="col-sm-8">
										<label class=" control-label">Scheduled Formulation:</label>
									</div>
								</div>
								 <div class="row">
								 	
								 	<div class="col-sm-1">
									<form:checkbox path="strProductTypeManufactured" id="strProductTypeManufactured"  value="3" />
									</div>	
									<div class="col-sm-8">
										<label class=" control-label">Non Scheduled Formulation:</label>
									</div> 
								</div>
								<div class="row">
									<div class="col-sm-1">
									<form:checkbox path="strProductTypeManufactured" id="strProductTypeManufactured"  value="4" />
									</div>	
									<div class="col-sm-8">
										<label class=" control-label">Patented:</label>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-1">
									<form:checkbox path="strProductTypeManufactured" id="strProductTypeManufactured"  value="5" />
									</div>	
									<div class="col-sm-8">
										<label class=" control-label">New Drug/Other:</label>
									</div> 
				
				 				</div>
				 			  
				 			  </div>
	                       
	                       </div>
                    
                    	</td>
         	  			<td class="col-sm-6">
                   			<div class="form-group">
		                        <div class="col-sm-4"><label class=" control-label">Select Source Type:<font color="red">*</font></label></div>
		                        <div class="col-sm-8">
		                            <div class="row">
		                          	
										<div class="col-sm-1">
											<form:radiobutton path="strProductSourceType" id="strProductSourceType"   value="1^OwnManufacturing"/>
										</div>
										
										<div class="col-sm-6">
											<label class=" control-label">Own Manufacturing:</label>
										
										</div>
									</div>
									<div class="row">
										
										<div class="col-sm-1">
											<form:radiobutton path="strProductSourceType" id="strProductSourceType"   value="2^Import"/>
										</div>
										
										<div class="col-sm-6">
											<label class=" control-label">Import:</label>
										</div>
										
									</div>
									<div class="row">
										
										<div class="col-sm-1">
											<form:radiobutton path="strProductSourceType" id="strProductSourceType"   value="3^Purchase"/>
										</div>
										
										<div class="col-sm-6">
											<label class=" control-label">Purchase:</label>
										</div>
										
									</div>
									<div class="row">	
										
										<div class="col-sm-1">
											<form:radiobutton path="strProductSourceType" id="strProductSourceType"   value="4^OutSourceContractual"/>
										</div>
										
										<div class="col-sm-6">
											<label class=" control-label">OutSource Countractual:</label>
										</div>
										
									</div>
									<div class="row">	
										
										<div class="col-sm-1">
											<form:radiobutton path="strProductSourceType" id="strProductSourceType"   value="5^OutSourceLoanLicense"/>
										</div>
										
										<div class="col-sm-6">
											<label class=" control-label">OutSource Loan License:</label>
										</div>
										
									</div>
		                        </div>
		                     </div>
	                    	
                   		</td>
         	  			</tr>
         	  			
         	  			<tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Captcha Image:</label>
		         	  				</div>
		         	  				<div class="row  pad-top">
										 <span class="col-md-5 col-xs-12 cimage" id="captchaText"> </span>
										 <span class="col-md-2 col-xs-2 pad-top"> 
										 <span style="cursor: pointer; color:blue;padding-top: 10px;" id="captcha_reload"
											class="glyphicon glyphicon-refresh"></span><br /> 
										 </span>
									</div>
		         	  				
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Enter Captcha Code:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strCaptchaCode" type="text" class="form-control " id="strCaptchaCode" placeholder="Enter Captcha Code" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  			</tr>
         	  			
         	  		</table>
         	  </div>
	         	
         </div> 
         
          
         </div> <!-- panel-body  -->			    
		</div>   <!-- panel panel-success -->
       </form:form>
              
               <div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button class="btn btn-primary" onclick="return validate();">Save</button>
						<button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>					
					</div>
				</div> 
    
          
	</div>  <!-- container myrow-container -->
            
  
</body> <!-- container -->
</html>