function wordCount(words) {
  var wordCount = {};
  var wordsArray = words.split(' ');
  var word;

  for (var i = 0; i < wordsArray.length; i++) {
    word = wordsArray[i];
    if (wordCount[word]) {
      wordCount[word]++;
    } else {
      wordCount[word] = 1;
    }
  } 

  return wordCount;
}

console.log(wordCount('box car cat bag box'));