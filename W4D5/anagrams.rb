def first_anagram?(str1, str2)
  str1.chars.permutation.to_a.include?(str2.split(""))
  #O(n!)
end

def second_anagram?(str1, str2)
  str2_arr = str2.chars
  str1.each_char do |char|
    target_idx = str2_arr.find_index(char)
    if target_idx != nil
      str2_arr.delete_at(target_idx)
    else
      return false
    end
  end
  str2_arr.empty?
end
#O(n^2) ?

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
  #O(n * log(n))
end


def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)

  str1.each_char {|char| hash1[char] += 1}
  str2.each_char {|char| hash1[char] -= 1}

  hash1.values.all? {|value| value == 0}
  #O(n)
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true