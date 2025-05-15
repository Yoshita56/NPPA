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
<%-- <script src="<c:url value="/js/mycaptcha.js" />"></script> --%>	


    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
        
        th{
           background: royalblue;
           color: white;
        }
    </style>
        
 <script>
	$(function() {
		 $("#permissionDate").datepicker({
			  dateFormat: 'dd-M-yy'	  
		   });
	});
	
	$(function() {
		 $("#prodImpDate").datepicker({
			  dateFormat: 'dd-M-yy'	  
		   });
	});
</script>
  
<script type="text/javascript">

function DeleteRecord(){
	 var retVal=confirm("You Are Going To Delete Records!!");
	   if(retVal){
		 var retVal1=confirm("Are You Sure!!");
		  if(retVal1){
			return true;
		  }
		  else
			  return false;
	   }
	   else{
		   return false;
	   }
}

function floatVal(){
	var retailPrice=document.getElementById("retailPrice").value;
	
	var num=parseFloat(retailPrice).toFixed(2);
	
	document.getElementById("retailPrice").value=num;
}

function checkMail(inputEmail)
{
	const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	return re.test(String(inputEmail).toLowerCase());
}

function validate1(){

	var formulationName=document.getElementById("formulationName").value;
	var manufacturerName=document.getElementById("manufacturerName").value;
	var manufacturerAddress=document.getElementById("manufacturerAddress").value;
//	var mktCompanyName=document.getElementById("mktCompanyName").value;
//	var mktCompanyAddress=document.getElementById("mktCompanyAddress").value;
	var composition=document.getElementById("composition").value;
	var documentCategory=document.getElementById("documentCategoryId").value;
//	var document1=document.getElementById("document").value;
//	var sdcLicense=document.getElementById("sdcLicense").value;
	var permissionNo=document.getElementById("permissionNo").value;
	var permissionDate=document.getElementById("permissionDate").value;
	var formulationType=document.getElementById("formulationType").value;
	var packsSize=document.getElementById("packsSize").value;
	var therapeuticCat=document.getElementById("therapeuticCat").value;
	var retailPrice=document.getElementById("retailPrice").value;
	var reason=document.getElementById("reason").value;
	var productInfo=document.getElementById("productInfo").value;
	var signatoryName=document.getElementById("signatoryName").value;
	var companyName=document.getElementById("companyName").value;
	var designation=document.getElementById("designation").value;
	var emailId=document.getElementById("emailId").value;
	var mobileNo=document.getElementById("mobileNo").value;
	var place=document.getElementById("place").value;
	
	if(formulationName==""||formulationName==null){
		alert("Please Enter Formulation Name!!");
		document.getElementById("formulationName").focus();
		return false;
	}
	
	if(!isNaN(formulationName)){
		alert("Please Enter Correct Formulation Name!!");
		document.getElementById("formulationName").focus();
		return false;
	}
	
	if(manufacturerName==""||manufacturerName==null){
		alert("Please Enter Manufacturer Name!!");
		document.getElementById("manufacturerName").focus();
		return false;
	}
	
	if(!isNaN(manufacturerName)){
		alert("Please Enter Correct Manufacturer Name!!");
		document.getElementById("manufacturerName").focus();
		return false;
	}
	
	if(manufacturerAddress==""||manufacturerAddress==null){
		alert("Please Enter Manufacturer Address!!");
		document.getElementById("manufacturerAddress").focus();
		return false;
	}
	
	if(!isNaN(manufacturerAddress)){
		alert("Please Enter Correct Manufacturer Address!!");
		document.getElementById("manufacturerAddress").focus();
		return false;
	}
	
	if(composition==""||composition==null){
		alert("Please Enter Composition!!");
		document.getElementById("composition").focus();
		return false;
	}
	
	if(!isNaN(composition)){
		alert("Please Enter Correct Composition!!");
		document.getElementById("composition").focus();
		return false;
	}
	
	if(documentCategory==""||documentCategory==null||documentCategory=="NONE"){
		alert("Please Select Document Category!!");
		document.getElementById("documentCategoryId").focus();
		return false;
	}
	
	if(document.getElementById("document").files.length == 0){
		alert("Please Select a Document to Upload!!");
		document.getElementById("document").focus();
		return false;
	}
	
	if(document.getElementById("sdcLicense").files.length == 0){
		alert("Please Select a SDC License to Upload!!");
		document.getElementById("sdcLicense").focus();
		return false;
	}
	
	if(permissionNo==""||permissionNo==null){
		alert("Please Enter Permission No.!!");
		document.getElementById("permissionNo").focus();
		return false;
	}
	
	if(isNaN(permissionNo)){
		alert("Please Enter Correct Permission No.!!");
		document.getElementById("permissionNo").focus();
		return false;
	}
	
	if(permissionDate==""||permissionDate==null){
		alert("Please Enter Permission Date!!");
		document.getElementById("permissionDate").focus();
		return false;
	}
	
	if(formulationType==""||formulationType==null){
		alert("Please Enter Formulation Type!!");
		document.getElementById("formulationType").focus();
		return false;
	}
	
	if(!isNaN(formulationType)){
		alert("Please Enter Correct Formulation Type!!");
		document.getElementById("formulationType").focus();
		return false;
	}
	
	if(packsSize==""||packsSize==null){
		alert("Please Enter Size of Packs!!");
		document.getElementById("packsSize").focus();
		return false;
	}
	
	if(isNaN(packsSize)){
		alert("Please Enter Correct Size of Packs!!");
		document.getElementById("packsSize").focus();
		return false;
	}
	
	if(therapeuticCat==""||therapeuticCat==null){
		alert("Please Enter Therapeutic Category!!");
		document.getElementById("therapeuticCat").focus();
		return false;
	}
	
	if(isNaN(therapeuticCat)){
		alert("Please Enter Correct Therapeutic Category!!");
		document.getElementById("therapeuticCat").focus();
		return false;
	}
	
	if(retailPrice==""||retailPrice==null){
		alert("Please Enter Retail Price!!");
		document.getElementById("retailPrice").focus();
		return false;
	}
	
	if(isNaN(retailPrice)){
		alert("Please Enter Correct Retail Price!!");
		document.getElementById("retailPrice").focus();
		return false;
	}
	
	if(reason==""||reason==null){
		alert("Please Enter Reason for Price Fixation/Revision!!");
		document.getElementById("reason").focus();
		return false;
	}
	
	if(!isNaN(reason)){
		alert("Please Enter Reason for Price Fixation/Revision!!");
		document.getElementById("reason").focus();
		return false;
	}
	
	if(productInfo==""||productInfo==null){
		alert("Please Enter Info relevant to Product!!");
		document.getElementById("productInfo").focus();
		return false;
	}
	
	if(!isNaN(productInfo)){
		alert("Please Enter Correct Info relevant to Product!!");
		document.getElementById("productInfo").focus();
		return false;
	}
	
	if(signatoryName==""||signatoryName==null){
		alert("Please Enter Signatory Name!!");
		document.getElementById("signatoryName").focus();
		return false;
	}
	
	if(!isNaN(signatoryName)){
		alert("Please Enter Correct Signatory Name!!");
		document.getElementById("signatoryName").focus();
		return false;
	}
	
	if(companyName==""||companyName==null){
		alert("Please Enter Signatory Company Name!!");
		document.getElementById("companyName").focus();
		return false;
	}
	
	if(!isNaN(companyName)){
		alert("Please Enter Correct Signatory Company Name!!");
		document.getElementById("companyName").focus();
		return false;
	}
	
	if(designation==""||designation==null){
		alert("Please Enter Signatory Designation!!");
		document.getElementById("designation").focus();
		return false;
	}
	
	if(!isNaN(designation)){
		alert("Please Enter Correct Signatory Designation!!");
		document.getElementById("designation").focus();
		return false;
	}
	
	if(emailId==""||emailId==null){
		alert("Please Enter Signatory Email Id!!");
		document.getElementById("emailId").focus();
		return false;
	}
	
	if(!checkMail(emailId)){
		alert("Please Enter Correct Signatory Email Id!!");
		document.getElementById("emailId").focus();
		return false;
	}
	
	if(mobileNo==""||mobileNo==null){
		alert("Please Enter Signatory Mobile No.!!");
		document.getElementById("mobileNo").focus();
		return false;
	}
	
	if(isNaN(mobileNo)||mobileNo.length>10){
		alert("Please Enter Correct Signatory Mobile No.!!");
		document.getElementById("mobileNo").focus();
		return false;
	}
	
	if(place==""||place==null){
		alert("Please Enter Signatory Place!!");
		document.getElementById("place").focus();
		return false;
	}
	
	if(!isNaN(place)){
		alert("Please Enter Correct Signatory Place!!");
		document.getElementById("place").focus();
		return false;
	}	
	/* var r =document.getElementById("strCaptchaCode").value;
	
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
							document.modifyForm.action="save";
							document.modifyForm.method="post";
							document.modifyForm.submit();
							return true;
						  }
					   }
				} 
			}
	 }); */
	 return true;
}

