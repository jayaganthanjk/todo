/* Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/


$(document).ready(function(){

	console.log("entered");

	$('#submitactivity').click(function(){
		var text = $('#todoactivity').val().trim();
		console.log("From form.."+text);
		$.post("/todos/createactivity",{t:text},function(data){
				console.log(data);
				console.log(data[0].id);
				var res=data.split(':');
				var result=res[1].split(',');
				var id1=result[0];
				result = res[2].split(',');
				var job1=result[0];
				job1 = job1.replace(/\"/g,"");
				console.log("Removed quotes:"+job1.replace(/\"/g, "")); 
				//console.log(data['id']);
				var newlist = $('#list').clone().addClass("listbox").attr('data-id',id1);
				//newlist.css('color','red');
				newlist.html('<div id="close" style="float:left;align:right;color:black;" data-id="'+id1+'">X</div><p id="timeview">Added New</p><br>'+job1);
				newlist.prependTo('#todolist');
				$('#todoactivity').val("");
		}) 
	});

	$('#showlist').click(function(){
		
	});

	$(document).on("click","#close",function(){
		console.log("clicked");
		var id=$(this).parent().attr('data-id');
		var self=$(this).parent();
		//console.log("close id is "+id);
		$.getJSON("/todos/deleteactivity?id="+id,function(data){
			console.log("successfully destroyed..");
			console.log(data)
			self.fadeOut(250);
			console.log("removed");
		});
		//$(this).parent().remove();
	});

	$("#submittodo").click(function(){
		console.log("submitted");
		var text=$('#todotext').val().trim();
		if(text=="")
		{
			alert("Valid todo required..!");
		}
		else
		{
		console.log(text);

		 /*$.ajax({
    		type: "GET",
    		url: '/todos/insertintodb/',
    		dataType: "JSON",
    		success: function(data) {
    		console.log("success");
      		console.log(data.task);
    		}
  		});*/
  		
  		$.post('/todos/verify',{t:text},function(data){
  			console.log("success");
  			console.log(data);
  		},'json');
  		console.log("new");
		}
	});



});