##Friday, January 29, 2021
##aAcademy > Hash Map & LRU Cache
##Luciano A. Campos


class MaxIntSet

  attr_reader :store 
    
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validade!(num)
    return false if @store[num]
    self.store[num] = true
  end

  def remove(num)
    validade!(num)
    return nil unless include?(num)
    self.store[num] = false
    num 
  end

  def include?(num)
    validade!(num)
    self.store[num]
  end


  private


  def is_valid?(num)
    num.between?(0, self.store.length - 1)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end

##______________________________________________

class IntSet

  attr_reader :store 


  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num 
    num 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    self.store.length
  end
end

##______________________________________________

class ResizingIntSet
  attr_reader :store :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    self.count += 1
    resize! if num_buckets < self.count 

    num
  end

  def remove(num)
    self.count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets]
  end

  def num_buckets
    self.store.length
  end

  def resize!
    old_store = self.store
    self.count = 0
    self.store = Arra.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |num| insert(num) }
  end

  def [](num)
    self.store[num % num_buckets]
  end


end
