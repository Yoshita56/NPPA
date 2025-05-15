<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Datatable</title>

<!-- Page level plugin CSS-->
 


<%-- <link href="<c:url value="/assets/css/style.css" />" rel="stylesheet"> --%>
<link rel="stylesheet" type="text/css"   href="css/jqDataTableCSS/jquery.dataTables.min.css" > 
<link rel="stylesheet" type="text/css"   href="css/jqDataTableCSS/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css"   href="css/jqDataTableCSS/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css"   href="css/jqDataTableCSS/select.dataTables.min.css">
<link rel="stylesheet" type="text/css"   href="css/jqDataTableCSS/buttons.dataTables.min.css">

<link rel="stylesheet" type="text/css"   href="materialdesk/css/sb-admin.css">
<link rel="stylesheet" type="text/css"   href="materialdesk/css/all.min.css">
<link rel="stylesheet" type="text/css"   href="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.css"/> 
<link rel="stylesheet" type="text/css"   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"   href="css/bootstrap_4_1_3/css/Chart.css" >
<link rel="stylesheet" type="text/css"   href="css/bootstrap_4_1_3/css/Chart.min.css" >  

<!-- Page level plugin JS FIles -->


<script language="JavaScript" src="js/jqDataTableJS/jquery-3.3.1.js"></script>
<script language="JavaScript" src="js/jqDataTableJS/jquery.dataTables.min.js"></script>
<script language="JavaScript" src="js/jqDataTableJS/dataTables.buttons.min.js"></script>
<script language="JavaScript" src="js/jqDataTableJS/buttons.flash.min.js"></script>
<script language="JavaScript" src="js/jqDataTableJS/dataTables.responsive.min.js"></script>
<script language="JavaScript" src="js/jqDataTableJS/dataTables.select.min.js"></script>
<script language="JavaScript" src="css/bootstrap_4_1_3/js/Chart.min.js"></script>


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
			    /* select: 
			    {
			      style: 'single',
			      selector: '.select-checkbox',
			      items: 'row',
			    }, */
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
			     { orderable: false,"targets": [5] },
			     { orderable: false,"visible": false, "targets": [6] }
			    ],
			    order: [1, 'asc'],
			    dom: 'Bfrtip',
		        buttons: [
		            {
		                text: 'ADD',
		                action: function ( e, dt, node, config ) 
		                {
		                    alert( 'Button activated' );
		                    
		                }
		            }
		        ]
			  });


	 new Chart(document.getElementById("chart-area1").getContext('2d'), {
		    type: 'pie',
		    data: {
		    	//labels:edlYearLabel,
		    	 labels: ['Red', 'Blue', 'Yellow', 'Green'],
		      datasets: [{
		        label: "PO Count - ",
		        backgroundColor: ["#ff8000", "#800080","#FF00FF","#0000FF"],
		        //data: edlYearData	    	
		        data: [12, 19, 3, 5]
		      }]
		    },
		    options: {
		      title: {
		        display: true,
		        text: 'Year Wise EDL Drug PO Count'
		      }
		    }
		});
	    
	    new Chart(document.getElementById("bar-chart1"), {
	    	 type: 'horizontalBar',
		    data: {
		    	labels:storeLabel,
		      datasets: [
		        {
		          label: "PO Count - ",
		          backgroundColor: ["#FF0000", "#800080","#FF00FF","#0000FF","#008080","#008000", "#FFFF00","#800000"],
		          data: storeData
		        }
		      ]
		    },
		    options: {
		      legend: { display: false },
		      title: {
		        display: true,
		        text: 'WhareHouse Wise PO Count'
		      }
		    }
		}); 		
	   
	  			
	    
	    new Chart(document.getElementById("chart-area").getContext('2d'), {
		    type: 'pie',
		    data: {
		    	labels:yearLabel,
		      datasets: [{
		        label: "PO Count - ",
		        backgroundColor: ["#0000ff", "#ff0000","#3cba9f","#e8c3b9","#c45850","#3e95cd", "#8e5ea2","#3e95cd"],
		        data: yearData	    	   	
		      }]
		    },
		    options: {
		      title: {
		        display: true,
		        text: 'Year Wise PO Count'
		      }
		    }
		});
	    
	   			    
	    new Chart(document.getElementById("bar-chart2"), {				   
		    type: 'bar',
		    data: {
		    	labels:prgLabel,
		      datasets: [
		        {
		          label: "PO Count - ",
		          backgroundColor: ["#e300ff", "#800080","#FF00FF","#ccff00","#008080","#008000", "#FFFF00","#800000","#C0C0C0","#000000","#808080","#e300ff","#ccff00"],
		          data: prgData
		        }
		      ]
		    },
		    options: {
		      legend: { display: false },
		      title: {
		        display: true,
		        text: 'Programme Wise PO Count'
		      }
		    }
		});		
});
 
$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
    $($.fn.dataTable.tables(true)).DataTable()
       .columns.adjust();
 });  

</script>

</head>

