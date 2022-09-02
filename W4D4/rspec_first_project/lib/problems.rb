class Array
    def my_uniq
        uniq = []
        self.each do |ele|
                if !uniq.include?(ele)
                    uniq << ele
                end
        end
        uniq
    end

    def two_sum
        results = []
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                if j > i && self[i] + self[j] == 0
                    results << [i, j]
                end
            end
        end
        results
    end

    def my_transpose
        (0...self.length).map { |i| self.map { |ele| ele[i]} }
    end

    def stock_picker
        largest = self[1] - self[0]
        largest_pair = [0,1]
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                if j > i && (self[j] - self[i]) > largest
                    largest = self[j] - self[i]
                    largest_pair = [i, j]
                end
            end
        end

        largest_pair

    end

end