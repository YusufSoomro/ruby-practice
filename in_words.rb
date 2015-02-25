UNIQUE_NUMS = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}

TENS = {
  20 => 'twenty',
  30 => 'thirty',
  40 => 'fourty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety'
}

HUNDREDS = [
  100, 200, 300,
  400, 500, 600, 700,
  800, 900
]

MAGNITUDE = {
  2 => 'thousand',
  3 => 'million',
  4 => 'billion',
  5 => 'trillion'
}

def tens_string(num)
  if TENS.include?(num)
    return TENS[num]
  else
    return "#{TENS[(num / 10) * 10]} #{UNIQUE_NUMS[num % 10]}"
  end
end

def hundreds_string(num)
  hundred_digit = UNIQUE_NUMS[num / 100]

  if HUNDREDS.include?(num)
    return "#{hundred_digit} hundred"
  elsif (num % 100) < 20
    return "#{hundred_digit} hundred #{UNIQUE_NUMS[num % 100]}"
  else
    return "#{hundred_digit} hundred #{tens_string(num % 100)}"
  end
end

def put_nums_together(num)
  raise "number needs to be below 1000" if num > 999
  if num > 99
    return hundreds_string(num)
  elsif num > 19
    return tens_string(num)
  elsif num == 0
    return ""
  else
    return UNIQUE_NUMS[num]
  end
end

def parse_nums(num)
  num = num.to_s.reverse
  result = []
  until num.length < 3
    result << num.slice(0..2)
    num = num[3..-1]
  end
  result << num unless num.empty?
  result.map(&:reverse!)
end

def full_number_string(num)
  in_words = []
  number_str_arr = parse_nums(num)
  j = 2
  if num < 1000
    return put_nums_together(num)
  else
    unless number_str_arr[0].empty?
      in_words << put_nums_together(number_str_arr.shift.to_i)
    end
    number_str_arr.each do |numbers_str|
      in_words << "#{put_nums_together(numbers_str.to_i)} #{MAGNITUDE[j]}"
      j += 1
    end
  end

  in_words.reverse.join(", ")
end

p full_number_string(199)
