function say() {
  if (false) {
    var a = 'hello from inside a block'; 
  }

  console.log(a);
}
say();

// JavaScript variables are scoped only by functions, not blocks.
// After hoisting, the code becomes

function say() {
  var a;
  if (false) {
    a = 'hello from inside a block'; // a is never re-assigned
  }

  console.log(a); // undefined
}
say();

