<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />
<head>
<c:url var="home" value="/users" scope="request" />
</head>

<div class="container" style="min-height: 500px">

	<div class="starter-template">
		<h1>Search Form</h1>
		<br>

		<div id="feedback"></div>

		<form class="form-horizontal" id="search-form">
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label">Username</label>
				<div class="col-sm-10">
					<input type=text class="form-control" id="username">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" id="bth-search"
						class="btn btn-primary btn-lg">Search</button>
				</div>
			</div>
		</form>

	</div>

</div>

<div class="container">
	<footer>
		<p>
			&copy; <a href="http://www.mkyong.com">Mkyong.com</a> 2015
		</p>
	</footer>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>


<script>
	jQuery(document).ready(function($) {

		$("#search-form").submit(function(event) {

			// Disble the search button
			enableSearchButton(false);

			// Prevent the form from submitting via the browser.
			event.preventDefault();

			searchViaAjax();

		});

	});

	/* function searchViaAjax() {
		  $.ajax({
		    type: "POST",
		    url: "proffessional",
		    data: JSON.stringify({
		    	username: "Gerry",
		    	email: "Sydney"
		    }),
		    headers: {
		      'Accept': 'application/json',
		      'Content-Type': 'application/json'
		    },
		    complete : function(){
		        alert(this.url)
		    },
		    success: function(data) 
		    {
		      if (data.status == 'OK')
		        alert('Person has been added');
		      else
		        alert('Failed adding person: ' + data.status + ', ' + data.errorMessage);
		   
		    }
		  });
	} */

	function searchViaAjax() {

		var search = {}
		search["username"] = $("#username").val();
		search["email"] = $("#email").val();
        //alert(search);
        $.ajax({
			    type: "GET",
			    url : "${home}/countryList",
			    async: true,
			    dataType: "text",
			    success: function( data ) {

				     alert(data);
			       
			    }
			}); 
			
		/* $.ajax({
			type : "GET",
			contentType : "application/json",
			url : "${home}/countryList",		
			data : JSON.stringify(search),
			dataType : 'json',
			timeout : 100000,
			success : function(data) 
			{			
				console.log("SUCCESS: ", data);
				display(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			}
		});
 */
	} 

	function enableSearchButton(flag) {
		$("#btn-search").prop("disabled", flag);
	}

	function display(data) {
		var json = "<h4>Ajax Response</h4><pre>"
				+ JSON.stringify(data, null, 4) + "</pre>";
		$('#feedback').html(json);
	}
</script>

</body>
</html>