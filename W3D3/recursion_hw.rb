def sum_to(num)
    return 0 if num == 0

    if num > 0
        num + sum_to(num - 1)
    else
        return nil
    end
end

# p sum_to(5)  # => returns 15
# p  sum_to(1)  # => returns 1
# p  sum_to(9)  # => returns 45
# p  sum_to(-8)  # => returns nil

def add_numbers(array)
    return nil if array == []
    return array[0] if array.length == 1
    
    array[0] + add_numbers(array[1..-1])

end

# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

def gamma_fnc(num) #(n-1)!
    return nil if num == 0
    return 1 if num == 1

    sum = num - 1

    sum *= gamma_fnc(num - 1)

end

# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(array, string)
    return false if array == []
    return false if array[0] != string
    return true if array[0] == string

    
    array[0] += ice_cream_shop(array[1..-1], string)

end

p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
    return "" if string.length == 0

    string[-1] + reverse(string[0..-2])
end

# p  reverse("house") # => "esuoh"
# p  reverse("dog") # => "god"
# p  reverse("atom") # => "mota"
# p  reverse("q") # => "q"
# p  reverse("id") # => "di"
# p  reverse("") # => ""