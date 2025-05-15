<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Datatable</title>

<!-- Page level plugin CSS-->
 


<%-- <link href="<c:url value="/assets/css/style.css" />" rel="stylesheet"> --%>

<link href="<c:url value="/css/jqDataTableCSS/jquery.dataTables.min.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/jqDataTableCSS/buttons.dataTables.min.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/jqDataTableCSS/responsive.dataTables.min.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/jqDataTableCSS/select.dataTables.min.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/jqDataTableCSS/buttons.dataTables.min.css" />" rel="stylesheet"> 
<link href="<c:url value="/materialdesk/css/sb-admin.css" />" rel="stylesheet"> 
<link href="<c:url value="/materialdesk/css/all.min.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/bootstrap_4_1_3/css/Chart.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/bootstrap_4_1_3/css/Chart.min.css" />" rel="stylesheet"> 

<link rel="stylesheet" type="text/css"   href="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.css"/> 
<link rel="stylesheet" type="text/css"   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- Page level plugin JS FIles -->


<script src="<c:url value="/js/jqDataTableJS/jquery-3.3.1.js" />"></script>
<script src="<c:url value="/js/jqDataTableJS/jquery.dataTables.min.js" />"></script>
<script src="<c:url value="/js/jqDataTableJS/dataTables.buttons.min.js" />"></script>
<script src="<c:url value="/js/jqDataTableJS/buttons.flash.min.js" />"></script>
<script src="<c:url value="/js/jqDataTableJS/dataTables.responsive.min.js" />"></script>
<script src="<c:url value="/js/jqDataTableJS/dataTables.select.min.js" />"></script>
<script src="<c:url value="/css/bootstrap_4_1_3/js/Chart.min.js" />"></script>


<script language="javaScript">

var table  = "";
var selcChkValue = "";


$.extend( $.fn.dataTable.defaults, {
    responsive: true
} );
 
$(document).ready(function() 
{
	 table = $('#myDatatable').DataTable(
			   {	 						   
				   "jQueryUI" : true,  		
				   "pagingType" : "full_numbers",		
				   "lengthMenu": [[5, 25, 50, -1], [5, 25, 50, "All"]],
			   
			    responsive: 
			    {
			      details: 
			      {
			        type: 'column',
			        target: 0
			      }
			    },
			    columnDefs: 
			     [
			      {
			        targets: 0,
			        className: 'control'
			      }		    
			    ],
			    order: [1, 'asc']
			  });
	
});
 
$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
    $($.fn.dataTable.tables(true)).DataTable()
       .columns.adjust();
 });  

</script>
<script type="text/javascript">
function validate1(){
	var groupId=document.getElementById("groupId").value;
	if(groupId=="NONE"){
		alert("Please Select Group Name!!");
		return false;
	}
		return true;
}

function loadDataTable(){
	if(validate1()){
		document.listForm.action="subGroupDT"; //+document.getElementById("groupId").value;
		//document.listForm.action="users";
		document.listForm.method="POST";
		document.listForm.submit();
		return true;
	}
	return false;
} 
 function DeleteRecord(){
	 var retVal=confirm("You Are Going To Delete Records!!");
	   if(retVal){
		 var retVal1=confirm("Are You Sure!!");
		  if(retVal1){
			return true;
		  }
		  else
			  return false;
	   }
	   else{
		   return false;
	   }
 }

</script>
</head>
<body>

<div class="container">

		<c:if test="${not empty msg}">
			<div class="alert alert-${css} alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>${msg}</strong>
			</div>
		</c:if>
	</div>

<spring:url value="/subGroupList"     var="urlHome" />

<spring:url value="/subGroup/subGroupAdd" var="subGroupAddURL" />

<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand">Sub Group Master</a>
  <form class="form-inline">   
     <a class="navbar-brand" href="${subGroupAddURL}">ADD SUB GROUP</a>
  </form>
</nav>

<%-- <jsp:include page="fragments/subGroupheader.jsp" />  --%>
	<div id="wrapper">   
	<!-- <div class="container"> -->
    <div id="content-wrapper">    
         	  		      
        <!-- DataTables Example -->
        
         
           <form:form Class="form-horizontal"  path="listForm" name="listForm" id="listForm" modelAttribute="listForm" onsubmit="return validate1();" >
           <spring:bind path="groupId">
                 <div class="form-group">
                        <div class="col-sm-2 control-label"><form:label path="groupId"><b>Group Name:</b></form:label></div>
                        <div class="col-sm-10">
                           <form:select cssClass="form-control"  path = "groupId" id = "groupId" onchange="return loadDataTable();">
			                     <form:option value = "NONE" label = "Select Group"/>
			                     <form:options items = "${groupCombo}" />
                          </form:select>         
                        </div>
                    </div>
         </spring:bind>
           
           </form:form>
           
           <div id="indentItemListDiv" style="width:100%;">
		       	<table id='myDatatable' class='display nowrap' width='100%'>			
				<thead>
				<tr>
					<th colspan='1'>Sub Group Id</th>
					<th colspan='1'>Sub Group Name</th>
					<th colspan='1'>Effective From</th>
					<th colspan='1'>Action</th>
				</tr>
			</thead>
            <tbody>
			<c:forEach var="subGroup" items="${subGroupBean}">
			<input id="hiddenId" name="hiddenId" type="hidden" value="${subGroup.hiddenId}"/>
				<tr>
					<td>${subGroup.subGroupId}</td>
					<td>${subGroup.subGroupName}</td>
					<td>${subGroup.effectiveFrom}</td>
					
					 <td>
				
						<spring:url value="/"        var="userUrl" />
						<%-- <spring:url value="/${user.id}/delete"  var="deleteUrl" />  --%>
                       <%--  <spring:url value="/add"  var="addURL" /> --%>
						<spring:url value="/subGroup/subGroupModify/${subGroup.hiddenId}"  var="subGroupModifyURL" />
                        <spring:url value="/subGroup/subGroupDelete/${subGroup.hiddenId}"  var="subGroupDeleteURL" />
                        <spring:url value="/subGroup/subGroupView/${subGroup.hiddenId}"  var="subGroupViewURL" />
                        
                        <%-- <button class="btn btn-primary"    onclick="location.href='${addURL}'">ADD</button> --%>
                        <button class="btn btn-success" onclick="location.href='${subGroupModifyURL}'">UPDATE</button>
                        <button class="btn btn-danger"  onclick="if(DeleteRecord()){location.href='${subGroupDeleteURL}';}">DELETE</button>
						<button class="btn btn-info"    onclick="location.href='${subGroupViewURL}'">VIEW</button>
						
						</td> 
				</tr>
			</c:forEach>
			</tbody>

		</table>
       </div>
        <%--  </form:form> --%>
          
      <!-- /.container-fluid -->
      
      <!-- Icon Cards-->
       
         
                  
       
        </div>

    </div>
    <!-- /.content-wrapper -->
  <!--  </div> -->
   <!-- /.Container -->
   

  <!-- /#wrapper -->

  <!-- Core plugin JavaScript-->
  <script src="materialdesk/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <!-- Custom scripts for all pages-->
  <script src="materialdesk/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="materialdesk/js/demo/datatables-demo.js"></script>
  <script src="materialdesk/js/demo/chart-area-demo.js"></script>
  
</body>
</html>