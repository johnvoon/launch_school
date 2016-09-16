class OCR
  NUMBERS_LAST_ON_LINE = {
    "\s_\n|\s|\n|_|\n" => '0',
    "\n\s\s|\n\s\s|\n" => '1',
    "\s_\n\s_|\n|_\n" => '2',
    "\s_\n\s_|\n\s_|\n" => '3',
    "\n|_|\n\s\s|\n" => '4',
    "\s_\n|_\n\s_|\n" => '5',
    "\s_\n|_\n|_|\n" => '6',
    "\s_\n\s\s|\n\s\s|\n" => '7',
    "\s_\n|_|\n|_|\n" => '8',
    "\s_\n|_|\n\s_|\n" => '9'
  }

  def initialize(text)
    @text = text
  end

  def convert
    assembled_characters = assemble(split(@text))
    numbers = assembled_characters.each_slice(3).to_a
    numbers.each do |number|
      number << "\n"
    end
    new_numbers = []
    numbers.each_index do |index|
      next if index % 2 == 1
      new_numbers << numbers[index] + numbers[index + 1]
    end
    joined_numbers = []
    new_numbers.each do |new_number|
      joined_numbers << new_number.join
    end
    number_string = ''
    joined_numbers.each do |joined_number|
      NUMBERS_LAST_ON_LINE.each_key do |number|
        number_string << NUMBERS_LAST_ON_LINE[number] if number.include?(joined_number)
      end
    end
    number_string
  end

  def split(text)
    split_text = text.split("\n")
    split_text.map do |section|
      section.chars.each_slice(3).to_a
    end
  end

  def assemble(split_text)
    joined_text_array = []
    split_text.each do |line|
      line.each do |number|
        number.each do |character|
          joined_text_array << character
        end
      end
    end

    joined_text_array
  end
end

text = <<-NUMBER.chomp
    _
  | _|
  | _|

NUMBER

ocr = OCR.new(text)
p ocr.convert


