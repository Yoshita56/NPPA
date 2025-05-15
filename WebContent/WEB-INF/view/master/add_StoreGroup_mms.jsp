<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Group Master Add</title>
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
	   }).datepicker("setDate", new Date());
});
</script>
<script type="text/javascript">

function validate1(){
	var strGroupName=document.getElementById("strGroupName").value;
	var strEffectiveFrom=document.getElementById("strEffectiveFrom").value;
	var strRemarks=document.getElementById("strRemarks").value;
	var strGroupTypeId=document.getElementById("strGroupTypeId").value;
	
	if(strGroupName==""||strGroupName==null){
		alert("Please Enter Group Name!!");
		return false;
	}
	
	if(!isNaN(strGroupName)){
		alert("Please Enter Valid Group Name!!");
		return false;
	}
	
	if(strGroupTypeId=="NONE"){
		alert("Please Select Group Type!!");
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
			document.addForm.action="save";
			document.addForm.method="post";
			document.addForm.submit();
			return true;
		  }
	   }
  }  
}	
function cancelAdd(){
	document.addForm.action="cancelAdd";
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
	
    <!--<h1><div style="background-color:DarkBlue;color:white"><strong>Group Master>>Add</strong></div></h1>
    <br/>-->
	<spring:url value="/group/save" var="saveURL" />
    <spring:url value="/group/cancelAdd" var="cancelAddURL" />
	 <div class="container myrow-container">
        <div class="panel panel-success">
             <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Drug Group>>Add</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${cancelAddURL}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
           <div class="panel-body">
	<form:form class="form-horizontal" path="addForm" name="addForm" id="addForm" modelAttribute="userForm" onsubmit="return validate1();">

		<form:hidden path="strHiddenId" />
		
		<spring:bind path="strCategory">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Category:</label>
				<div class="col-sm-10">
					<form:input path="strCategory" type="text" class="form-control" id="strCategory" value="Drug" readonly="true" />
					 <form:errors path="strCategory" class="control-label" />
				</div>
			</div>
		</spring:bind> 

		<spring:bind path="strGroupName">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Group Name:</label>
				<div class="col-sm-10">
					<form:input path="strGroupName" type="text" class="form-control " id="strGroupName" placeholder="Group Name" />
					<form:errors path="strGroupName" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="strGroupTypeId">
                  <div class="form-group">
                        <div class="col-sm-2 control-label"><form:label path="strGroupTypeId">Group Type:</form:label></div>
                        <div class="col-sm-10">
                           <form:select cssClass="form-control"  path = "strGroupTypeId" id="strGroupTypeId">
			                     <form:option value = "NONE" label = "Select Group Type"/>
			                     <form:options items = "${groupTypeList}" />
                          </form:select>         
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
				<!--<button class="btn btn-danger" onclick="return cancelAdd();">Cancel</button>-->
			</div>
		</div> 
       	</div>
		</div> 
       
		<!--<div style="background-color:DarkBlue;color:DarkBlue;">Footer</div>	-->

</div>
<%-- <jsp:include page="../fragments/footer.jsp" /> --%>

</body>
</html>