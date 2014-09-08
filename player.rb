class Player
	attr_accessor :turns
	def initialize
		@turns = 9
	end
	
	
	def welcome
		
		puts "Welcome to Mastermind"
		puts "The computer is holding a 4 color code you need to break."
		puts "You have 10 attempts to crack the code or you lose!"
		puts "Your choices are R (red), Y (yellow), W (white), O (orange), B (blue),"
		puts "and P (purple)"
		puts "Please seperate each choice with a comma (,)."
		puts "For best results, leave CAPS LOCK on!!!!!!!!!"
		puts "Good luck!"
	end

	def code_break
		second_guess(gets.chomp)
	
	end
 
	def second_guess(guess)

		guess.split(', ')
	
	end
end
 
