def two_identical_human_markers?(array_markers)
  human_marker_count = array_markers.count do |square_value|
    square_value == "X"
  end
  human_marker_count == 2
end

def at_risk_square
  markers_on_line = ["X", "X", 3]
  if  two_identical_human_markers?(markers_on_line) &&
      markers_on_line.one? do |square_value|
        square_value.is_a?(Integer)
      end
    markers_on_line.select do |square_value| 
      square_value == square_value.to_i
    end.first
  end
end

p at_risk_square