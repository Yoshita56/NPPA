var progressBar = {
  Bar : $('#progress-bar'),
 /*
  Reset : function(){
    if (this.Bar){
      this.Bar.find('li').removeClass('active'); 
    }
  },
  Next: function(){
    $('#progress-bar li:not(.active):first').addClass('active');
  },
  Back: function(){
    $('#progress-bar li.active:last').removeClass('active');
  }
  */
};
$(document).ready(function() 
{
	alert("Hi");
	  //$('#progress-bar li:not(.active):first').addClass('active');
	x=document.getElementById("stepone").value;
	y=document.getElementById("steptwo").value;
	z=document.getElementById("stepthree").value;
	w=document.getElementById("stepfour").value;
	
	if(x==1){
		document.getElementById("one").innerHTML="Step One Completed";
		$('#progress-bar li:not(.active):first').addClass('active');
	}
	else{
		document.getElementById("one").innerHTML="Pending";
	}
	if(y==2){
		document.getElementById("two").innerHTML="Step Two Completed";
		$('#progress-bar li:not(.active):nth-child(2)').addClass('active');
	}
	else{
		document.getElementById("two").innerHTML="Pending";
	}
	if(z==3){
		document.getElementById("three").innerHTML="Step Three Completed";
		$('#progress-bar li:not(.active):nth-child(3)').addClass('active');
	}
	else{
		document.getElementById("three").innerHTML="Pending";
	}
    if(w==4){
		document.getElementById("four").innerHTML="Step Four Completed";
		$('#progress-bar li:not(.active):nth-child(4)').addClass('active');
    }
    else{
		document.getElementById("four").innerHTML="Pending";
	}
});
  
//progressBar.Reset();
/*
////
$("#Next").on('click', function(){
  progressBar.Next();
});
$("#Back").on('click', function(){
  progressBar.Back();
});
$("#Reset").on('click', function(){
  progressBar.Reset();
});
*/