function getDocument(){
	var document1=document.getElementById("document").value;
	document.getElementById("one").innerHTML=document1.split("\\")[2];
}

function getSdcLicense(){
	var sdcLicense=document.getElementById("sdcLicense").value;
	document.getElementById("two").innerHTML=sdcLicense.split("\\")[2];
}

function getAgreement(){
	var agreement=document.getElementById("agreement").value;
	document.getElementById("three").innerHTML=agreement.split("\\")[2];
}

function getOtherDocument(){
	var otherDocument=document.getElementById("otherDocument").value;
	document.getElementById("four").innerHTML=otherDocument.split("\\")[2];
}

function SaveRecord(){
  if(validate1()){
	  var retVal=confirm("You Are Going To Save Records!!");
	   if(retVal){
		 var retVal1=confirm("Are You Sure!!");
		  if(retVal1){
			document.modifyForm.action=document.getElementById("priceApprovalTransUpdate").value;
			document.modifyForm.method="post";
			document.modifyForm.submit();
			return true;
		  }
	   }
  }  
}	
	</script> 
    
</head>
<body class="container" style="width:100%">
<spring:url value="/priceApprovalTrans/update" var="updateURL" />
	 <spring:url value="/priceApprovalTrans/cancelPriceApprovalAdd" var="cancelAddURL" />
    <input type="hidden" id="priceApprovalTransUpdate" value="${updateURL}">
