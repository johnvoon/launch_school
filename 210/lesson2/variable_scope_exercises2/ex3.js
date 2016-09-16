var a = 'hello';

for (var i = 0; i < 5; i++) {
  var a = i; // variable declaration gets hoisted.
}

console.log(a); 

// equivalent to:

var a;
var a; // no extra effect
a = 'hello';

for (var i = 0; i < 5; i++) {
  a = i;
}

console.log(a); // 4
