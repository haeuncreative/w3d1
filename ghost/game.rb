require 'dictionary.rb'
require 'player.rb'
class Game

    def initialize(*players)
        @fragment = ""
        @players = Array.new
        players.each do |player|
            @players << Player.new(player)
        end
        @dictionary = Dictionary.new
        @words = @dictionary.words
    end

    def play_round

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

    def valid_play?(string)
        
    end



end
