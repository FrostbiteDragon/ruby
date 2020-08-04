require_relative "board.rb"
require_relative "player.rb"

def play
    loop do
        break if play_turn(@player1)
        break if play_turn(@player2)
    end

    puts "Play again? y/n"
    if gets.chomp.downcase == 'y'
        system "clear"
        play
    end
end

def play_turn(player)
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

puts "player 1"
print "name: " 
@player1 = Player.new(gets.chomp, 'O')

puts "player 2"
print "name: " 
@player2 = Player.new(gets.chomp, 'X')
@board = Board.new

system "clear"
play