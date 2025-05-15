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
    <title>View Drug Standard</title>

<link href="<c:url value="/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet"> 
<link href="<c:url value="/css/bootstrap-4.0.0/css/bootstrap.min.css" />" rel="stylesheet"> 

<script src="<c:url value="/js/jquery-1.11.3.js" />"></script>	
<script src="<c:url value="/jquery-ui-1.12.1/jquery-ui.js" />"></script>	
	
<style type="text/css">
        .myrow-container{
            margin: 20px;
        }
</style>
</head>

<body class="container">
<spring:url value="/standard/drugStdList"     var="urlListPage" />
    <div class="container myrow-container">
        <div class="panel panel-success">
             <div class="panel-heading">
                <div class="col-xs-11">
                    <h4>Drug Standard>>View</h4> 
                </div>
                <div class="pull-right col-xs-1"> <a class="navbar-brand" href="${urlListPage}">BACK</a></div>
			    <div class="clearfix"></div>
            </div>
            <div class="panel-body">
  			
  			         <div class="row">
                        <label class="col-sm-2">Drug Standard Name</label> 
                        <div class="col-sm-10">${drugStdData.strStandardName}</div>
                     </div>
    
   
                     <div class="row">
                        <label class="col-sm-2">Short Name</label>
                        <div class="col-sm-10">${drugStdData.strShortName}</div>
                     </div>
                    
                      <div class="row">
                        <label class=" col-sm-2">Record Status</label>
                        <div class="col-sm-10">${drugStdData.strRecordStatus}</div>
                     </div>                  
            </div>
        </div>
    </div>

</body>
</html>
