class Card

    attr_reader :face_value, :current_state

    def initialize(face_value)
        @face_value = face_value
        @current_state = "?"
        @face_down = true
    end

    def valid?(pos) #[1, 2]
        pos.length == 2 && pos[0].to_i.to_s == pos[0] && pos[1].to_i.to_s == pos[1]
    end

    def face_down?
        @face_down
    end

    def hide
        @current_state = "?"
    end

    def reveal
        @current_state = face_value
    end    

end

# p c = Card.new('cat')
# p c.face_down?
# p c.hide
# p c.reveal
