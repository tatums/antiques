
$(document).ready(function(){

  // Hide or show the add line item.
  $('#add-new-line-btn').click(function() {

    if ($("#add-new-line-item").is(":hidden"))
      { $("#add-new-line-item").slideDown("slow");
        $("#add-new-line-btn").text('Hide Line Item Form');  }
    else
      { $("#add-new-line-item").slideUp('slow');
        $("#add-new-line-btn").text('Add New Line Item');    }

    return false;
  });

  // show modal
  $('#add-inventory-btn').click(function(evt) {
        $('#add-inventory-modal').reveal();
        evt.preventDefault();
   });

  $('#email-invoice-btn').click(function(evt) {
       $('#email-invoice-modal').reveal();
       evt.preventDefault();
  });





   $('.tax-row').click(function(evt) {
      $('#add-tax-modal').reveal();
      evt.preventDefault();
     });

     $('.tax-save-btn').click(function() {
          $('.close-reveal-modal').trigger('click');
      });


    $('.price').click(function(){
        if($(".price").text().trim() == "Price" )
          {
            $('#invoice_price_header').val('Net Price')
            $('.price').html("Net Price")
          }
        else
          {
            $('#invoice_price_header').val('Price')
            $('.price').html("Price")
          }

        $('.customer').submit();
    });




   // if a button is clicked close the modal.
   $('.add-inv-product').click(function() {
        $('.close-reveal-modal').trigger('click');
    });

    // if a button is clicked close the modal.
    $('.email-send-btn').click(function() {
         $('.close-reveal-modal').trigger('click');
     });


  // Datepicker for new invoices
  $( ".datepicker" ).datepicker( {dateFormat: "yy-mm-dd"});

  // index table sorter and paginate
  $("#invoice-table")
      .tablesorter({widthFixed: true, widgets: ['zebra']})
      .tablesorterPager({container: $("#pager")});

    // hide the new-line-item form
    $('.submit-line-item').click(function() {
      $("#add-new-line-item").slideUp('slow');
      $("#add-new-line-btn").text('Add New Line Item');
    });

});