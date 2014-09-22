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

	def new_guess(current_guess)
		if get_matches(current_guess).length != 4
			return almost_there_guess(current_guess).shuffle
		else
			return current_guess.shuffle
		end
	end

	def almost_there_guess(current_guess)
		almost_there_guess =  []
		until current_guess.length == almost_there_guess.length
			length = get_matches(current_guess).length
			almost_there_guess = (get_matches(current_guess) << available_colors(current_guess).sample(4 - length)).flatten!.uniq
		end
		return almost_there_guess
	end

	def available_colors(current_guess)
		new_colors = []
		new_colors = COLORS
		remainder = new_colors.reject { |color| current_guess.include?(color) }
		return remainder
	end


end

