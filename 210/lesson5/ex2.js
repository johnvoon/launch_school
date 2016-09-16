var wins = {
  steve: 3,
  susie: 4
};

function incrementProperty(object, propertyName) {
  if (object[propertyName]) {
    object[propertyName] += 1;
  } else {
    object[propertyName] = 1;
  }

  return object[propertyName];
}

console.log(incrementProperty(wins, 'susie'));
console.log(wins);
console.log(incrementProperty(wins, 'lucy'));
console.log(wins);