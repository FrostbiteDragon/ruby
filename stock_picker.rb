def stock_picker(stocks)
  days = [0, 0]
  highest_difference = 0

  stocks.each_index { |day|
      day.upto(stocks.count - 2) { |i|
        difference = stocks[i + 1] - stocks[day]

        if difference > highest_difference
            highest_difference = difference
            days = [day, i + 1]
        end
      }
    }
    days
end

puts stock_picker([17,3,6,9,15,8,6,1,10])