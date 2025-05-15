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


<link href="<c:url value="/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/bootstrap-4.0.0/css/bootstrap.min.css" />" rel="stylesheet"> 
<script src="<c:url value="/jquery-ui-1.12.1/jquery-ui.js" />"></script>	

<style>

</style>

<script language="javaScript">

var table  = "";
var selcChkValue = "";


$.extend( $.fn.dataTable.defaults, {
    responsive: true
} );
 
$(document).ready(function() 
{
	   $("#loadTable").click(function(){
		
			$.ajax({
			    type: "GET",
			    url:"dataTable",
			    data: {fromDate: $("#fromDate").val(),toDate: $("#toDate").val()},
			    async: true,
			    dataType: "text",
			    success: function( data ) 
			    {
				   // alert(data);
			      //document.getElementById("indentItemListDiv").style.display="block";
			      document.getElementById("indentItemListDiv").innerHTML=data;
			      table = $('#myDatatable').DataTable(
						   {	 						   
				//			   "jQueryUI" : true,  		
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

			    }
			}); 
			
	    
	}); 
  	  /* table = $('#myDatatable').DataTable(
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
			  }); */
       }); 
 
$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
    $($.fn.dataTable.tables(true)).DataTable()
       .columns.adjust();
 });  

</script>

<script>
$(function() {
	 $("#fromDate").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   }).datepicker("setDate", new Date());
});

$(function() {
	 $("#toDate").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   }).datepicker("setDate", new Date());
});
</script>

<script type="text/javascript">
function loadDatatable(){
	document.listForm.action="dataTable";
	document.listForm.method="post";
	document.listForm.submit();
	//document.getElementById("indentItemListDiv").style.display="block";
	
}
 /* function DeleteRecord(){
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
 */
 function DeleteRecord(i){
	 var id=document.getElementById("hiddenId"+i).value;
	 //alert(id);
	 var retVal=confirm("You Are Going To Delete Records!!");
	   if(retVal){
		 var retVal1=confirm("Are You Sure!!");
		  if(retVal1){
			  location.href=document.getElementById("deleteURL").value+id;
		  }
	   }
 }

 function downloadFunc(i){
	 var id=document.getElementById("hiddenId"+i).value;
	 location.href=document.getElementById("downloadURL").value+id;
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

<spring:url value="/circularMst/delete/"     var="deleteURL" />
<input type="hidden" id="deleteURL" value="${deleteURL}">

<spring:url value="/circularMst/download/"     var="downloadURL" />
<input type="hidden" id="downloadURL" value="${downloadURL}">

<spring:url value="/circularMst/circularMstAdd"      var="addURL" />
<spring:url value="/circularMst/dataTable"      var="dataTableURL" />

<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
  <a class="navbar-brand">Circular Master</a>
  <form class="form-inline">   
     <a class="navbar-brand" href="${addURL}"><p class="text-primary">ADD Circular Details</p></a>
  </form>
</nav>

    <%int i=1;%>
	<div id="wrapper">   
	<!-- <div class="container"> -->
    <div id="content-wrapper">    
         	  		      
        <!-- DataTables Example -->
         
           <%-- <form:form Class="form-horizontal"  name="listForm"  modelAttribute="listForm" > --%>
             <center>
           <table style="width:60%">
         
           <tr><td>
			<strong>From Date:</strong></td><td><input type="text" path="fromDate" class="form-control" id="fromDate" placeholder="Choose" readonly/>
			</td>	
			<td></td>
			<td>
			<strong>To Date:</strong></td><td><input type="text" path="toDate" class="form-control" id="toDate" placeholder="Choose" readonly/>
			</td>
			</tr>
			<!-- <td><div align="center"><button class="btn btn-success" onclick="loadDatatable()">GO</button></div></td> -->
				
		   	</table>
		   	</center>
		   	<br>
		   	<div align="center"><button class="btn btn-success btn-sm" id="loadTable">GO</button></div>
           <%-- </form:form> --%>
           <br>
           <br>
           <div id="indentItemListDiv" style="width:100%;">
           
		       	<%-- <table id='myDatatable' class='display nowrap' width='100%'>			
				<thead>
					<tr>	
					    <th colspan='1' ></th>		
						<th colspan='1'>S.No.</th>
						<th colspan='1'>Circular Date</th>
						<th colspan='1'>Particulars</th>
						<th colspan='1'>Valid Till</th>
						<th colspan='1'>Public Circular</th>
						<th colspan='1'>Download</th>
						<th colspan='1'>Action</th>
					</tr>
				</thead>
	            <tbody>
				<c:forEach var="circularMst" items="${circularMstBean}">
				<input id="hiddenId" name="hiddenId" type="hidden" value="${circularMst.hiddenId}"/>
					<tr>		
					    <td></td>	
					    <td><%=i++%></td>		
						<td>${circularMst.circularDate}</td>
						<td>${circularMst.subject}</td>		
						<td>${circularMst.validityDate}</td>
						<td>${circularMst.circularStatus}</td>	
						<td>
						<spring:url value="/circularMst/download/${circularMst.hiddenId}"  var="downloadURL" />
						<button class="btn btn-primary" onclick="location.href='${downloadURL}'">DOWNLOAD</button>
						</td>
						
						<td>
						<spring:url value="/circularMst/delete/${circularMst.hiddenId}"  var="deleteURL" />
						<button class="btn btn-danger"  onclick="if(DeleteRecord()){location.href='${deleteURL}';}">DELETE</button>
						</td>
						 
					</tr>
				</c:forEach>
				</tbody>
			</table> --%> 
         </div>
         <%-- </form:form> --%>  
        </div>

    </div>

  <script src="<c:url value="/materialdesk/jquery-easing/jquery.easing.min.js" />"></script>

 <script src="<c:url value="/materialdesk/js/sb-admin.min.js" />"></script>
  
   <script src="<c:url value="/materialdesk/js/demo/datatables-demo.js" />"></script>
   <script src="<c:url value="/materialdesk/js/demo/chart-area-demo.js" />"></script>

  
</body>
</html>