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
    <title>UNIT MASTER</title>
        

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


function validate1(){
	
	var strUnitSize=document.getElementById("strUnitSize").value;
	var strBaseUnit=document.getElementById("strBaseUnit").value;
	var strConvertedValue=document.getElementById("strConvertedValue").value;
	var strEffectiveFrom=document.getElementById("strEffectiveFrom").value;
	var strRemarks=document.getElementById("strRemarks").value;
	
	
	if(strUnitSize==""||strUnitSize==null){
		alert("Please Enter Drug Unit Size Name!!");
		document.getElementById("strUnitSize").focus();
		return false;
	}
	
	if(strBaseUnit=="0"||strBaseUnit==null){
		alert("Please Select Base Unit!!");
		document.getElementById("strBaseUnit").focus();
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
	
	if(strEffectiveFrom==""||strEffectiveFrom==null){
		alert("Please Select Effective From Date!!");
		document.getElementById("strEffectiveFrom").focus();
		return false;
	}
	
	if(strRemarks==""||strRemarks==null){
		alert("Please Enter Remarks!!");
		document.getElementById("strRemarks").focus();
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
			document.addForm.action="saveUnitMaster";
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

function unitDisable()
{
	
	if($('#strIsBaseUnit').is(":checked"))
	{
		$("#BaseUnitDiv").show();
		$('#strIsBaseUnit').val('1');
	}  
    else
    {
    	$("#BaseUnitDiv").hide();
    	$('#strIsBaseUnit').val('0');
    }
        
}

$('#strIsBaseUnit').change(function(){
   alert("anurag");
});

/* $('#strIsBaseUnit').change(function(){
    if($(this).prop('checked')){
        alert("true"); 
    	$(this).val('1');
    }else{
    	alert("false");
         $(this).val('0');
    }
}); */

/* $('#strIsDecimal').change(function(){
    if($(this).prop('checked')){
        alert("true"); 
    	$(this).val('1');
    }else{
    	alert("false");
         $(this).val('0');
    }
}); */

</script> 
    
</head>
<body class="container">
<spring:url value="/UnitMst/UnitMasterList"     var="urlListPage" />
    <div class="container myrow-container">        
            <div class="panel panel-success">
			    <div class="panel-heading">
			         <h3 class="panel-title pull-left">
			                    Unit Master>>Add
			         </h3>
			
			        <div class="pull-right"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			        <div class="clearfix"></div>
			    </div>
		  <div class="panel-body">			    
			           
             <form:form cssClass="form-horizontal" name="addForm" id="addForm" action="saveUnitMaster" modelAttribute="userForm" onsubmit="return validate1();">                
        	   <form:hidden path="strHiddenId"/>             
         
         <spring:bind path="strUnitSize">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Unit Size:</label>
				<div class="col-sm-10">
					<form:input path="strUnitSize" type="text" class="form-control " id="strUnitSize" placeholder="Unit Size Name" />
					<form:errors path="strUnitSize" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		
		
		<spring:bind path="strIsBaseUnit">
			<div class="form-group ${status.error ? 'has-error' : ''}" >
				<label class="col-sm-2 control-label">Whether Base Unit:</label>
				<div class="col-sm-10">
					
					<form:checkbox path="strIsBaseUnit" id="strIsBaseUnit"  value="1" onclick="unitDisable()"/>  
					<form:errors path="strUnitSize" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="strIsDecimal">
			<div class="form-group ${status.error ? 'has-error' : ''} " id="BaseUnitDiv" style="display:none">
				<label class="col-sm-2 control-label">Whether Unit Value could be in Decimal:</label>
				<div class="col-sm-10">
				
					<form:checkbox path="strIsDecimal" id="strIsDecimal"  value="1"/>  
					<form:errors path="strUnitSize" class="control-label" />
				</div>
			</div>
		</spring:bind> 
		
		
        <spring:bind path="strBaseUnit">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Base Unit:</label>
				<div class="col-sm-10">
					<form:select cssClass="form-control"  path = "strBaseUnit">
			                     <form:option value = "0" label = "Select Status"/>
			                     <form:options items = "${BaseUnitList}" />
                          </form:select>
					 <form:errors path="strBaseUnit" class="control-label" />
				</div>
			</div>
		</spring:bind> 
		
		
		
		 <spring:bind path="strConvertedValue">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Converted Value:</label>
				<div class="col-sm-10">
					<form:input path="strConvertedValue" type="text" class="form-control" id="strConvertedValue" placeholder="Converted Value Name" />
					 <form:errors path="strConvertedValue" class="control-label" />
				</div>
			</div>
		</spring:bind>      
		
		<spring:bind path="strEffectiveFrom">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Effective From:</label>
				<div class="col-sm-10">
					<form:input path="strEffectiveFrom" class="form-control" id="strEffectiveFrom" placeholder="Choose" readonly="true"/>
					<form:errors path="strEffectiveFrom" class="control-label" />
				</div>
			</div>
		</spring:bind>

		<spring:bind path="strRemarks">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Remarks:</label>
				<div class="col-sm-10">
					<form:textarea path="strRemarks" rows="5" class="form-control" id="strRemarks" placeholder="Remarks" />
					<form:errors path="strRemarks" class="control-label" />
				</div>
			</div>
		</spring:bind>
                    
                   
                    
                    
              </form:form>
              
               <div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<button class="btn btn-primary" onclick="return SaveRecord();">Save</button>
					<button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>					
				</div>
			</div> 
    
          </div> <!-- panel-body  -->			    
		</div>   <!-- panel panel-success -->
	</div>  <!-- container myrow-container -->
            
  
</body> <!-- container -->
</html>