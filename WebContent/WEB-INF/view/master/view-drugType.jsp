<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <meta charset="utf-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Cdac">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Drug Type</title>
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>
    
<script type="text/javascript">

function closeView(){
	document.drugTypeViewForm.action="drugTypeList";
	document.drugTypeViewForm.method="get";
	document.drugTypeViewForm.submit();
	return true;
}

</script> 
    
</head>
<body class=".container-fluid">
    <div class="container myrow-container">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">
                    Drug type>>View
                </h3>
                	
            </div>
            <div class="panel-body">
  			<form:form cssClass="form-horizontal" name="drugTypeViewForm" id="drugTypeViewForm" action="view" modelAttribute="drugTypeData">                       
                     <div class="row">
                     
                        <label class="control-label col-sm-3">Drug Type Name</label> 
                        <div class="col-sm-9">${drugTypeData.strItemTypeName}</div>
                    </div>
    
   
                    <div class="row">
                        <label class="control-label col-sm-3">Short Name</label>
                        <div class="col-sm-9">${drugTypeData.strShortName}</div>
                    </div>
                    
                     <div class="row">
                        <label class="control-label col-sm-3">Effective From</label>
                        <div class="col-sm-9">${drugTypeData.strEffectiveFrom}</div>
                    </div>
                    
                    <div class="row">
                        <label class="control-label col-sm-3">Remarks</label>
                        <div class="col-sm-9">${drugTypeData.strRemarks}</div>
                    </div>
              </form:form>
			<br/>              	

			   <div class="form-group">
				<div class="col-sm-offset-3 col-sm-9" >
					<button class="btn btn-secondary" onclick="return closeView();">Close</button>
				</div>
			</div> 
    
            </div>
        </div>
    </div>

</body>
</html>
