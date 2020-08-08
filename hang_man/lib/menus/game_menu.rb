require 'board'
require 'save_handler'
require 'menus/main_menu'

class GameMenu

  def initialize(board = Board.new, save_index = nil)
    @board = board
    @save_index = save_index
    play
  end

  private def play
    loop do
      #display board
      system 'clear'
      puts "Enter 'save' to save and exit"
      puts "Enter 'back' to exit with ought saving"
      puts ''
      @board.display

      input = gets.chomp.downcase
      if input.eql? 'save'
        SaveHandler.save(@board.word, @board.letters, @board.guesses, @save_index)
        MainMenu.new
        return
      elsif input.eql? 'back'
        MainMenu.new
        return
      end

      state = @board.update(input)

      next if state == 0

      #display win
      if state == 1
        system 'clear'
        @board.display
        puts "\nwin!"

        SaveHandler.delete(@save_index) unless @save_index.nil?

        puts "\npress 'Enter' to continue"
        gets
        MainMenu.new
        break
      end
      #display loss
      if state == -1
        system 'clear'
        @board.display
        puts "\ngame over"
        puts "word was #{@board.word}"

        SaveHandler.delete(@save_index) unless @save_index.nil?

        puts "\npress 'Enter' to continue"
        gets
        MainMenu.new
        break
      end
    end
  end
end