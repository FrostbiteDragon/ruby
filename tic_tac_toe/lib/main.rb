require_relative "player.rb"
require_relative "game_manager.rb"

puts "player 1"
print "name: " 
player1 = Player.new(gets.chomp, 'O')

puts "player 2"
print "name: " 
player2 = Player.new(gets.chomp, 'X')

system "clear"
GameManager.new(player1, player2).play