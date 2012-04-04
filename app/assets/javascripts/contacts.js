$(document).ready(function(){

  // modals
  $('.assign-group-btn').click(function(evt) {
       $('#assign-members-modal').reveal({animation: 'fade'});
       evt.preventDefault();
  });
  $("#contacts").tablesorter({widthFixed: true, widgets: ['zebra']})
  $("#contacts").tablesorterPager({container: $("#pager")})

  $('#assign-to-grp').click(function(evt) {
       $('#assign-group-modal').reveal({animation: 'fade'});
       evt.preventDefault();
  });


});
