var a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a); // outer
testScope(); // inner
console.log(a); // inner as a is re-assigned to inner in line 4
