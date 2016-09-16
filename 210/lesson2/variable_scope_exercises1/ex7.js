function hello() {
  var a = 'hello' // variable `a` is defined within the scope it is in, i.e. within the `hello` function
}

hello();
console.log(a); // ReferenceError as `a` is not declared in the global scope. 