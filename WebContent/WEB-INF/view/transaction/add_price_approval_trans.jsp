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
        
        th{
           background: royalblue;
           color: white;
        }
    </style>
        
 <script>
	$(function() {
		 $("#permissionDate").datepicker({
			  dateFormat: 'dd-M-yy'	  
		   }).datepicker("setDate", new Date());
	});
	
	$(function() {
		 $("#prodImpDate").datepicker({
			  dateFormat: 'dd-M-yy'	  
		   }).datepicker("setDate", new Date());
	});
</script>

<script type="text/javascript"> 
$(document).ready(function(){
	
	   $("#loadTable").click(function(){
		alert("hi");
			$.ajax({
			    type: "GET",
			    url:"dataTable",
			    data: {documentCategory: $("#documentCategoryId").val(), document: $("#document").val(), 
			    	sdcLicense: $("#sdcLicense").val(), agreement: $("#agreement").val(), otherDocument: $("#otherDocument").val()},
			    async: true,
			    dataType: "text",
			    success: function( data ) 
			    {
				   alert(data);
			      //document.getElementById("indentItemListDiv").style.display="block";
			      document.getElementById("filesDiv").innerHTML=data;

			    }
			    	
			}); 
			
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

function validate2()
{
	var documentCategoryId=document.getElementById("documentCategoryId").value;
	
	if(documentCategoryId==null||documentCategoryId==""||documentCategoryId=="NONE"){
		alert("Please Select a Document Category!!");
		return false;
	}
		
	
	if(document.getElementById("document").files.length == 0){
		alert("Please Select a Document to Upload!!");
		return false;
	}
	
	if(document.getElementById("sdcLicense").files.length == 0){
		alert("Please Select a SDC License to Upload!!");
		return false;
	}
	
	if(document.getElementById("agreement").files.length == 0){
		alert("Please Select a Agreement to Upload!!");
		return false;
	}
	
	if(document.getElementById("otherDocument").files.length == 0){
		alert("Please Select a Other Documents to Upload!!");
		return false;
	}

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
		return false;
	}
	
	if(manufacturerName==""||manufacturerName==null){
		alert("Please Enter Manufacturer Name!!");
		return false;
	}
	
	if(manufacturerAddress==""||manufacturerAddress==null){
		alert("Please Enter Manufacturer Address!!");
		return false;
	}
	
	if(composition==""||composition==null){
		alert("Please Enter Composition!!");
		return false;
	}
	
	if(documentCategory==""||documentCategory==null||documentCategory=="NONE"){
		alert("Please Select Document Category!!");
		return false;
	}
	
	if(document.getElementById("document").files.length == 0){
		alert("Please Select a Document to Upload!!");
		return false;
	}
	
	if(document.getElementById("sdcLicense").files.length == 0){
		alert("Please Select a SDC License to Upload!!");
		return false;
	}
	
	if(permissionNo==""||permissionNo==null){
		alert("Please Enter Permission No.!!");
		return false;
	}
	
	if(isNaN(permissionNo)){
		alert("Please Enter Valid Permission No.!!");
		return false;
	}
	
	if(permissionDate==""||permissionDate==null){
		alert("Please Enter Permission Date!!");
		return false;
	}
	
	if(formulationType==""||formulationType==null){
		alert("Please Enter Fromulation Type!!");
		return false;
	}
	
	if(permissionDate==""||permissionDate==null){
		alert("Please Enter Permission Date!!");
		return false;
	}
	
	if(packsSize==""||packsSize==null){
		alert("Please Enter Size of Packs!!");
		return false;
	}
	
	if(therapeuticCat==""||therapeuticCat==null){
		alert("Please Enter Therapeutic Category!!");
		return false;
	}
	
	if(retailPrice==""||retailPrice==null){
		alert("Please Enter Retail Price!!");
		return false;
	}
	
	if(reason==""||reason==null){
		alert("Please Enter Reason for Price Fixation/Revision!!");
		return false;
	}
	
	if(productInfo==""||productInfo==null){
		alert("Please Enter Info relevant to Product!!");
		return false;
	}
	
	if(signatoryName==""||signatoryName==null){
		alert("Please Enter Signatory Name!!");
		return false;
	}
	
	if(companyName==""||companyName==null){
		alert("Please Enter Signatory Company Name!!");
		return false;
	}
	
	if(designation==""||designation==null){
		alert("Please Enter Signatory Designation!!");
		return false;
	}
	
	if(emailId==""||emailId==null){
		alert("Please Enter Signatory Email Id!!");
		return false;
	}
	
	if(mobileNo==""||mobileNo==null){
		alert("Please Enter Signatory Mobile No.!!");
		return false;
	}
	
	if(isNaN(mobileNo)){
		alert("Please Enter Signatory Mobile No.!!");
		return false;
	}
	
	if(place==""||place==null){
		alert("Please Enter Signatory Place!!");
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
							document.addForm.action="save";
							document.addForm.method="post";
							document.addForm.submit();
							return true;
						  }
					   }
				} 
			}
	 });
}

