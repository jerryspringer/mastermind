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
