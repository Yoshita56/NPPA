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
    <title>Update Super Group</title>
        
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

function validate1(){
	//alert("hi");
	var strSuperGrpName=document.getElementById("strSuperGrpName").value;
	
	if(strSuperGrpName==""||strSuperGrpName==null){
		alert("Please Enter Super Group Name!!");
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
			document.UpdateForm.action="updateSuperGroup";
			document.UpdateForm.method="post";
			document.UpdateForm.submit();
			return true;
		  }
	   }
  }  
}	


</script> 
    
</head>
<body class="container">
<spring:url value="/superGroup/superGroupList"     var="urlListPage" />
    <div class="container myrow-container">
        <div class="panel panel-success">
               <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Super Group>>Modify</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
            <div class="panel-body">
  			<form:form cssClass="form-horizontal" name="UpdateForm" id="UpdateForm" action="updateSuperGroup" modelAttribute="superGroupUpdate" onsubmit="return validate1();">                
        	   <form:hidden path="strSuperGrpId"/>             
                      <div class="form-group">
                        <form:label path="strSuperGrpName" class="control-label col-xs-2">Super Group Name</form:label> 
                        <div class="col-xs-10">
                             <form:input cssClass="form-control" path="strSuperGrpName" id="strSuperGrpName"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <form:label path="strSuperGrpShortName" cssClass="control-label col-xs-2">Short Name</form:label>
                        <div class="col-xs-10">
                            <form:input cssClass="form-control" path="strSuperGrpShortName" id="strSuperGrpShortName"/>
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
				</div>
			</div> 
    
            </div>
        </div>
    </div>

</body>
</html>
