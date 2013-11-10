var viewWindow = $('#window').width();

var carousel = {
  $el: $('#carousel'),
  $pictures: $('#carousel img'),
  $firstImage: $('#carousel img').first(),
  toLeft: function() {
    // Check for left most image
    if (parseInt(carousel.$el.css('left')) >= 0) {
      carousel.$el.css('left', '-1836px');
    }
    this.$el.animate({left: '+=612'}, 1000);
  },
  toRight: function() {
    // Check for right most image
    if (parseInt(carousel.$el.css('left')) <= -viewWindow) {
        carousel.$el.css('left', '0');
      }
    this.$el.animate({left: '-=612'}, 1000);
  }
};

// Appends the first picture as the last element of the div to allow for continuous scrolling
carousel.$firstImage.clone().appendTo(carousel.$el);
carousel.$el.css('width', '+=612');

// Setting initial value to allow for continuous scrolling
carousel.$el.css('left', 0);

// Calling the functions based on click events
  $('#next').click(function(event) {
    carousel.toRight();
  });

  $('#previous').click(function(event) {
    carousel.toLeft();
  });

// Listener for left and right key press
  $('body').keydown(function(event) {
    if ( event.which === 37 ) {
      carousel.toLeft();
    }
    if ( event.which === 39 ) {
      carousel.toRight();
    }
  });

// Automatic scrolling

// $('#carousel').hover(function() {
//     intervalID = window.setInterval(function(){
//     carousel.toRight();
//   }, 5000);

// });

