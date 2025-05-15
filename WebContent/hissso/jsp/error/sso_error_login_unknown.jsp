<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<div
		style='color: steelblue; font-size: 40px; margin-top: 10%; text-align: center; width: 100%;'>Some
		error [ Error Id : <%= request.getAttribute("errorId")  %> ]  occurred... <br>Please try again or contact administrator!!</div>
		
		<br>
		<div style="display: none;"> <%= request.getAttribute("errorMsg")  %> </div>
		
</body>
</html>