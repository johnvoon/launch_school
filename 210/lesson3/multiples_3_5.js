function multiplesOfThreeAndFive() {
  for (var i = 1; i <= 100; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(i + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(i);
    }
  }
}

function multiplesOfThreeAndFive(min, max) {
  for (var i = min; i <= max; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(i + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(i);
    }
  }
}

multiplesOfThreeAndFive(3, 50)