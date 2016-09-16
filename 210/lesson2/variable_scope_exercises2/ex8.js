var a = 'outer';

console.log(a); 
setScope(a);
console.log(a);

var setScope = function() {
  a = 'inner';
}


// equivalent to
var a;
var setScope; // not a function yet
a = 'outer';

console.log(a); // outer
setScope(a); // TypeError as setScope is not a function but merely a variable declaration
console.log(a); //outer

setScope = function() {
  a = 'inner';
}
