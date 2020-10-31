$(function() {
  // 選択可能な日付を選択したときにフォームに日付を入力する
  $('.selectable-day').on('click', function() {
    if ($(this).hasClass('today')) {
      $(this).removeClass('today');
    };
    $('.simple-calendar').find('.bg-red-300').removeClass('bg-red-300');
    $(this).addClass('bg-red-300');
    $('#appointment_appointment_date').val($(this).next('#calendar_date').val());
  });

  // 選択した日付から予約可能な時間を取得する
  $('.selectable-day').on('click', function() {
    $.ajax({
      url: `${ gon.root_name }/appointments/appointment_possible_dates`,
      type: 'GET',
      dataType: 'json',
      data: {
        financial_planner_id: $('#appointment_financial_planner_id').val(),
        target_date: $('#appointment_appointment_date').val()
      }
    })
    .done(function(data) {
      console.log(data);
      $('#appointment_appointment_time option').remove();
      data.map(function(date) {
        const option = $('<option>').text(date)
                                    .val(date);
        $('#appointment_appointment_time').append(option);
      });
    });
  });
});
