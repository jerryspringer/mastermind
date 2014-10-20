require_relative 'computer'
require_relative 'player'
require_relative 'codemaker'
require_relative 'mastermind'

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

	def validate_code(guess)
		guess.each do |color|
		unless Computer::COLORS.include?(color)
				puts "The color #{color} is not a valid choice. Please choose from ['R', 'Y', 'W', 'O', 'B', 'P']."
				return false
			end
		end
	end
end
