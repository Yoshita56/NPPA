<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Super GroupMaster</title>

<!-- Page level plugin CSS-->
 
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
			      },
			      /* {
			        targets: 1,
			        className: 'select-checkbox'        
			        
			      }, 
			      {
			        targets: [0, 1],
			        orderable: false
			      },
			      */
			     { orderable: false,"targets": [3] }			    
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
function deleteRecord(){
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


<%-- <spring:url value="/"           var="urlHome" /> --%>
<spring:url value="/superGroup/AddForm"    var="urlAddDrug" />

 

<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
  <a class="navbar-brand">SUPER GROUP MASTER </a>
  <form class="form-inline">   
     <a class="navbar-brand" href="${urlAddDrug}"><p class="text-primary">ADD SUPER GROUP</p></a>
  </form>
</nav>

	<div id="wrapper">   
	<!-- <div class="container"> -->
    <div id="content-wrapper">             	  		      
        <!-- DataTables Example -->
     
           <div id="superGroupListDiv" style="width:100%;">
	       	<table id='myDatatable' class='display nowrap' width='100%'>
			<thead>
				<tr>
				    <th colspan='1' ></th>
				    <th colspan='1' >Super Group Name</th>
					<th colspan='1' >Short Name</th>
					<th colspan='1' >Action</th>				
				</tr>
			</thead>
			<tbody>
				<!-- Iterating over the list sent from Controller -->
				<c:forEach var="tempSuperGroup" items="${superGroupList}">
				<tr>
				    <td></td>
					<td>${tempSuperGroup.strSuperGrpName}</td>
					<td>${tempSuperGroup.strSuperGrpShortName}</td>			
					<td align="center">
				
						<spring:url value="/superGroup/${tempSuperGroup.strSuperGrpId}/viewPage"    var="viewUrl" />
											
						<spring:url value="/superGroup/${tempSuperGroup.strSuperGrpId}/deletePage"  var="deleteUrl" />
						 
						<spring:url value="/superGroup/${tempSuperGroup.strSuperGrpId}/UpdateForm"  var="updateUrl" />
						
                        <button class="btn btn-success"    onclick="location.href='${updateUrl}'">UPDATE</button>											
						<button class="btn btn-danger"     onclick="if(deleteRecord()){location.href='${deleteUrl}';}">DELETE</button>
						<button class="btn btn-secondary"  onclick="location.href='${viewUrl}'">VIEW</button>	
						</td>
						
				</tr>
			</c:forEach>
			</tbody>
		</table>
               </div>
            <!-- /.container-fluid -->
      
    		 <!-- Icon Cards-->
        </div>
    	</div>
    <!-- /.content-wrapper -->
  <!--  </div> -->
  <!-- /.Container -->

  <!-- /#wrapper -->
  <!-- Core plugin JavaScript-->
  <script src="<c:url value="/materialdesk/jquery-easing/jquery.easing.min.js" />"></script>
  <!-- Page level plugin JavaScript-->
  <!-- Custom scripts for all pages-->
  <script src="<c:url value="/materialdesk/js/sb-admin.min.js" />"></script>
  <!-- Demo scripts for this page--> 
   <script src="<c:url value="/materialdesk/js/demo/datatables-demo.js" />"></script>
   <script src="<c:url value="/materialdesk/js/demo/chart-area-demo.js" />"></script>
  
</body>
</html>