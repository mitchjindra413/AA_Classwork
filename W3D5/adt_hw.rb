class Stack
    def initialize
        @stack = []
    end

    def push(el)
        stack << el
        el
    end

    def pop
        stack.pop
    end

    def peek
        stack[-1]
    end

    private
    attr_reader :stack
end

class Queue
    def initialize
        @stack = []
    end

    def enqueue(el)
        stack.push(el)
        el
    end

    def dequeue
        stack.shift
    end

    def peek
        stack[0]
    end

    private
    attr_reader :stack
end

class Map
    def initialize
        @array_map = []
    end

    def set(key, value)
        array_map.each_with_index do |set, index|
            if set[0] == key
                array_map[index] << value
                puts "added #{value} to key: #{key}"
                return
            end
        end
        array_map << [key, value]
        puts "added #{value} to key: #{key}"
    end

    def get(key)
        array_map.each do |set|
            return set if set[0] == key  
        end
        puts "no key: #{key}"
    end

    def delete(key)
        array_map.each_with_index do |set, index|
            if set[0] == key
                @array_map.delete_at(index)
            end
        end
        puts "deleted #{key}"
    end

    private
    attr_reader :array_map
end