<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   
<!-- <meta charset="utf-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Cdac">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Company Details</title>
        

<link href="<c:url value="/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet"> 
<%-- <link href="<c:url value="/css/bootstrap-4.0.0/css/bootstrap.min.css" />" rel="stylesheet">  --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="<c:url value="/js/jquery-1.11.3.js" />"></script>
<script src="<c:url value="/jquery-ui-1.12.1/jquery-ui.js" />"></script>
<%-- <script src="<c:url value="/js/mycaptcha.js" />"></script> --%>	


    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
        
        th{
           background: royalblue;
           color: white;
        }
    </style>
        
 <script>
	$(function() {
		 $("#permissionDate").datepicker({
			  dateFormat: 'dd-M-yy'	  
		   });
	});
	
	$(function() {
		 $("#prodImpDate").datepicker({
			  dateFormat: 'dd-M-yy'	  
		   });
	});
</script>
  
    
</head>
<body class="container" style="width:100%">

	 <spring:url value="/priceApprovalTrans/cancelPriceApprovalAdd" var="cancelAddURL" />
	
    <div class="container myrow-container" style="width:100%">        
            <div class="panel panel-success">
			    <div class="panel-heading">
			         <h3 class="panel-title pull-left">
			                    PRICE APPROVAL  >> VIEW
			         </h3>
			
			           <div class="pull-right"> <a class="navbar-brand" href="${cancelAddURL}">BACK</a></div> 
			        <div class="clearfix"></div>
			    </div>
		       <div class="panel-body">	
                          
                  
                  <input type="hidden" name="hiddenId" id="hiddenId" value= "${priceApprovalTrans.hiddenId}" />
                  <div class="panel panel-primary">
                   <div class="panel-heading">Form-1'S INFORMATION</div>
                   <div class="panel-body">
                   
                  <!-- <div style="color:white;background:blue">Form-1'S INFORMATION</div> -->   
                  <table class="col-sm-12">
                    <tr>
                      <td class="col-sm-6"> 
                     
	                      <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name of the Formulation<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.formulationName}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Name of the Formulation:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.formulationName}</div>
                    
                      </td>
                    
                    <td class="col-sm-6">
                    
	                    <%-- <div class="form-group">
	                        <div class="col-sm-4">  <label class="col-sm-12 control-label" >Manufacturer / Importer Name<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">
	                            ${priceApprovalTrans.manufacturerName}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Manufacturer / Importer Name:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.manufacturerName}</div>
                    
                    </td>
                    
                   </tr>
                    
                   <tr>
                    
                     <td class="col-md-6">
                    
	                   <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Manufacturer / Importer Address<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">
	                            ${priceApprovalTrans.manufacturerAddress}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Manufacturer / Importer Address:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.manufacturerAddress}</div>
                    
                     </td>
                    
                     <td class="col-md-6">
                    
                        <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name of the Marketing Company, if any:</label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.mktCompanyName}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Name of the Marketing Company, if any:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.mktCompanyName}</div>
                    
                     </td>
                     
                    </tr>
                    
                    <tr>
                    
                    <td class="col-md-6">
                    
                    <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label">Address of the Marketing Company, if any:</label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.mktCompanyAddress}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Address of the Marketing Company, if any:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.mktCompanyAddress}</div>
    
                    </td>
                   
                     <td class="col-md-6">
    
	                  <%-- <div class="form-group">
                        <div class="col-sm-4"> <label class="col-sm-12 control-label">Composition as per label claimed and approved by Drug Control Authorities:</label> </div>
                        <div class="col-sm-8">                          
                            ${priceApprovalTrans.composition}
                        </div>
                    </div> --%> 
                    
                        <label class="col-sm-4">Composition as per label claimed and approved by Drug Control Authorities:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.composition}</div>
	                      
                    </td>
                    
                  </tr>
                  </table>
                  
                  </div>
                  </div>
                  
                  <!-- <div style="color:white;background:blue">Upload Form-I's Relevant Documents</div> -->
                  
                   <div class="panel panel-primary">
                     <div class="panel-heading">Upload Form-I's Relevant Documents</div>
                        <div class="panel-body">         
                    
                             
                  <div id="indentItemListDiv" style="width:100%;">
                 
                 <table id="myDatatable" border="1" cellspacing="0" width="100%">
                   <thead>
                    <tr>
		                <th width="20%"><div align="center">S.No.</div></th>
			            <th width="50%"><div align="center">Uploaded Document/(s)</div></th>
			            <th width="30%"><div align="center">Download</div></th>
	
		        </tr>
		        </thead>
		        <tbody>
                 
                 <c:forEach var="priceApprovalTrans" items="${priceApprovalBean}" varStatus="counter"> 
                    <%-- <form:hidden path="hiddenId" id="hiddenId" name="hiddenId" value="${file.hiddenId}"/> --%>
                    <tr>
                       <!--  <td width="10%"><div align="center">1.</div></td> -->
                        <td width="20%"><div align="center">${counter.index + 1}</div></td> 
                        
                        <td width="50%">${priceApprovalTrans.document}</td>
                        
                        <td width="30%">
						<spring:url value="/priceApprovalTrans/download/${priceApprovalTrans.hiddenFilesId}"  var="downloadURL" />
						<div align="center">
						<button class="btn btn-primary btn-sm" onclick="location.href='${downloadURL}'">DOWNLOAD</button>
						</div>
						</td>
                        
                    </tr>
                    
                 </c:forEach> 
           
	        </tbody>
	      </table>
                 </div>
                  
                  </div>
                  </div>
                  
                  <!-- <div style="color:white;background:blue">Drug Control Authority</div> -->
                  
                   <div class="panel panel-primary">
                     <div class="panel-heading">Drug Control Authority</div>
                        <div class="panel-body">
                  
                  <table class="col-sm-12">
                  
                  <tr>
                     
                     <td class="col-sm-6">
                    
	                    <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Permission Number<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.permissionNo}
	                        </div>
	                    </div> --%>
	                    <label class="col-sm-4"> Permission Number:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.permissionNo}</div>
                    
                     </td>
                     
                     <td class="col-sm-6">
                                 
	                    <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Permission Date<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.permissionDate}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Permission Date:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.permissionDate}</div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                                 
	                    <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Date of commencement of production / import</label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.prodImpDate}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Date of commencement of production / import:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.prodImpDate}</div>
                    
                    </td>
                    
                    <td class="col-md-6">
                    
	                   <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Type of formulation<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                           ${priceApprovalTrans.formulationType}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Type of formulation:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.formulationType}</div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                    <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Size of Packs<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.packsSize}
	                        </div>
	                    </div> --%>  
	                    
	                    <label class="col-sm-4">Size of Packs:</label>
	                    <div class="col-sm-8"> ${priceApprovalTrans.packsSize}</div>
                    
                    </td>
                  
                    <td class="col-md-6"> 
                     
	                    <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Therapeutic category / use of the formulation<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                           ${priceApprovalTrans.therapeuticCat}
	                        </div>
	                    </div> --%>  
	                    
	                    <label class="col-sm-4">Therapeutic category / use of the formulation:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.therapeuticCat}</div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                    <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >The Retail Price claimed for approval<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.retailPrice}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">The Retail Price claimed for approval:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.retailPrice}</div>
                    
                     </td>
                  
                    <td class="col-md-6"> 
                     
	                    <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Reason for submission of application for price fixation / revision<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                           ${priceApprovalTrans.reason}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Reason for submission of application for price fixation / revision:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.reason}</div>
                    
                    </td>
                    
                  </tr>
                    
                  <tr>
                    
                    <td class="col-md-6">
                    
	                     <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Any other information relavant to product and its process of manufacturing / packaging / distribution.<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.productInfo}
	                        </div>
	                    </div> --%>
                    
                    <label class="col-sm-4">Any other information relavant to product and its process of manufacturing / packaging / distribution:</label>
	                <div class="col-sm-8">${priceApprovalTrans.productInfo}</div>
	                    
                    </td>
                    
                 </tr>
                  
                  </table>
                  
                  </div>
                  </div>
                  
                  <!-- <div style="color:white;background:blue">Authorized Signatory</div> -->
                  
                  <div class="panel panel-primary">
                     <div class="panel-heading">Authorized Signatory:</div>
                        <div class="panel-body">
                  
                  <table class="col-sm-12">
                  
                  <tr>
                  
                   <td class="col-sm-6"> 
                    
	                     <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.signatoryName}
	                        </div>
	                    </div> --%>
	                    
	                <label class="col-sm-4">Name:</label>
	                <div class="col-sm-8">${priceApprovalTrans.signatoryName}</div>
                    
                    </td>
                    
                    <td class="col-sm-6">
                    
	                      <%-- <div class="form-group">
	                        <div class="col-sm-4"> <label class="col-sm-12 control-label" >Name of Company<font color="red">*</font></label> </div>
	                        <div class="col-sm-8">                         
	                            ${priceApprovalTrans.companyName}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Name of Company:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.signatoryName}</div>
                                             
					</td>
					
					</tr>
					
					<tr>
					
					  <td class="col-md-6">	
					                    
	                     <%-- <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Designation<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                           ${priceApprovalTrans.designation}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Designation:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.designation}</div>
                                     
                      </td>
                     
                  <td class="col-md-6">
                  
                  <%-- <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Email Id<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            ${priceApprovalTrans.emailId}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Email Id:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.emailId}</div>
                                     
                      </td>
                      
                    </tr>
					
					<tr>
					
					  <td class="col-md-6">	
					                    
	                     <%-- <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Mobile No.<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            ${priceApprovalTrans.mobileNo}
	                        </div>
	                    </div> --%>
                         
                        <label class="col-sm-4">Mobile No.:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.mobileNo}</div>            
                                     
                      </td>
                     
                      <td class="col-md-6">
                  
                        <%-- <div class="form-group">
	                        <div class="col-sm-4"><label class="col-sm-12 control-label" >Place<font color="red">*</font></label></div>
	                        <div class="col-sm-8">
	                            ${priceApprovalTrans.place}
	                        </div>
	                    </div> --%>
	                    
	                    <label class="col-sm-4">Place:</label>
	                    <div class="col-sm-8">${priceApprovalTrans.place}</div>
                                     
                      </td>
                      
                      </tr>
         	  		    
                      </table>
                      
                      </div>
	                    </div>
	                    
			   
            </div>
        </div>
    </div>

	

</body>
</html>         	  		      
        