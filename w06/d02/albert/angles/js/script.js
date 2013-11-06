/* MTA Javascript Homework */

// Subway system variable

var subwaySystem = {
  nLine: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
  lLine: ["8th", "6th", "Union Square", "3rd", "1st"],
  sixLine: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
};

// Function that returns journey on one line
var sameLine = function(line, startPoint, endPoint) {
  if ( startPoint === endPoint ) {
    return "No travelling required"
  }
  else if ( line.indexOf( startPoint ) < line.indexOf(endPoint )) {
    resultJourney = line[line.indexOf(startPoint)];
    for( var i = line.indexOf(startPoint) + 1; i <= line.indexOf(endPoint); i++) {
      resultJourney += line[i] + ", ";
    }
  }
  else {
    line.reverse();
    resultJourney = line[line.indexOf(startPoint)];
    for( var i = line.indexOf(startPoint) + 1; i <= line.indexOf(endPoint); i++) {
      resultJourney += line[i] + ", ";
    }
  }
  return resultJourney;
};

// Function that returns start and end lines
var linePrompt = function(){
  var startLine = prompt("Which line do you want to start at\n(1)\tN Line\n(2)\tL Line\n(3)\tSix Line");
  var endLine = prompt("Which line do you want to end at\n(1)\tN Line\n(2)\tL Line\n(3)\tSix Line");
  var linesArray = [];
  switch( startLine ) {
    case "1":
    linesArray[0] = subwaySystem.nLine;
    break;
    case "2":
    linesArray[0] =subwaySystem.lLine;
    break;
    case "3":
    linesArray[0] =subwaySystem.sixLine;
    break;
  }
  switch( endLine ) {
    case "1":
    linesArray[1] = subwaySystem.nLine;
    break;
    case "2":
    linesArray[1] =subwaySystem.lLine;
    break;
    case "3":
    linesArray[1] =subwaySystem.sixLine;
    break;
  }
  return linesArray;
};


// Function that returns entire journey

var completeJourney = function() {
  var linesArray = linePrompt();
  var startStation = prompt("Which station do you want to start at");
  var endStation = prompt("Which station do you want to end at");
  if (linesArray[0] === linesArray[1]) {
    alert("Your journey will be: " + sameLine(linesArray[0], startStation, endStation));
  }
  else
    alert("Your journey will be: " + sameLine(linesArray[0], startStation, "Union Square") + " " + sameLine(linesArray[1], "Union Square", endStation));
};

completeJourney();



















