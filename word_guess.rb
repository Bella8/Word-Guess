class WordGuess
    attr_accessor :words, :target_word_guess, :correct_guesses, :incorrect_guesses, :target_array_form, :dash_line, :petal_art, :your_guess

    def initialize
        @words = ["SPAGHETTI", "STUDENDOUS", "HAPPY", "LINGUISTIC"]
        @target_word_guess = ""
        @target_array_form = nil
        @correct_guesses = []
        @incorrect_guesses = []
        @dash_line = nil
        @petal_art = ""
        @your_guess = ""
    end

    def selection
        index_choice = rand(@words.length - 1)
        @target_word_guess = @words[index_choice]
        @target_array_form = @target_word_guess.split("")
        return @target_word_guess
    end

    def create_dash_line
        number_dashes = @target_word_guess.length
        dash_line = "-" * number_dashes
        @dash_line = dash_line.chars.to_a
        return @dash_line
    end

    def guess
        print "\nType your guess: "
        @your_guess = gets.chomp.upcase
        puts "\n"
        puts "*" * 50
        puts "\n"
        guessing
        if @target_word_guess.include?(@your_guess)
            @correct_guesses<<@your_guess
            @target_array_form.each_with_index do |char,    index|
                if @your_guess == char
                    @dash_line[index].replace(char)
                end
            end
            puts @petal_art
        else
            @incorrect_guesses<<@your_guess
            @petal_art.slice!(0,3)
            puts @petal_art
            # puts @petal_art.sub!("(@)", "")
        end
        puts "Here is your target word: "
        print @dash_line
        puts "\n"
        puts"Here are your incorrect guesses so far... \n"
        print @incorrect_guesses
    end

    def done?
        @target_array_form.each do |let|
            if !@correct_guesses.include?(let)
                return false
            end
        end
        return true
    end

    def conclusion
        until done? == true || @incorrect_guesses.length == 5
            guess
        end
        if @incorrect_guesses.length == 5
            puts"\nOops you lose, nice try!"
        elsif done? == true
            puts "\nGood job, you win!"
        end
    end

    def correct_input?
        alphabet = "A".."Z"
        until @your_guess.length == 1 && alphabet.include?(@your_guess)
            return false
        end
        return true
    end

    def guessing
        until correct_input? == true
            puts "Oops, you didn't enter one letter. Please try again...\n"
            guess
        end
    end

    def graphic
        @petal_art = "(@)(@)(@)(@)(@)\n,\\, \\, |,/, /,\n     _\\|/_\n    |_____|\n     |   |\n     |___|"
        return @petal_art
    end
end
