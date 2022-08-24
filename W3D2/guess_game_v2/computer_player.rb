class ComputerPlayer

    def initialize
        @card1 = []
    end

    def get_move1(hash, arr)   
        # if two cards were shown then return return a
        
        hash.each do |key, val|
            if val.length == 2
                @card1 = val
                return val[0]
            end
        end

        good_card = false
        while !good_card
            i = rand(0...4)
            j = rand(0...4)
                if arr.include?([i,j])
                    good_card = true
                end
            @card1 = [i,j]
            return [i,j]
        end
    end
    

    def get_move2(hash, arr)   
        # if two cards were shown then return return a


        return hash[@card1] if hash.has_key?(@card1)
        
        good_card = false
        
        hash.each do |key, val|
            if val.length == 2
                return val[1]
            else
                while !good_card
                    i = rand(0...4)
                    j = rand(0...4)
                        if arr.include?([i,j])
                            good_card = true
                        end
                end
                return [i,j]
            end
        end
    end

end