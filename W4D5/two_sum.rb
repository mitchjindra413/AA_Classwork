def bad_two_sum?(arr, target)
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if (arr[i] + arr[j]) == target
    end
  end
  false
  #O(n^2)
end

def okay_two_sum?(arr, target)
  sorted = arr.sort
  (0...sorted - 1).each do |i|
    if sorted[i]
  end
end

arr = [0, 1, 5, 7]
p brute_force?(arr, 6) # => should be true
p brute_force?(arr, 10) # => should be false