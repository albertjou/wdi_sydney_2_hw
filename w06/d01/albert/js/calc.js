/* Original version

var operator = prompt("What do you want to do: (Add)ition, (Sub)traction, (Mul)tiplication, (Div)ision, (Mod)ulus or (Squ)are-root");
var valueOne = parseFloat(prompt("What is the first number?"));
var valueTwo = parseFloat(prompt("What is the second number?"));

switch (operator.toLowerCase()) {
  case "add":
    alert(valueOne + "+" + valueTwo + "=" + (valueOne+valueTwo));
    break;
  case "sub":
  alert(valueOne + "-" + valueTwo + "=" + (valueOne-valueTwo));
  break;
  case "mul":
  alert(valueOne + "x" + valueTwo + "=" + (valueOne*valueTwo));
  break;
  case "div":
  alert(valueOne + "/" + valueTwo + "=" + (valueOne/valueTwo));
  break;
  case "mod":
  alert(valueOne + "%" + valueTwo + "=" + (valueOne%valueTwo));
  break;
  case "squ":
  alert(valueOne + "sqrt = " + Math.sqrt(valueOne) + ". " + valueTwo + " sqrt = " + Math.sqrt(valueTwo));
  break;
  default:
  alert("Sorry I don't recognise that request");
  break;
};

*/

/* Updated version */

/* Function to handle calculation */


var calculation = function() {
  var userOperator = prompt("What do you want to do: (Add)ition, (Sub)traction, (Mul)tiplication, (Div)ision");
  var flowControl = true;
  var total = parseFloat(prompt("What's the first number?"));

  switch (userOperator.toLowerCase()) {
    case "add":
      var userValue = prompt("What number do you want to use. Type 'Q' to stop including numbers")
      while (flowControl){
        if (userValue === 'Q') {
          flowControl = false;
        }
        else {
          total += parseFloat(userValue);
          userValue = prompt("What number do you want to use. Type 'Q' to stop including numbers")
        }
      }
      alert("The total is: " + total);
      break;

    case "sub":
    var userValue = prompt("What number do you want to use. Type 'Q' to stop including numbers")
    while (flowControl){
      if (userValue === 'Q') {
        flowControl = false;
      }
      else {
        total -= parseFloat(userValue);
        userValue = prompt("What number do you want to use. Type 'Q' to stop including numbers")
      }
    }
    alert("The total is: " + total);
    break;

    case "mul":
    var userValue = prompt("What number do you want to use. Type 'Q' to stop including numbers")
    while (flowControl){
      if (userValue === 'Q') {
        flowControl = false;
      }
      else {
        total = total * parseFloat(userValue);
        userValue = prompt("What number do you want to use. Type 'Q' to stop including numbers")
      }
    }
    alert("The total is: " + total);
    break;

    case "div":
    var userValue = prompt("What number do you want to use. Type 'Q' to stop including numbers")
    while (flowControl){
      if (userValue === 'Q') {
        flowControl = false;
      }
      else {
        total = total / parseFloat(userValue);
        userValue = prompt("What number do you want to use. Type 'Q' to stop including numbers")
      }
    }
    alert("The total is: " + total);
    break;

    default:
    alert("Sorry I don't recognise that request");
    break;
  };
};

calculation();

//       totalValues.push(parseFloat(UserValue);
//     }
//   };
//   var totalCalc = totalValues[0];
//   for(var i=1; i < totalValues.length; i++) {

//   };
// };