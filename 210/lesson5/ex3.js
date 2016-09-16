var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};

function copyProperties(source, destination) {
  var propertiesCopied = 0;

  for (var property in source) {
    destination[property] = source[property];
    propertiesCopied++;
  }

  return propertiesCopied;
}

console.log(copyProperties(hal, sal));
console.log(sal);

