var a = 'outer';

function testScope() {
  var a = 'inner';
  console.log(a);
}

console.log(a); // outer
testScope(); // inner 
console.log(a); // outer - note that line 4 is not a re-assignment but a declaration of a new variable which is also named `a`

