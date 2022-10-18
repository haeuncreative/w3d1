class Board

    attr_reader :size

    def initialize(size)
        @size = size
        @grid = Array.new(@size) {Array.new(@size)}
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos, val)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = val
    end

    def complete_row?(mark)
        @grid.any? do |row| 
            row.all? {|ele| ele == mark}
        end
    end

    def complete_col?(mark)
        (0...@size).each do |index|
            count = 0
            @grid.each do |row|
                if row[index] == mark
                    count += 1
                end
            end
            if count == @size
                return true
            end
        end
        return false
    end

    def complete_diag?(mark)
        up_down?(mark) || down_up?(mark)
    end

    def up_down?(mark)
        count = 0
        (0...@size).each do |index|
            if @grid[index][index] == mark
                count += 1
            end
        end
        if count == @size
            return true
        else
            return false
        end
    end

    def down_up?(mark)
        count = 0
        (0...@size).each do |index|
            if @grid[index][@size - 1 - index] == mark
                count += 1
            end
        end
        if count == @size
            return true
        else
            return false
        end
    end

    def winner?(mark)
        if self.complete_col?(mark) || self.complete_row?(mark)
            return true
        elsif self.complete_diag?(mark)
            return true
        end
        return false
    end



    def print
        @grid.each { |row| p row }
    end
end
