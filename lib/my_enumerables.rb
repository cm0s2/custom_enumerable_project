module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    counter = 0
    until counter == size
      yield self[counter]
      counter += 1
    end
    self
  end

  def my_each_with_index
    counter = 0
    until counter == size
      yield(self[counter], counter)
      counter += 1
    end
    self
  end

  def my_select
    counter = 0
    selected_array = []
    until counter == size
      selected_array << self[counter] if yield(self[counter])
      counter += 1
    end
    selected_array
  end

  def my_all?
    counter = 0
    until counter == size
      return false if !yield(self[counter])

      counter += 1
    end
    true
  end

  def my_any?
    counter = 0
    until counter == size
      return true if yield(self[counter])

      counter += 1
    end
    false
  end

  def my_none?
    counter = 0
    until counter == size
      return false if yield(self[counter])

      counter += 1
    end
    true
  end

  def my_count
    return size if !block_given?

    counter = 0
    num = 0
    until counter == size
      num += 1 if yield(self[counter])

      counter += 1
    end
    num
  end

  def my_map
    counter = 0
    mapped_array = []
    until counter == size
      mapped_array << yield(self[counter])
      counter += 1
    end
    mapped_array
  end

  # |sum, value| sum + value
  def my_inject(initial_value = 0)
    counter = 0
    sum = initial_value
    until counter == size
      sum = yield(sum, self[counter])
      counter += 1
    end
    sum
  end
end
