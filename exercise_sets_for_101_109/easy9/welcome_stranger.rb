def greetings(array, hash)
<<-MSG
Hello, #{array.join(' ')}! 
Nice to have a #{hash[:title]} #{hash[:occupation]} around"
MSG
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber'})
