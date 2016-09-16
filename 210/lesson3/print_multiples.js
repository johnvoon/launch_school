function printMultiples(n) {
  console.log("Start!");
  for (var i = 100; i >= 0; i--) {
    if (i % n === 0 && i % 2 === 1) {
      console.log(i);
    } 
  }
  console.log("Done!");
}

function printMultiples(n) {
  console.log("Start!");
  var largest_multiple = Math.floor(100 / n) * n;
  for (var i = largest_multiple; i >= 0; i -= n) {
    if (i % 2 === 1) console.log(i);
  }

  console.log("Done!");
}

function printMultiples(n) {
  console.log("Start!");
  var largest_multiple = Math.floor(100 / n) * n;
  var i = largest_multiple;
  
  while (i > 0) {
    if (i % 2 === 1) console.log(i);
  }

  i -= n;

  console.log("Done!");
}

printMultiples(17);
printMultiples(21);