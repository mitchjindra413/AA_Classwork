require "deck"
require "rspec"


describe Deck do
    let(:deck) { Deck.new }

    describe "#initialize" do 
        it"creat an empty array" do
            expect(deck.instance_variable_get(:@deck)).to eq([])
        end
    end

    describe "#create_deck" do
        context "populates deck with card instances" do
            it "has deck of 52 card instances" do
                deck.create_deck
                expect(deck.deck.length).to eq(52)
            end
        end
    end

    describe "#shuffle" do
        it "shuffles @deck" do
            deck.create_deck
            before = deck.deck
            after = deck.shuffle
            # p before.sort_by{|card| card.value}
            # p after.sort_by{|card| card.value}
            expect(before).not_to eq(after)
            expect(before.sort_by{|card| [card.value,card.suit]}).to eq(after.sort_by{|card| [card.value,card.suit]})
        end
    end


end