/* function showDocument(){
	document.addForm.action="save";
	document.addForm.method="post";
	document.addForm.submit();
	return true;
} */

function SaveRecord(){
  if(validate1()){
	  var retVal=confirm("You Are Going To Save Records!!");
	   if(retVal){
		 var retVal1=confirm("Are You Sure!!");
		  if(retVal1){
			document.addForm.action="save";
			document.addForm.method="post";
			document.addForm.submit();
			return true;
		  }
	   }
  }  
}	
	/* var cpaCode=document.getElementById("cpaCode").value;
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
 */
</script> 
    
</head>
<body class="container" style="width:100%">
<spring:url value="/drugMst/drugList"     var="urlListPage" />
<spring:url value="/priceApprovalTrans/save"     var="${saveURL}" />

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
			                    PRICE APPROVAL  >> ADD
			         </h3>
			
			        <%-- <div class="pull-right"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div> --%>
			        <div class="clearfix"></div>
			    </div>
		       <div class="panel-body">	
            
                <form:form cssClass="form-horizontal"  name="addForm" id="addForm" modelAttribute="addForm" method="post" onsubmit="return validate1();">                
                  
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
	                            <form:textarea rows="2" class="form-control" path="formulationName" name="formulationName" id="formulationName" placeholder="Name of the Formulation"/>
	                        </div>
	                    </div>
                    
                      </td>
                    
                    <td class="col-sm-6">
                    
	                    <div class="form-group">
	                        <div class="col-sm-4">  <label class="col-sm-12 control-label" >Manufacturer / Importer Name<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">
	                            <form:hidden path="manufactureId" />
	                            <form:input cssClass="form-control" path="manufacturerName" name="manufacturerName" id="manufacturerName" placeholder="Enter Manufacturer / Importer Name"/>
	                        </div>
	                    </div>
                    
                    </td>
                    
                   </tr>
                    
                   <tr>
                    
                     <td class="col-md-6">
                    
	                   <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Manufacturer / Importer Address<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">
	                            <form:textarea rows="2" class="form-control" path="manufacturerAddress" name="manufacturerAddress" id="manufacturerAddress" placeholder="Enter Manufacturer / Importer Address" />
	                        </div>
	                    </div>
                    
                     </td>
                    
                     <td class="col-md-6">
                    
                        <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name of the Marketing Company, if any:</label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="mktCompanyName" name="mktCompanyName" id="mktCompanyName" placeholder="Enter Name of the Marketing Company" />
	                        </div>
	                    </div>
                    
                     </td>
                     
                    </tr>
                    
                    <tr>
                    
                    <td class="col-md-6">
                    
                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label">Address of the Marketing Company, if any:</label> </div>
	                        <div class="col-sm-8">                         
	                            <form:textarea rows="2" class="form-control" path="mktCompanyAddress" name="mktCompanyAddress" id="mktCompanyAddress" placeholder="Enter Address of the Marketing Company" />
	                        </div>
	                    </div>
    
                    </td>
                   
                     <td class="col-md-6">
    
	                  <div class="form-group">
                        <div class="col-sm-4"> <label class="col-sm-12 control-label">Composition as per label claimed and approved by Drug Control Authorities:</label> </div>
                        <div class="col-sm-8">                          
                            <form:textarea rows="2" class="form-control" path="composition" name="composition" id="composition" placeholder="Enter Composition"/>
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
			                      <form:options items = "${documentList}" /> 
                          </form:select>         
                        </div>
                    </div>
                    
                    </td>
                    
                    <td class="col-sm-6">
                    
                    
	                    <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label">Upload Choosed Document<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                           <%--  <form:input cssClass="form-control" path="marketRate" value="${drugMstBean.marketRate}"/> --%>
	                            <form:input type="file" path="document" name="document" class="form-control " id="document" placeholder="Upload Choosed Document"/> 
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
	                            <form:input type="file" path="sdcLicense" name="sdcLicense" class="form-control " id="sdcLicense" placeholder="Upload SDC License" /> 
	                        </div>
	                    </div>
                     
                    </td>
                  
                    <td class="col-md-6">
                    
	                     <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label">Agreement / contract between manufacturer and marketer</label></div>
	                        <div class="col-sm-8">
	                           <%--  <form:input cssClass="form-control" path="marketRate" value="${drugMstBean.marketRate}"/> --%>
	                            <form:input type="file" path="agreement" name="agreement" id="agreement" class="form-control " placeholder="Upload Agreement" />
 
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
	                            <form:input type="file"  path="otherDocument" name="otherDocument" class="form-control " id="otherDocument" placeholder="Upload Other Document" /> 
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
		                <th width="10%">S.No.</th>
			            <th width="20%">Upload Document</th>
			            <th width="20%">SDC License</th>
			            <th width="20%">Agreement</th>
			            <th width="20%">Other Documents</th>
			            <th width="10%">Action</th>
		        </tr>
		        </thead>
		        <tbody>
                 <%-- <c:choose>
            <c:when test="${priceApprovalBean != null}"> --%>
                <c:forEach var="file" items="${priceApprovalBean}" varStatus="counter">
                    <form:hidden path="hiddenId" value="${file.hiddenId}"/>
                    <tr>
                        <td width="10%"><div align="center">${counter.index + 1}</div></td>
                        <td width="20%">${file.document}</td>
                        <td width="20%">${file.sdcLicense}</td>
                        <td width="20%">${file.agreement}</td>
                        <td width="20%">${file.otherDocument}</td>
                        
                        <td width="10%"><div align="center">
                         <spring:url value="/priceApprovalTrans/delete/${file.hiddenId}"  var="deleteURL" />
						<button class="btn btn-danger"  onclick="if(DeleteRecord()){location.href='${deleteURL}';}">DELETE</button>
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
	                            <form:input cssClass="form-control" path="permissionNo" name="permissionNo" id="permissionNo" placeholder="Enter Permission Number" />
	                        </div>
	                    </div>
                    
                     </td>
                     
                     <td class="col-sm-6">
                                 
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Permission Date<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="permissionDate" name="permissionDate" id="permissionDate" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                                 
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Date of commencement of production / import</label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="prodImpDate" name="prodImpDate" id="prodImpDate" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td class="col-md-6">
                    
	                   <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Type of formulation<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="formulationType" name="formulationType" id="formulationType" placeholder="Enter Type of Formulation" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Size of Packs<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="packsSize" name="packsSize" id="packsSize" placeholder="Enter Size of Packs" />
	                        </div>
	                    </div>  
                    
                    </td>
                  
                    <td class="col-md-6"> 
                     
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Therapeutic category / use of the formulation<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="therapeuticCat" name="therapeuticCat" id="therapeuticCat" placeholder="Enter Therapeutic Category" />
	                        </div>
	                    </div>  
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >The Retail Price claimed for approval<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="retailPrice" name="retailPrice" id="retailPrice" placeholder="Enter Retail Price" />
	                        </div>
	                    </div>
                    
                     </td>
                  
                    <td> 
                     
	                    <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Reason for submission of application for price fixation / revision<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:textarea cssClass="form-control" rows="2" path="reason" name="reason" id="reason" placeholder="Enter Reason for Price Fixation / Revision" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                     <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Any other information relavant to product and its process of manufacturing / packaging / distribution.<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:textarea cssClass="form-control" rows="2" path="productInfo" name="productInfo" id="productInfo" placeholder="Enter Information Relavant to Product" />
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
	                            <form:input cssClass="form-control" path="signatoryName" name="signatoryName" id="signatoryName" placeholder="Enter Signatory Name" />
	                        </div>
	                    </div>
                    
                    </td>
                    
                    <td class="col-sm-6">
                    
	                      <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name of Company<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            <form:input cssClass="form-control" path="companyName" name="companyName" id="companyName" placeholder="Enter Signatory Company Name" />
	                        </div>
	                    </div>
                                             
					</td>
					
					</tr>
					
					<tr>
					
					  <td class="col-md-6">	
					                    
	                     <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Designation<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            <form:input cssClass="form-control" path="designation" name="designation" id="designation" placeholder="Enter Signatory Designation" />
	                        </div>
	                    </div>
                                     
                      </td>
                     
                  <td class="col-md-6">
                  
                  <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Email Id<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            <form:input cssClass="form-control" path="emailId" name="emailId" id="emailId" placeholder="Enter Signatory EmailId" />
	                        </div>
	                    </div>
                                     
                      </td>
                      
                    </tr>
					
					<tr>
					
					  <td class="col-md-6">	
					                    
	                     <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Mobile No.<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            <form:input cssClass="form-control" path="mobileNo" name="mobileNo" id="mobileNo" placeholder="Enter Signatory Mobile No." />
	                        </div>
	                    </div>
                                     
                                     
                      </td>
                     
                      <td class="col-md-6">
                  
                        <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Place<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            <form:input cssClass="form-control" path="place" name="place" id="place" placeholder="Enter Signatory Place" />
	                        </div>
	                    </div>
                                     
                      </td>
                      
                      </tr>
                      
                      <tr>
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
         	  			</tr>
         	  			
         	  			  <%-- <tr>
					
					  	
					                    
	                     <div class="form-group">
	                        <div class="control-label col-xs-4"><label path="capchaCode">Capcha Code:<font color="red">*</font></label></div>
	                        <div class="col-xs-6">
	                            <form:input cssClass="form-control" path="capchaCode" />
	                        </div>
	                    </div>
	                    
	                    <td>Capcha Code:</td>
					<td>
						<div>
							<img id="captcha_id" name="imgCaptcha" src="captcha.jpg">
						</div>
					</td>


					<td align="left"><a href="javascript:;"
						title="change captcha text"
						onclick="document.getElementById('captcha_id').src = 'captcha.jpg?' + Math.random();  return false">
							<img src="<c:url value="images/refresh.png" />" />
					</a>
                                     
                      </td>
                      
                      </tr>
                      
                      <tr>
                      
				    	<td colspan="2"><form:errors path="captcha" cssClass="error" /></td>
					
				     </tr>
				     
				     <tr>
				     
					<td>Enter Capcha Code(case sensitive)<font color="red">*</font></td>
					
					<td><form:input path="captcha" /></td>
					
				    </tr>
 --%>                     
                      <%-- <td>
                  
                        <div class="form-group">
	                        <div class="control-label col-xs-4"><label path="capchaCode">Enter Capcha Code(case sensitive)<font color="red">*</font></label></div>
	                        <div class="col-xs-6">
	                            <form:input cssClass="form-control" path="capchaCode" />
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
				         <button class="btn btn-primary" onclick="return validate1();">Save</button>
				         <button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>
		               </div>
		           </div>
    
                   
                <%-- </form:form> --%>
                
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