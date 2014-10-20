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

  def position(guess)
  position = 0
  new_guess = guess 
  4.times do
    if guess[position] == @code_combo[position]
    else
      new_guess[position] = "$$"
    end
    position += 1
  end
  new_guess.flatten
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
      true
    else
      false
    end
  end

  def new_guess(current_guess)
      new_guess = position(current_guess)
      new_guess.each_with_index do |color, index|
        new_guess[index] = available_colors(new_guess).sample if color == "$$"
      end
      return new_guess.flatten
  end

  def almost_there_guess(current_guess)
    almost_there_guess =  []
    until current_guess.length == almost_there_guess.length
      length = get_matches(current_guess).length

      almost_there_guess = (get_matches(current_guess) << available_colors(current_guess).sample(4 - length)).flatten!.uniq
    end
    almost_there_guess
  end
  
  def available_colors(current_guess)
    new_colors = []
    new_colors = COLORS
    remainder = new_colors.reject { |color| current_guess.include?(color) }
    remainder
  end

  def check_for_bad_input(guess)
    no_match = []
    guess.each do |color|
      unless Computer::COLORS.include?(color)
        no_match << color
      end
    end
    no_match
  end

  def validate_code(guess)
    if check_for_bad_input(guess) == []
      true
    else
      puts "#{check_for_bad_input(guess)} is not a valid choice"
      false
    end
  end
end

