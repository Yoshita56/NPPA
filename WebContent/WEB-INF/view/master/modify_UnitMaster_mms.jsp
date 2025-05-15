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
    <title>Modifty Unit Master</title>
        

<link href="<c:url value="/jquery-ui-1.12.1/jquery-ui.min.js" />" rel="stylesheet">
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

/* $(function() {
	 $("#strEffectiveFrom").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   });
}); */

 

function validate1(){
	
	
	var strUnitSize=document.getElementById("strUnitSize").value;
	
	var strConvertedValue=document.getElementById("strConvertedValue").value;
	
	var strRemarks=document.getElementById("strRemarks").value;
	
	
	if(strUnitSize==""||strUnitSize==null){
		alert("Please Enter Drug Unit Size Name!!");
		document.getElementById("strUnitSize").focus();
		return false;
	}
	
	
	if(strConvertedValue==""||strConvertedValue==null){
		alert("Please Enter Converted Value!!");
		document.getElementById("strConvertedValue").focus();
		return false;
	}
	
	if(isNaN(strConvertedValue))
	{
		alert("Please Enter Converted Value in numeric value!!");
		document.getElementById("strConvertedValue").focus();
		
		return false;
	}
	
	
	
	if(strRemarks==""||strRemarks==null){
		alert("Please Enter Remarks!!");
		document.getElementById("strRemarks").focus();
		return false;
	}
	
	return true;
}

function UpdateRecord(){
	 if(validate1()){
		  var retVal=confirm("You Are Going To Update Record!!");
		   if(retVal){
			 var retVal1=confirm("Are You Sure!!");
			  if(retVal1){
			document.drugCertificateUpdateForm.action="updateUnitMaster";
			document.drugCertificateUpdateForm.method="post";
			document.drugCertificateUpdateForm.submit();
			return true;
		  }
	   }
  }  
}

function cancelUpdate(){
	document.drugCertificateUpdateForm.action="UnitMasterList";
	document.drugCertificateUpdateForm.method="get";
	document.drugCertificateUpdateForm.submit();
	return true;
}

</script> 

    
</head>
<body class="container">
<spring:url value="/UnitMst/UnitMasterList"     var="urlListPage" />
    <div class="container myrow-container">        
            <div class="panel panel-success">
			    <div class="panel-heading">
			         <h3 class="panel-title pull-left">
			                    Unit Master >> MODIFY
			         </h3>
			
			        <div class="pull-right"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			        <div class="clearfix"></div>
			    </div>
		  <div class="panel-body">	
  			<form:form cssClass="form-horizontal" name="drugCertificateUpdateForm" id="drugCertificateUpdateForm" action="updateUnitMaster" modelAttribute="modifyForm" onsubmit="return validate1();">                
        	   
        	   <form:hidden path="strUnitMstId"/>             
                      <div class="form-group">
                        <form:label path="strUnitSize" class="control-label col-xs-3">Unit Size:</form:label> 
                        <div class="col-xs-6">
                             <form:input cssClass="form-control" path="strUnitSize" id="strUnitSize"/>
                        </div>
                    </div>
    
                     
                    
                    <div class="form-group">
                        <form:label path="strBaseUnitName" cssClass="control-label col-xs-3">Base Unit:</form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="strBaseUnitName" id="strBaseUnitName" readonly="true"/>
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <form:label path="strDecimalAllowedStatus" cssClass="control-label col-xs-3">Decimal Allowed:</form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="strDecimalAllowedStatus" id="strDecimalAllowedStatus" readonly="true"/>
                        </div>
                    </div> 
                    
                    <div class="form-group">
                        <form:label path="strConvertedValue" cssClass="control-label col-xs-3">Converted Value:</form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="strConvertedValue" id="strConvertedValue" />
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <form:label path="strEffectiveFrom" cssClass="control-label col-xs-3">Effective From</form:label>
                        <div class="col-xs-6">
                          	<form:input cssClass="form-control" path="strEffectiveFrom" id="strEffectiveFrom" readonly="true"/>    
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <form:label path="strRemarks" class="control-label col-xs-3">Remarks</form:label>
                        <div class="col-xs-6">
                          	<form:textarea cssClass="form-control" path="strRemarks" rows="3"/>
                        </div>
                    </div> 
                    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="strIsValid">Status</form:label></div>
                        <div class="col-xs-6">
                           <form:select cssClass="form-control"  path = "strIsValid">
			                     <form:option value = "NONE" label = "Select Status"/>
			                     <form:options items = "${statusList}" />
                          </form:select>         
                        </div>
                    </div> 
              </form:form>
              	

			 <div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<button class="btn btn-primary" onclick="return UpdateRecord();">Update</button>
					<button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>
				</div>
			</div> 
    
            </div> 
        </div>
    </div>

</body>
</html>
