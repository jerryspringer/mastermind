class Mastermind
	

	def initialize
		@player = Player.new
		@computer = Computer.new
	end

		def welcome
		
		puts "\nWelcome to Mastermind\n
		The computer is holding a 4 color code you need to break\n
		You have 10 attempts to crack the code or you lose!\n
	    \tYou can choose R (red), Y (yellow), W (white), O (orange)\n
		B (blue) or P (purple)\n 
		Please seperate each choice with a comma (,).\n 
		For best results, leave CAPS LOCK on!!!!!!!!!\n
		\nGood luck!\n"
	end
 	
 	def play
			welcome 

		10.times do |i|
			
			puts "This is attempt number #{i + 1} out of 10 you have #{@player.turns - i} chances left to"
			puts "crack the code."
			current_guess = @player.code_break
			
			if @computer.is_exact?(current_guess)
				puts "You were able to crack the code"
				puts "You Won!"
					break
			
			elsif @player.turns - i == 0
				
				puts "You were unable to crack the color code."
				puts "You Lost!"
				puts "The code was #{@computer.code_combo}"
					break
			
				else @computer.is_close?(current_guess)
			end
		end
	end
end
 
class Computer
	
	COLORS = ["R", "Y", "W", "O", "B", "P"]
 	attr_accessor :code_combo
	
	def initialize
		
		@code_combo = COLORS.sample(4)
	
	end

	def get_matches(guess) 
		
		match = []
		guess.each do |color|
			
			if @code_combo.include?(color)
				match << color 
			end
		end
		
		match
	
	end

	def is_close?(guess) 
		if get_matches(guess) == []
			puts "You have no matches"
		
		else
			puts "The code contains #{get_matches(guess)}"
		
		end
	end


	def is_exact?(guess)
		
		if guess == @code_combo
			return true
		
		else
			return false
		
		end	
	end
end

class CodeMaker
	def initialize
		@player = Player.new 
		@computer = Computer.new 
	end

			def welcome
		
		puts "\nWelcome to CodeMaker\n
		You are holding a 4 color code that the\n  
		computer will try to break.\n
		The computer has 10 attempts to crack the code or you lose!\n
	    \tYou can choose R (red), Y (yellow), W (white), O (orange)\n
		B (blue) or P (purple)\n 
		Please seperate each choice with a comma (,).\n 
		For best results, leave CAPS LOCK on!!!!!!!!!\n
		\nGood luck!\n"
	end
 	
 	def play
			welcome
			@computer.code_combo = @player.second_guess(gets.chomp) 

		10.times do |i|
			
			puts "This is attempt number #{i + 1} out of 10 the computer has #{@player.turns - i} chances left to"
			puts "crack the code."
			current_guess = Computer::COLORS.sample(4)
			puts "The computer guessed #{current_guess}."
			
			if @computer.is_exact?(current_guess)
				puts "The computer was able to crack the color code\n
				You Lost!"
					break
			
			elsif @player.turns - i == 0
				
				puts "The computer was unable to crack the color code!\n
				You Won!\n
				The code was #{@computer.code_combo}"
					break
			
				else @computer.is_close?(current_guess)
					sleep (3.0)
			end
		end
	end
end
 
class Player
	attr_accessor :turns
	def initialize
		@turns = 9
	end
	

	def code_break
		second_guess(gets.chomp)
	
	end
 
	def second_guess(guess)
		guess.split(', ')
	
	end
end

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
