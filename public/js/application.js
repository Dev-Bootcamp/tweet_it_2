$(document).ready(function() {

  $('body').on('submit', '#tweet_form', function(e) {
    e.preventDefault();
    $('#tweet_form').append('<img src="processing.gif">');
    $('#submit_tweet').hide();
    
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function(response) {
      $('.container').replaceWith(response);
    });
  });

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
