a = 'global' // bound as a property of the global object

function checkScope() {
  var a = 'local';
  function nested() {
    var a = 'nested';
    function supernested() {
      a = 'supernested'; // resolves one level up in the scope chain, i.e. re-assigns a from nested to supernested
      return a; // supernested
    }

    return supernested(); // supernested
  }

  return nested(); // supernested
}

console.log(checkScope()); //supernested
console.log(a); //global `a` is never changed. 