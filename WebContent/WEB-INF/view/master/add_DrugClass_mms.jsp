<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drug Class Master Add</title>

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
	var drugClassName=document.getElementById("drugClassName").value;
	var drugClassShortName=document.getElementById("drugClassShortName").value;
	
	var strDrugClassName = drugClassName.toString();
	var strDrugClassShortName = drugClassShortName.toString();
		
	if(drugClassName==""||drugClassName==null){
		alert("Please Drug Class Name!!");
		return false;
	}
	
	if(!isNaN(strDrugClassName)){
		alert("Please Enter Valid Drug Class Name!!");
		return false;
	}
	
	if(drugClassShortName==""||drugClassShortName==null){
		alert("Please Drug Class Short Name!!");
		return false;
	}
	
	if(!isNaN(strDrugClassShortName)){
		alert("Please Enter Valid Drug Class Short Name!!");
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
	document.addForm.action="cancelDrugClassAdd";
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
	
   <!--<h1><div style="background-color:DarkBlue;color:white"><strong>Drug Class Master>>Add</strong></div></h1>
    <br/>-->
	<spring:url value="/drugClass/save" var="saveURL" />
    <spring:url value="/drugClass/cancelDrugClassAdd" var="cancelAddURL" />
	<div class="container myrow-container">
        <div class="panel panel-success">
             <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Drug Class>>Add</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${cancelAddURL}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
            <div class="panel-body">
	<form:form class="form-horizontal" path="addForm" name="addForm" id="addForm" modelAttribute="addForm" onsubmit="return validate1();">

		<form:hidden path="hiddenId" /> 

		<spring:bind path="drugClassName">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Drug Class Name:</label>
				<div class="col-sm-10">
					<form:input path="drugClassName" type="text" class="form-control " id="drugClassName" placeholder="Drug Class Name" />
					<form:errors path="drugClassName" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="drugClassShortName">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Drug Class Short Name:</label>
				<div class="col-sm-10">
					<form:input path="drugClassShortName" type="text" class="form-control " id="drugClassShortName" placeholder="Drug Class Short Name" />
					<form:errors path="drugClassShortName" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
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