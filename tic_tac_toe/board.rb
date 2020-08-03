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
  def play_turn(coordinate, symbol)
    alpha = ('a'..'c').to_a

    x = alpha.index(coordinate.chars[0].downcase)
    y = coordinate[1].to_i - 1

    @board[x][y] = symbol

      return @board[x].all? { |tile_symbol| tile_symbol == symbol } ||
      @board.map{ |row| row[y] }.all? { |tile_symbol| tile_symbol == symbol } ||
      @board.each_with_index.map { |row, i| row[i] }.all? { |tile_symbol| tile_symbol == symbol } ||
      @board.each_with_index.map { |row, i| row[row.count - 1 - i] }.all? { |tile_symbol| tile_symbol == symbol }
  end
end