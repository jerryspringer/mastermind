require 'spec_helper'

describe Computer do 
	before :each do
		@computer = Computer.new 
		@guess = ["W", "P", "B", "R"]
		@close_guess = ["Y", "O", "B", "W"]
		@code_combo = ["B", "O", "R", "P"]

	end
	describe "#new" do
	it "creates a new instance of the computer" do
		@computer.should be_an_instance_of Computer
	end

	end
	describe "#get_matches" do
	end
	describe "#code_combo" do
	end
	describe "#is_close?" do
	end
	describe "#is_exact?" do
		it "returns true if the code_combo matches the guess" do
			@computer.is_exact?(@computer.code_combo).should be_true
		end
		it "returns false if the code_combo does not exactly match the guess" do
		end
	end	
end