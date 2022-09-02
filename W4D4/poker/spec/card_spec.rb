require "card"
require "rspec"

describe Card do
    let(:card) {Card.new("4", "heart")}
    describe "#initialize" do 
        it "should accept value and suit as args" do
            card
        end

        it "should set the instance variables @value, @suit" do
            expect(card.instance_variable_get(:@value)).to eq("4")
            expect(card.instance_variable_get(:@suit)).to eq("heart")
        end




    end
end