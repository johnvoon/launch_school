var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

function objectHasProperty(object, propertyName) {
  if (object[propertyName]) {
    return true;
  } else return false
}

// Do notation doesn't work. Why? Because the argument to be passed to the PropertyName parameter is in the form of a string. 
// A string is not a valid identifier. But you can use square bracket notation instead.
// However, you still get false for 'mice' even though it should be true because `null` is falsy.

console.log(objectHasProperty(pets, 'dog'));       // true
console.log(objectHasProperty(pets, 'lizard'));    // false
console.log(objectHasProperty(pets, 'mice'));      // true
