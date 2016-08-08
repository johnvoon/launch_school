sentence = "Humpty Dumpty sat on a wall."
sentence_reverse = sentence.split(/\W/).reverse.join(' ') + '.'
p sentence_reverse