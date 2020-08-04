require_relative "board.rb"

class GameManager
  @player1
  @player2
  @board

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
  end

  def play
    loop do
        break if play_turn(@player1)
        break if play_turn(@player2)
    end

    puts "Play again? y/n"
    if gets.chomp.downcase == 'y'
        system "clear"
        @board = Board.new
        play
    end
  end

  private def play_turn(player)
    puts "#{player.name}: #{player.symbol}"
    @board.display
    while !@board.play_turn(gets, player.symbol); puts "invalid tile" end

    system "clear"

    if @board.won?(player.symbol)
      system "clear"
      @board.display
      puts ""
      puts "#{player.name} won!"
      return true
    else
      return false
    end
  end
end