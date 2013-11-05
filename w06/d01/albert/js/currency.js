var exchangeRate = 1.6796;

var dollarsToPounds = function(exchangeRate) {
  var valueAUD = parseFloat(prompt("What is the AUD amount you want to convert into GBP?"));
  var valueGBP = valueAUD / exchangeRate;
  alert(valueAUD + "AUD will buy " + (valueGBP.toFixed(2)) + "GBP, quoted at 3:37pm on the 4th of November");
};

var poundsToDollars = function(exchangeRate) {
  var valueGBP = parseFloat(prompt("What is the GBP amount you want to convert into AUD?"));
  var valueAUD = valueGBP * exchangeRate;
  alert(valueGBP + "GBP will buy " + (valueAUD.toFixed(2)) + "AUD, quoted at 3:37pm on the 4th of November");
};

dollarsToPounds(exchangeRate);
poundsToDollars(exchangeRate);

