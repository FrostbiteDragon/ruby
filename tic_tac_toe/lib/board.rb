class Board
  def initialize
    @board = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
  end

  def display
    puts "  1 2 3"
    puts "A|#{@board[0][0]} #{@board[0][1]} #{@board[0][2]}|"
    puts "B|#{@board[1][0]} #{@board[1][1]} #{@board[1][2]}|"
    puts "C|#{@board[2][0]} #{@board[2][1]} #{@board[2][2]}|"
    puts ""
  end

  #coordinate is string with format A1
  #returns true if valid tern, otherwise returns false
  def play_turn(coordinate, symbol)
    alpha = ('a'..'c').to_a

    x = alpha.index(coordinate[0].downcase)
    y = coordinate[1].to_i - 1

    if @board[x][y] == '-'; 
      @board[x][y] = symbol
      return true
    else return false
    end
  end

  def won?(symbol)
    return (
      #rows
      @board.any? { |item| 
        item.all? { |tile_symbol| tile_symbol == symbol } } ||

      #columns
      @board.each_index
        .any? { |i| @board.map{|row| row[i]}
        .all? { |tile_symbol| tile_symbol == symbol }} ||
        
      #crosses
      @board.each_with_index
        .map { |row, i| row[i] }
        .all? { |tile_symbol| tile_symbol == symbol } ||
      @board.each_with_index
        .map { |row, i| row[row.count - 1 - i] }
        .all? { |tile_symbol| tile_symbol == symbol }
    )
  end
end