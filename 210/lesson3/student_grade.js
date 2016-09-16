function student_grade() {
  var score1 = Number(prompt("Enter score 1"));
  var score2 = Number(prompt("Enter score 2"));
  var score3 = Number(prompt("Enter score 3"));
  var average = (score1 + score2 + score3) / 3;
  var grade;

  if (average >= 90) {
    grade = "A";
  } else if (average >= 70 && average < 90) {
    grade = "B";
  } else if (average >= 50 && average < 70) {
    grade = "C";
  } else {
    grade = "F";
  }

  console.log("Based on the average of your 3 scores your letter grade is " + grade)
}

function student_grade() {
  var scores = [];
  var input;
  var grade;
  var average;

  function average(scores) {
    var totalScores = 0
    for (var i = 0; i < scores.length; i++) {
      totalScores += scores[i];
    }
    return totalScores / scores.length
  }

  while (true) {
    input = prompt('Enter a score or enter \"done\" to continue');

    if (input.match(/\d+/)) {
      scores.push(Number(input));
    } else break;
  }

  average = average(scores);

  if (average >= 90) {
    grade = "A";
  } else if (average >= 70 && average < 90) {
    grade = "B";
  } else if (average >= 50 && average < 70) {
    grade = "C";
  } else {
    grade = "F";
  }

  console.log('Based on the average of your 3 scores, which is ' + average + ', your letter grade is ' + grade)
}

student_grade()