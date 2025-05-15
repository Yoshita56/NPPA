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
    <title>Add Super Group</title>

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

function validate1(){
	//alert("hi");
	var strSuperGrpName=document.getElementById("strSuperGrpName").value;
	
	if(strSuperGrpName==""||strSuperGrpName==null){
		alert("Please Enter Super Group Name!!");
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
			document.AddForm.action="saveSuperGroup";
			document.AddForm.method="post";
			document.AddForm.submit();
			return true;
		  }
	   }
  }  
}	


</script> 
    
</head>
<body class="container">
<spring:url value="/superGroup/superGroupList"     var="backToListPage" />
    <div class="container myrow-container">
        <div class="panel panel-success">
             <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Super Group>>Add</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${backToListPage}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
            <div class="panel-body">
            
             <form:form cssClass="form-horizontal" name="AddForm" id="AddForm" action="saveSuperGroup" modelAttribute="superGroupAdd" onsubmit="return validate1();">                
        	   <form:hidden path="strSuperGrpId"/>             
                      <div class="form-group">
                        <form:label path="strSuperGrpName" class="control-label col-xs-2">Super Group Name</form:label> 
                        <div class="col-xs-10">
                             <form:input cssClass="form-control" path="strSuperGrpName" id="strSuperGrpName" placeholder="Enter Super Group Name"/> 
                        </div>
                    </div>
    
                    <div class="form-group">
                        <form:label path="strSuperGrpShortName" cssClass="control-label col-xs-2">Short Name</form:label>
                        <div class="col-xs-10">
                            <form:input cssClass="form-control" path="strSuperGrpShortName" id="strSuperGrpShortName" placeholder="Enter Short Name"/>
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