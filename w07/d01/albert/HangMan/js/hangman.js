$(document).ready(function() {
  show_letters();
  $('#restart').hide();
  var totalGuesses = parseInt($('#set-guess').val());
    $('#guesses .letter').click(function(event) {
    var $event = $(event.target);
    if (_.contains(secretWord, $event.attr('id'))) {
      hangmanGame($event.attr('id'));
    } else {
      totalGuesses --;
      $('#set-guess').val(totalGuesses);
    }
    $event.addClass('clicked');
    $event.removeClass('letter');
    $('#guessed').append($event)
    if ( totalGuesses === 0 ) {
      alert("Game over!\nThe word was: " + secretAnswer);
      $('#restart').show();

    }
  });
  show_answers();
});

// Create letters for the game
var alphabet = "a b c d e f g h i j k l m n o p q r s t u v w x y z".split(" ");

var show_letters = function() {
  _.each(alphabet, display_alphabet);
};

var display_alphabet = function (n) {
  var $letter = $('<div />');
  $letter.addClass('letter');
  $letter.text( n );
  $letter.attr('id', n);
  $('#guesses').append($letter);
};

// Create the secret word for guessing
var generateGuess = "able achieve acoustics action activity aftermath afternoon afterthought apparel appliance beginner believe bomb border boundary breakfast cabbage cable calculator calendar caption carpenter cemetery channel circle creator creature education faucet feather friction fruit fuel galley guide guitar health heart idea kitten laborer language lawyer linen locket lumber magic minister mitten money mountain music partner passenger pickle picture plantation plastic pleasure pocket police pollution railway recess reward route scene scent squirrel stranger suit sweater temper territory texture thread treatment veil vein volcano wealth weather wilderness wren wrist writer".split(" ");

var secretAnswer = _.sample(generateGuess, 1)[0]
var secretWord = secretAnswer.split("");

// Game Mechanics

  // Tracking variables
    var currentGuess = _.map(secretWord, function(letter){ return "-"; });

  var hangmanGame = function(charGuess) {
    // Checks guess with answer
    for (var i = 0; i < secretWord.length; i++) {
      if (secretWord[i] === charGuess) {
        currentGuess[i] = charGuess;
      }
    };
    show_answers();
    // Winning state
    if (currentGuess.join() === secretWord.join()) {
      alert("You win!");
    }

  };


var display_answer = function (n) {
  var $letter = $('<div />');
  $letter.addClass('correct');
  $letter.text( n );
  $letter.attr('id', n);
  $('#answer').append($letter);
};

var show_answers = function() {
  empty_answer();
  _.each(currentGuess, display_answer);
};

var empty_answer = function () {
  $('#answer').empty();
};