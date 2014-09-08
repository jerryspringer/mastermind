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

