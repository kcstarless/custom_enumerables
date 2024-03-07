module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |value|
      yield value, index
      index += 1
    end
  end

  def my_select
    array_new = []
    my_each do |value|
      array_new << value if yield(value)
    end
    array_new
  end

  def my_all?(default = nil)
    if block_given?
      my_each do |value|
        return false unless yield(value)
      end
    elsif default == nil
      return false if include?(false) || include?(nil)
    else
      my_each do |value|
        return false unless default === value || default === self || include?(default)
      end
    end
    true
  end

  def my_any?
    my_each do |value|
      return true if yield(value)
    end
    false
  end

  def my_none?
    my_each do |value|
      return false if yield(value)
    end
    true
  end

  def my_count
    if block_given?
      count = 0
      my_each do |value|
        count += 1 if yield(value)
      end
      return count
    end
    length
  end

  def my_map
    if block_given?
      map = []
      my_each { |value| map << yield(value) }
      map
    end
  end

  def my_inject(default)
    my_each { |value| default = yield(default, value)}
    default
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for value in self
      yield value
    end
  end
end

# a.my_select {|value| value == 4}
