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

<style type="text/css">
#rows1{
  width: 500px;
} 
</style>

<script language="javaScript">

var table  = "";
var selcChkValue = "";


$.extend( $.fn.dataTable.defaults, {
    responsive: true
} );
 
$(document).ready(function(){
	
	/* $("#rows1").change(function(){
		alert("hi");
		$.ajax({
		    type: "GET",
		    url:"dataTable",
		    data: {rows1: $("#rows1").val()},
		    async: true,
		    dataType: "text",
		    success: function( data ) 
		    {
			    alert(data);
		      //document.getElementById("indentItemListDiv").style.display="block";
		      document.getElementById("indentItemListDiv").innerHTML=data;
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

		    }
		}); 
		
    alert("hello");
}); 
 */ 
    	  
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

function msg(){
	
document.listForm.action="SaveorUpdate";
document.listForm.method="POST";
document.listForm.submit();
//document.getElementById("listForm").reset();
//document.getElementById("addBtn").disabled = false;
}

 function SaveRecords(){
	    var end = document.getElementById("rows1").value;
	    
	    if(end==""||end==null||end==0){
	    	alert("Please Enter No. of Rows!!");
			return false;
	    }
	    
	    if(isNaN(end)){
	    	alert("Please Enter Valid No. of Rows!!");
			return false;
	    }
	    
	    var groupName="";
		var effectiveFrom="";
		var groupTypeId="";
		
	   
	    for(var i=1; i<= end; i++){
	    	
           groupName=document.getElementById("groupName"+i).value;
	       effectiveFrom=document.getElementById("effectiveFrom"+i).value;
	       groupTypeId=document.getElementById("groupTypeId"+i).value;
		
		if(groupName==""||groupName==null){
			alert("Please Enter Group Name!!");
			return false;
		}
		
		if(!isNaN(groupName)){
			alert("Please Enter Valid Group Name!!");
			return false;
		}
		
		if(groupTypeId=="NONE"||groupTypeId==""||groupTypeId==null){
			alert("Please Select Group Type!!");
			return false;
		}
		
		if(effectiveFrom==""||effectiveFrom==null){
			alert("Please Select Effective From Date!!");
			return false;
		}
		
	}
		
     var retVal1=confirm("You Are Going To Save Records!!");
     
     if(retVal1){
    	 var retVal=confirm("Are You Sure!!");
    	 
    	 if(retVal){
    		 document.listForm.action="save";
    		 document.listForm.method="POST";
    		 document.listForm.submit();
    	 }
    	 else{
    		 return false;
    	  }
        }
     
       else{
    	 return false;
       }
}

</script>

<script>
$(function() {
	 $(".effectiveFrom1").datepicker({
		  dateFormat: 'dd-M-yy'	  
	   }).datepicker("setDate", new Date());
});
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
<spring:url value="/multiRowDemo/SaveorUpdate" var="addURL" />
<spring:url value="/multiRowDemo/view" var="viewURL" />

<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
  <a class="navbar-brand">MultiRow Example</a>
  <form class="form-inline">   
     <a class="navbar-brand" href="${viewURL}"><p class="text-primary">VIEW Details</p></a>
  </form>
</nav>

  <%int i=0;%>
	<div id="wrapper">   
	<!-- <div class="container"> -->
    <div id="content-wrapper">    
         	  		      
        <!-- DataTables Example -->
         
       <form:form Class="form-horizontal"  name="listForm" id="listForm" modelAttribute="listForm"> 
      
      
		<form:input type="text" path="rows1" class="form-control" name="rows1" id="rows1" placeholder="Enter Rows" onchange="msg()" />
				
		
	        <%-- <input type="hidden" id="len" value= "${multiRowDemo.rows1}"/> --%> 
              
           <%-- <form:form Class="form-horizontal"  name="listForm"  modelAttribute="listForm"> --%>
           <%-- </form:form> --%>
           <div id="indentItemListDiv" style="width:100%;">
		       <table id='myDatatable1' class='display nowrap' width='100%'>			
				<thead>
					<tr>	
					    <th colspan='1' ></th>			
						<th colspan='1'>Group Name</th>
						<th colspan='1'>Effective From</th>
						<th colspan='1'>Group Type</th>
					</tr>
				</thead>
	            <tbody>
	            </table>
				<c:forEach var="i" begin="1" end="${multiRowDemo.rows1}">
				   <table class='display nowrap' width='100%'> 
					<tr>		
					    <td></td>	
					    <td>
					   
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<!-- <label class="col-sm-2 control-label">Group Name:</label> -->
								<div class="col-sm-10">
									<form:input path="groupName" type="text" class="form-control " name="groupName" id="groupName${i}" />
									<form:errors path="groupName" class="control-label" />
								</div>
							</div>
						
						
					    </td>		
						<td>
						
						
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<!-- <label class="col-sm-2 control-label">Effective From:</label> -->
								<div class="col-sm-10">
									<form:input path="effectiveFrom" class="effectiveFrom1" id="effectiveFrom${i}" placeholder="Choose" readonly="true"/>
									<form:errors path="effectiveFrom" class="control-label" />
								</div>
							</div>
						
						</td>
						<%-- <td>
						 <spring:bind path="groupTypeId">
			                  <div class="form-group">
			                        <div class="col-sm-2 control-label"><form:label path="groupTypeId">Group Type:</form:label></div>
			                        <div class="col-sm-10">
			                           <form:select cssClass="form-control" path="groupTypeId" name="groupTypeId" id="groupTypeId${i}">
						                     <form:option value = "NONE" label = "Select Group Type"/>
						                     <form:options items = "${groupTypeList}" />
			                          </form:select>         
			                        </div>
			                    </div>
                       </spring:bind> 
                       </td> --%>
                       <td>
                    
	                   <div class="form-group">
	                        
	                        <div class="col-xs-6">
	                           <form:select cssClass="form-control"  path="groupTypeId" name="groupTypeId" id="groupTypeId${i}">
				                     <form:option value = "NONE" label = "Select Group"/>
				                     <form:options items = "${groupTypeList}" />
	                          </form:select>         
	                        </div>
	                    </div>
                    
                    </td>
                       			
					</tr>
					</table>
				</c:forEach>
				</tbody>
			
         </div>
          </form:form>
         <br>
         <br>
         <!-- <div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
 -->         
          <center><button class="btn btn-primary" id="addBtn" onclick="return SaveRecords();" >ADD</button></center>
          
          <!-- </div>
          </div> -->
          
          
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