<body>
	<div id="wrapper">   
	<!-- <div class="container"> -->
    <div id="content-wrapper">
    
    <div class="panel panel-primary">
      <h3 align="center"><u>Drug Master</u></h3>
      
    </div>
     	  
		<!-- <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
		  <div class="btn-group mb-2 btn-group-lg" role="group" aria-label="First group">
		        <button type="button" class="btn btn-primary" onClick="generatePage();"><i class="fa fa-bars"></i> GENEARTE </button>
			    <button type="button" class="btn btn-primary" onClick="modifyPage();"><i class="fa fa-bars"></i> MODIFY</button>
			    <button type="button" class="btn btn-primary" onClick="getPrint();"><i class="fa fa-bars"></i> PRINT</button>
			    <button type="button" class="btn btn-primary" onClick="getPOCancel();"><i class="fa fa-bars"></i> CANCEL</button>
			    <button type="button" class="btn btn-primary" onClick="getReport();"><i class="fa fa-bars"></i> REPORT</button> 
		  </div>
		  <div class="btn-group mb-2 btn-group-lg">
		    <div class="input-group-prepend">
		      <div class="input-group-text" >
		      <strong><div id="selectedSt" align="center">Selected Store - GMSCL - HQ</div></strong>
		      </div>
		    </div>
		    
		  </div>
		  <div class="btn-group mb-2 btn-group-lg">
		    <div class="input-group-prepend">
		      <div class="input-group-text" >
		      <strong><div id="selectedStatus" align="center">Selected PO Status - Approval Pending</div></strong>
		      </div>
		    </div>	    
		  </div>
		</div> -->
			 
	    
				 
		
      
	  <!--  <div class="input-group">
		  <div class="input-group-prepend">
		    <span class="input-group-text"><b>Store and PO Status</b></span>
		  </div>
		    <select class="form-control" id="strStoreId"  name="strStoreId" onChange="refreshData();">
							        <bean:write name="poSingleProgTransBean" property="strStoreName"	filter="false" />
					  </select>
		
		    <select class="form-control" id="strPOStatusId"  name="strPOStatusId" onChange="refreshData();">
							        <option value="1">Approval Pending</option>
							        <option value="2">Approved(In-Process)</option>
							        <option value="3">Close</option>
							        <option value="4">Rejected</option>
							        <option value="5">All PO</option>
			</select>
		</div> -->
      <!--   <div class="alert alert-primary alert-dismissible fade show" style="display:none;">
		    <strong><div id="selectedStatus" align="center">Selected PO Status - Approval Pending</div></strong>		    
		</div> -->
       
      
        <!-- DataTables Example -->
     
           <div id="indentItemListDiv" style="width:100%;">
	       	<table id='myDatatable' class='display nowrap' width='100%'>
			<thead>
				<tr>
				    <th colspan='1' ></th>
				    <!-- <th colspan='1' ></th> -->
					<th colspan='1' >ID</th>
					<th colspan='1' >Name</th>
					<th colspan='1' >Email</th>
					<th colspan='1' >framework</th>
					<th colspan='1' >Action</th>
					<th colspan='1' >PK</th>
				</tr>
			</thead>
			<tbody>
				<!-- Iterating over the list sent from Controller -->
				<c:forEach var="user" items="${users}">
				<tr>
				    <td></td>
					<!-- <td></td> -->
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>
					    <c:forEach var="framework" items="${user.framework}" varStatus="loop">
						    ${framework}
    					   <c:if test="${not loop.last}">,</c:if>
						</c:forEach>
					</td>
					<td align="center">
				        <spring:url value="/add"                var="urlAddUser" />
						<spring:url value="/${user.id}/view"    var="viewUrl" />						
						<spring:url value="/${user.id}/delete"  var="deleteUrl" /> 
						<spring:url value="/${user.id}/update"  var="updateUrl" />						
						
                        <button class="btn btn-primary"    onclick="location.href='${urlAddUser}'">ADD</button>
                        <button class="btn btn-success"    onclick="location.href='${updateUrl}'">UPDATE</button>											
						<button class="btn btn-danger"     onclick="this.disabled=true;post('${deleteUrl}')">DELETE</button>
						<button class="btn btn-secondary"  onclick="location.href='${viewUrl}'">VIEW</button>	
						</td>
						<td>${user.id}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
               </div>
          
      <!-- /.container-fluid -->
      
      <!-- Icon Cards-->
        <div class="row" align="center">
                  
           <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-light o-hidden h-100">            
                     
                        <canvas id="chart-area1" height="190" style="display: block; width: 280px; height:190px;" width="280"></canvas>         
            </div>
         </div>         
                  
          
         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-white o-hidden h-100">                               
                        
                        <canvas id="chart-area1" height="190" style="display: block; width: 280px; height:190px;" width="280"></canvas> 
             
             </div>
         </div>  
         
         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-light o-hidden h-100">            
                       <canvas id="chart-area" height="190" style="display: block; width: 280px; height:190px;" width="280"></canvas>          
            </div>
         </div>   
         
         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-white o-hidden h-100">
                       <canvas id="bar-chart2" height="190" style="display: block; width: 280px; height:190px;" width="280"></canvas>         
                         
            </div>
          </div>
          
       
        </div>

    </div>
    <!-- /.content-wrapper -->
  <!--  </div> -->
   <!-- /.Container -->

  </div>
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