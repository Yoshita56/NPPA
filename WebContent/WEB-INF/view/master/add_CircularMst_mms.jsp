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
    
    <script>
$(function() {
	 $("#circularDate").datepicker({
		  dateFormat: 'dd-M-yy',
		  beforeShow: function(i) { 
              if ($(i).attr('readonly')) { return false; } 
           }
	   }).datepicker("setDate", new Date());
});
</script>


<script type="text/javascript">

function checkVal(){
	
	if(document.getElementById("isPublicCircular").checked==true){
    	document.getElementById("isPublicCircular").value="1";
    }
	else{
		document.getElementById("isPublicCircular").value="0";
	}
	
}

function validate1(){

	var subject=document.getElementById("subject").value;
	var expiryDays=document.getElementById("expiryDays").value;
	
	if(subject==""||subject==null){
		alert("Please Enter Subject!!");
		return false;
	}
	
	if(!isNaN(subject)){
		alert("Please Enter Valid Subject!!");
		return false;
	}
	
	if(expiryDays==""||expiryDays==null){
		alert("Please Enter Validity!!");
		return false;
	}
	
	if(isNaN(expiryDays)){
		alert("Please Enter Valid Validity!!");
		return false;
	}
	
	if(document.getElementById("fileName").files.length == 0){
		alert("Please Select a File to Upload!!");
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
			document.addForm.action="save.htm";
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

	<spring:url value="/circularMst/save" var="saveURL" />
    <spring:url value="/circularMst/cancelCircularAdd" var="cancelAddURL" />
	<div class="container myrow-container">
        <div class="panel panel-success">
             <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Circular Master>>Add</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${cancelAddURL}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
            <div class="panel-body">
	<form:form class="form-horizontal" path="addForm" name="addForm" id="addForm" enctype="multipart/form-data" modelAttribute="addForm" onsubmit="return validate1();">

		<form:hidden path="hiddenId" /> 
		
		<form:hidden path="fileType" id="fileType" name="fileType" /> 

		<spring:bind path="circularDate">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Circular Date:</label>
				<div class="col-sm-10">
					<form:input path="circularDate" class="form-control" name="circularDate" id="circularDate" placeholder="Choose" readonly="true"/>
					<form:errors path="circularDate" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="subject">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Subject:</label>
				<div class="col-sm-10">
					<form:textarea path="subject" rows="5" class="form-control" name="subject" id="subject" placeholder="Subject" />
					<form:errors path="subject" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="expiryDays">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Validity (in Days):</label>
				<div class="col-sm-10">
					<form:input path="expiryDays" type="text" class="form-control " name="expiryDays" id="expiryDays" placeholder="Validity (in Days)" />
					<form:errors path="expiryDays" class="control-label" />
				</div>
			</div>
		</spring:bind>
		
		<%-- <spring:bind path="filesName"> --%>
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Upload Document:</label>
				<div class="col-sm-10">
				 <%-- <form:input path="filesName" type="file" class="form-control " id="filesName" />  --%>
		         <input type="file" name="file" class="form-control " id="fileName" /> 
					<form:errors path="fileName" class="control-label" />
				</div>
			</div>
		<%-- </spring:bind> --%>
		
		<spring:bind path="isPublicCircular">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Is Public Circular:</label>
				<div class="col-sm-1">
					<form:checkbox path="isPublicCircular" class="form-control " name="isPublicCircular" id="isPublicCircular" value="1"  onchange="checkVal()" checked="checked" /> 
					<form:errors path="isPublicCircular" class="control-label" />
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