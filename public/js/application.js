$(document).ready(function() {
  // Delete
  $('#content').on('submit', 'form.delete_form', function (event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      type: 'DELETE'
    }).done(function(response) {
      $target.closest('.task').remove();
    });
  });
  // Edit form
  $('#content').on('submit', 'form.edit_form', function(event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      type: 'PUT',
      //data: {task: {description: $target.children('input[name=task\[description\]]').val(), priority: $target.children('select').val() }, tags: $target.children('input[name=tags]').val()}
      data: $target.serialize()
    }).done(function(response) {
      $target.closest('.task').replaceWith(response);
    })
  })
  // Toggle
  $('#content').on('submit', 'form.toggle_form', function (event) {

    event.preventDefault();

    var $target = $(event.target);
    var $complete_btn = $target.children('input[type=submit]');

    $complete_btn.attr("disabled", true);

    $.ajax({
      url: $target.attr('action'),
      type: 'PUT'
    }).done(function (response) {
      $target.closest('.task').replaceWith(response);
    })
  })
  // Edit link
  $('#content').on('click', 'a.edit_link', function(event) {
    event.preventDefault();

    var $target = $(event.target);

    $target.closest('.task').children('.edit_wrapper').toggle();
  });
});
