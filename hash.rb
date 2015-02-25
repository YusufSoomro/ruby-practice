class MyHashSet
  def initialize(hash)
    @store = hash
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.each do |key,value|
      return true if key == el
    end
    return false
  end

  def delete(el)
    return false unless include?(el)
    @store[el] = false
  end

  def to_a
    array = []
    @store.each do |key, value|
      array << key if @store[key]
    end
    array
  end

  def union(set2)
    result = MyHashSet.new({})

    self.to_a.each do |key|
      result.insert(key)
    end

    set2.to_a.each do |key|
      result.insert(key)
    end
    result
  end

  def intersect(set2)
    result = MyHashSet.new({})

    set2.to_a.each do |key|
      result.insert(key) if include?(key)
    end
    result
  end

  def minus(set2)
    result = MyHashSet.new({})

    self.to_a.each do |key|
      result.insert(key) unless set2.include?(key)
    end
    result
  end
end
