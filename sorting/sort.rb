module Sort

  def self.selection_sort(array)
    i = 0
    while i < array.length
      smallest = array[i]
      min_index = i
      (i+1...array.length).each do |j|
        if array[j] < smallest
          smallest = array[j]
          min_index = j
        end
      end
      array[i], array[min_index] = array[min_index], array[i]
      i+=1
    end
    array
  end

  def self.merge(l_arr, r_arr)
    result = []
    l_i = 0
    r_i = 0

    until l_i == l_arr.length || r_i == r_arr.length
      if l_arr[l_i] < r_arr[r_i]
        result << l_arr[l_i]
        l_i += 1
      elsif l_arr[l_i] > r_arr[r_i]
        result << r_arr[r_i]
        r_i += 1
      else
        result << l_arr[l_i]
        result << r_arr[r_i]
        l_i += 1
        r_i += 1
      end
    end

    # if l_i == l_arr.length
      result = result + r_arr[r_i..-1]
    # else
      result = result + l_arr[l_i..-1]
    # end
    result
  end

  def self.mergesort(array)
    if array.length <= 1
      array
    else
      mid = (array.length / 2)
      left_side = mergesort(array[0...mid])
      right_side = mergesort(array[mid...array.length])
      merge(left_side, right_side)
    end
  end
end


