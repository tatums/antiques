$(document).ready(function(){


	//Sort the Images
	$('#active-slider-images').sortable({
		update: function(event, ui) {
			var SlidersOrder = $(this).sortable('toArray');
			$.post( 'sliders/sort', {SlidersOrder:SlidersOrder});
		}
	});



  // Reveal drop down modal
   $('#new_slider').click(function(evt) {
        $('#myModal').reveal();
			// Prevents scrolling back to top before the reveal shows up.
			evt.preventDefault();
		$('#slider_image').trigger('click');
      });

	  // This is to auto submit the upload form
		//first line detects users selection.
  $('#slider_image').change(function() {
      // this submits the form
       $('#image-upload').submit();
   });




});
