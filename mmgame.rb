require_relative 'computer'
require_relative 'player'
require_relative 'game'
require_relative 'codemaker'
require_relative 'mastermind'



puts "Enter 1 to play Mastermind, Enter 2 to play CodeMaker"
game_type = gets.chomp
if game_type == '1'
	game = Mastermind.new
	game.play
elsif game_type == '2'
	game = CodeMaker.new
	game.play
else
	puts "No game selected."
end
