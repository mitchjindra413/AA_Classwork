class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_array = []
        self.my_each do |ele|
            new_array << ele if prc.call(ele)
        end
        new_array 
    end

    def my_reject(&prc)
        new_array = []
        self.my_each do |ele|
            new_array << ele if !prc.call(ele)
        end
        new_array
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        count = 0
        self.my_each do |ele|
            count += 1 if prc.call(ele)
        end
        count == self.length
    end

    def my_flatten 
        results = [] 
        self.my_each do |ele| 
            if !ele.is_a?(Array)           
                results << ele
            else
                results += ele.my_flatten
            end
        end
        results
    end

    def my_zip(*args) 

        new_array = Array.new(self.length) {[]} 

        self.each_with_index do |ele, indx|
            new_array[indx] << ele
        end
        
        args.each do |arr|
            arr.each_with_index do |ele, idx|
                new_array[idx] << ele if idx < self.length
            end
        end

        results = new_array.each do |arr|
            while arr.length < args.length + 1 
                arr << nil
            end
        end

        results
    end

    def my_rotate(n = 1)
        array = self[0..-1]

        if n > 0
            i = 0
            while i < n 
                first_element = array.shift

                array.push(first_element)
                i += 1
            end
        else
            i = 0
            while i > n 
                last_element = array.pop

                array.unshift(last_element)
                i -= 1
            end
        end

        array        
    end

    def my_join(joiner='')
        results = ""

        if joiner == ""
            self.each do |ele|
                results << ele
            end
            return results 
        end

        self.each do |ele|
            results << ele + joiner
        end
        results.slice(0...-1)
    end

    def my_reverse
        new_array = []
        self_copy = self[0..-1]
        
        while new_array.length < self.length
            last_element = self_copy.pop
            new_array << last_element
        end

        new_array
    end

end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
