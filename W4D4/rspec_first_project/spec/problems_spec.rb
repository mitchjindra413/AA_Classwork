require "rspec"
require "problems"

describe Array do
    describe "#my_uniq" do
        it "removes duplicates from the array" do
            arr = [1,2,1,3,3]
            expect(arr.my_uniq).to eq([1,2,3])
        end
    end


    describe "#two_sum" do
        it "finds all pairs of array that sum to zero" do
            arr = [-1, 0, 2, -2, 1]
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end
    end

    describe "#my_transpose" do
        it "will convert between the row-oriented and column-oriented representations" do
            rows = [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8]
                    ]
            expect(rows.my_transpose).to eq(cols = [
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8]
                ])
            end
    end

    describe "#stock_picker" do
        
        it "iterate over array taking largest difference pair" do
            arr = [2,1,3,4]
            expect(arr.stock_picker).to eq([1,3])
        end
    end


end