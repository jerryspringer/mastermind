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
      clean_guess = @player.second_guess(gets.chomp)
      until @computer.validate_code(clean_guess) == true do 
      clean_guess = @player.second_guess(gets.chomp)
      end
      @computer.code_combo = clean_guess
      current_guess = Computer::COLORS.sample(4)

    10.times do |i|
      puts "This is attempt number #{i + 1} out of 10 the computer has #{@player.turns - i} chances left to"
      puts "crack the code."
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
        sleep (2.5)
        old_guess = current_guess
        current_guess = @computer.new_guess(old_guess)
      end
    end
  end
end