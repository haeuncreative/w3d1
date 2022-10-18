class Maze

    def initialize(text_file)
        @maze_container = Array.new

        File.open(text_file, 'r') do |f|
            f.each_line do |line|
                line_arr = line.chomp.split("")
                maze_container << line_arr
            end
        end
        @width = maze_container[0].length
        @length = maze_container.length
        @available_width = width - 2 #to account for walls
        @available_length = length - 2

        flattened = maze_container.flatten
        @total_area = flattened.count
        @total_wall_units = flattened.count {|ele| ele == "*"}
        to_subtract = 2 * (width + length - 1) #1 is for the shared corners

        @inner_walls = total_wall_units - to_subtract
        @inner_maze = Array.new

        @maze_container.each do |row|
            if row.all? {|ele| ele == "*"}
                next
            elsif row[0] == "*" && row[-1] == "*"
                @inner_maze << row[1...-1]
            end
        end

        @start_coordinates = Array.new
        @end_coordinates = Array.new
        
        @inner_maze.each_with_index do |row, ri|
            row.each do |col, ci|
                if @inner_maze[ri][ci] == "S"
                    @start_coordinates = [ri, ci]
                elsif @inner_maze[ri][ci] == "E"
                    @end_coordinates = [ri, ci]
                end
            end
        end

        # closest_distance = Array.new
        # closest_distance << (start_coordinates[0] - end_coordinates[0])
        # closest_distance << (start_coordinates[1] - end_coordinates[1])
    end

    def print_maze(two_d_arr)
        two_d_arr.each do |line|
            joined = line.join("")
            p joined
        end
    end

    def get_dimensions(maze)

    end

    
    def adjacent?(arr1, arr2)
     
        
        r1 = arr1[0]
        c1 = arr1[1]
        r2 = arr2[0]
        c2 = arr2[1]

        if r1 

        object = @inner_maze[r1][r2]
        case object
            when object == "S"
                return true 
            when object == "E"
                return true
            when object == "X"
                return true
            end
        end
    end

    def valid_length?(num)
        return true if num < @inner_maze[0].length && num > -1
    end

    def valid_width?(num)
        return true if num < @inner_maze.length && num > -1
    end


end

end

p maze_solver('./maze1.txt')