<%@page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <title>${title} | CanvasJS Chart using Spring Web MVC</title> --%>
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet"> 
<link href="<c:url value="/assets/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/css/style.css" />" rel="stylesheet">
<!-- scripts -->
 <script src="<c:url value="/assets/script/jquery-1.11.1.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/assets/script/bootstrap.min.js" />"	type="text/javascript"></script> 
<script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>

<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

map = new HashMap<Object,Object>(); map.put("y", 72.48);  map.put("legendText", "Google");  map.put("label", "Google"); list.add(map);
map = new HashMap<Object,Object>(); map.put("y", 10.39);  map.put("legendText", "Bing");  map.put("label", "Bing"); list.add(map);
map = new HashMap<Object,Object>(); map.put("y", 7.78);  map.put("legendText", "Yahoo!");  map.put("label", "Yahoo!"); list.add(map);
map = new HashMap<Object,Object>(); map.put("y", 7.14);  map.put("legendText", "Baidu");  map.put("label", "Baidu"); list.add(map);
map = new HashMap<Object,Object>(); map.put("y", 0.22);  map.put("legendText", "Ask");  map.put("label", "Ask"); list.add(map);
map = new HashMap<Object,Object>(); map.put("y", 0.15);  map.put("legendText", "AOL");  map.put("label", "AOL"); list.add(map);
map = new HashMap<Object,Object>(); map.put("y", 1.84);  map.put("legendText", "Others");  map.put("label", "Others");list.add(map);	
String dataPoints = gsonObj.toJson(list);
%>



<script>
	$(function() {
		// #sidebar-toggle-button
		$('#sidebar-toggle-button').on('click', function() {
			$('#sidebar').toggleClass('sidebar-toggle');
			$('#page-content-wrapper').toggleClass('page-content-toggle');
			fireResize();
		});

		// sidebar collapse behavior
		$('#sidebar').on('show.bs.collapse', function() {
			$('#sidebar').find('.collapse.in').collapse('hide');
		});

		// To make current link active
		(function addActiveToNestedList () {
			var pageURL = $(location).attr('href');
			var URLSplits = pageURL.split('/');
		
			
			var routeURL = '/' + URLSplits[URLSplits.length - 2] + '/' + URLSplits[URLSplits.length - 1];
			var activeNestedList = $(
					'.sub-menu > li > a[href$="' + routeURL + '"]').parent();
			
			if (activeNestedList.length !== 0
					&& !activeNestedList.hasClass('active')) {
				$('.sub-menu > li').removeClass('active');
				activeNestedList.addClass('active');
			}
		})();

		function fireResize() {
			if (document.createEvent) { // W3C
				var ev = document.createEvent('Event');
				ev.initEvent('resize', true, true);
				window.dispatchEvent(ev);
			} else { // IE
				element = document.documentElement;
				var event = document.createEventObject();
				element.fireEvent("onresize", event);
			}
		}

	})
	
	 $(function () {
       var chart = new CanvasJS.Chart("chartContainer", {
           title: {
              // text: "Desktop Search Engine Market Share, Jul-2016"
           },
           animationEnabled: true,
           legend: {
               verticalAlign: "center",
               horizontalAlign: "left",
               fontSize: 20,
               fontFamily: "Helvetica"
           },
           theme: "light2",
           data: [
           {
               type: "pie",
               indexLabelFontFamily: "Garamond",
               indexLabelFontSize: 20,
               indexLabel: "{label} {y}%",
               startAngle: -20,
               showInLegend: true,
               toolTipContent: "{legendText} {y}%",
               dataPoints: <%out.print(dataPoints);%>              
           }
           ]
       });
       chart.render();
   });
</script>
</head>

<body>
	
	<div id='chartContainer'></div>
	
</body>
</html>