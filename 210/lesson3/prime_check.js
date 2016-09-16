function isPrime(n) {
  if (n <= 1) {
    console.log(false);
  }

  for (var i = 2; i < n; i++) {
    if (n % i === 0) {
      console.log(false);
    }
  }

  console.log(true);
}

function isPrime(n) {
  if (n <= 1 || (n > 2 && n % 2 === 0)) {
    return false;
  }

  var divisor = 3;

  while (divisor < n) {
    if (n % divisor === 0) {
      return false;
    }

    divisor += 2;
  }

  return true;
}

console.log(isPrime(5));