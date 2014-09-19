class Game

	def initialize
		@player = Player.new 
		@computer = Computer.new 
	end
	
	def play
		welcome	
		10.times do |i|
			pre_guess(i)
			current_guess = guess 
			check(current_guess)
		end
	end

end
