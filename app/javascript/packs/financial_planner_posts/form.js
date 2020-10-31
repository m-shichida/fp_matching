$(function() {
  $('#financial_planner_post_interview_method').on('change', function() {
    if ($(this).val() === 'face_to_face') {
      $('#financial_planner_post_url').val('');
      $('#financial_planner_post_url').attr('readonly',true);
      $('#financial_planner_post_url').removeClass('focus:bg-white');
      $('#financial_planner_post_place').attr('readonly', false);
      $('#financial_planner_post_place').addClass('focus:bg-white');
    } else {
      $('#financial_planner_post_place').val('');
      $('#financial_planner_post_place').attr('readonly',true);
      $('#financial_planner_post_place').removeClass('focus:bg-white');
      $('#financial_planner_post_url').attr('readonly', false);
      $('#financial_planner_post_url').addClass('focus:bg-white');
    }
  });
});
