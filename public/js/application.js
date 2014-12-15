$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  // $('#ajax_button').on('click', function(event) {

  // })
  $('#ajax_button').click(function(event) {
    event.preventDefault();
    console.log("Click received");

    console.log("Before AJAX call.");
    $.ajax({
      type: "POST",
      url: "/ajax_demo",
      data: { name: "John", location: "Boston" }
    }).done(function(response) {
      console.log(response);
    }).fail(function(response) {
      console.log(response);
    })

    setTimeout(function() {console.log("After AJAX call.")}, 4000);
  });

  $('#demo_link').click(function(event) {
    event.preventDefault();
  })
  //$('')
});
