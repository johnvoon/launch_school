flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
new_array = [flintstones.key(2), flintstones["Barney"]]
p new_array
p flintstones.assoc("Barney")