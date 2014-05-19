/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/


$(document).ready(function(){
	console.log("entered");
	$('#one').click(function(){
		alert("clicked");
	});	

	$('#show').click(function(){
		console.log("Users show");
		$.getJSON("/users/populate",function(data){
			console.log("Got back Json");
			console.log(data);
			console.log(data.length);
			for(i=0;i<data.length;i++)
			{
				console.log(data[i]);
			}
		});
	});	

});