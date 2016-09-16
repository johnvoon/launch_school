var a = 'outer';
var b = 'outer';

console.log(a); // outer
console.log(b); // outer
setScope(a); // inner
console.log(a); // outer
console.log(b); // inner

function setScope(foo) {
  foo = 'inner'; // function arguments become local variables within in the function;  
  b = 'inner'; // b is re-assigned
}