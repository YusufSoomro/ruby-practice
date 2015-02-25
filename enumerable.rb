def by_two(arr)
  arr.map { |integer| integer * 2 }
end

class Array
  def my_each
    0.upto(self.length - 1) do |index|
      yield(self[index])
    end
  end
end

def median(arr)
  array = arr.sort
  odd_value = array[array.length / 2]
  even_value = array[(array.length / 2) - 1]
  return odd_value if array.length.odd?
  return (odd_value + even_value) / 2
end

def concatenate(str_arr)
  str_arr.inject("") { |accum, string| accum << string }
end

p concatenate(["Yay ", "for ", "strings!"])
