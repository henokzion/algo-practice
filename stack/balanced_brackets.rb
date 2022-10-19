#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'isBalanced' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def isBalanced(s)
    # Write your code here
    arr = s.split("")
    stack = []
    match = {
        "}" => "{",
        "]" => "[",
        ")" => "(",
    }
    while arr.any?
        current = arr.shift
        if  match[current]
            return 'NO' if stack.pop != match[current]
        else
            stack << current
        end
    end
    return 'NO' if stack.any?
    'YES'
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.strip.to_i

t.times do |t_itr|
    s = gets.chomp

    result = isBalanced s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
