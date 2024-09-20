require './lib/stock_picker'

RSpec.describe StockPicker do
  let!(:picker) { StockPicker.new }

  describe "instance methods" do
    describe "#stock_picker" do
      it "gets the two best days to buy/sell stocks from an input array" do
        input = [17,3,6,9,15,8,6,1,10]
        result = [1,4]

        expect(picker.stock_picker(input)).to eq(result)
      end

      it "gets the two best days to buy/sell stocks from an input array" do
        test_cases = {
          [17, 3, 6, 9, 15, 8, 6, 1, 10] => [1, 4],
          [7, 1, 5, 3, 6, 4] => [1, 4],
          [7, 6, 4, 3, 1] => [],
          [1, 2, 3, 4, 5, 6] => [0, 5],
          [3, 8, 6, 1, 9] => [3, 4],
          [5, 10, 4, 6, 7] => [0, 1],
          [20, 18, 12, 8, 5] => [],
          [12, 11, 15, 3, 10, 2] => [3, 4],
          [9, 7, 4, 3, 2, 1] => [],
          [1, 3, 2, 8, 4, 9] => [0, 5]
        }

        test_cases.each do |input, result|
          expect(picker.stock_picker(input)).to eq(result)
        end
      end

      it "returns a helpful stock picking message" do
        input = [0]
        result = "You need to be in it for the long haul to win in the market"

        expect(picker.stock_picker(input)).to eq(result)

        input = [0,1]
        result = "You need to be in it for the long haul to win in the market"

        expect(picker.stock_picker(input)).to eq(result)
      end
    end
  end
end
