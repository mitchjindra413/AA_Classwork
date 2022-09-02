class Hanoi

    attr_accessor :a1, :a2, :a3

    def initialize 
        @a1 = [1,2,3,4,5]
        @a2 = []
        @a3 = []
    end

    def move(start_arr, end_arr)
        if end_arr.empty?
            end_arr << start_arr.shift
        elsif end_arr[0] > start_arr[0]
            end_arr.unshift(start_arr.shift)
        elsif
            raise "invalid move"
        end
    end

    def won?
        @a3 == [1,2,3,4,5]
    end

    def play
        until won?
            puts "Enter: 1, 2, or 3 for start stack and end stack"
            input = gets.chomp
            i, j = input.split(" ")
            if i == "1" 
                start_arr = a1
            elsif i == "2" 
                start_arr = a2
            elsif i == "3"
                start_arr = a3
            end

            if j == "1" 
                end_arr = a1
            elsif j == "2" 
                end_arr = a2
            elsif j == "3"
                end_arr = a3
            end

            move(start_arr, end_arr)
            print
        end
    end

    def print
        p a1
        p a2
        p a3
    end


end