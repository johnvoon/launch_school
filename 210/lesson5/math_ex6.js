function getRandomInt(min, max) {
  var difference;
  var swap;

  if (min === max) {
    return min;
  } else if (min > max) {
    swap = min;
    min = max;
    max = swap;
  }

  difference = max - min + 1
  return Math.floor(Math.random() * difference) + min;
}

console.log(getRandomInt(1, 10));