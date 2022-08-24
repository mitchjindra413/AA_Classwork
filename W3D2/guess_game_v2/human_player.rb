class HumanPlayer

    def get_move1(hash, arr)

        puts "Pick card: Row,Col" # 1,2
        pos = gets.chomp.split(',') # ["1", "2"]
        pos.each do |ele|
            if ele.to_i.to_s != ele
                raise "invalid position"
            end
        end
        pos
    end

    def get_move2(hash, arr)

        puts "Pick card: Row,Col" # 1,2
        pos = gets.chomp.split(',') # ["1", "2"]
        pos.each do |ele|
            if ele.to_i.to_s != ele
                raise "invalid position"
            end
        end
        pos
    end

end