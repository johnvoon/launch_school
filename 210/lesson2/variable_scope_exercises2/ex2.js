function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

// equivalent to

function hello() {
  var a;
  a = 'hello';
  console.log(a);

  if (false) {
    a = 'hello again';
  }
}

hello(); // hello
console.log(a); // Uncaught ReferenceError as `a` is never defined in the global scope, just within the function