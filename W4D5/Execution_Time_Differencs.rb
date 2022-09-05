def my_min(arr)
  smallest = arr[0]

  arr.each_with_index do |el,idx|

    arr.each_with_index do |el2,idx2|
      if idx2 > idx && el2 < el
        smallest = el2 if el2 < smallest
      end
    end
    
  end

  smallest
  #O(n^2)
end



def my_min_v2(arr)
  smallest = arr[0]

  arr.each do |el|
    smallest = el if el < smallest
  end

  smallest
  #O(n)
end

def largest_contiguous(arr)
  sub_sum_arr = []
  (0..arr.length-1).each do |i|
    (i..arr.length-1).each do |j|
      sub_sum_arr << arr[i..j].sum 
    end
  end
  sub_sum_arr.max
  #O(n^3)
end

def largest_contiguous_v2(arr)
  #GOALS: O(n) O(1)
  largest = arr[0]
  current_sum = arr[0]

  (1...arr.length).each do |i|
    if current_sum >= 0
      current_sum += arr[i]
    else 
      current_sum = arr[i]
    end

    largest = current_sum if current_sum > largest
  end
  largest
  #O(n) O(1)
end


