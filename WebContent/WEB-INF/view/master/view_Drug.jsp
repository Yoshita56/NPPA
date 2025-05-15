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
    <title>Add Drug Thearpy</title>
        

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


</script> 

</head>

<body class="container">
<spring:url value="/drugMst/drugList"     var="urlListPage" />

 

    <div class="container myrow-container"> 
           
            <div class="panel panel-success">
			    <div class="panel-heading">
			         <h3 class="panel-title pull-left">
			                    DRUG  >> VIEW
			         </h3>			
			        <div class="pull-right"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			        <div class="clearfix"></div>
			    </div>
			    <c:if test="${not empty msg}">
					<div class="alert alert-${css} alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>${msg}</strong>
					</div>
	           </c:if>
		  <div class="panel-body">			    
			           
                			
				<div class="row">
					<label class="col-sm-2">Drug Name:</label>
					<div class="col-sm-10">${drugMstBean.cpaCode} - ${drugMstBean.drugName}</div>
				</div>
				
				<div class="row">
					<label class="col-sm-2">Strength:</label>
					<div class="col-sm-10">${drugMstBean.drugStrength}</div>
				</div>
				
				<div class="row">
					<label class="col-sm-2">Packing:</label>
					<div class="col-sm-10">${drugMstBean.drugPacking}</div>
				</div>
				
				<div class="row">
					<label class="col-sm-2">Drug Type:</label>
					<div class="col-sm-10">${drugMstBean.drugItemTypeName}</div>
				</div>
				
				<div class="row">
					<label class="col-sm-2">Super Group Name:</label>
					<div class="col-sm-10">${drugMstBean.superGroupName}</div>
				</div>
				
			
				<div class="row">
					<label class="col-sm-2">Rate:</label>
					<div class="col-sm-10">${drugMstBean.rate} - ${drugMstBean.unitName}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Market Rate:</label>
					<div class="col-sm-10">${drugMstBean.rate} - ${drugMstBean.marketRateUnitName}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Super Group Name:</label>
					<div class="col-sm-10">${drugMstBean.superGroupName}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Group Name:</label>
					<div class="col-sm-10">${drugMstBean.groupName}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Sub- Group Name:</label>
					<div class="col-sm-10">${drugMstBean.subGroupName}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Divison Name:</label>
					<div class="col-sm-10">${drugMstBean.divisionName}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Thearpy Name:</label>
					<div class="col-sm-10">${drugMstBean.thearpyName}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Drug Class:</label>
					<div class="col-sm-10">${drugMstBean.drugClassName}</div>
				</div>	
				<div class="row">
					<label class="col-sm-2">Make:</label>
					<div class="col-sm-10">${drugMstBean.itemMakeName}</div>
				</div>		
				<div class="row">
					<label class="col-sm-2">Qc Type:</label>
					<div class="col-sm-10">${drugMstBean.qcTypeName}</div>
				</div>					
				<div class="row">
					<label class="col-sm-2">Specification:</label>
					<div class="col-sm-10">${drugMstBean.drugSpec}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Status:</label>
					<div class="col-sm-10">${drugMstBean.recordStatus}</div>
				</div>
    
          </div> <!-- panel-body  -->			    
		</div>   <!-- panel panel-success -->
	</div>  <!-- container myrow-container -->
            
  
</body> <!-- container -->
</html>
