require "hanoi"
require "rspec"

describe Hanoi do
    subject(:game) {Hanoi.new}

    describe "#move" do
        it "shift element of choosen arr and add to other chossen arr" do 
            game.move(game.a1, game.a2)
            expect(game.a1).to eq([2,3,4,5])
            expect(game.a2).to eq([1])
        end
    end

    describe "#won?" do
        it "check if third array is full and in order" do
            expect(game.won?).to eq(false)
        end
    end

end