// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function(){
  var totalChecking = 0;
  var totalSavings = 0;
  var checkingsDiv = document.getElementById('balance1');
  var savingsDiv = document.getElementById('balance2');

  // https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onclick
  // The click event is raised when the user clicks on an element.
  document.getElementById("checkingDeposit").onclick = function(event){
    var checkingInput = document.getElementById('checkingAmount').value;
    totalChecking += parseFloat(checkingInput);
    checkingsDiv.innerHTML = totalChecking;
  };

  document.getElementById("savingsDeposit").onclick = function(event){
    // Any code you put in here will be run when the savingsDeposit button is clicked
    var savingsInput = document.getElementById('savingsAmount').value;
    totalSavings += parseFloat(savingsInput);
    savingsDiv.innerHTML = totalSavings;
  };

  document.getElementById("checkingWithdraw").onclick = function(event){
    // Any code you put in here will be run when the checkingWithdraw button is clicked
    var checkingInput = parseFloat(document.getElementById('checkingAmount').value);
    if (totalChecking >= checkingInput) {
      totalChecking -= checkingInput;
      checkingsDiv.innerHTML = totalChecking;
    } else if ((totalChecking + totalSavings) >= checkingInput ) {
      checkingInput -= totalChecking;
      totalSavings -= checkingInput;
      totalChecking = 0;
      checkingsDiv.innerHTML = totalChecking;
      savingsDiv.innerHTML = totalSavings;
    } else {
      alert("Insufficient funds!");
    }
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
    // Any code you put in here will be run when the savingsWithdraw button is clicked
    var savingsInput = parseFloat(document.getElementById('savingsAmount').value);
      if (totalSavings >= savingsInput) {
        totalSavings -= savingsInput;
        savingsDiv.innerHTML = totalSavings;
    } else if ((totalChecking + totalSavings) >= savingsInput ) {
        totalSavings -= savingsInput;
        totalSavings = 0;
        totalChecking -= savingsInput;
        checkingsDiv.innerHTML = totalChecking;
        savingsDiv.innerHTML = totalSavings;
    } else {
        alert("Insufficient funds!");
    }
  };

};

