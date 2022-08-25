def range_rec(start_num, end_num)
    # return [1] if start_num == 1 <- not right
    return [] if start_num >= end_num
    
    range(start_num, end_num - 1) << end_num - 1
end

def range(start_num, end_num)
    (start_num...end_num).map {|num| num}
end

#--------------------------------

def exp_1(b, n)
    return 1 if n == 0
    b * exp_1(b, n-1)
end

def exp(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        exp(b, n / 2) ** 2             
    else 
        b * (exp(b, (n - 1) / 2) ** 2) 
    end
end

#--------------------------------

def deep_dup(array)
    return array if !array.is_a?(Array)

    results = []
    array.each do |ele|
        results << deep_dup(ele)
    end

    results
end

#--------------------------------

def fibonacci(n)
    return [0] if n == 1
    return [0, 1] if n == 2

    previous = fibonacci(n - 1)

    previous << previous[-1] + previous[-2]
end

#--------------------------------

def binary_search(array, target)
    return nil if array.length == 0

    mid = array.length / 2
    return mid if target == array[mid]

    left = array[0...mid]
    right = array[mid+1..-1]

    if target < mid
        binary_search(left, target)
    else
        stack = binary_search(right, target)
        if stack != nil
            mid + 1 + stack
        end
    end
end

#--------------------------------

def merge_sort(array)
    return [] if array.length == 0
    return array if array.length == 1

    mid = array.length / 2
    left = merge_sort(array[0...mid])
    right = merge_sort(array[mid..-1])

    merge(left, right)
end



def merge(left, right)
    merged = []
    until left.length == 0 || right.length == 0
        if left[0] < right[0]
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged += right + left
end

#--------------------------------

def subsets(array) 
    return [[]] if array.length == 0
    
    previous = subsets(array[0..-2]) 
    
    temp = [] 
    previous.each do |ele| 
        temp << ele + [array[-1]] 
    end

    previous += temp 
end

def permutations(array)
    return [[array[-1]]] if array.length == 1

    
end