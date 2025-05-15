<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>Update Drug Type</title>
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>
    
<script type="text/javascript">
$(function() {
	 $("#strEffectiveFrom").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   });
});

function validate1(){
	//alert("hi");
	var strItemTypeName=document.getElementById("strItemTypeName").value;
	var strShortName=document.getElementById("strShortName").value;
	var strEffectiveFrom=document.getElementById("strEffectiveFrom").value;
	
	if(strItemTypeName==""||strItemTypeName==null){
		alert("Please Enter Drug Type Name!!");
		return false;
	}
	
	if(strShortName==""||strShortName==null){
		alert("Please Enter Short Name!!");
		return false;
	}
	
	if(strEffectiveFrom==""||strEffectiveFrom==null){
		alert("Please Select Effective From Date!!");
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
			document.drugTypeUpdateForm.action="updateDrugType";
			document.drugTypeUpdateForm.method="post";
			document.drugTypeUpdateForm.submit();
			return true;
		  }
	   }
  }  
}	
/* function cancelUpdate(){
	document.drugTypeUpdateForm.action="drugTypeList";
	document.drugTypeUpdateForm.method="get";
	document.drugTypeUpdateForm.submit();
	return true;
} */

</script> 
    
</head>
<body class="container">
<spring:url value="/drugType/drugTypeList"  var="backToList"/>
    <div class="container myrow-container">
        <div class="panel panel-success">
              <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Drug Type>>Modify</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${backToList}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
            <div class="panel-body">
  			<form:form cssClass="form-horizontal" name="drugTypeUpdateForm" id="drugTypeUpdateForm" action="updateDrugType" modelAttribute="drugTypeAdd" onsubmit="return validate1();">                
        	   <form:hidden path="strItemTypeId"/>             
                      <div class="form-group">
                        <form:label path="strItemTypeName" class="control-label col-xs-2">Drug Type Name</form:label> 
                        <div class="col-xs-10">
                             <form:input cssClass="form-control" path="strItemTypeName" id="strItemTypeName"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <form:label path="strShortName" cssClass="control-label col-xs-2">Short Name</form:label>
                        <div class="col-xs-10">
                            <form:input cssClass="form-control" path="strShortName" id="strShortName"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <form:label path="strEffectiveFrom" cssClass="control-label col-xs-2">Effective From</form:label>
                        <div class="col-xs-10">
                          	<form:input cssClass="form-control" path="strEffectiveFrom" id="strEffectiveFrom" readonly="true"/>    
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <form:label path="strRemarks" class="control-label col-xs-2">Remarks</form:label>
                        <div class="col-xs-10">
                          	<form:textarea cssClass="form-control" path="strRemarks" rows="3"/>
                        </div>
                    </div> 
                    
                     <div class="form-group">
                        <div class="control-label col-xs-2"><form:label path="strRecordStatus">Status</form:label></div>
                        <div class="col-xs-10">
                           <form:select cssClass="form-control"  path = "strRecordStatus">
			                     <%-- <form:option value = "NONE" label = "Select Unit"/> --%>
			                     <form:options items = "${statusList}" />
                          </form:select>         
                        </div>
                    </div>
              </form:form>
              	

			   <div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-primary" onclick="return UpdateRecord();">Update</button>
					<!-- <button class="btn btn-danger" onclick="return cancelUpdate();">Cancel</button> -->
				</div>
			</div> 
    
            </div>
        </div>
    </div>

</body>
</html>
