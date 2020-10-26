$(function() {
  // 画面右上のドロップダウンメニューのトグル
  $('.profile').on('click', function() {
    $('.pulldonw-menu').toggle();
  });

  $('.flash').on('click', function() {
    $(this).hide();
  });
});
