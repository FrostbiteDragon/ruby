require_relative 'game_manager'
require_relative 'load_manager'
require_relative 'extentions'

class MenuManager
  def self.start
    system 'clear'

    puts 'options:'
    puts '1 new game'
    puts '2 load'
    puts '3 exit game'
    input = gets.chomp

    if input.eql? '1'; GameManager.new
    elsif input.eql? '2'; LoadManager.new
    elsif input.eql? '3'; system 'clear'; exit!
    else start end
  end
end