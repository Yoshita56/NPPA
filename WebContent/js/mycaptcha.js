

$(document).ready(function(){
var csrf = $("#csrf").val();

displayCaptcha();
displayCaptcha(1);


$("#captcha_reload").click(function(){
reloadCaptcha();
});

$("#captcha_reload1").click(function(){
$('#jcaptcha1').val("");
reloadCaptcha(1);
});

function displayCaptcha(flag){
	
$.ajax({
type : "POST",
url : "getCaptcha",
data:{"csrf":csrf,"flag":flag},
success : function(response) {
/*alert(flag);	
if(flag && flag==1){
	alert("if");
$("#resetPwdCaptcha").html("<img width='150px' height='50px' src='data:image/png;base64," + response + "' />");
}else{
	alert("else");
$("#captchaText").html("<img width='150px' height='50px' src='data:image/png;base64," + response + "' />");
}*/
$("#captchaText").html("<img width='150px' height='50px' src='data:image/png;base64," + response + "' />");
},
error : function(e) {
$("#errormsg").addClass("alert alert-danger");
$("#errormsg").html("<b>Error</b>: An Error Occured, Please try Later");
setTimeout(function(){
$("#errormsg").removeClass("alert alert-danger");
$("#errormsg").html("");
},2000);
}
});
}



function reloadCaptcha(flag){
$.ajax({
type : "POST",
url : "reloadCaptcha",
data:{"csrf":csrf,"flag":flag},
success : function(response) 
{
/*if(flag && flag==1){
$("#resetPwdCaptcha").html("<img width='150px' height='50px'src='data:image/png;base64," + response + "' />");
}else{
$("#captchaText").html("<img width='150px' height='50px' src='data:image/png;base64," + response + "' />");
}*/
$("#captchaText").html("<img width='150px' height='50px' src='data:image/png;base64," + response + "' />");
},
error : function(e) {
$("#errormsg").addClass("alert alert-danger");
$("#errormsg").html("<b>Error</b>: An Error Occured, Please try Later");
setTimeout(function(){
$("#errormsg").removeClass("alert alert-danger");
$("#errormsg").html("");
},2000);
}
});
}
});