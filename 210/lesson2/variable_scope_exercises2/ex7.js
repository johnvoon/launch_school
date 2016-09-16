var total = 50;
var increment = 15;

function incrementBy(increment) {
  total += increment; // outer variable is shadowed by the increment local variable within the function as function arguments become locally scoped variables even if they have the same name as global variables.
}

console.log(total); // 50
incrementBy(10); 
console.log(total); // 60
console.log(increment); // 15