<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sub Group Master Add</title>

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
	 $("#effectiveFrom").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   }).datepicker("setDate", new Date());
});
</script>
<script type="text/javascript">

function validate1(){
	var subGroupName=document.getElementById("subGroupName").value;
	var effectiveFrom=document.getElementById("effectiveFrom").value;
	var remarks=document.getElementById("remarks").value;
	var groupId=document.getElementById("groupId").value;
	var subGroupTypeId=document.getElementById("subGroupTypeId").value;
	
	if(groupId=="NONE"){
		alert("Please Select Group Name!!");
		return false;
	}
	
	if(subGroupName==""||subGroupName==null){
		alert("Please Enter Sub Group Name!!");
		return false;
	}
	
	if(!isNaN(subGroupName)){
		alert("Please Enter Valid Sub Group Name!!");
		return false;
	}
	
	if(subGroupTypeId=="NONE"){
		alert("Please Select Sub Group Type!!");
		return false;
	}
	
	if(effectiveFrom==""||effectiveFrom==null){
		alert("Please Select Effective From Date!!");
		return false;
	}
	
	if(remarks==""||remarks==null){
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
			document.addForm.action="save";
			document.addForm.method="post";
			document.addForm.submit();
			return true;
		  }
	   }
  }  
}	
function cancelAdd(){
	document.addForm.action="subGroupCancelAdd";
	document.addForm.method="get";
	document.addForm.submit();
	return true;
}

</script> 
</head>

<!--<jsp:include page="../fragments/subGroupheader.jsp" />-->

<body class="container">

<%-- 	<c:choose>
		<c:when test="${userForm['new']}">
			<h1>Add User</h1>
		</c:when>
		<c:otherwise>
			<h1>Update User</h1>
		</c:otherwise>
	</c:choose> --%>
	
    <!--<h1><div style="background-color:DarkBlue;color:white"><strong>Sub Group Master>>Add</strong></div></h1>
    <br/>-->
	<spring:url value="/subGroup/save" var="subGroupSaveURL" />
    <spring:url value="/subGroup/subGroupCancelAdd" var="subGroupCancelAddURL" />
	  <div class="container myrow-container">
        <div class="panel panel-success">
             <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Drug Sub Group>>Add</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${subGroupCancelAddURL}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
            <div class="panel-body">
            
	<form:form class="form-horizontal" path="addForm" name="addForm" id="addForm" modelAttribute="addForm" onsubmit="return validate1();">

		<form:hidden path="hiddenId" />
		
		<spring:bind path="category">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Category:</label>
				<div class="col-sm-10">
					<form:input path="category" type="text" class="form-control" id="category" value="Drug" readonly="true" />
					 <form:errors path="category" class="control-label" />
				</div>
			</div>
		</spring:bind> 

              <spring:bind path="groupId">
                 <div class="form-group">
                        <div class="col-sm-2 control-label"><form:label path="groupId">Group Name:</form:label></div>
                        <div class="col-sm-10">
                           <form:select cssClass="form-control"  path = "groupId">
			                     <form:option value = "NONE" label = "Select Group"/>
			                     <form:options items = "${groupList}" />
                          </form:select>         
                        </div>
                    </div>
                   </spring:bind>
                    
		<spring:bind path="subGroupName">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Sub Group Name:</label>
				<div class="col-sm-10">
					<form:input path="subGroupName" type="text" class="form-control " id="subGroupName" placeholder="Sub Group Name" />
					<form:errors path="subGroupName" class="control-label" />
				</div>
			</div>
		</spring:bind>

          <spring:bind path="subGroupTypeId">
                 <div class="form-group">
                        <div class="col-sm-2 control-label"><form:label path="subGroupTypeId">Sub Group Type:</form:label></div>
                        <div class="col-sm-10">
                           <form:select cssClass="form-control"  path = "subGroupTypeId" id="subGroupTypeId">
			                     <form:option value = "NONE" label = "Select Sub Group Type"/>
			                     <form:options items = "${subGroupTypeList}" />
                          </form:select>         
                        </div>
                    </div>
                   </spring:bind>
                   
		<spring:bind path="effectiveFrom">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Effective From:</label>
				<div class="col-sm-10">
					<form:input path="effectiveFrom" class="form-control" id="effectiveFrom" placeholder="Choose" readonly="true"/>
					<form:errors path="effectiveFrom" class="control-label" />
				</div>
			</div>
		</spring:bind>

		<spring:bind path="remarks">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Remarks:</label>
				<div class="col-sm-10">
					<form:textarea path="remarks" rows="5" class="form-control" id="remarks" placeholder="Remarks" />
					<form:errors path="remarks" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		  <!-- <div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button class="btn btn-primary" onclick="return SaveRecord();">Save</button>
				<button class="btn btn-primary" onclick="document.forms[0].reset()">Clear</button>
				<button class="btn btn-danger" onclick="return cancelAdd();">Cancel</button>
			</div>
		</div>  -->
	</form:form>
	
	<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button class="btn btn-primary" onclick="return SaveRecord();">Save</button>
				<button class="btn btn-success" onclick="document.forms[0].reset()">Clear</button>
				<!-- <button class="btn btn-danger" onclick="return cancelAdd();">Cancel</button> -->
			</div>
		</div> 
     
		</div>
		</div> 
		<!--<div style="background-color:DarkBlue;color:DarkBlue;">Footer</div>	-->
   </div>

</body>
</html>