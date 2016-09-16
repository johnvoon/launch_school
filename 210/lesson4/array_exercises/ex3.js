var numbers = [1, 2, 3, 4, 5];

function reverse(array) {
  var reversedArray = [];
  for (var i = array.length - 1; i >= 0; i--) {
    reversedArray.push(array[i]);
  }

  return reversedArray;
}

console.log(reverse(numbers));

