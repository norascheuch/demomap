$('.expand-button').on('click', function(){
  $('.demo-expand-text').toggleClass('-expanded');

  if ($('.demo-expand-text').hasClass('-expanded')) {
    $('.expand-button').html('Collapse Content');
  } else {
    $('.expand-button').html('Read More');
  }
});

export $
