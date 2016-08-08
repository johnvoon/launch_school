def print_in_box(string)
 horizontal_rule = "+#{'-' * (string.size + 2)}+"
 empty_line = "|#{' ' * (string.size + 2)}|"
 horizontal_rule_max = "+#{'-' * 78}+"
 empty_line_max = "|#{' ' * 78}|"
 if (string.size - 4) <= 80
   puts horizontal_rule
   puts empty_line
   puts "| #{string} |"
   puts empty_line
   puts horizontal_rule
 else
   puts horizontal_rule_max
   puts empty_line_max
   puts "| #{string[0..75]} |"
   puts empty_line_max
   puts horizontal_rule_max
 end
end

def print_in_box2(string)
 horizontal_rule = "+#{'-' * (string.size + 2)}+"
 empty_line = "|#{' ' * (string.size + 2)}|"
 horizontal_rule_max = "+#{'-' * 78}+"
 empty_line_max = "|#{' ' * 78}|"
 if (string.size - 4) <= 80
   puts horizontal_rule
   puts empty_line
   puts "| #{string} |"
   puts empty_line
   puts horizontal_rule
 else
   puts horizontal_rule_max
   puts empty_line_max
   puts "#{wrap_text(string)}"
   puts empty_line_max
   puts horizontal_rule_max
 end
end

def wrap_text(string)
  string.gsub(/(.{1,76})/, "| \\1 |\n")
end

print_in_box("To boldly go where no one has gone before.")
print_in_box("To boldly go where no on awd awd awd awdaw awd awd awd awd awd awd awd aw daw daw dawd aw dawd awd awd awd aw da w daw daw daw daw dawd ae has gone before.")
print_in_box2("To boldly go where no one has gone before.")
print_in_box2("Hello my name is John and I am 27 years old. How are you? How are you doingggg? To boldly go where no on awd awd awd awdaw awd awd awd awd awd awd awd aw daw daw dawd aw dawd awd awd awd aw da w daw daw daw daw dawd ae has gone before.")