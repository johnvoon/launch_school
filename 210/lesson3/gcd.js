function gcd(int1, int2) {
  if (int1 > int2) {
    for (var i = int2; i >= 0; i--) {
      if (int1 % i === 0 && int2 % i === 0) {
        return i;
      }
    }
  } else {
    for (var i = int1; i >= 0; i--) {
      if (int1 % i === 0 && int2 % i === 0) {
        return i;
      }
    }
  }
}

function gcd(num1, num2) {
  while (num2 !== 0) {
    var temp = num2;
    
  }
}

console.log(gcd(12, 4));
console.log(gcd(15, 10));
console.log(gcd(9, 2));