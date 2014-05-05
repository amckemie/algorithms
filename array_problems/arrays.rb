require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)

    max = array[0]

    for num in 1...array.length
      max = array[num] if array[num] > max
    end

    max
  end

  def self.middle_element(array)
    if array.length == 0
      return nil
    else
      average = 0
    end

    if array.length % 2 == 0
      average = (array[array.length/2] + array[array.length/2 - 1]) / 2.0
    else
      average = array[array.length/2]
    end

    average
  end

  def self.sum_arrays(array1, array2)
    if array1.length == 0 && array2.length == 0
      return []
    end

    new_array = []

    for num in 0...array1.length
      new_array << array1[num] + array2[num]
    end

    new_array
  end
end
