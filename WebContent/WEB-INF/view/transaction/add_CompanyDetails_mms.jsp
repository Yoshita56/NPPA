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
    <title>Company Details</title>
        

<link href="<c:url value="/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet"> 
<%-- <link href="<c:url value="/css/bootstrap-4.0.0/css/bootstrap.min.css" />" rel="stylesheet">  --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
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
	
	
	
	 var strCompanyName=document.getElementById("strCompanyName").value;
	var strCompanyBusinessActivity=document.getElementsByName("strCompanyBusinessActivity");
	var StrIndustryType=document.getElementsByName("StrIndustryType");
	var strDateOfReg=document.getElementById("strDateOfReg").value;
	var strCompanyAddress=document.getElementById("strCompanyAddress").value;
	var strCompanyCity=document.getElementById("strCompanyCity").value;
	var strState=document.getElementById("strState").value;
	var strDistrict=document.getElementById("strDistrict").value;
	var strPinCode=document.getElementById("strPinCode").value;
	var strCompanyEmailId=document.getElementById("strCompanyEmailId").value;
	var strOfficePhoneNo=document.getElementById("strOfficePhoneNo").value;
	var strPersonName=document.getElementById("strPersonName").value;
	var strPersonPhoneNo=document.getElementById("strPersonPhoneNo").value;
	var strPersonEmailId=document.getElementById("strPersonEmailId").value;
	var strPersonMobileNo=document.getElementById("strPersonMobileNo").value;
	
	
	var count=0;
	
	
	
	
	if(strCompanyName==""||strCompanyName==null){
		alert("Please Enter Company Name!!");
		document.getElementById("strCompanyName").focus();
		return false;
	}
	
	for (var i=0;i<strCompanyBusinessActivity.length;i++) 
	{
		if (strCompanyBusinessActivity[i].checked == true )
	    {
			count++;
	    }	
	}
	if( count==0)
	{
		alert("Please Select Business Activity!!");
		document.getElementById("strCompanyBusinessActivity").focus();
		return false;
	}
	count=0;
	for (var i=0;i<StrIndustryType.length;i++) 
	{
		if (StrIndustryType[i].checked == true )
	    {
			count++;
	    }	
	}
	
	if( count==0)
	{
		alert("Please Select Industry Type!!");
		document.getElementById("StrIndustryType").focus();
		return false;
	}
	
	if(strDateOfReg==""||strDateOfReg==null){
		alert("Please Select Date of Registration Date!!");
		document.getElementById("strDateOfReg").focus();
		return false;
	}
	
	if(strCompanyAddress==""||strCompanyAddress==null){
		alert("Please Enter Company Address!!");
		document.getElementById("strCompanyAddress").focus();
		return false;
	}
	
	if(strState=="0"||strState==null){
		alert("Please Select State!!");
		document.getElementById("strState").focus();
		return false;
	}
	
	if(strDistrict=="0"||strDistrict==null){
		alert("Please Select District!!");
		document.getElementById("strDistrict").focus();
		return false;
	}
	
	
	if(strCompanyCity==""||strCompanyCity==null){
		alert("Please Enter Company City!!");
		document.getElementById("strCompanyCity").focus();
		return false;
	}
	
	if(strPinCode==""||strPinCode==null){
		alert("Please Enter pin Code!!");
		document.getElementById("strPinCode").focus();
		return false;
	}
	
	if(isNaN(strPinCode))
	{
		alert("Please Enter pin Code in numeric value!!");
		document.getElementById("strPinCode").focus();
		
		return false;
	}
	
	if(strCompanyEmailId==""||strCompanyEmailId==null){
		alert("Please Enter Company mail id !!");
		document.getElementById("strCompanyEmailId").focus();
		return false;
	}
	
	
	if(strOfficePhoneNo==""||strOfficePhoneNo==null){
		alert("Please Enter Office Phone No.!!");
		document.getElementById("strOfficePhoneNo").focus();
		return false;
	}
	
	if(isNaN(strOfficePhoneNo))
	{
		alert("Please Enter Office Phone NO. in numeric value!!");
		document.getElementById("strOfficePhoneNo").focus();
		
		return false;
	}
	
	if(strPersonName==""||strPersonName==null){
		alert("Please Enter Person Name!!");
		document.getElementById("strPersonName").focus();
		return false;
	}
	
	if(strPersonPhoneNo==""||strPersonPhoneNo==null){
		alert("Please Enter Person Phone No.!!");
		document.getElementById("strPersonPhoneNo").focus();
		return false;
	}
	
	if(isNaN(strPersonPhoneNo))
	{
		alert("Please Enter Person Phone NO. in numeric value!!");
		document.getElementById("strPersonPhoneNo").focus();
		
		return false;
	}
	
	if(strPersonEmailId==""||strPersonEmailId==null){
		alert("Please Enter Person Email Id!!");
		document.getElementById("strPersonEmailId").focus();
		return false;
	}
	
	if(strPersonMobileNo==""||strPersonMobileNo==null){
		alert("Please Enter Person Mobile No.!!");
		document.getElementById("strPersonMobileNo").focus();
		return false;
	}
	
	if(isNaN(strPersonMobileNo))
	{
		alert("Please Enter Person MObile NO. in numeric value!!");
		document.getElementById("strPersonMobileNo").focus();
		
		return false;
	}

	 var r =document.getElementById("strCaptchaCode").value;
	
	 $.ajax({
			type : "POST",
			url : "isCaptchaValidate",
			data : {"captcha" : r,"flag":1},			
			success : function(response) {
					//alert("response"+response);
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
							document.addForm.action="saveCompanyDtls";
							document.addForm.method="post";
							document.addForm.submit();
							return true;
						  }
					   }
				} 
			}
	 });
	
	
	
}



