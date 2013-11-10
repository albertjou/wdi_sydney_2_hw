// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function(){
  var account = {
    checking: {
      balance: 0,
      deposit: function(amount) {
        this.balance += amount;
      },
      withdraw: function(amount) {
        this.balance -= amount;
      }
    }, savings: {
      balance: 0,
      deposit: function(amount) {
        this.balance += amount;
      },
      withdraw: function(amount) {
        this.balance -= amount;
      }
    }
  };

  var checkingsDiv = document.getElementById('balance1');
  var savingsDiv = document.getElementById('balance2');

  // https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onclick
  // The click event is raised when the user clicks on an element.
  document.getElementById("checkingDeposit").onclick = function(event){
    var checkingInput = document.getElementById('checkingAmount').value;
    account.checking.deposit(verifyInput(checkingInput));
    checkingsDiv.innerHTML = account.checking.balance;
    checkingInput = "";
    colorChange(account.checking, account.savings);
  };

  document.getElementById("savingsDeposit").onclick = function(event){
    var savingsInput = document.getElementById('savingsAmount').value;
    account.savings.deposit(verifyInput(savingsInput));
    savingsDiv.innerHTML = account.savings.balance;
    savingsInput = "";
    colorChange(account.checking, account.savings);
  };

  document.getElementById("checkingWithdraw").onclick = function(event){
    // Any code you put in here will be run when the checkingWithdraw button is clicked
    var checkingInput = document.getElementById('checkingAmount').value;
    checkingInput = verifyInput(checkingInput);
    bankWithdraw(account.checking, account.savings, checkingInput);
    colorChange(account.checking, account.savings);
    checkingInput = "";
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
    // Any code you put in here will be run when the savingsWithdraw button is clicked
    var savingsInput = parseFloat(document.getElementById('savingsAmount').value);
    savingsInput = verifyInput(savingsInput);
    bankWithdraw(account.savings, account.checking, savingsInput);
    colorChange(account.checking, account.savings);
    savingsInput = "";
  };

  var verifyInput = function(input) {
    if ( input.charAt(0) === '$' ) {
      input = parseFloat(input.slice(1));
      if ( isNaN( input ) ) {
        alert("Sorry the input amount is not numeric");
        return 0;
      } else {
        return input;
      }
    } else if (isNaN(parseFloat(input))) {
      alert("Sorry the input amount is not numeric");
      return 0;
    } else {
      return parseFloat(input);
    }
  };

  var bankWithdraw = function(account1, account2, amount) {
  if (account1.balance >= amount ) {
      account1.withdraw(amount);
  } else if ((account1.balance + account2.balance) >= amount ) {
      amount -= account1.balance;
      account2.balance.withdraw(amount);
      account1.balance = 0;
  } else {
      alert("Insufficient funds!");
  }
  };

  var colorChange = function(checkAccount, savAccount) {
    if (checkAccount.balance == 0) {
      var box = document.getElementById('checkingAccount');
      box.style.backgroundColor = 'red';
    } else {
      box.style.backgroundColor = 'green';
    }
    if ( savAccount.balance == 0 ) {
      var box2 = document.getElementById('savingsAccount');
      box2.style.backgroundColor = 'red';
    } else {
      box2.style.backgroundColor = 'green';
    }
  };
};
