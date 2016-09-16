numbers = [1, 2, 3, 4, 5]

function findIndex(value, array) {
  for (var i = 0; i < array.length; i++) {
    if (array[i] === value) {
      return i;
    }
  }
  return -1
}

console.log(findIndex(3, numbers))
console.log(findIndex(6, numbers))