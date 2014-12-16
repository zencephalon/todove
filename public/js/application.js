$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#content').on('submit', 'form.toggle_form', function (event) {
    event.preventDefault();

    var $target = $(event.target);
    var $complete_btn = $target.children('input[type=submit]');

    $complete_btn.attr("disabled", true);

    $.ajax({
      //url: '/task/' + task_id + '/toggle_complete'
      url: $target.attr('action'),
      type: 'PUT'
    }).done(function (response) {
      $target.closest('.task').replaceWith(response);
      // $target.closest('.task').find('p.description').first().toggleClass('strikethrough');

      // // Deal with the button
      // var text = $complete_btn.val() == "Complete" ? "Uncomplete" : "Complete";
      // $complete_btn.val(text);
      // $complete_btn.attr("disabled", false);
    })
  })
});
