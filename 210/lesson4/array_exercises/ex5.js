var array = ["Hello", "how", "are", "you?"]

function convertToString(array) {
  var newString = '';
  for (var i = 0; i < array.length - 1; i++) {
    newString += array[i] + ' ';
  }

  return newString + array[array.length - 1];
}

console.log(convertToString(array))