<div class="container">

		<c:if test="${not empty msg}">
			<div class="alert alert-${css} alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>${msg}</strong>
			</div>
		</c:if>
	</div>
	
    <div class="container myrow-container" style="width:100%">        
            <div class="panel panel-success">
			    <div class="panel-heading">
			         <h3 class="panel-title pull-left">
			                    PRICE APPROVAL  >> MODIFY
			         </h3>
			
			           <div class="pull-right"> <a class="navbar-brand" href="${cancelAddURL}">BACK</a></div> 
			        <div class="clearfix"></div>
			    </div>
		       <div class="panel-body">	
            
                <form:form cssClass="form-horizontal"  name="modifyForm" id="modifyForm" modelAttribute="modifyForm" enctype="multipart/form-data" onsubmit="return validate1();">                
                  
                  <form:hidden path="hiddenId" name="hiddenId" id="hiddenId" value= "${priceApprovalTrans.hiddenId}" />
                  <div class="panel panel-primary">
                   <div class="panel-heading">Form-1'S INFORMATION</div>
                   <div class="panel-body">
                   
                  <!-- <div style="color:white;background:blue">Form-1'S INFORMATION</div> -->   
                  <table class="col-sm-12">
                    <tr>
                      <td class="col-sm-6"> 
                     
	                      <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name of the Formulation<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:textarea rows="2" class="form-control" path="formulationName" name="formulationName" id="formulationName" placeholder="Name of the Formulation" value="${priceApprovalTrans.formulationName}" />
	                        </div>
	                    </div>
                    
                      </td>
                    
                    <td class="col-sm-6">
                    
	                    <div class="form-group">
	                        <div class="col-sm-4">  <label class="col-sm-12 control-label" >Manufacturer / Importer Name<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">
	                            <form:hidden path="manufactureId" />
	                            <form:input cssClass="form-control" path="manufacturerName" name="manufacturerName" id="manufacturerName" placeholder="Enter Manufacturer / Importer Name" value="${priceApprovalTrans.manufacturerName}" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                   </tr>
                    
                   <tr>
                    
                     <td class="col-md-6">
                    
	                   <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Manufacturer / Importer Address<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">
	                            <form:textarea rows="2" class="form-control" path="manufacturerAddress" name="manufacturerAddress" id="manufacturerAddress" placeholder="Enter Manufacturer / Importer Address" value="${priceApprovalTrans.manufacturerAddress}" />
	                        </div>
	                    </div>
                    
                     </td>
                    
                     <td class="col-md-6">
                    
                        <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name of the Marketing Company, if any:</label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="mktCompanyName" name="mktCompanyName" id="mktCompanyName" placeholder="Enter Name of the Marketing Company" value="${priceApprovalTrans.mktCompanyName}" />
	                        </div>
	                    </div>
                    
                     </td>
                     
                    </tr>
                    
                    <tr>
                    
                    <td class="col-md-6">
                    
                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label">Address of the Marketing Company, if any:</label> </div>
	                        <div class="col-sm-8">                         
	                            <form:textarea rows="2" class="form-control" path="mktCompanyAddress" name="mktCompanyAddress" id="mktCompanyAddress" placeholder="Enter Address of the Marketing Company" value="${priceApprovalTrans.mktCompanyAddress}" />
	                        </div>
	                    </div>
    
                    </td>
                   
                     <td class="col-md-6">
    
	                  <div class="form-group">
                        <div class="col-sm-4"> <label class="col-sm-12 control-label">Composition as per label claimed and approved by Drug Control Authorities:</label> </div>
                        <div class="col-sm-8">                          
                            <form:textarea rows="2" class="form-control" path="composition" name="composition" id="composition" placeholder="Enter Composition" value="${priceApprovalTrans.composition}" />
                        </div>
                    </div> 
	                      
                    </td>
                    
                  </tr>
                  </table>
                  
                  </div>
                  </div>
                  
                  <!-- <div style="color:white;background:blue">Upload Form-I's Relevant Documents</div> -->
                  
                   <div class="panel panel-primary">
                     <div class="panel-heading">Upload Form-I's Relevant Documents</div>
                        <div class="panel-body">         
                  
               
                  <table class="col-sm-12">  
                  <form:hidden path="filesId" />
                  <tr>
                    
                     <td class="col-sm-6">
                    
                     <div class="form-group">
                        <div class="col-sm-4"><label class="col-sm-12 control-label">Choose Document Category<font color="red">*</font></label></div>
                        <div class="col-sm-8">
                           <form:select cssClass="form-control"  path = "documentCategoryId" name = "documentCategoryId" id = "documentCategoryId">
			                     <form:option value = "NONE" label = "Select Document Category" />
			                      <form:options value="${priceApprovalTrans.documentCategoryId}" items = "${documentList}" /> 
                          </form:select>         
                        </div>
                    </div>
                    
                    </td>
                    
                    <td class="col-sm-6">
                    
                    
	                    <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label">Upload Choosed Document<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                           <%--  <form:input cssClass="form-control" path="marketRate" value="${drugMstBean.marketRate}"/> --%>
	                            <input type="file" name="document" class="form-control " id="document" onchange="getDocument()" /> 
	                        </div>
	                    </div>
                    
                    </td>
                    
                    </tr>
                    
                    <tr>
                    
                    <td class="col-md-6">
                     
                     <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label">Current Valid SDC License having both the names of Manufacturing and Marketing Company<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                           <%--  <form:input cssClass="form-control" path="marketRate" value="${drugMstBean.marketRate}"/> --%>
	                            <input type="file" name="sdcLicense" class="form-control " id="sdcLicense" onchange="getSdcLicense()" /> 
	                        </div>
	                    </div>
                     
                    </td>
                  
                    <td class="col-md-6">
                    
	                     <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label">Agreement / contract between manufacturer and marketer</label></div>
	                        <div class="col-sm-8">
	                           <%--  <form:input cssClass="form-control" path="marketRate" value="${drugMstBean.marketRate}"/> --%>
	                            <input type="file" name="agreement" id="agreement" class="form-control " onchange="getAgreement()" />
 
	                        </div>
	                    </div>
                    
                    </td>
                    
                    </tr>
                    
                    <tr>
                    
                    <td class="col-md-6">
    
	                    <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label">Any other document(s)</label></div>
	                        <div class="col-sm-8">
	                           <%--  <form:input cssClass="form-control" path="marketRate" value="${drugMstBean.marketRate}"/> --%>
	                            <input type="file" name="otherDocument" class="form-control " id="otherDocument" onchange="getOtherDocument()" /> 
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                  
                  <!-- <tr>
                  <td>
                  <div class="form-group">
			            <div class="col-sm-offset-2 col-sm-10">
				         <button class="btn btn-primary" id="loadTable" >Add</button>
				         
		               </div>
		           </div>
                  </td>
                    
                  </tr> -->
                  </table>
                            
                  
                 <!--  <div id="filesDiv"> -->
                  <%-- <table id="myDatatable" border="1" cellspacing="0">
                   <thead>
                    <tr>
		                <th>S.No.</th>
			            <th>Upload Document</th>
			            <th>SDC License</th>
			            <th>Agreement</th>
			            <th>Other Documents</th>
			            <th>Action</th>
		        </tr>
		        </thead>
		        <tbody>
		        <c:choose>
            <c:when test="${priceApprovalBean != null}">
                <c:forEach var="file" items="${priceApprovalBean}" varStatus="counter">
        
                    <tr>
                        <td><div align="center">${counter.index + 1}</div></td>
                        <td>${file.document}</td>
                        <td>${file.sdcLicense}</td>
                        <td>${file.agreement}</td>
                        <td>${file.otherDocument}</td>
                        <td><div align="center"><a href="download.htm?id=${file.id}">Download</a> /
                            <a href="delete.htm?id=${file.id}">Delete</a></div>
                        </td>
                        <td><div align="center">
                        <button class="btn btn-primary btn-sm" onclick="location.href='download.htm?id=${file.id}'">Download</button>
						<button class="btn btn-danger"  onclick="if(DeleteRecord()){location.href='${deleteURL}';}">DELETE</button>
                        </div>
                        </td>
                    </tr>
                    
                </c:forEach>
            </c:when>
        </c:choose>
        </tbody>
    </table> --%>
                 <!--  </div> -->
                 
                 <div id="filesDiv">
                 
                 <table id="myDatatable" border="1" cellspacing="0" width="100%">
                   <thead>
                    <tr>
		                <th width="20%"><div align="center">S.No.</div></th>
			            <th width="50%"><div align="center">Uploaded Documents</div></th>
			            <th width="30%"><div align="center">Action</div></th>
		        </tr>
		        </thead>
		        <tbody>
                 <%-- <c:choose>
            <c:when test="${priceApprovalBean != null}"> --%>
                <c:forEach var="file" items="${priceApprovalBean}" varStatus="counter">
                     <%-- <form:hidden path="hiddenId" id="hiddenId" name="hiddenId" value="${file.hiddenId}"/> --%> 
                    <tr>
                        <td width="20%"><div align="center">${counter.index + 1}</div></td>
                        <td width="50%"><div id="one">${file.document}</div></td>                     
                        <td width="30%"><div align="center">
                         <spring:url value="/priceApprovalTrans/deleteTable/${file.hiddenFilesId}"  var="deleteTableURL" />
						<button class="btn btn-danger"  onclick="if(DeleteRecord()){location.href='${deleteTableURL}';}">DELETE</button>
                        </div>
                        </td>
                    </tr>
                    
                </c:forEach>
            <%-- </c:when>
        </c:choose> --%>
	        </tbody>
	      </table>
                 </div>
                  
                  </div>
                  </div>
                  
                  <!-- <div style="color:white;background:blue">Drug Control Authority</div> -->
                  
                   <div class="panel panel-primary">
                     <div class="panel-heading">Drug Control Authority</div>
                        <div class="panel-body">
                  
                  <table class="col-sm-12">
                  
                  <tr>
                     
                     <td class="col-sm-6">
                    
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Permission Number<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="permissionNo" name="permissionNo" id="permissionNo" placeholder="Enter Permission Number" value="${priceApprovalTrans.permissionNo}" />
	                        </div>
	                    </div>
                    
                     </td>
                     
                     <td class="col-sm-6">
                                 
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Permission Date<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="permissionDate" name="permissionDate" id="permissionDate" value="${priceApprovalTrans.permissionDate}" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                                 
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Date of commencement of production / import</label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="prodImpDate" name="prodImpDate" id="prodImpDate" value="${priceApprovalTrans.prodImpDate}" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td class="col-md-6">
                    
	                   <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Type of formulation<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="formulationType" name="formulationType" id="formulationType" placeholder="Enter Type of Formulation" value="${priceApprovalTrans.formulationType}" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Size of Packs<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="packsSize" name="packsSize" id="packsSize" placeholder="Enter Size of Packs" value="${priceApprovalTrans.packsSize}" />
	                        </div>
	                    </div>  
                    
                    </td>
                  
                    <td class="col-md-6"> 
                     
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Therapeutic category / use of the formulation<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="therapeuticCat" name="therapeuticCat" id="therapeuticCat" placeholder="Enter Therapeutic Category" value="${priceApprovalTrans.therapeuticCat}" />
	                        </div>
	                    </div>  
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >The Retail Price claimed for approval<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="retailPrice" name="retailPrice" id="retailPrice" placeholder="Enter Retail Price" value="${priceApprovalTrans.retailPrice}" />
	                        </div>
	                    </div>
                    
                     </td>
                  
                    <td> 
                     
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Reason for submission of application for price fixation / revision<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:textarea cssClass="form-control" rows="2" path="reason" name="reason" id="reason" placeholder="Enter Reason for Price Fixation / Revision" value="${priceApprovalTrans.reason}" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                     <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Any other information relavant to product and its process of manufacturing / packaging / distribution.<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:textarea cssClass="form-control" rows="2" path="productInfo" name="productInfo" id="productInfo" placeholder="Enter Information Relavant to Product" value="${priceApprovalTrans.productInfo}" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                 </tr>
                  
                  </table>
                  
                  </div>
                  </div>
                  
                  <!-- <div style="color:white;background:blue">Authorized Signatory</div> -->
                  
                  <div class="panel panel-primary">
                     <div class="panel-heading">Authorized Signatory</div>
                        <div class="panel-body">
                  
                  <table class="col-sm-12">
                  
                  <tr>
                  
                   <td class="col-sm-6"> 
                    
	                     <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="signatoryName" name="signatoryName" id="signatoryName" placeholder="Enter Signatory Name" value="${priceApprovalTrans.signatoryName}" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td class="col-sm-6">
                    
	                      <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name of Company<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="companyName" name="companyName" id="companyName" placeholder="Enter Signatory Company Name" value="${priceApprovalTrans.companyName}" />
	                        </div>
	                    </div>
                                             
					</td>
					
					</tr>
					
					<tr>
					
					  <td class="col-md-6">	
					                    
	                     <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Designation<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            <form:input cssClass="form-control" path="designation" name="designation" id="designation" placeholder="Enter Signatory Designation" value="${priceApprovalTrans.designation}" />
	                        </div>
	                    </div>
                                     
                      </td>
                     
                  <td class="col-md-6">
                  
                  <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Email Id<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            <form:input cssClass="form-control" path="emailId" name="emailId" id="emailId" placeholder="Enter Signatory EmailId" value="${priceApprovalTrans.emailId}" />
	                        </div>
	                    </div>
                                     
                      </td>
                      
                    </tr>
					
					<tr>
					
					  <td class="col-md-6">	
					                    
	                     <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Mobile No.<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            <form:input cssClass="form-control" path="mobileNo" name="mobileNo" id="mobileNo" placeholder="Enter Signatory Mobile No." value="${priceApprovalTrans.mobileNo}" />
	                        </div>
	                    </div>
                                     
                                     
                      </td>
                     
                      <td class="col-md-6">
                  
                        <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Place<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            <form:input cssClass="form-control" path="place" name="place" id="place" placeholder="Enter Signatory Place" value="${priceApprovalTrans.place}" />
	                        </div>
	                    </div>
                                     
                      </td>
                      
                      </tr>
                      
                      <%-- <tr>
         	  				<td class="col-md-6">
         	  					<div class="form-group">
		         	  				<div class="col-sm-4">
		         	  					<label class="col-sm-12 control-label">Captcha Code:</label>
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
		         	  					<label class="col-sm-12 control-label">Enter Captcha Code:(case sensitive)<font color="red">*</font></label>
		         	  				</div>
		         	  				<div class="col-sm-8">
		         	  					<form:input path="strCaptchaCode" type="text" class="form-control " id="strCaptchaCode" placeholder="Enter Captcha Code" />
		         	  				</div>
	         	  				</div>
         	  				</td>
         	  			</tr> --%>
         	  		    
                      </table>
                      
                      </div>
	                    </div>
	                    
                    </form:form>
                    <div class="form-group">
			            <div class="col-sm-offset-2 col-sm-10">
				         <button class="btn btn-primary" onclick="return SaveRecord();">Save</button>
				         <button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>
		               </div>
		           </div>
			   
            </div>
        </div>
    </div>

	

</body>
</html>