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
    <title>Modifty Drug Thearpy</title>
        

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
$(function() {
	 $("#entryDate").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   });
});


function validate1(){
	//alert("hi");
	var strItemTypeName=document.getElementById("thearpyName").value;
	var strShortName=document.getElementById("thearpyShortName").value;
	//var strEffectiveFrom=document.getElementById("entryDate").value;
	
	if(strItemTypeName==""||strItemTypeName==null){
		alert("Please Enter Thearpy Name!!");
		return false;
	}
	
	if(strShortName==""||strShortName==null){
		alert("Please Enter Short Name!!");
		return false;
	}
	
	/* if(strEffectiveFrom==""||strEffectiveFrom==null){
		alert("Please Select Effective From Date!!");
		return false;
	} */
	
	
	
	return true;
}

function UpdateRecord(){
	 if(validate1()){
		  var retVal=confirm("You Are Going To Update Record!!");
		   if(retVal){
			 var retVal1=confirm("Are You Sure!!");
			  if(retVal1){
			document.drugThearpyModifyForm.action="updateDrugThearpy";
			document.drugThearpyModifyForm.method="post";
			document.drugThearpyModifyForm.submit();
			return true;
		  }
	   }
  }  
}	
function cancelUpdate(){
	document.drugThearpyModifyForm.action="drugThearpyList";
	document.drugThearpyModifyForm.method="get";
	document.drugThearpyModifyForm.submit();
	return true;
}

</script> 
    
</head>
<body class="container">
<spring:url value="/drugThearpy/drugThearpyList"     var="urlListPage" />
    <div class="container myrow-container">        
            <div class="panel panel-success">
			    <div class="panel-heading">
			         <h3 class="panel-title pull-left">
			                    DRUG THEARPY >> MODIFY
			         </h3>
			
			        <div class="pull-right"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			        <div class="clearfix"></div>
			    </div>
		  <div class="panel-body">			    
			           
               <form:form cssClass="form-horizontal" name="drugThearpyModifyForm" id="drugThearpyModifyForm" action="updateDrugThearpy" modelAttribute="drugThearpyBean" onsubmit="return validate1();">                
                 
        	   <form:hidden path="thearpyId"/>  
        	              
                      <div class="form-group">
                        <form:label path="thearpyName" class="control-label col-xs-3">Thearpy Name</form:label> 
                        <div class="col-xs-6">
                             <form:input cssClass="form-control" path="thearpyName" id="thearpyName"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <form:label path="thearpyShortName" cssClass="control-label col-xs-3">Short Name</form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="thearpyShortName" id="thearpyShortName"/>
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <form:label path="entryDate" cssClass="control-label col-xs-3">Effective From</form:label>
                        <div class="col-xs-6">
                          	<form:input type="text" path="entryDate" class="date-picker" readonly="true"/>                              	
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="isValid">Status</form:label></div>
                        <div class="col-xs-6">
                           <form:select cssClass="form-control"  path = "isValid">
			                     <form:option value = "NONE" label = "Select Status"/>
			                     <form:options items = "${statusList}" />
                          </form:select>         
                        </div>
                    </div> 
              </form:form>
              	
              
               <div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<button class="btn btn-primary" onclick="return UpdateRecord();">Save</button>
					<button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>					
				</div>
			</div> 
    
          </div> <!-- panel-body  -->			    
		</div>   <!-- panel panel-success -->
	</div>  <!-- container myrow-container -->
            
  
</body> <!-- container -->
</html>
<%-- <body class="container">
    <div class="container myrow-container">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">
                    Drug Thearpy >> Update
                </h3>
                	
            </div>
            <div class="panel-body">
  	   <form:form cssClass="form-horizontal" name="drugThearpyModifyForm" id="drugThearpyModifyForm" action="updateDrugThearpy" modelAttribute="drugThearpyBean" onsubmit="return validate1();">                
                 
        	   <form:hidden path="thearpyId"/>  
        	              
                      <div class="form-group">
                        <form:label path="thearpyName" class="control-label col-xs-3">Thearpy Name</form:label> 
                        <div class="col-xs-6">
                             <form:input cssClass="form-control" path="thearpyName" id="thearpyName"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <form:label path="thearpyShortName" cssClass="control-label col-xs-3">Short Name</form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="thearpyShortName" id="thearpyShortName"/>
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <form:label path="entryDate" cssClass="control-label col-xs-3">Effective From</form:label>
                        <div class="col-xs-6">
                          	<form:input type="text" path="entryDate" class="date-picker" readonly="true"/>    
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="isValid">Status</form:label></div>
                        <div class="col-xs-6">
                           <form:select cssClass="form-control"  path = "isValid">
			                     <form:option value = "NONE" label = "Select Status"/>
			                     <form:options items = "${statusList}" />
                          </form:select>         
                        </div>
                    </div> 
              </form:form>
              	

			   <div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
				<button class="btn btn-primary" onclick="return UpdateRecord();">Update</button>
				<button class="btn btn-danger" onclick="return cancelUpdate();">Cancel</button>
				</div>
			</div> 
    
            </div>
        </div>
    </div>

</body>
</html>
 --%>