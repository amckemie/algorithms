module Set1
  # O(n)
  def self.swap_small(array)
    smallest = array[0]
    index = 0
    for num in 0...array.length
      if array[num] < smallest
        smallest = array[num]
        index = num
      end
    end
    array[0], array[index] = array[index], array[0]
    array
  end

  #0(n^2)
  def self.find_sum_2(array, sum = 0)
    return false if array.length == 0
    hash = Hash.new

    array.each do |i|
      hash[i] = true
    end

    array.each do |i|
      return true if hash[sum-i]

    # (0...array.length).each do |i|
    #   (i...array.length).each do |j|
    #     return true if array[i] + array[j] == sum
    #   end
    # end
    # false
  end

  #O(n^3)
  def self.find_sum_3(array, sum = 0)
    return false if array.length == 0

    for i in 0...array.length
      for j in i...array.length
        for k in j...array.length
          return true if array[i] + array[j] + array[k]== sum
        end
      end
    end
    false
  end
end
