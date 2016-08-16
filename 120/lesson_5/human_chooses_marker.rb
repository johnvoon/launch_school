X_MARKER = 'X'
O_MARKER = 'O'

def human_chooses_marker
  puts "Choose your marker: 'O' or 'X'"
  marker_choice = gets.chomp.downcase
  if %w(x o).include?(marker_choice)
    if marker_choice == 'x'
      X_MARKER
    else 
      O_MARKER
    end
  else
    puts "That marker is not available. Please wait while we assign your markers..."
    sleep 2
    X_MARKER
  end
end

p human_chooses_marker