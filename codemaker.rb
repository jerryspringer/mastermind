class CodeMaker < Game



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
		set_code
	end
 	
	def set_code
		@computer.code_combo = @player.second_guess(gets.chomp)
	end

	def pre_guess(i)
		puts "This is attempt number #{i + 1} out of 10 the computer has #{@player.turns - i} chances left to"
		puts "crack the code."
	end

	def guess 
		current_guess = Computer::COLORS.sample(4) 
		puts "The computer guessed #{current_guess}."
	end

	def check(current_guess)
		puts current_guess
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
			sleep (2.0)
		end
	end


 	# def play
			 

		# 10.times do |i|
			
		# 	puts "This is attempt number #{i + 1} out of 10 the computer has #{@player.turns - i} chances left to"
		# 	puts "crack the code."
		# 	current_guess = Computer::COLORS.sample(4) 
		# 	puts "The computer guessed #{current_guess}."
			
		# 	if @computer.is_exact?(current_guess)
		# 		puts "The computer was able to crack the color code\n
		# 		You Lost!"
		# 			break
			
		# 	elsif @player.turns - i == 0
				
		# 		puts "The computer was unable to crack the color code!\n
		# 		You Won!\n
		# 		The code was #{@computer.code_combo}"
		# 			break
			
		# 		else @computer.is_close?(current_guess)
		# 			sleep (2.0)
		# 	end
	# 	end
	# end
end