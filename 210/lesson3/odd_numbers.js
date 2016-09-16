function printOddNumbers(n) {
  for (var i = 1; i <= n; i++) {
    if (i % 2 === 1) console.log(i);
  }
}

function printOddNumbers(n) {
  for (var i = 1; i <= n; i += 2) {
    console.log(i);
  }
}

function printOddNumbers(n) {
  for (var i = 1; i <= n; i++) {
    if (i % 2 === 0) continue;
    console.log(i);
  }
}

printOddNumbers(23);