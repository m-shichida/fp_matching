$(function() {
  $('.selectable-day').on('click', function() {
    if ($(this).hasClass('today')) {
      $(this).removeClass('today');
    };
    $('.simple-calendar').find('.bg-red-300').removeClass('bg-red-300');
    $(this).addClass('bg-red-300');
    $('#appointment_appointment_date').val($(this).next('#calendar_date').val());
  });
});