function SaveRecord(){
	
  if(validate1()){
	  
	  var retVal=confirm("You Are Going To Save Records!!");
	   if(retVal){
		 var retVal1=confirm("Are You Sure!!");
		  if(retVal1){
			document.addForm.action="saveCompanyDtls";
			document.addForm.method="post";
			document.addForm.submit();
			return true;
		  }
	   }
  }  
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

$(document).ready(function(){
	
	 $("select#strState").change(function(){
		$.ajax({
		    type: "GET",
		    url:"districtList",
		    data: {stateCode: $(this).val()},
		    async: true,
		    dataType: "text",
		    success: function( data ) 
		    {
			    //alert(data);
		       $("select#strDistrict").html(data);
		       
		    }
		}); 
		 
  }); 

});


</script> 
    
</head>
<body class="container" style="width:100%">
<spring:url value="/CompanyDtl/CompanyDtlList"     var="urlListPage" />
    <div class="container myrow-container" style="width:100%">        
            <div class="panel panel-success">
			    <div class="panel-heading">
			         <h3 class="panel-title pull-left">
			                    Company Details
			         </h3>
			
			         <div class="pull-right"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			        <div class="clearfix"></div>
			    </div>
		  <div class="panel-body">			    
			           
          <form:form cssClass="form-horizontal" name="addForm" id="addForm" action="saveCompanyDtls" modelAttribute="userForm" onsubmit="return validate();">                
        <form:hidden path="strHiddenId"/>             
         
         <div class="panel panel-primary">
              <div class="panel-heading">Company Details</div>
         	  <div class="panel-body">
         		
         		<table class="col-sm-12">
                    <tr>
                      	<td class="col-sm-5"> 
                     
	                      	<div class="form-group">
		                        <div class="col-sm-4"><label class=" control-label">Company Name:<font color="red">*</font></label></div>
		                        <div class="col-sm-8">
		                            <form:input path="strCompanyName" type="text" class="form-control " id="strCompanyName" placeholder="Enter Company Name" />
		                        </div>
	                    	</div>
                    
                      	</td>
                    
                    	<td class="col-sm-7">
                    
	                       <div class="form-group">
		                      <div class="col-sm-4">
		                      		<label class="control-label">Company Business Activity:<font color="red">*</font></label>
		                      </div>
		                      <div class="col-sm-8">  
		                        <div class="row">
					
									 <div class="col-sm-3">
										<label class=" control-label">Manufacture:</label>
										<form:checkbox path="strCompanyBusinessActivity" id="strCompanyBusinessActivity"  value="1^IsManufacturer" />  
										
									</div>
									
									<div class="col-sm-3">
										<label class=" control-label">Marketing:</label>
										<form:checkbox path="strCompanyBusinessActivity" id="strCompanyBusinessActivity"  value="2^IsMarketing" />  
										
									</div>
									
									<div class="col-sm-3">
										<label class=" control-label">Importer:</label>
										<form:checkbox path="strCompanyBusinessActivity" id="strCompanyBusinessActivity"  value="3^IsImporter" />  
										
									</div>
									
									<div class="col-sm-3">
										<label class=" control-label">Distributer:</label>
										<form:checkbox path="strCompanyBusinessActivity" id="strCompanyBusinessActivity"  value="4^IsDistributor" />  
										
									</div> 
				
				 				</div>
				 			  
				 			  </div>
	                       
	                       </div>
                    
                    	</td>
                    
                   </tr>
                   
                   <tr>
                   		<td class="col-sm-6">
                   			<div class="form-group">
		                        <div class="col-sm-4"><label class=" control-label">Industry Type:<font color="red">*</font></label></div>
		                        <div class="col-sm-8">
		                            <div class="row">
		                          	
										<div class="col-sm-6">
											<label class=" control-label">SSL:</label>
											<form:radiobutton path="StrIndustryType" id="StrIndustryType"   value="1^IsSSL"/>  
					
										</div>
										<div class="col-sm-6">
										<label class=" control-label">NON SSL:</label>
										<form:radiobutton path="StrIndustryType" id="StrIndustryType"   value="2^IsNonSSL"/>  
					
										</div>
									</div>
		                        </div>
	                    	</div>
                   		</td>
                   		
                   		<td class="col-sm-6">
                   			<div class="form-group">
                   				<div class="col-sm-4">
                   				<label class=" control-label">Date Of Registration:<font color="red">*</font></label>
                   				</div>
                   				<div class="col-sm-8">
                   				<form:input path="strDateOfReg" class="form-control" id="strDateOfReg" placeholder="Choose" readonly="true"/>
                   				</div>
                   			
                   			</div>
                   		</td>
                   </tr>
         
         	  
         	  </table>
         	  </div>
         </div>
         
         <div class="panel panel-primary">
             <div class="panel-heading">Head Office / Corperate office address</div>
         	  <div class="panel-body">
         	  		<table class="col-sm-12">
         	  			<tr>
         	  				<td class="col-sm-6">
	         	  				<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Address:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:textarea path="strCompanyAddress" rows="2" class="form-control" id="strCompanyAddress" placeholder="Enter Company Address" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-sm-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Town/City:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strCompanyCity" type="text" class="form-control " id="strCompanyCity" placeholder="Enter Company city" />
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
		         	  					<form:select cssClass="form-control"  path = "strState">
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
		         	  					<form:select cssClass="form-control"  path = "strDistrict">
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
		         	  					<form:input path="strPinCode" type="text" class="form-control " id="strPinCode" placeholder="Enter Pin Code" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Office Phone No. (With Std Code):</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strOfficePhoneNo" type="text" class="form-control " id="strOfficePhoneNo" placeholder="Enter Office Phone No." />
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
		         	  					<form:input path="strCompanyEmailId" type="text" class="form-control " id="strCompanyEmailId" placeholder="Enter Email Id" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">If OTP Required:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<div class="row">
					
					 						<div class="col-lg-2">
						
												<form:checkbox path="strIsOtpReq" id="strIsOtpReq"  value="1" onclick="mobForOTP()" />  
						
											</div>
										</div>
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  			</tr>
         	  			
         	  			<tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group" id="mobforOTP" style="display:none">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Mobile No. (For OTP):</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strMobileNo" type="text" class="form-control " id="strMobileNo" placeholder="Enter Company's Mobile No. " />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					
         	  				</td>
         	  			</tr>
         	  			
         	  		</table>
         	  </div>
         </div>
         
         <div class="panel panel-primary">
             <div class="panel-heading">Contact Person Details</div>
         	  <div class="panel-body">
         	  		<table class="col-sm-12">
         	  			
         	  			<tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Name:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strPersonName" type="text" class="form-control " id="strPersonName" placeholder="Enter Contact Person Name" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Phone No. (With STD Code):</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strPersonPhoneNo" type="text" class="form-control " id="strPersonPhoneNo" placeholder="Enter Person Phone No." />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  			</tr>
         	  			
         	  			<tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Email Id:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strPersonEmailId" type="text" class="form-control " id="strPersonEmailId" placeholder="Enter Person Email Address" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Mobile No.:</label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strPersonMobileNo" type="text" class="form-control " id="strPersonMobileNo" placeholder="Enter Person Mobile No" />
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
         
       </form:form>
              
               <div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<button class="btn btn-primary" onclick="return validate();">Save</button>
					<button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>					
				</div>
			</div> 
    
          </div> <!-- panel-body  -->			    
		</div>   <!-- panel panel-success -->
	</div>  <!-- container myrow-container -->
            
  
</body> <!-- container -->
</html>