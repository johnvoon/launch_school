// function average(a, b, c) {
//   var average = (a + b + c) / 3;
//   console.log(average);
// }

// average(1, 2, 3);

function average(array) {
  var total = 0;
  for (var i = 0; i < array.length; i++) {
    total += array[i];
  }

  return total / array.length;
}

console.log(average([1, 2, 3s, 4]));

function sum(array) {
  var total = 0;
  for (var i = 0; i < array.length; i++) {
    total += array[i];
  }
  return total;
}

function average(array) {
  return sum(array) / array.length;
}

console.log(average([1, 2, 3, 4, 5]));

var temperatures = [30, 29, 28, 27, 30]

console.log(average(temperatures))