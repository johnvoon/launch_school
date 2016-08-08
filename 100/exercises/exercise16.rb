a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']
a = a.map! { |phrase| phrase.split(' ') }
a = a.flatten
p a