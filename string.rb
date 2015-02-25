UNIQUE_HASH = {
  10 => 'A',
  11 => 'B',
  12 => 'C',
  13 => 'D',
  14 => 'E',
  15 => 'F'
}

def find_bases(num, base)
  results = []
  power = base

  until power > num
    results << power
    power = base * power
  end

  results.reverse!
end

def num_to_s(num, base)
  result = ""

  find_bases(num, base).each do |power|
    fit_num = num / power
    if fit_num.between?(10, 15)
      result << UNIQUE_HASH[fit_num]
    else
      result << fit_num.to_s
    end
    num -= (power * fit_num) unless fit_num == 0
  end

  if num.between?(10, 15)
    result << UNIQUE_HASH[num]
  else
    result << num.to_s
  end

  result
end

def caesar(string,num)
  result = ""

  string.each_char do |letter|
    result << (letter.ord + num).chr
  end
  result
end

p num_to_s(234, 16)
