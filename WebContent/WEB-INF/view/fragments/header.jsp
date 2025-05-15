<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<title>Spring MVC Form Handling Example</title>

<spring:url value="/resources/core/css/hello.css"           var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" 	var="bootstrapCss" />

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}"      rel="stylesheet" />



<script     type="text/javascript" src="/js/jquery.1.10.2.min.js"></script>


</head>

<spring:url value="/"           var="urlHome" />
<spring:url value="/add"  var="urlAddUser" />
<spring:url value="/ajax" var="ajaxPage" />
<spring:url value="/pie"  var="piePage" />

<nav class="navbar navbar-inverse ">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="${urlHome}">List of Users</a>
		</div>
		<div id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="${urlAddUser}">Add User</a></li>
			</ul>
		</div>
		<div id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="${ajaxPage}">Ajax Call</a></li>
			</ul>
		</div>
		<div id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="${piePage}">Pie Chart</a></li>
			</ul>
		</div>
	</div>
</nav>