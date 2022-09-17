class Cat < ApplicationRecord

    CAT_COLORS = ['orange', 'white', 'black', 'grey', 'brown']

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: {in: CAT_COLORS}
    validates :name, presence: true
    validates :sex, presence: true, length: {is: 1}, inclusion: {in: ['M', 'F']}
    
    validate :birth_date_cannot_be_future
    def birth_date_cannot_be_future
        if self.birth_date > Date.today 
            erros.add(:birth_date, "invalid date!")
        end
    end

    def cat_colors 
        CAT_COLORS
    end
end
