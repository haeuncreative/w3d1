class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def guess
        1.times do
            puts "#{@name}, please enter a lowercase character"
            input = gets.chomp
            input = input.downcase
            redo if alert_invalid_guess(input)
            return input
        end
    end

    def alert_invalid_guess(char)
        char = char.downcase
        alphabet = ('a'..'z').to_a
        if !alphabet.include?(char)
            return true
        end
        return false
    end

end