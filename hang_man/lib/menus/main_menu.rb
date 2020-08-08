require 'menus/game_menu'
require 'menus/load_menu'
require 'extentions'

class MainMenu
  def initialize; start end

  private def start
    system 'clear'

    puts 'options:'
    puts '1 new game'
    puts '2 load'
    puts '3 exit game'
    input = gets.chomp

    if input.eql? '1'; GameMenu.new
    elsif input.eql? '2'; LoadMenu.new
    elsif input.eql? '3'; system 'clear'; exit!
    else start end
  end
end