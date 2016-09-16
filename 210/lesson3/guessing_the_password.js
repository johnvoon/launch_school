function password_prompt() {
  var password = "hello";
  var failedAttempts = 0
  var input;

  while (input != password) {
    failedAttempts += 1;
    input = prompt("What is the password");
    if (counter === 3) {
      console.log("You have been denied access.");
      break;
    } else if (input === password) {
      console.log("You have successfully logged in.");
      break;
    }
  }
}

function password_prompt() {
  var password = "hello";
  var failedAttempts = 0;

  while (true) {
    var guess = prompt('What is the password?');

    if (guess === password) {
      console.log('You have successfully logged in.');
      break;
    }

    failedAttempts++;

    if (failedAttempts === 3) {
      console.log('You have been denied access.');
      break;
    }
  }
}

function password_prompt() {
  var password = 'password';
  var failedAttempts = 0;

  do {
    var guess = prompt('What is the pasword:');

    if (guess === password) {
      break;
    }

    failedAttempts++;
  } while (failedAttempts < 3);

  if (failedAttempts === 3) {
    console.log('You have been denied access.');
  } else {
    console.log('You have successfully logged in.')
  }
}

password_prompt()
