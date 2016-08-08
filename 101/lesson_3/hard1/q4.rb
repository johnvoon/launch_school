def generate_UUID_v1
  character_index = (0..9).to_a + ('a'..'f').to_a
  section1 = character_index.shuffle[0,8].join
  section2 = character_index.shuffle[0,4].join
  section3 = character_index.shuffle[0,4].join
  section4 = character_index.shuffle[0,4].join
  section5 = character_index.shuffle[0,12].join
  "#{section1}-#{section2}-#{section3}-#{section4}-#{section5}"  
end

def generate_UUID_v2
  characters = ("a".."f").to_a + (1..9).to_a
  sequence = [8, 4, 4, 4, 12]

  clusters = sequence.map do |length|
    length.times.map { characters.sample }.join
  end
  clusters.join('-')
end

def generate_UUID_v3
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

def generate_UUID_v4
  characters = ("a".."f").to_a.concat((1..9).to_a)
  uuid = ""

  cluster = [8, 4, 4, 8, 12]
  cluster.each do |length|
    length.times { uuid += characters.sample }
    uuid += "-" unless length == 12
  end
  uuid
end

p generate_UUID_v1
p generate_UUID_v2
p generate_UUID_v3
p generate_UUID_v4