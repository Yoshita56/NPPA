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
    <title>Add Drug Certificate</title>
        

<link href="<c:url value="/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/bootstrap-4.0.0/css/bootstrap.min.css" />" rel="stylesheet"> 

<script src="<c:url value="/js/jquery-1.11.3.js" />"></script>	
<script src="<c:url value="/jquery-ui-1.12.1/jquery-ui.js" />"></script>	

    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>

<script>
$(function() {
	 $("#strEffectiveFrom").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   });
});
</script>
  
<script type="text/javascript">

/* $(document).ready(function() {
	$(function() {
		$("#strEffectiveFrom").datepicker({
		dateFormat: 'dd-mm-yy'
		});
	});
});
 */
function validate1(){
	var strDrugCertificateName=document.getElementById("strDrugCertificateName").value;
	var StrDrugShortName=document.getElementById("StrDrugShortName").value;
	var strEffectiveFrom=document.getElementById("strEffectiveFrom").value;
	var strRemarks=document.getElementById("strRemarks").value;
	
	if(strDrugCertificateName==""||strDrugCertificateName==null){
		alert("Please Enter Drug Certificate Name!!");
		return false;
	}
	
	if(StrDrugShortName==""||StrDrugShortName==null){
		alert("Please Enter Drug Short Name!!");
		return false;
	}
	
	if(!isNaN(strDrugCertificateName)){
		alert("Please Enter Valid Drug Certificate Name!!");
		return false;
	}
	
	if(strEffectiveFrom==""||strEffectiveFrom==null){
		alert("Please Select Effective From Date!!");
		return false;
	}
	
	if(strRemarks==""||strRemarks==null){
		alert("Please Enter Remarks!!");
		return false;
	}
	
	return true;
}

function SaveRecord(){
  if(validate1()){
	  var retVal=confirm("You Are Going To Save Records!!");
	   if(retVal){
		 var retVal1=confirm("Are You Sure!!");
		  if(retVal1){
			document.addForm.action="saveDrugCertificate";
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

</script> 
    
</head>
<body class="container">
<spring:url value="/list/DrugCertificateList"     var="urlListPage" />
    <div class="container myrow-container">        
            <div class="panel panel-success">
			    <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Drug Certificate>>Add</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
		  <div class="panel-body">			    
			           
             <form:form cssClass="form-horizontal" name="addForm" id="addForm" action="saveDrugCertificate" modelAttribute="userForm" onsubmit="return validate1();">                
        	   <form:hidden path="strHiddenId"/>             
         
         <spring:bind path="strDrugCertificateName">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Drug Certificate Name</label>
				<div class="col-sm-10">
					<form:input path="strDrugCertificateName" type="text" class="form-control " id="strDrugCertificateName" placeholder="Enter Certificate Name" />
					<form:errors path="strDrugCertificateName" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
         <spring:bind path="StrDrugShortName">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Drug Short Name</label>
				<div class="col-sm-10">
					<form:input path="StrDrugShortName" type="text" class="form-control" id="StrDrugShortName" placeholder="Enter Short Name" />
					 <form:errors path="StrDrugShortName" class="control-label" />
				</div>
			</div>
		</spring:bind>      
		
		<spring:bind path="strEffectiveFrom">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Effective From</label>
				<div class="col-sm-10">
					<form:input path="strEffectiveFrom" class="form-control" id="strEffectiveFrom" placeholder="Choose Date" readonly="true"/>
					<form:errors path="strEffectiveFrom" class="control-label" />
				</div>
			</div>
		</spring:bind>

		<spring:bind path="strRemarks">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Remarks</label>
				<div class="col-sm-10">
					<form:textarea path="strRemarks" rows="5" class="form-control" id="strRemarks" placeholder="Enter  Remarks" />
					<form:errors path="strRemarks" class="control-label" />
				</div>
			</div>
		</spring:bind>
                    
                   
                    
                    
              </form:form>
              
               <div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-primary" onclick="return SaveRecord();">Save</button>
					<button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>					
				</div>
			</div> 
    
          </div> <!-- panel-body  -->			    
		</div>   <!-- panel panel-success -->
	</div>  <!-- container myrow-container -->
            
  
</body> <!-- container -->
</html>