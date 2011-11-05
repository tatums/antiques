$(document).ready(function(){
	$("#spinner").bind("ajaxSend", function() {
		$(this).show();
	}).bind("ajaxStop", function() {
		$(this).hide();
	}).bind("ajaxError", function() {
		$(this).hide();
	});


	$('#upload-button').click(function() {
		$('#spinner').show();
	});

	$('#image-upload').submit(function(){
	    $('input[type=file]', this).hide();
	    $('input[type=submit]', this).attr('disabled', 'disabled');
	});

});
