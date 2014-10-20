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
