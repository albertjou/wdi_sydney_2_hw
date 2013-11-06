var isSquare = function(shape){
  if ( shape.length === shape.width ) {
    alert(shape + " is a square.\nThe area is: " +
      (shape.length * shape.length) + " units squared.\nThe perimeter is: " +
      (shape.length * 4) + " units.");
  }
  else {
    alert(shape + " is a rectangle.\nThe area is: " +
      (shape.length * shape.width) + " units squared.\nThe perimeter is: " +
      ( ( shape.width + shape.length ) * 2 ) + " units.");
  }
};

var isTriangle = function(shape) {
  var perimeter = shape.sideA + shape.sideB + shape.sideC;
  var p = parseFloat(perimeter)/2;
  var area = Math.sqrt(p*(p-shape.sideA)*(p-shape.sideB)*(p-shape.sideC));
  if (( shape.sideA === shape.sideB ) && ( shape.sideB === shape.sideC )) {
    alert(shape + " is equilateral.\nThe area is: " + area);
  }
  else if (( shape.sideA === shape.sideB ) || ( shape.sideA === shape.sideC ) || ( shape.sideB === shape.sideC )) {
    alert(shape + " is isocescles.\nThe area is: " + area);
  }
  else {
    alert(shape + " is obtuse.\nThe area is: " + area);
  }
};

var triangle = {
  sideA: 3,
  sideB: 4,
  sideC: 4
};

isTriangle(triangle);