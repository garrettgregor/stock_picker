class StockPicker
  def stock_picker(prices)
    if prices.length <= 2
      return "You need to be in it for the long haul to win in the market"
    end

    best_days_indexes = []
    min_price = 0
    max_price = 0
    max_profit = 0

    prices.each_with_index do |buy_price, buy_day|
      prices.each_with_index do |sell_price, sell_day|
        if sell_day > buy_day
          potential_profit = sell_price - buy_price

          if potential_profit > max_profit
            max_profit = potential_profit
            min_price = buy_price
            max_price = sell_price
            best_days_indexes[0] = buy_day
            best_days_indexes[1] = sell_day
          end
        end
      end
    end

    best_days_indexes
  end
end
