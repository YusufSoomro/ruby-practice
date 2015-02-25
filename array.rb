class Array
  def my_uniq
    results = []

    self.each do |item|
      results << item unless results.include?(item)
    end

    results
  end

  def two_sum
    results = []

    0.upto(self.length - 2) do |start_pos|
      (start_pos + 1).upto(self.length - 1) do |end_pos|
        if self[start_pos] + self[end_pos] == 0
          results << [start_pos, end_pos]
        end
      end
    end

    results
  end
end

def towers_of_hanoi
  tower1 = [3,2,1]
  tower2 = []
  tower3 = []

  towers = {
    1 => tower1,
    2 => tower2,
    3 => tower3
  }

  puts "Do you want to play a game?"
  p tower1
  p tower2
  p tower3

  loop do
    puts "What tower do you want to move from?"
    tower_from = gets.chomp.to_i
    puts "What tower do you want to move to?"
    tower_to = gets.chomp.to_i

    if validate(towers[tower_from], towers[tower_to])
      towers[tower_to] << towers[tower_from].pop
    else
      puts "You dumbass...Illegal move"
      next
    end

    p tower1
    p tower2
    p tower3

    break if tower3.length == 3
  end
  puts "You are not retarded! YAY!"
end

def validate(array1, array2)
  return false if array1.empty?
  return true if array2.empty? || array1.last < array2.last
  false
end

def my_transpose(arr)
  result = Array.new(arr[0].length) { Array.new }

  arr.each do |row|
    j = 0
    row.each do |value|
      result[j] << value
      j += 1
    end
  end

  result
end

def stockpicker(arr)
  most_profit = 0
  result = []
  (0..(arr.length - 1)).each do |start_day|
    (start_day..(arr.length - 1)).each do |end_day|
      profit = arr[end_day] - arr[start_day
      if profit > most_profit
        most_profit = profit
        result = [start_day, end_day]
      end
    end
  end
  result
end
