
require 'byebug'

class Array

    def my_each(&proc)
        i = 0
        until i == (self.length)
            proc.call(self[i])
            i += 1
        end
        return self
    end
# # calls my_each twice on the array, printing all the numbers twice.

# My Select
# Now extend the Array class to include my_select that 
# takes a block and returns a new array containing only 
# elements that satisfy the block. Use your my_each method!
    def my_select(&proc)
        selected = Array.new
        self.my_each do |ele| 
            if proc.call(ele) == true
                selected << ele
            end
        end
        selected
    end

# Example:


# My Reject
# Write my_reject to take a block and return a new array 
# excluding elements that satisfy the block.

    def my_reject(&proc)
        rejected = Array.new
        self.my_each do |ele| 
            if proc.call(ele) == false
                rejected << ele
            end
        end
        rejected
    end

# Example:

    def my_any?(&proc)
        self.my_each do |ele| 
            if proc.call(ele) == true
                return true
            end
        end
        return false
    end

    def my_all?(&proc)
        self.my_each do |ele| 
            if proc.call(ele) == false
                return false
            end
        end
        return true
    end

    def my_flatten
        flattened = Array.new
        self.each do |ele|
            if !ele.instance_of?(Array)
                flattened += [ele]
            else
                flattened += ele.my_flatten
            end
        end
        flattened
    end

    def my_zip(*args)
        zipped = Array.new(self.length) {Array.new}
        (0...self.length).each do |index|
            zipped[index] << self[index]

            args.each do |arg_arr|
                zipped[index] << arg_arr[index]
            end

        end
        zipped
    end

    def my_rotate(num=1)
        rotated = self.dup
        if num > 0
            num.times do
                ele = rotated.shift
                rotated.push(ele)
            end
        elsif num < 0
            num.abs.times do
                ele = rotated.pop
                rotated.unshift(ele)
            end
        end
    
            
        rotated
    end

    def my_join(sep="")
        new_str = ""
        self.each do |ele| 
            new_str += ele + sep
        end
        new_str
    end

    def my_reverse
        reversed = Array.new
        max_i = self.length - 1
            while max_i > -1
                reversed << self[max_i]
                max_i -= 1
            end
        return reversed
    end

    def sorted?(prc)
        (0..self.length - 2).each do |i|
            sort_num = prc.call(self[i], self[i + 1])
            if sort_num == 1
                return false
            end
        end
        return true
    end

    def bubble_sort!(&prc)
        if self.empty?
            return self
        elsif self.length == 1
            return self
        else
            while !self.sorted?(prc)
                (0..self.length - 2).each do |i|
                    sort_num = prc.call(self[i], self[i + 1])
                        if sort_num == 1
                            self.swap(i, i + 1)
                        end
                end
            end
            self
        end
    end

    def swap(i, i2)
        self[i], self[i2] = self[i2], self[i]
    end

    def bubble_sort(&prc)
        copy = self.dup
        if copy.empty?
            return copy
        elsif copy.length == 1
            return copy
        else
            while !copy.sorted?(prc)
                (0..copy.length - 2).each do |i|
                    sort_num = prc.call(copy[i], copy[i + 1])
                        if sort_num == 1
                            copy.swap(i, i + 1)
                        end
                end
            end
            copy
        end
    end

    def my_map(&proc)
        mapped = Array.new
        self.each do |ele|
            mapped << proc.call(ele)
        end
        mapped
    end

    def my_inject(&proc)
        injected = self.dup
        # if proc == nil
        #     acc = injected[0]
        # end
        acc = injected[0]
        (0...injected.length - 1).each do |i|
            el = injected[i]
            if proc.call(acc, el) == 1
                acc = el
            else
                acc = acc
            end
        end
        return acc
    end


end
# My Rotate
# Write a method my_rotate that returns a new array 
# containing all the elements of the original array 
# in a rotated order. By default, the array should 
# rotate by one element. If a negative value is given, 
# the array is rotated in the opposite direction.

# Example:

# My Join
# my_join returns a single string containing all the 
# elements of the array, separated by the given string 
# separator. If no separator is given, an empty string is used.

# Example:

# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"
# My Reverse
# Write a method that returns a new array containing 
# all the elements of the original array in reverse order.

# Example:

# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]
# Review
# Now that we're all warmed up, let's review the iteration 
# exercises from the prepwork. Implement the following methods:

def factors(num)
    factors = Array.new
    (1..num).each do |fac|
        if num % fac == 0
            factors << fac
        end
    end
    factors
end


def substrings(string)

end

def subwords(word, dictionary)
    subs = Array.new
    dictionary.each do |sub|
        if word.include?(sub)
            subs << sub
        end
    end

    subs

end

def doubler(array)
    array.map {|ele| ele * 2}
end
# Although these exercises are from the prepwork and come 
# with specs, use this opportunity to practice your own 
# testing skills. Write out each method, think of a few 
# different example cases, and test out your code in pry.

# If you are having a tough time thinking of example cases, 
# check out the specs. You can use those examples to test 
# your solutions. Don't forget to move your enumerables_array.rb 
# into a lib directory!


def concatenate(arr)
    arr.inject do |acc="", el|
        acc += el
    end
end


# return_value = [1, 2, 3].my_each do |num|
#  puts num
# end.my_each do |num|
#  puts num
# end
# # => 1
#     # 2
#     # 3
#     # 1
#     # 2
#     # 3

# p return_value  # => [1, 2, 3]

# p 'my select'
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# p 'my reject'
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# p 'my any'
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

# p 'my all'
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p 'my flatten'
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# p 'my zip'
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]

# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]



# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]