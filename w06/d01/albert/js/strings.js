/* DrEvil */

var DrEvil = function(amount) {
  if (amount === 1000000) {
    console.log(amount + " dollars (pinky)");
  }
  else {
    console.log(amount + " dollars");
  }
};

DrEvil(1);
DrEvil(1000000);

/* MixUp */

var mixUp = function(stringOne, stringTwo) {
  var stringThree = stringTwo.substring(0,2) + stringOne.substring(2) + " " + stringOne.substring(0,2) + stringTwo.substring(2);
  console.log(stringThree);
};

mixUp("hello", "goodbye");
mixUp("unicorn", "rainbow");

/* FixStart */

var fixStart = function(stringFix) {
  var newString = stringFix.split(stringFix.substring(0));


};