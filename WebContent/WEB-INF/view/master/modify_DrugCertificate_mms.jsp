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
    <title>Modify Drug Certificate</title>
        
																									

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
	//alert("hi");
	var strDrugCertificateName=document.getElementById("strDrugCertificateName").value;
	var StrDrugShortName=document.getElementById("StrDrugShortName").value;
	var strEffectiveFrom=document.getElementById("strEffectiveFrom").value;
	
	if(strDrugCertificateName==""||strDrugCertificateName==null){
		alert("Please Enter Drug Certificate Name!!");
		return false;
	}
	
	if(StrDrugShortName==""||StrDrugShortName==null){
		alert("Please Enter Drug Short Name!!");
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
			document.drugCertificateUpdateForm.action="updateDrugCertificate";
			document.drugCertificateUpdateForm.method="post";
			document.drugCertificateUpdateForm.submit();
			return true;
		  }
	   }
  }  
}


</script> 

    
</head>
<body class="container">
<spring:url value="/list/DrugCertificateList"     var="urlListPage" />
    <div class="container myrow-container">        
            <div class="panel panel-success">
			   <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Drug Certificate>>Modify</h4> 
                </div>
   
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
			    
							 
		  <div class="panel-body">	
  			<form:form cssClass="form-horizontal" name="drugCertificateUpdateForm" id="drugCertificateUpdateForm" action="updateDrugCertificate" modelAttribute="modifyForm" onsubmit="return validate1();">                
        	   
        	   <form:hidden path="strDrugCertificateId"/>             
                      <div class="form-group">
                        <form:label path="strDrugCertificateName" class="control-label col-xs-2">Drug Type Name</form:label> 
                        <div class="col-xs-10">
                             <form:input cssClass="form-control" path="strDrugCertificateName" id="strDrugCertificateName"/>
                        </div>
                    </div>
    
                     <div class="form-group">
                        <form:label path="StrDrugShortName" cssClass="control-label col-xs-2">Short Name</form:label>
                        <div class="col-xs-10">
                            <form:input cssClass="form-control" path="StrDrugShortName" id="StrDrugShortName"/>
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
                        <div class="control-label col-xs-2"><form:label path="strIsValid">Status</form:label></div>
                        <div class="col-xs-10">
                           <form:select cssClass="form-control"  path = "strIsValid">
			                     <form:option value = "NONE" label = "Select Status"/>
			                     <form:options items = "${statusList}" />
                          </form:select>         
                        </div>
                    </div> 
              </form:form>
              	

			 <div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-primary" onclick="return UpdateRecord();">Update</button>
				</div>
			</div> 
    
            </div> 
        </div>
  
    </div>

</body>
</html>
