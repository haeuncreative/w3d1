require './dictionary.rb'
require './player.rb'
class Game

    attr_reader :players, :losses
    attr_accessor :fragment, :losses

    def initialize(*players)
        @fragment = ""
        @players = Array.new
        players.each do |player|
            @players << Player.new(player)
        end
        @dictionary = Dictionary.new
        @words = @dictionary.words
        @losses = Hash.new(0)
        @players.each do |player|
            @losses[player.name] = 0
        end
    end

    def play_game
        @players
        while @players.length > 1
            until @losses.has_value?(5)
                self.play_round
            end
            @players.delete_if do |player|
                @losses[player.name] >= 5
            end
        end
        system('clear')
        p "#{@players[0].name} is the winner!"
        
    end

    def play_round
        self.record
        while !round_end?
            system('clear')
            self.record

            1.times do
                puts '------------------'
                word_str = ""
                @fragment.each_char {|char| word_str += "#{char}"}
                puts @fragment.upcase
                puts '------------------'

                input = self.current_player.guess
                redo if !valid_play?(input)
                @fragment += input
                self.next_player!
            end
        end
        system('clear')
        p "#{self.previous_player.name} has lost!"
        @losses[self.previous_player.name] += 1
        self.record
        @fragment = ""
        sleep(4)
    end

    def current_player
        @players[0]
    end

    def previous_player
        @players[-1]

    end

    def next_player!
        @players << @players.shift
    end

    def round_end?
        if @words.has_key?(@fragment)
            return true
        end
        return false
    end

    def valid_play?(string)
        guess = @fragment + string
        p guess
        if @words.any? {|key, val| key[0...guess.length].include?(guess)}
            return true
        else
            p 'Please enter a valid play.'
            sleep(2)
            return false
        end
    end

    def record
        ghost = {
            0 => '-',
            1 => 'G',
            2 => 'GH',
            3 => 'GHO',
            4 => 'GHOS',
            5 => 'GHOST'
        }

        @losses.each do |key, val|
            puts "#{key} is at #{ghost[val]}"
        end

    end



end
