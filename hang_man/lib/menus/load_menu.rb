require_relative 'main_menu'

class LoadMenu
  def initialize; load end

  private def load
    system 'clear'
    puts "Enter 'back' to return to main menu"
    puts 'saves: '
    saves = SaveHandler.load_all
    saves.each_with_index{ |save, i| puts "#{i + 1}: #{Extentions.format_word(save[:word], save[:letters])} Guesses used: #{save[:guesses]}"}

    input = gets.chomp
    if input == 'back' 
      MainMenu.new
      return
    elsif input =~ /[[:digit:]]/ && input.to_i <= saves.length
      save_index = input.to_i - 1
    else 
      load
    end

    save = SaveHandler.load(save_index)
    GameMenu.new(Board.new(save[:letters], save[:guesses], save[:word]), save_index)
  end
end