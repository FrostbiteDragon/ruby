require_relative "board.rb"
require_relative "save_handler"
class GameManager

  def initialize(board = Board.new)
    @board = board
  end

  def play
    loop do
      #display board
      system 'clear'
      puts 'Enter save to save and quit the game'
      @board.display

      input = gets.chomp.downcase
      if input.eql? "save"
        SaveHandler.save(@board.word, @board.letters, @board.guesses)
        exit!
      end

      state = @board.update(input)

      next if state == 0

      #display win
      if state == 1
        system 'clear'
        @board.display
        puts "win!"
        break
      end
      #display loss
      if state == -1
        system 'clear'
        @board.display
        puts "game over"
        break
      end
    end
  end
end