$(function() {

$('button').click(function(){
	var desc = $('input').val();
	var day = $('#date_day').val();
	var hour = $('#date_hour').val();
	var minute = $('#date_minute').val();
	var month = $('#date_month').val();
	var year = $('#date_year').val();
	console.log(year);
	data_hash = {
		"todo":{"description": desc, day: day, hour: hour, minute: minute, month: month, year: year}
	}

	var request = $.ajax({
		url: "/todos",
		type: "POST",
		data: data_hash,
		dataType: "json"
	});

	request.done(function(data){
  		$('ul').append("<li data-todo-id= '" + data.id + "'>" + "<input type ='checkbox'> " + data.description + " <span class='glyphicon glyphicon-trash'>  </span></li>")
  		$('input').val('') = "";
  	});

	request.fail(function(data){
		console.log("FAIL FUNCTION");
		$('h1').append("<p> There was an error saving your todo</p>")
	});

});

$('ul').click(function(e){
  	console.log(e.target);
  	var li = $(e.target).parent();
	var id = li.data("todo-id");



  	if($(e.target).is("span")){
		var request = $.ajax({
			url: "/todos/"+id,
			type: "DELETE",
			dataType: "json"
		});

		request.done(function(data){
			li.remove();
		});
	}

	if($(e.target).is("input")){
		console.log("CLICKED CHECKBOX")
	
	    // _text = $("#myDiv").text();
	    // StrikeThrough(0, li);

		var checkbox_value = $(e.target).is(':checked');
		
		data_hash = {
		"todo":{"completed":checkbox_value}
		}

		var request = $.ajax({
			url: "/todos/"+ id,
			type: "PATCH",
			data: data_hash,
			dataType: "json"
		});

		request.done(function(data){
			if(data.completed === true)
				li.addClass("done")
			else
				li.removeClass("done")
		});
	}

	});
});


