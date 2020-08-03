require_relative "board.rb"
require_relative "player.rb"

@player1 = Player.new('O')
@player2 = Player.new('X')
@board = Board.new

loop do
    puts "Player 1"
    @board.display
    break if @board.play_turn(gets, @player1.symbol)

    puts "Player 2"
    @board.display
    break if @board.play_turn(gets, @player2.symbol)
end

puts "Winner!"