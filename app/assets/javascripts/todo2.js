$(document).ready(function() {
  $('.datepicker').datepicker({
      format: 'mm-dd-yyyy'
  }).on('changeDate', function() {
    $('.datepicker.dropdown-menu').hide();
  });

  $('h1 span.best_in_place').colorize().on("best_in_place:deactivate", function() {
    $(this).colorize();
  });
});