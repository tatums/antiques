$(document).ready(function() {
       
  /* Reveal drop down modal */
   $('#upload').click(function(evt) {
        $('#myModal').reveal();
			// Prevents scrolling back to top before the reveal shows up.
			evt.preventDefault();
		$('#image_image').trigger('click');	
      });

  
	/* Lightbox - uses default settings */
	$("a.single_image").fancybox();
	/* Using custom settings */

  //Monitors the Keyword field and enables and disables the button unless filled.
  $('#keyword-submit').attr('disabled','disabled');
       $('#keyword_title').keyup(function(){
              if($(this).val() == ""){
                 $('#keyword-submit').attr('disabled','disabled');
              } else
              {
                $('#keyword-submit').removeAttr('disabled');                
              }
       });

  // This is to auto submit the upload form 
	//first line detects users selection.
  $('#image_image').change(function() { 
       // this submits the form 
       $('#image-upload').submit(); 
   });

       
});