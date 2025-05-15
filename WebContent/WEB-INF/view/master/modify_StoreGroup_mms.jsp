<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Group Master Modify</title>

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
 <script>
$(function() {
  $("#strEffectiveFrom").datepicker({
	  dateFormat: 'dd-M-yy'	  
   });
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

function UpdateRecord(){
  if(validate1()){
	  var retVal=confirm("You Are Going To Modify Records!!");
	   if(retVal){
		 var retVal1=confirm("Are You Sure!!");
		  if(retVal1){
			document.modifyForm.action=document.getElementById("groupUpdate").value;
			document.modifyForm.method="post";
			document.modifyForm.submit();
			return true;
		  }
	   }
  }  
}	
function cancelModify(){
	document.modifyForm.action="cancelModify";
	document.modifyForm.method="get";
	document.modifyForm.submit();
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
	
    <!--<h1><div style="background-color:DarkBlue;color:white"><strong>Group Master>>Modify</strong></div></h1>
    <br/>-->
	<spring:url value="/group/groupUpdate" var="updateURL" />
	<spring:url value="/group/cancelModify" var="cancelModifyURL" />
    <input type="hidden" id="groupUpdate" value="${updateURL}">
	 <div class="container myrow-container">        
            <div class="panel panel-success">
			    <div class="panel-heading">
			        <div class="col-xs-11">
                    <h4>Drug Group>>Modify</h4> 
                </div>
			
			        <div class="pull-right"> <a class="navbar-brand" href="${cancelModifyURL}">BACK</a></div>
			        <div class="clearfix"></div>
			    </div>
		  <div class="panel-body">	
	<form:form class="form-horizontal" path="modifyForm" name="modifyForm" id="modifyForm" modelAttribute="modifyForm" onsubmit="return validate1();">

		<form:hidden path="strHiddenId" id="strHiddenId" value= "${user.strHiddenId}"/>
		
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
					<form:input path="strGroupName" type="text" class="form-control " id="strGroupName" value="${user.strGroupName}" placeholder="Group Name" />
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
			                     <form:options value= "${user.strGroupTypeId}" items = "${groupTypeList}" />
                          </form:select>         
                        </div>
                    </div>
               </spring:bind>
               
		<spring:bind path="strEffectiveFrom">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Effective From:</label>
				<div class="col-sm-10">
					<form:input path="strEffectiveFrom" class="form-control" id="strEffectiveFrom" value="${user.strEffectiveFrom}" placeholder="Choose" readonly="true"/>
					<form:errors path="strEffectiveFrom" class="control-label" />
				</div>
			</div>
		</spring:bind>

		<spring:bind path="strRemarks">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Remarks:</label>
				<div class="col-sm-10">
					<form:textarea path="strRemarks" rows="5" class="form-control" id="strRemarks" value="${user.strRemarks}" placeholder="Remarks" />
					<form:errors path="strRemarks" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="strIsValid">
			<div class="form-group">
			 <label class="col-sm-2 control-label">Record Status:</label>
			 <div class="col-sm-10">
	           <table>
                 <tr>
                 <td><form:radiobutton path="strIsValid" class="form-control" id="strIsValid" value="1"/></td><td>Active</td>
                 </tr>
                 <tr>
                  <td><form:radiobutton path="strIsValid" class="form-control" id="strIsValid" value="0"/></td><td>Inactive</td>   
				 </tr>
		       </table>
					 <%-- <form:radiobutton path="strIsValid" class="form-control" id="strIsValid" label = "Active" value="1"/>     
					
                 <form:errors path="strIsValid" class="control-label" /> --%>
				</div>
			</div>
		</spring:bind> 

	</form:form>
	
	<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button class="btn btn-primary" onclick="return UpdateRecord();">Save</button>
				<button class="btn btn-danger" onclick="location.href='${cancelModifyURL}'">Cancel</button> 
			</div>
		</div>
	
            </div> 
  
        </div>
    </div>
   <!-- <div style="background-color:DarkBlue;color:DarkBlue;">Footer</div>-->
<!--<%-- <jsp:include page="../fragments/footer.jsp" /> --%>-->

</body>
</html>